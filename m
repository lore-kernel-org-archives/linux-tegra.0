From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 4/9] clk: tegra: Fix the misnaming of nvenc from msenc
Date: Mon, 25 Jan 2016 13:36:30 +0100
Message-ID: <20160125123630.GG20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-5-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-5-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:33PM -0500, Rhyland Klein wrote:
> When adding the nvenc clock, it was partially named msenc in
> the code. Since the msenc clk isn't present in T210 where the nvenc
> clk is, its misleading to see it present. Therefore, properly
> rename it.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphbOAAoJEN0jrNd/PrOh74QP/0xdFbNAhlulOeKulRLxjPhI
YOm/VcnU1ExdAeJdcxk4ydVKaU7XhLkMeKy+Kqca9SZ4bBMMmpSKsyDiLjIs+75L
opG0fi9IytoFIRkXumgJN8TlH89pM1+Wt8rCQoBuMsuvzrtdH97+JkkhtGeK5UXv
wWnrMNboLCp9URY0F20wrgYPAmhYb1dXPsNH8mQv+ZC80KpxSHqZYLJ9Euhnfs02
5Nvx/hX1Q/t2loRw8UFTelFgh8fokXGtGkDDT5mnrMaEwan1ALa3CmV18q5iFUPw
2t+VHVts1KYctKsfbYdNb5aXYpVOmZUN3Pvv14VoCtkapj1mSWhOpuYsp+umoWhI
wp8BKFjfyGsxPjOogZ2Romew9BgLaiQaYA6hBRdkk+A0bxbfBUsxSCEQ79163m2p
qi9CSVFTTpuDbcQJ3X/tVLvH5KtG76S6U6ryPKtQcH8pnowxMeMy57sUIqcY3Ur+
sKq8VBK/8B7cCURNnP1gPz63z0K6MhOr49FpzdfWsXmVzJ7bOoFPXtQBw+ST2qGc
oHS1hDNK7ZaCFShoshGbhsLDxSaXNIEBRuolq5M1wOT0I9B2qcbjMajuxkpwbncv
8ksSAGs0MORKg6hvhZZ+UYped8wCm9NC1eJM9k4SCiF7a19L5x3P4T/cAHDlPDo9
K6w1cHo5tPwhUwG6A6li
=Zd1K
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
