From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: Fix pllre Tegra210 and add pll_re_out1
Date: Tue, 12 Apr 2016 17:23:36 +0200
Message-ID: <20160412152336.GF25160@ulmo.ba.sec>
References: <1458590333-8898-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458590333-8898-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 03:58:52PM -0400, Rhyland Klein wrote:
> Use a new Tegra210 version of the pll_register_pllre function to
> allow setting the proper settings for the m and n div fields.
>=20
> Additionally define PLL_RE_OUT1 on Tegra210.

It'd be nice to specify what that additional clock is used for. No need
to repost for that, I can add it when applying.

Thierry

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDRL3AAoJEN0jrNd/PrOhJbEP/RJpLVn9zWjB/rtjdCKpyGam
Xl21CWpu0q3nn5g0C7VSH4k8SAAKf+K3XvZT2L4tJfBDWncaFji/Py/J5DGrwrEL
CvVWPH+XJvtteUJKh88+5CkINwXGCbdiIAY2/jRcBPS86WcXVKTwecXUabb5HUoD
oMGMfi3eT+9irEsTcXvpPhmGajH/cfEMR8rqPAdFEjcq6HtciMcVXZvX3xD27Bho
1JG3NcutOw6yUB1L4zQfCheZuTQ84rSLgKbSD1MQMbpF+Aj28ooQkWCOyGM2vOdX
pNPg8SDu/Dz9tkh9VecgHm35A+1fsF+J5DOzZr2wc8TkXESXvWrChdOmCeTqvJQb
6W3R91StCcz5njyFJ+nuloJaQCarZwg6ZBmjhU1nfQhOzvFeqMlgF5pOwYIEDVp8
aU8pljGU4AkdL1S6G44mxQix+5kT3vXMbFK4ar2ojeg1eMjMkD1mN3Bx1Ay8N3a9
uwJsKRjkrB9vCo274iQHbDbEbne2zWyDcmCOEpOPh/z7Ke7GCs//0uvWtURkbE7+
UUEN6Gfqjrn/CLXxZSEacxp1UDqw8Pt3+x3SSPueZdCbrnAmBJnNZ3wEpIHwwYW1
ex/izWjZZsQUnz9S85WNTMUecDgD09rT5k3UCUMsp6KmKn2TGa1al7q//TgmWzju
75zA9fZOEQp/I88Ff2G2
=4d7T
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--
