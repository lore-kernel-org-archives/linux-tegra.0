From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Fix compile when !CONFIG_OF
Date: Thu, 14 Jul 2011 07:48:25 +0900
Message-ID: <CACxGe6sVmpSTAxan3zRz-hQ=uoiVuekm-7r0L9_F5EWPPhS_3A@mail.gmail.com>
References: <1310589418-15821-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310589418-15821-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 14, 2011 at 5:36 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> When !CONFIG_OF, <linux/of.h> doesn't prototype of_get_property(), wh=
ich
> causes i2c-tegra.c to fail to compile. Make the references to this
> function conditional to solve this.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Grant, is this the correct way to solve this? Other solutions I can s=
ee are:
> a) Make ARM or Tegra select CONFIG_OF, now that ARM is moving to Devi=
ce Tree.
> b) Make <linux/of.h> provide dummy inline versions of its functions w=
hen
> =A0 !CONFIG_OF.

The solution you chose is sufficient for now, but turning on CONFIG_OF
unconditionally for Tegra would be fine too since I hope to get the
tegra board-dt patch merged for 3.1 (I hope to have the patch cleaned
up and posted in the next 24 hrs).  I've been avoiding creating a
dummy inline of of_get_property(), but not for any particularly strong
reason other than to avoid bloating linux/of.h.  I probably would
accept a patch that added it.

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

g.

>
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index 2440b74..5a18d6d 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -610,12 +610,15 @@ static int tegra_i2c_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0if (pdata) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c_dev->bus_clk_rate =3D pdata->bus_c=
lk_rate;
>
> - =A0 =A0 =A0 } else if (i2c_dev->dev->of_node) { =A0 =A0/* if there =
is a device tree node ... */
> + =A0 =A0 =A0 }
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 else if (i2c_dev->dev->of_node) { =A0 =A0/* if there is=
 a device tree node ... */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop =3D of_get_property(i2c_dev->dev-=
>of_node,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"clock=
-frequency", NULL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c_dev->bus_clk_rate =
=3D be32_to_cpup(prop);
> =A0 =A0 =A0 =A0}
> +#endif
>
> =A0 =A0 =A0 =A0if (pdev->id =3D=3D 3)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c_dev->is_dvc =3D 1;
> --
> 1.7.0.4
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
