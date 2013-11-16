From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 15/31] ASoC: dmaengine: add custom DMA config to
 snd_dmaengine_pcm_config
Date: Sat, 16 Nov 2013 09:44:12 +0000
Message-ID: <20131116094412.GD15393@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-16-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-16-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2013 at 01:54:10PM -0700, Stephen Warren wrote:

> - DMA device

>   This allows requesting DMA channels for a device other than the device
>   which is registering the "PCM" driver. This is quite unusual, but is
>   currently useful on Tegra. In much HW, and in Tegra20, each DAI HW

Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

but this one especially I'd like to get into ASoC as soon as possible
since this one should be being used by other things.

I'm a bit concerned about anything actually using dma_dev since it
indicates that something is being worked around, it'd be a bit nicer to
print a warning when doing this to give people a hint that they might
not be doing the right thing if they use it (unless someone comes up
with a system that has a clear use case for it).

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJShz5pAAoJELSic+t+oim9deAQAIs8XZico8Q0otysp+TrrtRa
n+ZeJEDI4jwkbyf5yit5+QGO38GdgIbit1I5av+mieeyhsZ0FhfuRtyI1ngxfAGG
zu5zUHiRKsywv2XA5tTs6182tXNAMaKGZFYQ9LF+9W1dreLu69KILdTPBzq9zKD4
ucWE2robKjkQ86kS+1+L2YONuXF48MvnYNcQ+VWUfb+c18cY1ZrveivtUe9a6JWp
N5obL2xtvdXUeT06kbFHK/03tIxufxAEN+I8yTsVOAUIxMSANHDmTNlCWaLYTUBt
Q8rG9BEqohpJI4lNaTzpcmdcBuZy7ufrjcw1zfdGg+jQm7VuyZaezR+FPaFi4XKL
KOEuk5hgaiEHIjCoeyc1bfkZMkV8blhi6oQ3nUIGMSY/M+TceABZZM8UPWFhfIST
LPypkus+0PBtKVIxv7/pmGhSQ930SoaL9a60rNYTIeBvSGmEvkXwYBIvdYddjR4c
RDGOXq+zt9v2sD6wwpxzks+201qkOx9RoCxPNOUwWmDztWaZJ3IAzcHn92BhXQyz
8iXGfVVQQphJ5xgiTdnSBFAE1REJboaov4ekN1iYGzPKnLPABdRNgbeQr4xmeCYI
UgdYImQ87dU1kpEPYghRu+0YrJVWBqX4JucY5aEHXkQIgVxIieo5IPwsr51YiuDN
s6AkEaT0fbRyc2IizSGc
=0IfW
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
