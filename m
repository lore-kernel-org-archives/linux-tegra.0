From: Mayuresh Janorkar <mayureshjanorkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] video: tegra: Add dc color dithering support
Date: Sat, 16 Apr 2011 11:56:00 +0530
Message-ID: <BANLkTikRRFSymKBkaK77xdb7mwPo-QttPw@mail.gmail.com>
References: <1302923939-374-1-git-send-email-rmorell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302923939-374-1-git-send-email-rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 16, 2011 at 8:48 AM, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
>
> This change adds support for display color dithering configuration in
> the display control structure. =A0Two dithering modes are possible:
> ordered and error-diffusion mode. =A0Error-diffusion dithering is usu=
ally
> considered higher quality, but can only be used when the active regio=
n
> is less than 640 pixels wide.
>
> This is based on patches from Chao Jiang <chaoj-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/include/mach/dc.h | =A0 =A07 +++++++
> =A0drivers/video/tegra/dc/dc.c =A0 =A0 =A0 =A0 =A0 | =A0 24 +++++++++=
+++++++++++++++
> =A02 files changed, 31 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/include/mach/dc.h b/arch/arm/mach-te=
gra/include/mach/dc.h
> index 254b732..696e6ed 100644
> --- a/arch/arm/mach-tegra/include/mach/dc.h
> +++ b/arch/arm/mach-tegra/include/mach/dc.h
> @@ -44,6 +44,12 @@ enum {
> =A0 =A0 =A0 =A0TEGRA_DC_OUT_HDMI,
> =A0};
>
> +enum {
> + =A0 =A0 =A0 TEGRA_DC_DISABLE_DITHER =3D 1,
> + =A0 =A0 =A0 TEGRA_DC_ORDERED_DITHER,
> + =A0 =A0 =A0 TEGRA_DC_ERRDIFF_DITHER,
> +};
> +
> =A0struct tegra_dc_out {
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 type;
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flags;
> @@ -58,6 +64,7 @@ struct tegra_dc_out {
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0order;
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0align;
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0depth;
> + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dither;
>
> =A0 =A0 =A0 =A0struct tegra_dc_mode =A0 =A0*modes;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 n_modes;
> diff --git a/drivers/video/tegra/dc/dc.c b/drivers/video/tegra/dc/dc.=
c
> index 16789c2..4241a24 100644
> --- a/drivers/video/tegra/dc/dc.c
> +++ b/drivers/video/tegra/dc/dc.c
> @@ -890,6 +890,30 @@ static void tegra_dc_set_color_control(struct te=
gra_dc *dc)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* The line buffer for error-diffusion dither is limi=
ted to 640 pixels
> + =A0 =A0 =A0 =A0* per line, so we can't use it if the active region =
is larger than 640
> + =A0 =A0 =A0 =A0* pixels. =A0Be nice and fall back to ordered dither=
ing, but warn so the
> + =A0 =A0 =A0 =A0* platform data can be corrected.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (WARN_ON(dc->out->dither =3D=3D TEGRA_DC_ERRDIFF_DIT=
HER &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dc->mode.h_active > 640)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dc->out->dither =3D TEGRA_DC_ORDERED_DI=
THER;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 switch (dc->out->dither) {
> + =A0 =A0 =A0 case TEGRA_DC_DISABLE_DITHER:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 color_control |=3D DITHER_CONTROL_DISAB=
LE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case TEGRA_DC_ORDERED_DITHER:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 color_control |=3D DITHER_CONTROL_ORDER=
ED;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case TEGRA_DC_ERRDIFF_DITHER:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(dc->mode.h_active > 640);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 color_control |=3D DITHER_CONTROL_ERRDI=
=46F;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
If would be a Good idea to add default case here.
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0tegra_dc_writel(dc, color_control, DC_DISP_DISP_COLOR_=
CONTROL);
> =A0}
>
> --
> 1.7.3.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
