From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 19/31] ASoC: tegra: convert to standard DMA DT bindings
Date: Sat, 16 Nov 2013 10:05:39 +0000
Message-ID: <20131116100539.GI15393@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-20-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZOudaV4lSIjFTlHv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-20-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZOudaV4lSIjFTlHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:14PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> By passing no flags when calling snd_dmaengine_pcm_register() from
> tegra_pcm.c, we end up using dma_request_slave_channel() rather than

Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--ZOudaV4lSIjFTlHv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSh0NwAAoJELSic+t+oim9la0QAJx8IVE5JaHjxSZ/73ff9nTD
NzFhS5dR2Frd+fu5bicXSs5b++/4IFE90Riq1AnoiH0qxUnR8Cp51JCpQaMLrT1H
aLt0Irz8KlZt2kfkLlkZXLjYLdIx+anDRqb2C9brYzeuSTpT1TfKc9Z9uQYb6cJa
fMgVjVHLZRqb3EynUVVnJ9yp7335oAXJEJAHxHRmNeBsIfrEI2xvAbZ5vyz8jL4d
7OfU4iXAbDLn0WDOuHcguvVHcoDXc15EyV5tCAwljg1gxTR1DzW53Usw4W9xiPgm
m9frMotFuTNEerUk7WfxmUwNQ/I21qdtFeYk72eE4EVdlEUc+whaG2vV4mL9aGyk
sd93qtZ3qEosqKXDwrBn2dLI6GPiHwwlzjST/9vr+TF694+/PZVmZ2H+dSa68hJy
vKuHTjxwPrDmpV+oahtGN70xsqOw6LCjQ5/L6PK2Y+aZxdK/yrqulqSo43dUw4MF
RWYle2D1bXxp02zPUpj38blQzAM4CoO1/xDYSorctVCEBlzmy7I3W6Ul+3omAgst
fBXwlmgjV8TjEfz6bAY1+oQuPr9B2ygaQQubGcdO2/f1lrqEY5RFmnfpVK5ycVSY
b5W1O4VQ5LAD0vkEi+VnBsLZlm+GtHABnoWFPjGO1O5d52KklxDXEkrnbMrekBO+
9+bSdTfcmvxOjZGdEPM5
=Cnbw
-----END PGP SIGNATURE-----

--ZOudaV4lSIjFTlHv--
