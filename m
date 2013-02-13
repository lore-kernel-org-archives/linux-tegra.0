From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix driver to match DT binding
Date: Wed, 13 Feb 2013 16:53:13 +0100
Message-ID: <20130213155313.GA24119@avionic-0098.mockup.avionic-design.de>
References: <1360697642-22620-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360697642-22620-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2013 at 12:34:02PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> enum tegra*_clk is intended to match the IDs listed in the Tegra clock
> bindings. There are a few mismatches, which this patch fixes:
>=20
> 1) pll_s and cop were left out of the Tegra20 enum.
>=20
> 2) spdif_in and spdif_out were swapped relative to the Tegra30 binding.
>=20
> 3) i2cslow was misnamed as i2c_slow, and a duplicate i2cslow clock added
>    to the Tegra30 enum.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c |    4 ++--
>  drivers/clk/tegra/clk-tegra30.c |    6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Looks good to me and I haven't seen any regressions, so:

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Tested-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRG7bpAAoJEN0jrNd/PrOhlp4P/3tQ9qx8whSmThpkqdPIt3y6
zrbwNSs28MYHIyKKN/FEQDYBfX9NPUACBy6DbU9+PuesudR5Lqf0Tc1wfIn7hbRZ
jsjOmvGJxi17cIHxo6eoS64BjI2UNLj4eHce1krw/9IZ876OVn6fM66OhWaZHf1u
hcxIUw4+nwXHsptabhIKSp95LhJmUpjHaKsyTfXLN9h0pQ2xBdYlzzgDsX4rvots
qRboq42TjtVkzsGivsjgLGnRxnZev/lXtRqHSyotc4Nw/10hq3Xs70FAfV4np79B
KU+j6MKm9jYUpGpV1bA/wDrbB2uYoQdMR7pJkei+z1jLL2CYgvdUi50CnU6YfTK0
Tt5nQpipY80699H6XONXgbw94Mp6m8/SreSbIJ7MAc0HHuF/jQAhDM6mFJyjAl57
QD2WpBfAFHwYdM0qs53HgDHosL25bOk5jo2g9w4f+jvvlfZVQVqffgsr8yaNa8w0
gmQPu8TH0iQ7KobvXcInqC5TF6DHx2Ep2xtGONik9x9G4auDzW0YbT6RAJ7Ekpxl
/fMoDLJd3hiIZER4FCSZW4JNvUTKs8xK+WUGVQiL57XVXGjicJB1Mpbt67TZqupM
/yyGoMc5f45ehoARKSQpCmj3HClw+U+/vcaU0Jfv98v24LfME1vIWCBbi7S/6At3
rFEly18A4nEszPIxJQRn
=R6+6
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
