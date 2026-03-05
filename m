Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9F3BED66
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724124; cv=pass; b=QnmIIlhvOj31OmSH/iOWycQ2d0D74diHI42jVgFMfm09lZ3eIBankw+Mb8TO+rKZCEGiXrbc3y1mkBBvxkusL7dQ3p+nZRzaK4Jrr7AnnEzWCrZiZd3VcP10LCjcp1KfcsvZsB47anFmn26mDUuDnANePM/n9GXl7OLfZzykyg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724124; c=relaxed/simple;
	bh=U7/+rd+5MeAPjg8hm3K40JiUQ2NOIMCf4Ic1O3zFjFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtfohaYNQBtLg5ceguNtfKwuA1Eb3ns3P0TTkuR/3Wep3QdRSHlat67RYYRWHX/q0Ov/y7lCLbThorQfxJFGy2SJq6lTFjyfYldBhwjv/avQNE8nBADOFpuImgRELVza2qJiGeArNPjMj4cNwuMNf9eyWJYrZ6F4tvkcV5Y4h2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A609ci4H; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A609ci4H"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso72611655e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 07:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772724120; cv=none;
        d=google.com; s=arc-20240605;
        b=JpTGDNXhcPEGTovd5oMB1vvIe46DFBz1ONTlhWjkeMiqTO1U85R2DQcNA4dzRBUtLG
         du4KksXTTPqOwisQtZV+8fLYNSq2xLDGuu0Pg02oOKt8kkjHy5Ny217AtEsJJCffe27/
         gXt88WnRt5BjSdVFtl0ZFHK+Pl8NmKX3i6H/XWvrHuO3iNUbaKbi2+ZLlspDvg87yHyb
         q7+NsvTWS1IB5Qhi6/DOJGnufhXgR3BGdYGUFU5Uccfex4ht6GPXlk5om0jBA/PuXkxv
         vsZDhDMMbA6FZveAPcfxVDPfUtJV7XvaA9PvJWs9cPC+cWah//YCKnZ6jeBhXFFS4c6V
         MezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jqmiLxm1JEv5hCt6EVT4PE6zg6wsKVc3c6TB8BqOoK0=;
        fh=YJyKzvrV2CApaov0KuYLb1fjJwj0decxOuRqVv1t70Y=;
        b=Lc05lbbxfILevbfxmZbFRAvU8P18m8ds5bROh2tMdsd32LTIvC3D+Yw36KVrcpJLij
         tP3nxmk+NSJJ3GwZzAUzijRAr1EtPcwsWHZfoIQq+8TXNIhVMd0bDZoNZvro6ibLnpOu
         nY9H9uQjFmWOD6HuJna7HqcgCJgp/mySCyYUZCd/fA9Jr/rtqjAJcHrp7xgAJmTnS1MH
         1Cc1V6+dFptcYwHCn6IOH01+mqMd0+H9MIV4ingobS49/lRfbfkqxFj8cyREktz/Mu9f
         nWZJmFeahy3vvE1l31qjmecX82NecC8y88fXPBxeb0iLcPusGdXCCGohafeRwqkQ7pTZ
         cNAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772724120; x=1773328920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqmiLxm1JEv5hCt6EVT4PE6zg6wsKVc3c6TB8BqOoK0=;
        b=A609ci4HPofYAmAeclpPywemHpMyAtxp6Il+sS2t/leKU497uuAE22Elnn6OXJ3WRu
         FNY8BnRTLOAFB++KS+C6oEk7GHWEIlRCAyiNNWxPhbm58CVztsVFk+YVyNf688eOYwHK
         9SuSgWMaYC6q97B1QgslKVDhKXQdteK8D450pvWSsRqRqfeC0z2aNtgkxgdQ1tsdzMIt
         0/F85r8OAU8e6Nr1PBEIQ8c2oHL2ri1We3QPIIVLwpdRfgeLCC0I6URLXlpxrZCvMe8f
         ewLyhgOFAY9ubbc7gaY3BR5bnvZH4ZVHbK5GBdh7Qbq9lblkeazcaH3jyXRlM4uVlKlg
         1uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772724120; x=1773328920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqmiLxm1JEv5hCt6EVT4PE6zg6wsKVc3c6TB8BqOoK0=;
        b=JKkh7GK9qBjS6zYmUX8icWacZS+B4l4DtRmVgqjwxUCe8bhEcVnukBGCrUFfHfwN3t
         wM2JvbZalAlqpaldpBhHRqV69DuzO73BS6ZFg4tIGd7dlgcr7aDRjG/Yyn25cp7RCJMa
         YRdjpdT4P0xe8kHZH02cJPDBsaapATN/llDqox26ntbvL7zJDqIXxWMAnHy9jmN9809v
         JLx1gR46osKsw1CFhd2sD4cClOodnC3eLJ/5LDp5mRSncJDAadCG/75p8IT1xoDUiYKE
         J4vp0eP2tk5wFuRQUSJSpsGpkuv9WyesD/vjf3b0P/rRMEhlbk7FKWMaxC89QITLw1mx
         n7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWP4BE3+BsFRgEXN47ySGtocwsetO4ibbBI9BMtERHFS9Rqqq/5/pa6RxY3um+Fr6YLHX2S5PXtLgqGtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JNvtzcJewAMCIzkbLT1O8VZJdbHmVMnG6vhOu1oIO4SlT34e
	m0OFPfUO3buESwJ0DIp47gGsYZa0rbIRUI19ptTnYGuUzsRzMt18rV0LFcbvy1LrBjbrvLRX2KO
	Sng1YLuqWVN9IMhZZDciIf23p3uJRk2Nc8XIO
X-Gm-Gg: ATEYQzxjAEZIcBZRZ76Z0hM8uIVZLeLOOCg/sthQaC+4lZeGQYVr/YW0qs6ekrG5BGC
	Y2cZj7Y+DGtobjHdZPZzxL01Lu7ryUlTmyD13r5/m4pNGBNO7RcC8DxNkXIzxIDyfy2PJ6oKtBp
	PTH6oSVdSL7n/u1wD9qM/Btlwe3gt2rRlwddPZ4wf1fk2kWgWzP1LbLZU8Z8AH/sDirPNicpRDw
	SnlMsEFwG7Vh5S2FLGpfVQXZvx/tz1x2IZVIQo6Zzti8bbVx2/0rIm2aa7u0SLkeYi/V/VrCGnF
	Nj2ZiNFYXDjbkVHEZ08=
X-Received: by 2002:a05:600c:190e:b0:482:dbd7:a1c1 with SMTP id
 5b1f17b1804b1-485198bb11bmr103389455e9.34.1772724120195; Thu, 05 Mar 2026
 07:22:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com> <20260125131323.45108-2-clamor95@gmail.com>
In-Reply-To: <20260125131323.45108-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 17:21:49 +0200
X-Gm-Features: AaiRm51HVWO42gd_jxtRlV9XjrCMIr_S_GY-8XlvGM5fAb-cXCbobJINkWBCLb0
Message-ID: <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20 and Tegra30 are fully compatible with existing Tegra DSI driver
> apart from clock configuration and pad calibration which are addressed by
> this patch.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-----------
>  drivers/gpu/drm/tegra/dsi.h |  10 ++++
>  3 files changed, 88 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 4596073fe28f..5d64cd57e764 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1=
x_drm_suspend,
>
>  static const struct of_device_id host1x_drm_subdevs[] =3D {
>         { .compatible =3D "nvidia,tegra20-dc", },
> +       { .compatible =3D "nvidia,tegra20-dsi", },
>         { .compatible =3D "nvidia,tegra20-hdmi", },
>         { .compatible =3D "nvidia,tegra20-gr2d", },
>         { .compatible =3D "nvidia,tegra20-gr3d", },
>         { .compatible =3D "nvidia,tegra30-dc", },
> +       { .compatible =3D "nvidia,tegra30-dsi", },
>         { .compatible =3D "nvidia,tegra30-hdmi", },
>         { .compatible =3D "nvidia,tegra30-gr2d", },
>         { .compatible =3D "nvidia,tegra30-gr3d", },
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 02a661d86751..ebc78dceaee6 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
>         return container_of(state, struct tegra_dsi_state, base);
>  }
>
> +struct tegra_dsi_config {
> +       bool has_multiple_pad_controls;
> +       bool has_mux_parent_clk;
> +};
> +
>  struct tegra_dsi {
>         struct host1x_client client;
>         struct tegra_output output;
> @@ -82,6 +87,8 @@ struct tegra_dsi {
>         /* for ganged-mode support */
>         struct tegra_dsi *master;
>         struct tegra_dsi *slave;
> +
> +       const struct tegra_dsi_config *config;
>  };
>
>  static inline struct tegra_dsi *
> @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *d=
si)
>  {
>         u32 value;
>
> -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDI=
O(0);
> -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +       if (dsi->config->has_multiple_pad_controls) {
> +               /*
> +                * XXX Is this still needed? The module reset is deassert=
ed right
> +                * before this function is called.
> +                */
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> +
> +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL=
_VS1_PDIO(0);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +
> +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> +                       DSI_PAD_OUT_CLK(0x0);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> +
> +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_=
CLK(0x3) |
> +                       DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> +       } else {
> +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_=
LPDNADJ(0x1) |
> +                       DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_=
SLEWDNADJ(0x6) |
> +                       DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_=
PDIO(0) |
> +                       DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PUL=
LDN_ENAB(0);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +       }
>
>         return 0;
>  }
>
>  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>  {
> -       u32 value;
>         int err;
>
> -       /*
> -        * XXX Is this still needed? The module reset is deasserted right
> -        * before this function is called.
> -        */
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> -
>         /* start calibration */
>         tegra_dsi_pad_enable(dsi);
>
> -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> -               DSI_PAD_OUT_CLK(0x0);
> -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> -
> -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3)=
 |
> -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> -
>         err =3D tegra_mipi_start_calibration(dsi->mipi);
>         if (err < 0)
>                 return err;
> @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
>         if (!dsi)
>                 return -ENOMEM;
>
> +       dsi->config =3D of_device_get_match_data(&pdev->dev);
>         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
>         dsi->video_fifo_depth =3D 1920;
>         dsi->host_fifo_depth =3D 64;
> @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
>                 goto remove;
>         }
>
> -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
>         if (IS_ERR(dsi->clk_lp)) {
>                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
>                                     "cannot get low-power clock\n");
> @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
>                 goto remove;
>         }
>
> -       err =3D tegra_dsi_setup_clocks(dsi);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "cannot setup clocks\n");
> -               goto remove;
> +       if (dsi->config->has_mux_parent_clk) {
> +               err =3D tegra_dsi_setup_clocks(dsi);
> +               if (err < 0) {
> +                       dev_err(&pdev->dev, "cannot setup clocks\n");
> +                       goto remove;
> +               }
>         }
>
>         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct platform_devi=
ce *pdev)
>         tegra_mipi_free(dsi->mipi);
>  }
>
> +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> +       .has_multiple_pad_controls =3D false,
> +       .has_mux_parent_clk =3D false,
> +};
> +
> +/*
> + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2; this =
is
> + * simply not modeled in the clock driver yet. If this functionality is
> + * required, the has_mux_parent_clk flag can be set to true once the clo=
ck
> + * driver is patched.
> + */
> +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> +       .has_multiple_pad_controls =3D false,
> +       .has_mux_parent_clk =3D false,
> +};
> +
> +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> +       .has_multiple_pad_controls =3D true,
> +       .has_mux_parent_clk =3D true,
> +};
> +
> +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> +       .has_multiple_pad_controls =3D true,
> +       .has_mux_parent_clk =3D false,
> +};

Mikko, I have an update regarding Tegra124 config. If
tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
=3D false) DSI will not work. I cannot say for sure what is going on
with clocks since my tegra124 device has broken usb in mainline Linux
and without panel is no go. I would like to address this before this
series is picked.

> +
>  static const struct of_device_id tegra_dsi_of_match[] =3D {
> -       { .compatible =3D "nvidia,tegra210-dsi", },
> -       { .compatible =3D "nvidia,tegra132-dsi", },
> -       { .compatible =3D "nvidia,tegra124-dsi", },
> -       { .compatible =3D "nvidia,tegra114-dsi", },
> +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D &tegra124_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra132-dsi", .data =3D &tegra124_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra124-dsi", .data =3D &tegra124_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi_co=
nfig },
> +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D &tegra20_dsi_co=
nfig },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> index f39594e65e97..d834ac0c47ab 100644
> --- a/drivers/gpu/drm/tegra/dsi.h
> +++ b/drivers/gpu/drm/tegra/dsi.h
> @@ -95,6 +95,16 @@
>  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
>  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
>  #define DSI_PAD_CONTROL_0              0x4b
> +/* Tegra20/Tegra30 */
> +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> +/* Tegra114+ */
>  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
>  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
>  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> --
> 2.51.0
>
