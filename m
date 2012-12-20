From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] drm: tegra: protect DC register access with mutex
Date: Thu, 20 Dec 2012 10:36:15 +0800
Message-ID: <50D2799F.4010008@gmail.com>
References: <1355953137-31563-1-git-send-email-dev@lynxeye.de> <1355953137-31563-4-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355953137-31563-4-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

OK, you add a mutex in a tegra_dc structure. But I think there is no
parallel scenario while we operate on a dc. AFAIK, the functions which
you add mutex protection are called by drm sequentially(except for
function "tegra_crtc_load_lut" I'm not very clear about that).

So could you give us an example?

Mark
On 12/20/2012 05:38 AM, Lucas Stach wrote:
> Window properties are programmed through a shared aperture and have t=
o
> happen atomically. Also we do the read-update-write dance on some of =
the
> shared regs.
> To make sure that different functions don't stumble over each other
> protect the register access with a mutex.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> We could probably make this a bit more fine grained, but this would a=
dd
> some complexity and I don't really see a win there for now.
> ---
>  drivers/gpu/drm/tegra/dc.c  | 13 +++++++++++++
>  drivers/gpu/drm/tegra/drm.h |  1 +
>  2 Dateien ge=C3=A4ndert, 14 Zeilen hinzugef=C3=BCgt(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 54683e4..b256574 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -171,6 +171,8 @@ static int tegra_crtc_mode_set(struct drm_crtc *c=
rtc,
>  		return err;
>  	}
> =20
> +	mutex_lock(&dc->regs_mutex);
> +
>  	/* program display mode */
>  	tegra_dc_set_timings(dc, mode);
> =20
> @@ -269,6 +271,8 @@ static int tegra_crtc_mode_set(struct drm_crtc *c=
rtc,
>  	tegra_dc_writel(dc, 0xff00, DC_WIN_BLEND_NOKEY);
>  	tegra_dc_writel(dc, 0xff00, DC_WIN_BLEND_1WIN);
> =20
> +	mutex_unlock(&dc->regs_mutex);
> +
>  	return 0;
>  }
> =20
> @@ -287,6 +291,8 @@ static void tegra_crtc_prepare(struct drm_crtc *c=
rtc)
>  	else
>  		syncpt =3D SYNCPT_VBLANK0;
> =20
> +	mutex_lock(&dc->regs_mutex);
> +
>  	/* initialize display controller */
>  	tegra_dc_writel(dc, 0x00000100, DC_CMD_GENERAL_INCR_SYNCPT_CNTRL);
>  	tegra_dc_writel(dc, 0x100 | syncpt, DC_CMD_CONT_SYNCPT_VSYNC);
> @@ -320,6 +326,8 @@ static void tegra_crtc_prepare(struct drm_crtc *c=
rtc)
> =20
>  	value =3D VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT;
>  	tegra_dc_writel(dc, value, DC_CMD_INT_ENABLE);
> +
> +	mutex_unlock(&dc->regs_mutex);
>  }
> =20
>  static void tegra_crtc_commit(struct drm_crtc *crtc)
> @@ -330,6 +338,8 @@ static void tegra_crtc_commit(struct drm_crtc *cr=
tc)
> =20
>  	update_mask =3D GENERAL_ACT_REQ | WIN_A_ACT_REQ;
> =20
> +	mutex_lock(&dc->regs_mutex);
> +
>  	tegra_dc_writel(dc, update_mask << 8, DC_CMD_STATE_CONTROL);
> =20
>  	value =3D tegra_dc_readl(dc, DC_CMD_INT_ENABLE);
> @@ -341,6 +351,8 @@ static void tegra_crtc_commit(struct drm_crtc *cr=
tc)
>  	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
> =20
>  	tegra_dc_writel(dc, update_mask, DC_CMD_STATE_CONTROL);
> +
> +	mutex_unlock(&dc->regs_mutex);
>  }
> =20
>  static void tegra_crtc_load_lut(struct drm_crtc *crtc)
> @@ -747,6 +759,7 @@ static int tegra_dc_probe(struct platform_device =
*pdev)
>  		return -ENOMEM;
> =20
>  	INIT_LIST_HEAD(&dc->list);
> +	mutex_init(&dc->regs_mutex);
>  	dc->dev =3D &pdev->dev;
> =20
>  	dc->clk =3D devm_clk_get(&pdev->dev, NULL);
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.=
h
> index 3a843a7..eae1f56 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -84,6 +84,7 @@ struct tegra_dc {
> =20
>  	struct clk *clk;
> =20
> +	struct mutex regs_mutex;
>  	void __iomem *regs;
>  	int irq;
> =20
>=20
