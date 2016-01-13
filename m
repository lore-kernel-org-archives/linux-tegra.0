From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: tegra: Fix sparse warning for pll_m
Date: Wed, 13 Jan 2016 18:15:50 +0100
Message-ID: <20160113171550.GR2588@ulmo>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Idd68gPqKLz5+Ci0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449248665-22343-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Idd68gPqKLz5+Ci0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 05:04:23PM +0000, Jon Hunter wrote:
> Sparse generates the following warning for the pll_m params structure:
>=20
> drivers/clk/tegra/clk-tegra210.c:1569:10: warning: Initializer entry
>  defined twice
> drivers/clk/tegra/clk-tegra210.c:1570:10:   also defined here
>=20
> Fix this by correcting the index for the MISC1 register.
>=20
> Fixes: b31eba5ff3f7 ("clk: tegra: Add support for Tegra210 clocks")
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All three patches applied.

Thanks,
Thierry

--Idd68gPqKLz5+Ci0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWloZGAAoJEN0jrNd/PrOhNt8P/RRbBHbI9h8uRYj5qNjBSeSQ
WlebJsZCRBoF1OA/7lSnm488TqKa5/qGUdQ4hwzeoQCJerGILBE69KamZlvHJp68
WR5ZAIjMZFwLqhConekK6qWDRe6eKfgHGs3/n54PWEDLoCvtbQKPQbHUGEUu2KM5
xSh6HlpDLYGuUrifvYMUdER5TpA2FPCAXA+qzERtEj2TlADmXcbwATUvO0xmQ6ra
ViABFuvsm7icfdL6upAINNDcwulrVjdDuiCFnyhv2dBpYTHURN0xAq0VMdzZ/Snk
xKh3loPEBjHuExrsilpxvGKnCy0Y8iVwi8OMb92aidrXu4jYjkaXx9wdZRcGIqzf
eaVwDgOoI2Xrxl9R/0OJ4hHVmA5FxPFDBgS1NVCiodH4eU+ejW+V4VXldCXJkZA1
C2kjeQTCWngX/aDiXG5/fgypgC+9SeuvqRj1Ch8cqgizyIjtPHtDuRBzD3K2JCpt
KHqTJGFAbCU1A58OmWwfnzhfsw59AFRfgmx/2735jfdis2m4zIhlVcdzX2ndvpZB
5YBBQcdprokNjT1yJGrxdVQRjYAOV97GoXjuQelyFuqt2EQdLB0BUJ1+wNCJa/Vt
dq8MDCNpp01C2UTthsUVNZqnHh+P2gVHxOW+0qRFrD/rU3qKizxWFl3x3Od9dw2Z
D/KwOuEUOBvGHToyZJvX
=WuPQ
-----END PGP SIGNATURE-----

--Idd68gPqKLz5+Ci0--
