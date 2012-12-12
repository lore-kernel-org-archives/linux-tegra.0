From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: fix front_porch <-> back_porch mixup
Date: Wed, 12 Dec 2012 16:44:06 +0800
Message-ID: <50C843D6.3020707@gmail.com>
References: <1355259101-17815-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355259101-17815-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Acked-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On my Tegra 30 cardhu. Thanks, Lucas.

Mark
On 12/12/2012 04:51 AM, Lucas Stach wrote:
> Fixes wrong picture offset observed when using HDMI output with a
> Technisat HD TV.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> Captions are a bit confusing here. As the porch is always relative to
> the sync pulse, the left picture margin is actually the back_porch.
> ---
>  drivers/gpu/drm/tegra/dc.c   | 8 ++++----
>  drivers/gpu/drm/tegra/hdmi.c | 6 +++---
>  2 Dateien ge=C3=A4ndert, 7 Zeilen hinzugef=C3=BCgt(+), 7 Zeilen entf=
ernt(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 0744103..54683e4 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -102,12 +102,12 @@ static int tegra_dc_set_timings(struct tegra_dc=
 *dc,
>  		((mode->hsync_end - mode->hsync_start) <<  0);
>  	tegra_dc_writel(dc, value, DC_DISP_SYNC_WIDTH);
> =20
> -	value =3D ((mode->vsync_start - mode->vdisplay) << 16) |
> -		((mode->hsync_start - mode->hdisplay) <<  0);
> -	tegra_dc_writel(dc, value, DC_DISP_BACK_PORCH);
> -
>  	value =3D ((mode->vtotal - mode->vsync_end) << 16) |
>  		((mode->htotal - mode->hsync_end) <<  0);
> +	tegra_dc_writel(dc, value, DC_DISP_BACK_PORCH);
> +
> +	value =3D ((mode->vsync_start - mode->vdisplay) << 16) |
> +		((mode->hsync_start - mode->hdisplay) <<  0);
>  	tegra_dc_writel(dc, value, DC_DISP_FRONT_PORCH);
> =20
>  	value =3D (mode->vdisplay << 16) | mode->hdisplay;
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdm=
i.c
> index ab40164..81ea934 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -479,7 +479,7 @@ static void tegra_hdmi_setup_avi_infoframe(struct=
 tegra_hdmi *hdmi,
>  		return;
>  	}
> =20
> -	h_front_porch =3D mode->htotal - mode->hsync_end;
> +	h_front_porch =3D mode->hsync_start - mode->hdisplay;
>  	memset(&frame, 0, sizeof(frame));
>  	frame.r =3D HDMI_AVI_R_SAME;
> =20
> @@ -634,8 +634,8 @@ static int tegra_output_hdmi_enable(struct tegra_=
output *output)
> =20
>  	pclk =3D mode->clock * 1000;
>  	h_sync_width =3D mode->hsync_end - mode->hsync_start;
> -	h_front_porch =3D mode->htotal - mode->hsync_end;
> -	h_back_porch =3D mode->hsync_start - mode->hdisplay;
> +	h_back_porch =3D mode->htotal - mode->hsync_end;
> +	h_front_porch =3D mode->hsync_start - mode->hdisplay;
> =20
>  	err =3D regulator_enable(hdmi->vdd);
>  	if (err < 0) {
>=20
