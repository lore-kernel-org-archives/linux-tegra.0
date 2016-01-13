From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix clock sources for tegra210 EMC
Date: Wed, 13 Jan 2016 18:20:40 +0100
Message-ID: <20160113172040.GS2588@ulmo>
References: <1450446328-6414-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxNrNKeE/ptr8Zbn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450446328-6414-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wxNrNKeE/ptr8Zbn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2015 at 01:45:28PM +0000, Jon Hunter wrote:
> The EMC clock sources for tegra210 currently incorrectly include pll_c2
> and pll_c3. However, both of these should have been pll_mb as shown in
> the TRM. If tegra210 happens to be configured such that the pll_mb is the
> default clock for the EMC, as configured by the bootloader, then this will
> cause a system hang on boot. This is because the kernel will disable the
> pll_mb when disabling unused clock as it appears to be unused when it is
> not.
>=20
> Also add the additional pll_p clock source for the EMC.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--wxNrNKeE/ptr8Zbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlodoAAoJEN0jrNd/PrOhRTEQAI7d8Q0SGrrCsS+a9Y/ckKw4
T8CtuSPbouM0Ts5W1cbtPen4Qu6CHSdQYqPbvD4lqG3n5DsbKvMNFk9GPtk/SS65
NrkdX0sivhtcg6O4MFNEDRVWzVF02h3YDUe+5mQdkjW1Qe7uY3bdsLVNAL7SptCb
07GQG5L+yYI9U33GZbSnT2FZZpYmjAjcOUqM+9Y/D+BNhlCNyBbih8uTsBlK/rIx
XdCuN7fsPF8MIqYmDbF3mvjtrEnB8/YjX6v9SxJsKgXLzI+NCbVw3eNEuEaLDWG0
ZapqhGZ5TtO0+ceRQdjLNifge9wlGZNui3tzZlC2U+rFDEzqPcSNMJxnc+S/aX8i
HCYe1G6VWTbqmdGS+ML2fV3B7AQw/nz4Go0Ta+lEBUQP+EaxxgBlTIXJjsWzez7r
JeCsIOp8iAVoLRs41moqb5DXQJ51SwA7gtgYRH4Nt64tKgma9vHlCVo95g6o7ImO
Snr3BKp9zP/QobA8mvAm3PraVQcN3uL+vMPA1J1CCj//ZoS1zt7pBZUI1NixlfGR
dCz59sZmh+C9CrdfBybF9vGUY9TWDW/o3XK8/w6PXe84PCt1TK5XeyBZtNp6bTzq
fo7KWpQO5tBu4BZxRCajoC8yM4rBZTysUORtovvzEQbWpSLIMpR51eH2naz1vekb
M4rZD/S9QhjCuagMeuTM
=b8RB
-----END PGP SIGNATURE-----

--wxNrNKeE/ptr8Zbn--
