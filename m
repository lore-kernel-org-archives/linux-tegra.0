Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA4F32BF41
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463136; cv=none; b=bkFlJygQ582jAaxnSO3u1J5O5IAxshKFeXgPsJaBMjBHjMqSwxicIVZHgbjp6Sh5mT/1CCOeSn90FREgR6huJyOZxohFC6o/Zs4W32DdWcljqKLIfP679s+6UQqdYTSkGwRmgTwzZ71c5bLEhnpEqydn6u3+cjczJnEij5DKwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463136; c=relaxed/simple;
	bh=dpx4mUFK6XN5uyKG/yfPFKPAE3fHsCMh1GGGOBFeAlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8cRVPQJrNG4OK0B9cANofmoAtcuN63KEgg29bn0/AlBWwW184fW6YvYQeTJZFeYr6sSa6RTGAJSSixl5BhAsaHRnacb83J/cIeI9nWyTVjauo/MV/rQ1vke2A753ynDMHkkMmDzeKSKzlcSvIdBsLRGyIZYyp03sKi7YrLwX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXwZZH3a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXwZZH3a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc544b09so451400f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 23:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768463133; x=1769067933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx9HvTuC/nWJTqeXB5NCIb7B2MpOD8Vg8GMhrdv3oCU=;
        b=FXwZZH3ahFxGsIOxuqbdOVmgAOVLweIDlZYpjslmf0LKd1+zCE8FDkH8hWP8Z0o5Sg
         tc/zKDKtScCbLGrbXo33HEdUjTUDZVJO1f+WU/4DzP7zL3fmQQrNxTBRxFAUWsdtH2K6
         UrureS4YG9nCHykVtVS+r+jyBeeOh9+BNokUkDIhRYFwkaP2+KRy5m7LEwtaWtohoEIH
         H1qIGUAm8p51FfhFOjnodElqcKe1fx63qJGXEHhKqzmflljUrxv6wVVJdvfpPni9Yat1
         d+sDYUWU2TWr6Rgfj7j5+J3Y/xVzsmqKMnqA8LP1ec+ZND44faHNtLYzFOeQiexfRq/C
         NWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768463133; x=1769067933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sx9HvTuC/nWJTqeXB5NCIb7B2MpOD8Vg8GMhrdv3oCU=;
        b=AP7637iCb37ZjObM+pf24hWgVFn9LGH5cUDSWBSTPR2fbmQy1XacuSfuSYtBI/HUgx
         g34VJQRs4AJml3nHGZXOgAljjN29dnp8P/mfI+8TcQijO1y4xliB2/xelQw4FOfNUB0c
         Pj96uWARMzdVX7x7SYF8Z9F8y/4oxkMJgFERekyjoE56V354eeUObqThd0qmVMiAxLoZ
         gi4jkaTQlAX2PA9aOfyGhIqTi3QeAJkO2/8GWBai/5bkpSan8AR9Yj88J41ajCwm01qi
         6UIHJ6elwUPBLFGmcopHUvg9pZw81yreH9YoOHNps5V882yTEjilpDe/Vz/LK26l4YAz
         4S/g==
X-Forwarded-Encrypted: i=1; AJvYcCWQs97lS8UBQva61YKkXNjBnOaGf2ULv10pQsOOJrSsOdsjF3QJ2UPJAMGp3Q7J8OulOsT+n9W2v8myEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/caX6KNcToJX6WP7yvNpV5McmG5qQrBlE6oBu1FokGg+rqPJJ
	elFJF9sGw9BRmQFdo4zrscjWuWwFT070iBUB5epbbymYFYq+crw5TKshlmjCKG7wfPFeWu9n/G2
	4tYncdlrzYOw8ZWwpacZNGDC3pbdAGWM=
X-Gm-Gg: AY/fxX69k0tplpWCbs1mclVUjAZ5yPT0KNyepitgPwYQpA/A8wOW5ekP2EmqwKzWDJ3
	yni3jA5L2c5wmbMTahY62FqfPH6VlnCmRbnaL5rTl4oZGMjWDune57FY4vxSvK4N+IO/7t1DP73
	fw+d6HvkZ8ziISd8EeVXREfi5TLqrQpaJpPEuLCrGiiYLH2m6QDDqeEQ2yPXCHYgJDXp7iOxsvs
	9ok+7/X8ISy6oTlL/fL8nxjTSOQwcaeC3flJK1Gj10oXKWa42LKz2yIKzJxDk1kpQrnA08u
X-Received: by 2002:a05:6000:25ca:b0:430:f301:3e6c with SMTP id
 ffacd0b85a97d-4342c5422f0mr5713481f8f.34.1768463132683; Wed, 14 Jan 2026
 23:45:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204061703.5579-1-clamor95@gmail.com> <20251204061703.5579-4-clamor95@gmail.com>
 <9411928.T7Z3S40VBb@senjougahara>
In-Reply-To: <9411928.T7Z3S40VBb@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Jan 2026 09:45:21 +0200
X-Gm-Features: AZwV_QghD6FXe-dPVjxSUHWWVRcMlfFVLJpdZ72C5Ypff7V3j-uUvEj-3slTUkw
Message-ID: <CAPVz0n3fwQNb2JozBx8G+r=txrENf1g3We5-P+sYJWepDJqU2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4 RESEND] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:02 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Tegra20 and Tegra30 are fully compatible with existing tegra DSI driver
> > apart from clock configuration and PAD calibration which are addressed =
by
> > this patch.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c |  2 +
> >  drivers/gpu/drm/tegra/dsi.c | 88 ++++++++++++++++++++++++-------------
> >  drivers/gpu/drm/tegra/dsi.h | 15 +++++++
> >  3 files changed, 74 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 4596073fe28f..5d64cd57e764 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, hos=
t1x_drm_suspend,
> >
> >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> >       { .compatible =3D "nvidia,tegra20-dc", },
> > +     { .compatible =3D "nvidia,tegra20-dsi", },
> >       { .compatible =3D "nvidia,tegra20-hdmi", },
> >       { .compatible =3D "nvidia,tegra20-gr2d", },
> >       { .compatible =3D "nvidia,tegra20-gr3d", },
> >       { .compatible =3D "nvidia,tegra30-dc", },
> > +     { .compatible =3D "nvidia,tegra30-dsi", },
> >       { .compatible =3D "nvidia,tegra30-hdmi", },
> >       { .compatible =3D "nvidia,tegra30-gr2d", },
> >       { .compatible =3D "nvidia,tegra30-gr3d", },
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 8e80c7efe8b4..d079aa7d2a85 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -53,6 +53,10 @@ to_dsi_state(struct drm_connector_state *state)
> >       return container_of(state, struct tegra_dsi_state, base);
> >  }
> >
> > +struct tegra_dsi_config {
> > +     u32 dsi_version;
>
> Rather than a dsi_version field, we should have something that describes =
the difference. e.g. 'bool has_multiple_pad_controls' being true for the "V=
1" hardware.
>

I used versioning from downstream dsi sources, where with addition of
Tegra114 support older DSI controller got v0 and newer v1, but if you
find 'has_multiple_pad_controls' more suitable I have no objections.

> > +};
> > +
> >  struct tegra_dsi {
> >       struct host1x_client client;
> >       struct tegra_output output;
> > @@ -82,6 +86,8 @@ struct tegra_dsi {
> >       /* for ganged-mode support */
> >       struct tegra_dsi *master;
> >       struct tegra_dsi *slave;
> > +
> > +     const struct tegra_dsi_config *config;
> >  };
> >
> >  static inline struct tegra_dsi *
> > @@ -663,39 +669,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi =
*dsi)
> >  {
> >       u32 value;
> >
> > -     value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDI=
O(0);
> > -     tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +     if (dsi->config->dsi_version =3D=3D TEGRA_DSI_V1) {
> > +             /*
> > +              * XXX Is this still needed? The module reset is deassert=
ed right
> > +              * before this function is called.
> > +              */
> > +             tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > +             tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > +             tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > +             tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > +             tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > +
> > +             value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL=
_VS1_PDIO(0);
> > +             tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +
> > +             value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > +                     DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > +                     DSI_PAD_OUT_CLK(0x0);
> > +             tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > +
> > +             value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_=
CLK(0x3) |
> > +                     DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > +             tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > +     } else {
> > +             value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_=
LPDNADJ(0x1) |
> > +                     DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_=
SLEWDNADJ(0x6) |
> > +                     DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_=
PDIO(0) |
> > +                     DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PUL=
LDN_ENAB(0);
> > +             tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +     }
> >
> >       return 0;
> >  }
> >
> >  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
> >  {
> > -     u32 value;
> >       int err;
> >
> > -     /*
> > -      * XXX Is this still needed? The module reset is deasserted right
> > -      * before this function is called.
> > -      */
> > -     tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > -     tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > -     tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > -     tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > -     tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > -
> >       /* start calibration */
> >       tegra_dsi_pad_enable(dsi);
> >
> > -     value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > -             DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > -             DSI_PAD_OUT_CLK(0x0);
> > -     tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > -
> > -     value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3)=
 |
> > -             DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > -     tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > -
> >       err =3D tegra_mipi_start_calibration(dsi->mipi);
> >       if (err < 0)
> >               return err;
> > @@ -1577,6 +1590,7 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
> >       if (!dsi)
> >               return -ENOMEM;
> >
> > +     dsi->config =3D of_device_get_match_data(&pdev->dev);
> >       dsi->output.dev =3D dsi->dev =3D &pdev->dev;
> >       dsi->video_fifo_depth =3D 1920;
> >       dsi->host_fifo_depth =3D 64;
> > @@ -1615,7 +1629,7 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
> >               goto remove;
> >       }
> >
> > -     dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> > +     dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
> >       if (IS_ERR(dsi->clk_lp)) {
> >               err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
> >                                   "cannot get low-power clock\n");
> > @@ -1636,10 +1650,12 @@ static int tegra_dsi_probe(struct platform_devi=
ce *pdev)
> >               goto remove;
> >       }
> >
> > -     err =3D tegra_dsi_setup_clocks(dsi);
>
> > -     if (err < 0) {
> > -             dev_err(&pdev->dev, "cannot setup clocks\n");
> > -             goto remove;
> > +     if (dsi->config->dsi_version =3D=3D TEGRA_DSI_V1) {
>
> And 'has_mux_parent_clk', perhaps? Not a very good name, if you come up w=
ith something better feel free to use it.

Noted

>
> I checked, and looks like Tegra30 in fact allows DSIA/DSIB to be muxed to=
 either PLL_D or PLL_D2, it is just not modelled in the clock driver. The s=
ame applies to all of Tegra114, 124, and 210, but only Tegra114 has it pres=
ently modelled as a mux whereas 124 and 210 have a gate. The TRMs for 124 a=
nd 210 specify that only PLL_D can be used in the mux bit documentation so =
the bit is probably dysfunctional on those chips.
>
> The correct solution, hence, I think is to have that config field, and it=
 be false for Tegra20, 124, and 210; and true for Tegra30, and 114. Then im=
plement the mux clock in the Tegra30 clock driver.
>
> However, I would settle for setting it to false for both Tegra20 and Tegr=
a30 and leaving a comment next to the Tegra30 entry describing the situatio=
n (the mux clock is not currently modelled).
>

I clearly understand your point. I agree regarding setting it to false
for both Tegra20 and Tegra30 and leaving a comment for Tegra30, it
seems to be the optimal solution. Later on if there would be such
need, Tegra30 can get its mux too.

A little note regarding mux on Tegra124/210, it seems that bit is not
dysfunctional but behavior is intentional to diverge PLLD and D2 as
"internal" and "external" main display clock. At least this is what I
have concluded while working with Tegra display controller stuff.

> Cheers,
> Mikko
>

Thank you for your review!

Best regards,
Svyatoslav R.

> > +             err =3D tegra_dsi_setup_clocks(dsi);
> > +             if (err < 0) {
> > +                     dev_err(&pdev->dev, "cannot setup clocks\n");
> > +                     goto remove;
> > +             }
> >       }
> >
> >       dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > @@ -1703,11 +1719,21 @@ static void tegra_dsi_remove(struct platform_de=
vice *pdev)
> >       tegra_mipi_free(dsi->mipi);
> >  }
> >
> > +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> > +     .dsi_version =3D TEGRA_DSI_V0,
> > +};
> > +
> > +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> > +     .dsi_version =3D TEGRA_DSI_V1,
> > +};
> > +
> >  static const struct of_device_id tegra_dsi_of_match[] =3D {
> > -     { .compatible =3D "nvidia,tegra210-dsi", },
> > -     { .compatible =3D "nvidia,tegra132-dsi", },
> > -     { .compatible =3D "nvidia,tegra124-dsi", },
> > -     { .compatible =3D "nvidia,tegra114-dsi", },
> > +     { .compatible =3D "nvidia,tegra210-dsi", .data =3D &tegra114_dsi_=
config },
> > +     { .compatible =3D "nvidia,tegra132-dsi", .data =3D &tegra114_dsi_=
config },
> > +     { .compatible =3D "nvidia,tegra124-dsi", .data =3D &tegra114_dsi_=
config },
> > +     { .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_=
config },
> > +     { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra20_dsi_co=
nfig },
> > +     { .compatible =3D "nvidia,tegra20-dsi", .data =3D &tegra20_dsi_co=
nfig },
> >       { },
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> > diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> > index f39594e65e97..5049ec7813c7 100644
> > --- a/drivers/gpu/drm/tegra/dsi.h
> > +++ b/drivers/gpu/drm/tegra/dsi.h
> > @@ -95,6 +95,16 @@
> >  #define DSI_TALLY_LRX(x)             (((x) & 0xff) <<  8)
> >  #define DSI_TALLY_HTX(x)             (((x) & 0xff) <<  0)
> >  #define DSI_PAD_CONTROL_0            0x4b
> > +/* DSI V0 */
> > +#define DSI_PAD_CONTROL_PULLDN_ENAB(x)       (((x) & 0x1) << 28)
> > +#define DSI_PAD_CONTROL_SLEWUPADJ(x) (((x) & 0x7) << 24)
> > +#define DSI_PAD_CONTROL_SLEWDNADJ(x) (((x) & 0x7) << 20)
> > +#define DSI_PAD_CONTROL_PREEMP_EN(x) (((x) & 0x1) << 19)
> > +#define DSI_PAD_CONTROL_PDIO_CLK(x)  (((x) & 0x1) << 18)
> > +#define DSI_PAD_CONTROL_PDIO(x)              (((x) & 0x3) << 16)
> > +#define DSI_PAD_CONTROL_LPUPADJ(x)   (((x) & 0x3) << 14)
> > +#define DSI_PAD_CONTROL_LPDNADJ(x)   (((x) & 0x3) << 12)
> > +/* DSI V1 */
> >  #define DSI_PAD_CONTROL_VS1_PDIO(x)  (((x) & 0xf) <<  0)
> >  #define DSI_PAD_CONTROL_VS1_PDIO_CLK (1 <<  8)
> >  #define DSI_PAD_CONTROL_VS1_PULLDN(x)        (((x) & 0xf) << 16)
> > @@ -140,4 +150,9 @@ enum tegra_dsi_format {
> >       TEGRA_DSI_FORMAT_24P,
> >  };
> >
> > +enum tegra_dsi_version {
> > +     TEGRA_DSI_V0,
> > +     TEGRA_DSI_V1,
> > +};
> > +
> >  #endif
> >
>
>
>
>
