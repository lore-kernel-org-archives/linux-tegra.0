From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ASoC: tegra: remove Whistler machine driver
Date: Tue, 13 Jun 2017 15:36:44 +0200
Message-ID: <20170613133644.GF16758@ulmo.fritz.box>
References: <20170413185559.1939-1-swarren@wwwdotorg.org>
 <20170413185559.1939-2-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413185559.1939-2-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 12:55:59PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The previous patch removed Whistler board support. There's no need to
> keep around a Whistler-specific ASoC machine driver.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/sound/nvidia,tegra-audio-wm8753.txt   |  40 ----
>  sound/soc/tegra/Kconfig                            |  10 -
>  sound/soc/tegra/Makefile                           |   4 +-
>  sound/soc/tegra/tegra_wm8753.c                     | 219 ---------------=
------
>  4 files changed, 1 insertion(+), 272 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-=
audio-wm8753.txt
>  delete mode 100644 sound/soc/tegra/tegra_wm8753.c

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/6mwACgkQ3SOs138+
s6HofBAAjbQefhwb7i7/buofttoEPyr0ssVALYoe3m5BO4y0bag5IrKDW5bLOYpe
Wk4sUaA/+jYGtemREBI0brr0u2wdZpfLHZN3ZvAztmdkZzfEcxr2XNpXg+2Yu1z2
CSI2qMdOpr1rL7GExKVDH3ABsyoKDO7a0i90SSK/xBQ7IhbRPJBsZwuyj9/6EK4p
kvl0Ln663tmCWs9IKxYnqEroq1a5zUlGlEljF/xV9ar1GiVKmOp2R7s7NnGtFF8j
arEsMPoX92IdMRZBEo9tzdWDJPg6G5540rZGvKrAl4UEA5iAtMYLBio1BgnQdPor
R6VmtAdi1WSTHVjkAXvH30Q3/bwfgyejnXotakZF5Y0/CcmlSbATwxF/Jh5VPDzG
Z/k8Ekwx1xNbG0tUHWSkXw7FFPQFssNB/TkaApHRBsbjamZD0lH1QhnOp9oflt1a
vnKV+7GLXNR/x2WVrE0RbQAKWeCGiMfvTm5u/V+PO4tLpD/coTAUiAw+8n/AEAEx
IfoAvQLlsJzGHAbVbCoPvqSii7YD9JymoGzajsOeBjrEQPXJyxj55fSa88t0Maib
o65tqdpj/YVtANmRulvoFRblvmhKtFZK8bPy0YFJotyZzKJhVvZ5k/8mx3yOZQzY
M2b78xVfabGVscmvXWDEUH7lBVhjJAN1gIh8oGig57Kag4vvnhQ=
=Ed+8
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
