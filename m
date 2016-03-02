From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] thermal: tegra_soctherm: fix sign bit of temperature
Date: Wed, 2 Mar 2016 15:40:46 +0800
Message-ID: <56D698FE.7070706@nvidia.com>
References: <1456739480-3304-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456739480-3304-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi, Rui & Thierry & Matt
Could you please take a look on this patch.
It's a bug on the temperature's sign bit, it can't show the negative
temperature, although it will not cause problems for now.

Thanks.
Wei.

On 2016=E5=B9=B402=E6=9C=8829=E6=97=A5 17:51, Wei Ni wrote:
> The sign bit of temperature readback is bit 0, not bit 1.
> Change to BIT(0) to fix it.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/thermal/tegra_soctherm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegra=
_soctherm.c
> index 74ea5765938b..136975220c92 100644
> --- a/drivers/thermal/tegra_soctherm.c
> +++ b/drivers/thermal/tegra_soctherm.c
> @@ -57,7 +57,7 @@
>  #define READBACK_VALUE_MASK			0xff00
>  #define READBACK_VALUE_SHIFT			8
>  #define READBACK_ADD_HALF			BIT(7)
> -#define READBACK_NEGATE				BIT(1)
> +#define READBACK_NEGATE				BIT(0)
> =20
>  #define FUSE_TSENSOR8_CALIB			0x180
>  #define FUSE_SPARE_REALIGNMENT_REG_0		0x1fc
>=20
