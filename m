Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BBC3C6A5A
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725821; cv=pass; b=fVZsW3ugfZeqd2OojGos5xX1n2FUC+3qG9Uwsd8b+z0lcPpdOYdDjI7drUIyjv9wpAALvYNXbmNBbSLDP/w7xCQOhAvWw9zC6y46ED78xUOMeF7KhZZJysBFr/r27RcgniL3QngcSyqE9iFvid6emfp/5o0uknJU9kKZPNbOHzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725821; c=relaxed/simple;
	bh=4ZfP0yyfamCkYd1xCoJ8Oranq2jToCzWrJKq/BxtyCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrwxmfqDP+x3+RMs1XU8KI16ogGrLjNMlpG2kmmvpI1XvY5iRnXYXwZ3YlWsSMqgA+XYCqxLO0Ug5LdGjhg/16QcB/JGr0aU+GusVRabeaAfsgvmD9VOpMZHs3+JT7ccHSqtDf+dnF53m7121WFmnLpz49jmGMkvxbo2sZuu/pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3Agu36T; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3Agu36T"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso3393729f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 07:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772725817; cv=none;
        d=google.com; s=arc-20240605;
        b=lZXz+PyfK7miPwO2TWMzsyKunU23a08Re/gfqS0C0p47I5k80zj+EHeL16A7n7Uvq/
         9Wpqfvn8m81jUOcEXAvh9dSCYpQrFk85PcSNiZ+fKxF1nwzOpGkctbvmpEJZT+Xtu4se
         RnEjcunYuHZZrPLEkmEkXKbf1JcY3b2NUsMT4h2InXdt1MdmNDq/5TU+a2FUUgrddBMP
         FHHON2GmVnTgMkGugpCqD5UhJpRPQEUwdMvesaQu9NzJZ+mibIspLynHRz9gep6Cx/od
         PNQVET69W1jDWz25P/3UOy0kbxYIuLpuV7RvDUnyAGlT6R48h5m8V6HzVRWKtQY28flL
         Gc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PH46tNzcbUu3o7RvcJd4Yy5jYTA3vxe5hzUK7gP3mI=;
        fh=1PPPvgoCVMpd33bvSaidc4RDpm2tMRZpdhz5kilgU3A=;
        b=FnMOha2dgZAmR4QjgYzV5Zlv/kq4aGAA45YEIRGEaXApQQFj/Xtcswmd7Vy+I2JWqc
         91iRZXkW905aec1f1Y7eTK65YfOFY3cSXOShnE/FCU7BuAirXcq5M35BGvkanuLqEJR7
         5W5A4ohV5JtGpBEpqYTaDebAhVuwTsr0rZM2i9k96sCKoR/oJaJckWEQR5TQ+og6gAW9
         ZM68QWD5ophIQFj6EmbiuphnkSnsqZpHgf8EIBqktx4M8hUjUQUEIp7zlMgMzpx1pW+3
         WyHwfzxQVyd6JJYETYlh4ez8kVoFdNJeia+d32/qY5JUqSMrTeHcLvLmRViMtX/v0ytE
         EanA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772725817; x=1773330617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PH46tNzcbUu3o7RvcJd4Yy5jYTA3vxe5hzUK7gP3mI=;
        b=B3Agu36TovAnKVrYjlL9UdSs3yrVbdOjJUKW7zTAUM43YR/9Zyw+Y95+6ntWmEPweG
         sUOtobjTwQJ5Ixj1ErkEsUP7AabclxNnZ8z209wZmNdKEbKuvdIXdmW4DqR4lyL4FBpq
         j1IKEdOsYVSHPR7sG7auHzW91IoBq41WMBq5kBxR9PoIqRQR2rMbafgRO4g/9AIhydO6
         MpoKKmM+IWpWN/iGTUP/c9P3fK0CYm6INlTB4YCQKYsq40/fcUesk41ImdNW5BmclHgo
         pwe0XEj43MdISmWyhqCT0FSfYlI19cKmqlGANg4UmsFyQHp1cOQDNmtx0s6aKIMPgsMF
         cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772725817; x=1773330617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PH46tNzcbUu3o7RvcJd4Yy5jYTA3vxe5hzUK7gP3mI=;
        b=nHKTQXsYN8R04hDHz6L/7MXO47dpJWzu7x4v/r0XGf0L0Sl9IdkyZABCQQTIKOyIBa
         v3AVvbvfHACTIf5Zqg9Z8EXW7cVuhBmp4rCq4m55FgAOoo3P+jqQXGrxm1u4fkXyOy7l
         Qhd/dp8K9Id6085Zexaq5uRPAiRhXZ+GFZf3hPRHggCAatDHy3dTitMIcuTo1ZC6k1n1
         Rl+jEhky8gYtIv5SM9RkHAv432SSl5SI99GBiIxDGYZ1IOTBgTnbXHyEIZqib5RTrvgc
         Lx74h+m+CzBv24QhN8ffcn6IB4+/HXSHg0G3b0DUj+K47ykdWEn9enEbes3OSwPRhYJz
         tWJA==
X-Forwarded-Encrypted: i=1; AJvYcCXqUw1rs3jXPV060TDJcs2qfRNrJbi8TTiyHqlLqOX1hUQIPFTnTJGhT0R0We4bQa2s0mROuwtfxrEtDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3jhFYA6/FeiikclMSbkpSxfXFlQsdXXetEvUOCBdaZtce9AE
	8fiNumvrV160e/jnLRv4yBIweB5QYznLcGV6glpAsm+ThWSzPSzhfCAk3YS7n70heciGECrElDR
	nUbNPMy+m1J2fmThARRwe8PzvAed4oSs=
X-Gm-Gg: ATEYQzxzwCrRJoVtlGy/kcLlv8wIHSdykSnu/ecCpXyhy4Vjx8HZCyvmr9dsCo+RxlR
	QTTxljXW5Wqn8XiwV5HQ3xiWyTbQ7NW9q73hku9S0Sg48zEeiO5LHVeScXHKhHWxuVSHdWNuQRL
	oGPg6Yn4V5ug9119r8/VljFdQC0gh576bfdoqpfk3/DwkHhEGkYvDIHxfkLdQ/i9ffhIVTSJK4J
	cNZTEu8/76zKsPFSMcWdCvE3YO++Tz4tRHHBynczcKtvFl8XjhOGpE55K/F2s2+plChAAvpkbKM
	DwAjX0Eg
X-Received: by 2002:a05:6000:609:b0:439:af25:e4ea with SMTP id
 ffacd0b85a97d-439c7fb73b9mr11949295f8f.25.1772725817347; Thu, 05 Mar 2026
 07:50:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com> <20260125131323.45108-2-clamor95@gmail.com>
 <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
In-Reply-To: <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 17:50:05 +0200
X-Gm-Features: AaiRm503-z2GyN7tR097bCSEJFPg05xfdEkXmVkRdfGeB9zms-4jtXuG4YxPcM4
Message-ID: <CAPVz0n1Jf=rNyNu-M9Zp0aUTWm61yo_VLXJ9QHTvAV77ZGn+9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:21 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Sv=
yatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Tegra20 and Tegra30 are fully compatible with existing Tegra DSI driver
> > apart from clock configuration and pad calibration which are addressed =
by
> > this patch.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c |   2 +
> >  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-----------
> >  drivers/gpu/drm/tegra/dsi.h |  10 ++++
> >  3 files changed, 88 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 4596073fe28f..5d64cd57e764 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, hos=
t1x_drm_suspend,
> >
> >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> >         { .compatible =3D "nvidia,tegra20-dc", },
> > +       { .compatible =3D "nvidia,tegra20-dsi", },
> >         { .compatible =3D "nvidia,tegra20-hdmi", },
> >         { .compatible =3D "nvidia,tegra20-gr2d", },
> >         { .compatible =3D "nvidia,tegra20-gr3d", },
> >         { .compatible =3D "nvidia,tegra30-dc", },
> > +       { .compatible =3D "nvidia,tegra30-dsi", },
> >         { .compatible =3D "nvidia,tegra30-hdmi", },
> >         { .compatible =3D "nvidia,tegra30-gr2d", },
> >         { .compatible =3D "nvidia,tegra30-gr3d", },
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 02a661d86751..ebc78dceaee6 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
> >         return container_of(state, struct tegra_dsi_state, base);
> >  }
> >
> > +struct tegra_dsi_config {
> > +       bool has_multiple_pad_controls;
> > +       bool has_mux_parent_clk;
> > +};
> > +
> >  struct tegra_dsi {
> >         struct host1x_client client;
> >         struct tegra_output output;
> > @@ -82,6 +87,8 @@ struct tegra_dsi {
> >         /* for ganged-mode support */
> >         struct tegra_dsi *master;
> >         struct tegra_dsi *slave;
> > +
> > +       const struct tegra_dsi_config *config;
> >  };
> >
> >  static inline struct tegra_dsi *
> > @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi =
*dsi)
> >  {
> >         u32 value;
> >
> > -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_P=
DIO(0);
> > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +       if (dsi->config->has_multiple_pad_controls) {
> > +               /*
> > +                * XXX Is this still needed? The module reset is deasse=
rted right
> > +                * before this function is called.
> > +                */
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > +
> > +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTR=
OL_VS1_PDIO(0);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +
> > +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > +                       DSI_PAD_OUT_CLK(0x0);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > +
> > +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_P=
U_CLK(0x3) |
> > +                       DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3=
);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > +       } else {
> > +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTRO=
L_LPDNADJ(0x1) |
> > +                       DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTRO=
L_SLEWDNADJ(0x6) |
> > +                       DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTRO=
L_PDIO(0) |
> > +                       DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_P=
ULLDN_ENAB(0);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +       }
> >
> >         return 0;
> >  }
> >
> >  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
> >  {
> > -       u32 value;
> >         int err;
> >
> > -       /*
> > -        * XXX Is this still needed? The module reset is deasserted rig=
ht
> > -        * before this function is called.
> > -        */
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > -
> >         /* start calibration */
> >         tegra_dsi_pad_enable(dsi);
> >
> > -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > -               DSI_PAD_OUT_CLK(0x0);
> > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > -
> > -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x=
3) |
> > -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > -
> >         err =3D tegra_mipi_start_calibration(dsi->mipi);
> >         if (err < 0)
> >                 return err;
> > @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
> >         if (!dsi)
> >                 return -ENOMEM;
> >
> > +       dsi->config =3D of_device_get_match_data(&pdev->dev);
> >         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
> >         dsi->video_fifo_depth =3D 1920;
> >         dsi->host_fifo_depth =3D 64;
> > @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
> >                 goto remove;
> >         }
> >
> > -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> > +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
> >         if (IS_ERR(dsi->clk_lp)) {
> >                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
> >                                     "cannot get low-power clock\n");
> > @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct platform_devi=
ce *pdev)
> >                 goto remove;
> >         }
> >
> > -       err =3D tegra_dsi_setup_clocks(dsi);
> > -       if (err < 0) {
> > -               dev_err(&pdev->dev, "cannot setup clocks\n");
> > -               goto remove;
> > +       if (dsi->config->has_mux_parent_clk) {
> > +               err =3D tegra_dsi_setup_clocks(dsi);
> > +               if (err < 0) {
> > +                       dev_err(&pdev->dev, "cannot setup clocks\n");
> > +                       goto remove;
> > +               }
> >         }
> >
> >         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct platform_de=
vice *pdev)
> >         tegra_mipi_free(dsi->mipi);
> >  }
> >
> > +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D false,
> > +       .has_mux_parent_clk =3D false,
> > +};
> > +
> > +/*
> > + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2; thi=
s is
> > + * simply not modeled in the clock driver yet. If this functionality i=
s
> > + * required, the has_mux_parent_clk flag can be set to true once the c=
lock
> > + * driver is patched.
> > + */
> > +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D false,
> > +       .has_mux_parent_clk =3D false,
> > +};
> > +
> > +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D true,
> > +       .has_mux_parent_clk =3D true,
> > +};
> > +
> > +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D true,
> > +       .has_mux_parent_clk =3D false,
> > +};
>
> Mikko, I have an update regarding Tegra124 config. If
> tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
> =3D false) DSI will not work. I cannot say for sure what is going on
> with clocks since my tegra124 device has broken usb in mainline Linux
> and without panel is no go. I would like to address this before this
> series is picked.
>

Ok, from what I can tell, tegra_dsi_setup_clocks ensures that the
Tegra124 DSI parent gate clock is properly configured. I propose
setting has_mux_parent_clk to true for Tegra124, and I will add a
comment to explain why.

Smth like this: "Tegra124 and Tegra210 don't have an actual mux parent
for DSI clocks, but the gate parent clock they use requires the same
setup."

Or flag name can be changed to has_mux_gate_parent_clk or any other
name which fits.

> > +
> >  static const struct of_device_id tegra_dsi_of_match[] =3D {
> > -       { .compatible =3D "nvidia,tegra210-dsi", },
> > -       { .compatible =3D "nvidia,tegra132-dsi", },
> > -       { .compatible =3D "nvidia,tegra124-dsi", },
> > -       { .compatible =3D "nvidia,tegra114-dsi", },
> > +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D &tegra124_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra132-dsi", .data =3D &tegra124_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra124-dsi", .data =3D &tegra124_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi_=
config },
> > +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D &tegra20_dsi_=
config },
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> > diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> > index f39594e65e97..d834ac0c47ab 100644
> > --- a/drivers/gpu/drm/tegra/dsi.h
> > +++ b/drivers/gpu/drm/tegra/dsi.h
> > @@ -95,6 +95,16 @@
> >  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
> >  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
> >  #define DSI_PAD_CONTROL_0              0x4b
> > +/* Tegra20/Tegra30 */
> > +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> > +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> > +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> > +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> > +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> > +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> > +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> > +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> > +/* Tegra114+ */
> >  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
> >  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
> >  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> > --
> > 2.51.0
> >
