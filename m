From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V2 7/9] clk: tegra: pll: Do not disable PLLE when under
 HW control
Date: Mon, 25 Jan 2016 13:46:48 +0100
Message-ID: <20160125124648.GK20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-8-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZG5hGh9V5E9QzVHS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-8-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Kuo <mkuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZG5hGh9V5E9QzVHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:36PM -0500, Rhyland Klein wrote:
> From: Mark Kuo <mkuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> SW should not disable PLLE if PLLE is already put under HW control.
>=20
> Signed-off-by: Mark Kuo <mkuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--ZG5hGh9V5E9QzVHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphk4AAoJEN0jrNd/PrOhK6IQAKh8U5OFIuZF7JUE15gQc3qt
Q0dZjbJxH8PON/AvWn4hL9Af+ukkq/nex42AlYc19LKCiCO7VjBSgPOYlpqaCb7z
+qW3RUxBg+Ktq/rh8G8K2fFgk1hBb968GlIw/P5Pp9k5Y10YjFixhG5vU/wAjmh8
wqQubnGIPnFeqvlL4yA9A2RFheH2rrYxLCk7Hrf8zqkJuNkt2vwOEGLKzMdtJhBQ
X50fBxNxZZwIJrlc5Fzeieyjd8DdhU1+LecY9ye1oBxvIxBUAUsKBDxZT4AaeaLu
41PjEx5GsL5FjPrWJRLgwoM9kNk4/KPb5fK0o3xbBiE3zk6dRLbQ8QLAWlLfZ6jo
lTGE/1/NNRUISYboXvup+gnoVvD6I+lO4SleXqCWiDxpCyqZ20O8Fem+Q/gmR1m/
A1SbsGRvbb4q5TfMyz0C+BFSDHKBwyDdZwauQeXIbC4DMVpLQz4JYozAwW3D0A7I
3Ej7UAzte+WwLaPgaUZvOVmeDFzw1Zd3MA+bw8Gt6PuNfMsea/mb9VsMt79JBi6W
gbba+EvNN5hiW9mtsBrTOSyZLLi16qIV9LKS5NmsgQg0P7RdLSgUiD2t3ufmhR9s
S5N+R6J8CbkNSXvrluqd89wb9l+Cjuu/Gm7USR7BIQ3Itpxl87KJv6AIwP5Eijso
ywy1thhjiE+iS2FIOL/8
=gjC3
-----END PGP SIGNATURE-----

--ZG5hGh9V5E9QzVHS--
