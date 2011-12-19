From: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] i2c: tegra: Add __devinit/exit to probe/remove
Date: Mon, 19 Dec 2011 12:23:40 +0530
Message-ID: <CAM=Q2csGoQR8PZhQO_oeVZt9CqEq377Ut8swY5g12M_=71on9g@mail.gmail.com>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324189772-26914-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 18, 2011 at 11:59 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> This fixes some section mismatch build warnings.
What was the error was a devinit function called from these?

>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: New patch.
>
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index 46b6500..e8560ed 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -558,7 +558,7 @@ static const struct i2c_algorithm tegra_i2c_algo =
=3D {
> =A0 =A0 =A0 =A0.functionality =A0=3D tegra_i2c_func,
> =A0};
>
> -static int tegra_i2c_probe(struct platform_device *pdev)
> +static int __devinit tegra_i2c_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct tegra_i2c_dev *i2c_dev;
> =A0 =A0 =A0 =A0struct tegra_i2c_platform_data *pdata =3D pdev->dev.pl=
atform_data;
> @@ -690,7 +690,7 @@ err_iounmap:
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> -static int tegra_i2c_remove(struct platform_device *pdev)
> +static int __devexit tegra_i2c_remove(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct tegra_i2c_dev *i2c_dev =3D platform_get_drvdata=
(pdev);
> =A0 =A0 =A0 =A0i2c_del_adapter(&i2c_dev->adapter);
> --
> 1.7.5.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
