/*
  KeePass Password Safe - The Open-Source Password Manager
  Copyright (C) 2003-2007 Dominik Reichl <dominik.reichl@t-online.de>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

using KeePassLib.Security;

namespace KeePassLib.Cryptography.PasswordGenerator
{
	public enum PwgError
	{
		Success = 0,
		Unknown,
		TooFewCharacters
	}

	/// <summary>
	/// Utility functions for generating random passwords.
	/// </summary>
	public static class PwGenerator
	{
		public static PwgError Generate(ProtectedString psOutBuffer,
			PwProfile pwProfile, byte[] pbUserEntropy)
		{
			Debug.Assert(psOutBuffer != null);
			if(psOutBuffer == null) throw new ArgumentNullException("psOutBuffer");
			Debug.Assert(pwProfile != null);
			if(pwProfile == null) throw new ArgumentNullException("pwProfile");

			psOutBuffer.Clear();

			CryptoRandomStream crs = CreateCryptoStream(pbUserEntropy);
			PwgError e = PwgError.Unknown;

			if(pwProfile.GeneratorType == PasswordGeneratorType.CharSet)
				e = CharSetBasedGenerator.Generate(psOutBuffer, pwProfile, crs);
			else if(pwProfile.GeneratorType == PasswordGeneratorType.Pattern)
				e = PatternBasedGenerator.Generate(psOutBuffer, pwProfile, crs);
			else { Debug.Assert(false); }

			return e;
		}

		private static CryptoRandomStream CreateCryptoStream(byte[] pbAdditionalEntropy)
		{
			byte[] pbKey = CryptoRandom.GetRandomBytes(256);

			// Mix in additional entropy
			if((pbAdditionalEntropy != null) && (pbAdditionalEntropy.Length > 0))
			{
				for(int nKeyPos = 0; nKeyPos < pbKey.Length; ++nKeyPos)
					pbKey[nKeyPos] ^= pbAdditionalEntropy[nKeyPos % pbAdditionalEntropy.Length];
			}

			return new CryptoRandomStream(CrsAlgorithm.ArcFour, pbKey);
		}

		internal static char GenerateCharacter(PwProfile pwProfile,
			PwCharSet pwCharSet, CryptoRandomStream crsRandomSource)
		{
			if(pwCharSet.Size == 0) return char.MinValue;

			ulong uIndex = crsRandomSource.GetRandomUInt64();
			uIndex %= (ulong)pwCharSet.Size;
			return pwCharSet[(uint)uIndex];
		}

		internal static void PrepareCharSet(PwCharSet pwCharSet, PwProfile pwProfile)
		{
			pwCharSet.Remove(PwCharSet.Invalid);

			if(pwProfile.ExcludeLookAlike) pwCharSet.Remove(PwCharSet.LookAlike);
		}

		internal static void ShufflePassword(char[] pPassword,
			CryptoRandomStream crsRandomSource)
		{
			Debug.Assert(pPassword != null); if(pPassword == null) return;
			Debug.Assert(crsRandomSource != null); if(crsRandomSource == null) return;

			if(pPassword.Length <= 1) return; // Nothing to shuffle

			for(int nSelect = 0; nSelect < pPassword.Length; ++nSelect)
			{
				ulong uRandomIndex = crsRandomSource.GetRandomUInt64();
				uRandomIndex %= (ulong)(pPassword.Length - nSelect);

				char chTemp = pPassword[nSelect];
				pPassword[nSelect] = pPassword[nSelect + (int)uRandomIndex];
				pPassword[nSelect + (int)uRandomIndex] = chTemp;
			}
		}
	}
}
