From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add power domains to Tegra BPMP firmware
Date: Tue, 15 Nov 2016 16:39:14 +0100
Message-ID: <20161115153914.GA22611@ulmo.ba.sec>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719191442.15439-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 01:14:40PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The Tegra186 BPMP is also a provider of power domains. Enhance the device
> tree binding to describe this.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> These patches all build on top of Joseph Lo's baseline BPMP binding patch=
es[1]
> and enhance them to represent a few more features of the firmware.
>=20
> [1] https://lkml.org/lkml/2016/7/19/280
> "[PATCH V3 01/10] Documentation: dt-bindings: mailbox: tegra: Add binding=
 for HSP mailbox"
>=20
>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 10 ++++--
>  include/dt-bindings/power/tegra186-powergate.h     | 39 ++++++++++++++++=
++++++
>  2 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/power/tegra186-powergate.h

Applied, thanks.

One small comment below...

> diff --git a/include/dt-bindings/power/tegra186-powergate.h b/include/dt-=
bindings/power/tegra186-powergate.h
> new file mode 100644
> index 000000000000..388d6e228dc8
> --- /dev/null
> +++ b/include/dt-bindings/power/tegra186-powergate.h
> @@ -0,0 +1,39 @@
> +/*
> + * Copyright (c) 2015-2016, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_TEGRA186_POWERGATE_H
> +#define _DT_BINDINGS_POWER_TEGRA186_POWERGATE_H
> +
> +#define TEGRA186_POWER_DOMAIN_AUD	0
> +#define TEGRA186_POWER_DOMAIN_DFD	1
> +#define TEGRA186_POWER_DOMAIN_DISP	2
> +#define TEGRA186_POWER_DOMAIN_DISPB	3
> +#define TEGRA186_POWER_DOMAIN_DISPC	4
> +#define TEGRA186_POWER_DOMAIN_ISPA	5
> +#define TEGRA186_POWER_DOMAIN_NVDEC	6
> +#define TEGRA186_POWER_DOMAIN_NVJPG	7
> +#define TEGRA186_POWER_DOMAIN_MPE	8
> +#define TEGRA186_POWER_DOMAIN_PCX	9
> +#define TEGRA186_POWER_DOMAIN_SAX	10
> +#define TEGRA186_POWER_DOMAIN_VE	11
> +#define TEGRA186_POWER_DOMAIN_VIC	12
> +#define TEGRA186_POWER_DOMAIN_XUSBA	13
> +#define TEGRA186_POWER_DOMAIN_XUSBB	14
> +#define TEGRA186_POWER_DOMAIN_XUSBC	15
> +#define TEGRA186_POWER_DOMAIN_GPU	43
> +#define TEGRA186_POWER_DOMAIN_MAX	44

It's slightly odd that these are named TEGRA186_POWER_DOMAIN_* since
power domain is a Linuxism. All documentation that I've seen calls these
powergates.

I guess since this is now ABI there is not much we can do to rectify it.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYKywgAAoJEN0jrNd/PrOhLEEP/1qn92gVNetuKfsaiDr/yWDO
EuVIFS/gVuwTV7xLe+Bi8Bfxw4oiNRWQw5pQhqJB7EgzDAVys6MrW/O15C98nHDX
WddrEGJhWAlsjNNrqLgHz1OGLA9yciBwxcC64DAKlp62DQ+Q1vVhrIfbIrsApfY3
nLSMVVuTe2iCTUfmhv8tl8hLqe6JC4aYVq47QR2e340oB/Zb1R65btQzezmjkjHf
TCTuZf6YECNxBMsXlUJmVs8sotU/gETvAARRHcwyYKaZMtaPuAeKaFYv23HCfUAC
V8od5pHuTUmimMSJJQSE2LyctK/X+koa8VmQwJfeBLUa83XEdUmq8k7CkZf6yc6O
2jS6JahjUwXLAOztTovXqbG+TSYEv+5kiy1t2x1JX0VGhxI6uLS2/ssS4kBDMaBV
A9xhhXqF6XVlyhfjOi3G+HWaR+fMpx4Yx6v9R/4CQpTMIP/9Mvc2pvveGtreG/3U
aaRuQYFE9o6R5ASFhlHoKcasDVUgnwYbvGCopdLhOpRXl9nJL74XwiSt4Am/y+W5
PRo94ht02WXJtwNox2TX6EJqHakhdLCEjFUemKdIcdf2SE6s9BMpp0AoDy7UVAxI
qDYM16G4sKC5LC0I6akd5rGxGVtFJ2T2O7OfhSsoYMo58GADqoMCNmOfruY5V6TO
FeyW5p127JCkb2S+SdZo
=lGVm
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
