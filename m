From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] i2c: Tegra: Add of_match_table
Date: Fri, 15 Jul 2011 03:52:57 +0900
Message-ID: <CACxGe6vU3gKVpDBwBr7UcLSk1VNsBaGTuJTWKPR8pRurdqiQqw@mail.gmail.com>
References: <1310668465-2535-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310668465-2535-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday, July 14, 2011, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> This patch was intended to be part of 7ca2d1a105a239e300b937e9c41a10a=
4bd08f569
> "i2c: Tegra: Add DeviceTree support". However, an early version of th=
at patch,
> which was missing a chunk, was applied to next-i2c. This change is th=
at
> missing chunk.
>
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 12 ++++++++++++
> =A01 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index 5a18d6d..f2156de 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -722,6 +722,17 @@ static int tegra_i2c_resume(struct platform_devi=
ce *pdev)
> =A0}
> =A0#endif
>
> +#if defined(CONFIG_OF)
> +/* Match table for of_platform binding */
> +static const struct of_device_id tegra_i2c_of_match[] __devinitconst=
 =3D {
> + =A0 =A0 =A0 { .compatible =3D "nvidia,tegra20-i2c", },
> + =A0 =A0 =A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
> +#else
> +#define tegra_i2c_of_match NULL
> +#endif
> +
> =A0static struct platform_driver tegra_i2c_driver =3D {
>  =A0 =A0 =A0 =A0.probe =A0 =3D tegra_i2c_probe,
>  =A0 =A0 =A0 =A0.remove =A0=3D tegra_i2c_remove,
> @@ -732,6 +743,7 @@ static struct platform_driver tegra_i2c_driver =3D=
 {
>  =A0 =A0 =A0 =A0.driver =A0=3D {
>  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0=3D "tegra-i2c",
>  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D tegra_i2c_of_match,
>  =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.7.0.4
>
>

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
