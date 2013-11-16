From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/31] ASoC: dmaengine: support deferred probe for DMA
 channels
Date: Sat, 16 Nov 2013 09:29:44 +0000
Message-ID: <20131116092944.GC15393@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-15-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-15-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2013 at 01:54:09PM -0700, Stephen Warren wrote:

> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.

Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

but please do provide the branch (ideally just the ASoC core stuff)
since other drivers ought to be being enhanced to use this.

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJShzr5AAoJELSic+t+oim9OQkP/jL/dgwNpY+2ET8kAhfQnfxX
BSD1pNZKxCyyLX/MMEaNBkEkDtHoCS6tGw7KzWM/OQBGgltmpMF78FDY1kuaEJj8
My0MRagLEdsG9PndlPa8Y4gZBwRkNSxls6t/tWvZgATKrS5iQ4NPEKWYkNaXJTUl
xLYaFtFz02ftItXn1UceP49atGu5Xtl4iyJFz+1auwYc7goFkpvUvEZ7mm5B6Lt3
y2r7+wMHxojTvNLQk2qpHhCZEtflN9w6p7iO+Rgyo/YFLv3zZge861Wz8blKzHzU
XwjtYDfuLOuweagTcbDb1JVIA+LVAzHTMi9z371QjQrp7CWu3woKp8t1UJNBXSCi
uzuIid9e5PVh19SSGMmeK5h2Z065qdeND2jBkwlfK+9eKRNptVnLILDcngBKJaRc
kEc0h83+oJ58gO3rRULiyjzqwoyG1Fh4bIIFTW/qY7lQVvERJ+O1rd3M6lB1XIVC
MhhTdh30ZQOhWy0DkMm3heTe38Cp+2lD0aBJ4MYxBF7lTaUahvvM8G9Vu9otMqOr
VmqtWGLEzwXZambFmPPBaJNA40h9ThJ/lCpuuJTL+aaiwI/T9Y/UY+qIL3IlDYVo
AqoClLOrydSQh9vS3k1dg4La2ysOLWi++yX4TM96t7VagCSFW4JrEcpBxiaH42tw
Oai0phm8BuHKYirv0+76
=hZXp
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
