From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: configs: Add Tegra I2S interfaces to
 multi_v7_defconfig
Date: Mon, 31 Jul 2017 12:22:55 +0200
Message-ID: <20170731102255.GD26667@ulmo>
References: <20170730112220.15525-1-contact@paulk.fr>
 <20170730112220.15525-3-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170730112220.15525-3-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2017 at 01:22:20PM +0200, Paul Kocialkowski wrote:
> This selects both the Tegra20 and Tegra30 I2S interfaces (that were
> previously auto-selected by Kconfig but are not anymore) to
> multi_v7_defconfig, as modules.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thierry

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/BP8ACgkQ3SOs138+
s6EhHQ/7BCxGbfvF/PXB2zh8oFQYdQdIwynyq2WnGSEotWdyP0fq63u5qGFttbpI
fRijZQAxwfkgRXxtgCktPHqhYAzjcwr3WdkM+6mtcj/DECwQ0t/moBcKBDgsszSA
9+E4H+swyOocXxVzoKk1SrkP2S0trF8oGj5jlWKeRUPL0PTbUuTFoG7+Q4tvfoMU
QWx+lNcucCvn+EzT/vhgOGxqhwFYL6Yl1NlNzuabrPByRG++rmvKolXCVrWz6nag
x59QYn2KIJhPpNVT4O4rGFMNM8YNC298GZvHShDiZqBkHPkzh69F+xZacorB5oWC
PeMpgSD4tH28Dlmjo3Q5urXN5MzmjoojOFFpW/4h8TB0ZxxHrRGd3Ljt2qBI00fE
t2TNDd+EhbXqUaYItj8t3kfaPhPhVidKN2koZniHU578Fy796xYHWWHKZLYC4XB9
ZVD0xDfdAQgrZcm8u4ZLGkBpWl85i7G/t55EIf8NOxNTrwpqUPt30m7kTjcjTUu7
zbGOqiT3A9F+kDhqS0xGF+A1lDdHmhziiZj9w4MoAAYHDY35bWMTNtwC2wTinf2h
9ZIXPKA/0G57iFhHP0cuoqfbauV7lrjDpFyXT5INwhdXsnxEP0bi4285n2rE6S05
bp6fuyFVb6Zw/yIVqFSTM/GQd6dbRW24iffPF7SuaDee/EU5If8=
=tTOX
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
