Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1242FC433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Nov 2021 17:50:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2AA761051
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Nov 2021 17:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhKBRxP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Nov 2021 13:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhKBRxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Nov 2021 13:53:13 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA6EC061714
        for <linux-tegra@vger.kernel.org>; Tue,  2 Nov 2021 10:50:38 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso5776otv.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Nov 2021 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JCnH8IVQSN/Tydtefp2s0zrp4McuTwvXnflW3E4hZFk=;
        b=VdBLOAQmTW8IYQmzlxua3oCaylRz+xtYXTY/C+2FP3cDsBBqJC/OlAfidpp+sAYfWh
         XZpOlzP9xIk4Vl25k7NFe9yrLOeWEoVdATlZYJ26fpbAEB29KxhDAWnAZSxunMaT21vy
         hovCeL8T24CqDQlv/nSLcDx0HVEb+OmzGUI5ZifOQetoIW7x0EMiF+Lx0Tjq9eWFMmAq
         +uypRNFbpVFIVTg3XXzms1kY+gwaskiDyGaj1ikcUZqT3D6v9UkQmRHG5parwKYwV+i1
         UKIZVaz02RXWOmjbe9NrrRmxgvtKjbwudjuwd84JzgQdu8Gtook+wRkf5xYqIxbAdgY0
         bC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JCnH8IVQSN/Tydtefp2s0zrp4McuTwvXnflW3E4hZFk=;
        b=IPMoX9WQDJrfO7NQFmYoh43UxKrJ0xoE30vZUionHc4HXssK6oAud1WHnGVD5zqxvp
         1fihCbmu8BeTc3GhVl8/BqEfbXcrYDxcygs6t/ApdoVyarSaYk71zAxdOyV+kNZXWYAw
         DsMDV2/hHRfJrNj0yMnXfcZwXBQFMs5U7v9TNBVv2oWROsR5S3mTsllOz198hZ/IyaxQ
         Z1SSeDdG2EfsvSAH7R9YeX8y5cdR99sRmZ1OQyFUUEKOYNT0uiD2V5Hh82m1xx+te5UQ
         i8YDYa81VXYtUIt+vt6q7myqr89FzzAPecQSVrJEnguSrHEaPDDgh0fHIz7rEoWciCJu
         5y2w==
X-Gm-Message-State: AOAM531TqcEF8UXTNNKOv0OD4zhrvq3VaVYfnQPpJLNFVLjga0WPi5Mz
        ynK9fd+wdEHdnSZF9lSb0Pkd8yudKPaQb0+s4X8=
X-Google-Smtp-Source: ABdhPJylgDZ1V00UpveCgBw7YMyDGwlexpSVyGJmOUKlwqguIVRxCkdmleuRmNBGUuHIPNCqVvqSPwGYxIIoWRPWgiY=
X-Received: by 2002:a9d:1b4f:: with SMTP id l73mr28917145otl.200.1635875437736;
 Tue, 02 Nov 2021 10:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211102145944.259181-1-maxime@cerno.tech> <20211102145944.259181-2-maxime@cerno.tech>
In-Reply-To: <20211102145944.259181-2-maxime@cerno.tech>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 2 Nov 2021 13:50:26 -0400
Message-ID: <CADnq5_Ne-t8QpdnxRjyyRNazus9pRtOzgA6Xd6HK=sjQg6xNtg@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emma Anholt <emma@anholt.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Dom Cobley <dom@raspberrypi.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Robert Foss <robert.foss@linaro.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Nov 2, 2021 at 10:59 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> A lot of drivers open-code the HDMI 1.4 maximum pixel rate in their
> driver to test whether the resolutions are supported or if the
> scrambling needs to be enabled.
>
> Let's create a common define for everyone to use it.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 4 ++--
>  drivers/gpu/drm/drm_edid.c                 | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c      | 4 ++--
>  drivers/gpu/drm/radeon/radeon_encoders.c   | 2 +-

For radeon:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

Note that there are several instances of this in amdgpu as well:
drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c:                if
(pixel_clock > 340000)
drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c:                if
(pixel_clock > 340000)
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:            if
(mode->clock > 340000)
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:                if
(mode->clock > 340000)

Alex

>  drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c | 2 +-
>  drivers/gpu/drm/tegra/sor.c                | 8 ++++----
>  drivers/gpu/drm/vc4/vc4_hdmi.c             | 4 ++--
>  include/drm/drm_connector.h                | 2 ++
>  9 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 62ae63565d3a..3a58db357be0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -46,7 +46,7 @@
>  /* DW-HDMI Controller >=3D 0x200a are at least compliant with SCDC versi=
on 1 */
>  #define SCDC_MIN_SOURCE_VERSION        0x1
>
> -#define HDMI14_MAX_TMDSCLK     340000000
> +#define HDMI14_MAX_TMDSCLK     (DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)
>
>  enum hdmi_datamap {
>         RGB444_8B =3D 0x01,
> @@ -1264,7 +1264,7 @@ static bool dw_hdmi_support_scdc(struct dw_hdmi *hd=
mi,
>          * for low rates is not supported either
>          */
>         if (!display->hdmi.scdc.scrambling.low_rates &&
> -           display->max_tmds_clock <=3D 340000)
> +           display->max_tmds_clock <=3D DRM_HDMI_14_MAX_TMDS_CLK_KHZ)
>                 return false;
>
>         return true;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 7aa2a56a71c8..ec8fb2d098ae 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_co=
nnector *connector,
>                 u32 max_tmds_clock =3D hf_vsdb[5] * 5000;
>                 struct drm_scdc *scdc =3D &hdmi->scdc;
>
> -               if (max_tmds_clock > 340000) {
> +               if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>                         display->max_tmds_clock =3D max_tmds_clock;
>                         DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
>                                 display->max_tmds_clock);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index d2e61f6c6e08..0666203d52b7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_encoder =
*encoder,
>                 if (scdc->scrambling.low_rates)
>                         pipe_config->hdmi_scrambling =3D true;
>
> -               if (pipe_config->port_clock > 340000) {
> +               if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KH=
Z) {
>                         pipe_config->hdmi_scrambling =3D true;
>                         pipe_config->hdmi_high_tmds_clock_ratio =3D true;
>                 }
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meso=
n/meson_dw_hdmi.c
> index 0afbd1e70bfc..8078667aea0e 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -434,7 +434,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, voi=
d *data,
>                 readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
>
>         DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
> -                        mode->clock > 340000 ? 40 : 10);
> +                        mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ ? 40 =
: 10);
>
>         /* Enable clocks */
>         regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
> @@ -457,7 +457,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, voi=
d *data,
>         dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>
>         /* TMDS pattern setup */
> -       if (mode->clock > 340000 &&
> +       if (mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ &&
>             dw_hdmi->output_bus_fmt =3D=3D MEDIA_BUS_FMT_YUV8_1X24) {
>                 dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTT=
N_01,
>                                   0);
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/r=
adeon/radeon_encoders.c
> index 46549d5179ee..ddd8100e699f 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -384,7 +384,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encode=
r *encoder,
>                 if (radeon_connector->use_digital) {
>                         /* HDMI 1.3 supports up to 340 Mhz over single li=
nk */
>                         if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor=
(radeon_connector_edid(connector))) {
> -                               if (pixel_clock > 340000)
> +                               if (pixel_clock > DRM_HDMI_14_MAX_TMDS_CL=
K_KHZ)
>                                         return true;
>                                 else
>                                         return false;
> diff --git a/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c b/drivers/gpu/drm=
/sti/sti_hdmi_tx3g4c28phy.c
> index d25ecd4f4b67..bc213232a875 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c
> @@ -102,7 +102,7 @@ static bool sti_hdmi_tx3g4c28phy_start(struct sti_hdm=
i *hdmi)
>         tmdsck =3D ckpxpll;
>         pllctrl |=3D 40 << PLL_CFG_NDIV_SHIFT;
>
> -       if (tmdsck > 340000000) {
> +       if (tmdsck > (DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)) {
>                 DRM_ERROR("output TMDS clock (%d) out of range\n", tmdsck=
);
>                 goto err;
>         }
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 0ea320c1092b..99a2d627bfeb 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1814,7 +1814,7 @@ tegra_sor_encoder_atomic_check(struct drm_encoder *=
encoder,
>          * For HBR2 modes, the SOR brick needs to use the x20 multiplier,=
 so
>          * the pixel clock must be corrected accordingly.
>          */
> -       if (pclk >=3D 340000000) {
> +       if (pclk >=3D (DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)) {
>                 state->link_speed =3D 20;
>                 state->pclk =3D pclk / 2;
>         } else {
> @@ -2196,7 +2196,7 @@ static void tegra_sor_hdmi_scdc_start(struct tegra_=
sor *sor)
>
>         mode =3D &sor->output.encoder.crtc->state->adjusted_mode;
>
> -       if (mode->clock >=3D 340000 && scdc->supported) {
> +       if (mode->clock >=3D DRM_HDMI_14_MAX_TMDS_CLK_KHZ && scdc->suppor=
ted) {
>                 schedule_delayed_work(&sor->scdc, msecs_to_jiffies(5000))=
;
>                 tegra_sor_hdmi_scdc_enable(sor);
>                 sor->scdc_enabled =3D true;
> @@ -2340,7 +2340,7 @@ static void tegra_sor_hdmi_enable(struct drm_encode=
r *encoder)
>         value &=3D ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
>         value &=3D ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
>
> -       if (mode->clock < 340000) {
> +       if (mode->clock < DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>                 DRM_DEBUG_KMS("setting 2.7 GHz link speed\n");
>                 value |=3D SOR_CLK_CNTRL_DP_LINK_SPEED_G2_70;
>         } else {
> @@ -2423,7 +2423,7 @@ static void tegra_sor_hdmi_enable(struct drm_encode=
r *encoder)
>         /* adjust clock rate for HDMI 2.0 modes */
>         rate =3D clk_get_rate(sor->clk_parent);
>
> -       if (mode->clock >=3D 340000)
> +       if (mode->clock >=3D DRM_HDMI_14_MAX_TMDS_CLK_KHZ)
>                 rate /=3D 2;
>
>         DRM_DEBUG_KMS("setting clock to %lu Hz, mode: %lu Hz\n", rate, pc=
lk);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index fab9b93e1b84..fc7247cc1022 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -97,11 +97,11 @@
>  #define HSM_MIN_CLOCK_FREQ     120000000
>  #define CEC_CLOCK_FREQ 40000
>
> -#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> +#define HDMI_14_MAX_TMDS_CLK   (DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)
>
>  static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode=
 *mode)
>  {
> -       return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
> +       return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
>  }
>
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b501d0badaea..030636635af1 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -260,6 +260,8 @@ struct drm_hdmi_info {
>         struct drm_hdmi_dsc_cap dsc_cap;
>  };
>
> +#define DRM_HDMI_14_MAX_TMDS_CLK_KHZ   (340 * 1000)
> +
>  /**
>   * enum drm_link_status - connector's link_status property value
>   *
> --
> 2.32.0
>
