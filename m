Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09B358388
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773040334; cv=pass; b=ZS8a5hY97YxWpJ8Oa5JtfY0M0/XJ9oVj4pzuyAU9EpbM8XWJV3oxUjvyFdD4sJ1fxC1l/tOZS42zqOLsWOG3AAGlQP9Qtzu6zgxS1mZ9rm8W2TK5ZZxTvFmMSNXqdjh9rdRJpvAif8X/VRysGb26U0xtzjrKbddeV7o5FKmikcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773040334; c=relaxed/simple;
	bh=1ZOkKmraxQNtM8rRCki8TIwowTJB5IVJ2Zp9mz5TW0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAIXfEUG6h3Y7ReVexas4PqGpiwHZAEjLkPP2yRmqe+Za35V58+/u21nZ8ZO/xTUu70Qr1jaY3UWnPE4E1k8/LpfXMPGV0ky/5X5DvvbCVAArDtQ86PkuJySnRfs4lG5uLx4hDLCk2vQBBjqIg6XXwRWBdOzYREeu4JOx/Iwi5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMAiWHEg; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMAiWHEg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so1568505e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 00:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773040331; cv=none;
        d=google.com; s=arc-20240605;
        b=FQGFsW/gESOLBMGamibm3wIVa2oXb6NJ5kF6Te6JSSZzg7SVbFn7qt0s4885B1AhFC
         S/Ga0owUkbY0I5vL/72cf2K7yHimV7c+7tQ+VW2046DmaLfD/szidOaCXAhSbj6/NVZC
         gpg/JUec+o5kBKDa9/HZaqnLiisVLLHEqJZQ5Joompoiu+A+YeAGdCNIX/feqrAEXx6d
         z+YJTqxC/Crk9Xy2nu+WxAA63321DpnC6uhr2YWUflUELeYKesdmNKIRB4zlM66fCtvz
         MZeseYyzFR2G5ijVXNGTg2HglvPTrns3m7mzhg8tVDCu2XzO2pTyZ69pFVnr4Aat2eVf
         Prjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03443dTqeAHAAj77YpAeSyMA97ePpWH1nHHn5egmzGs=;
        fh=eJ1Bq/Esl6ocjepb8dPo3LBe0ceDKnBM6xsxY+CVROM=;
        b=hFU2DQJmEOIYonOG+fGlQVSa+J4Xg8ytn06pmx6I4a1kHNvuEYQ+UPSxBTaKveXAOu
         kKKGDtGCmvWUvxa61XuAi4kS4bTTWCDJMjaxaKTCpwDDMp9ZLb9MQbQtmCfw8cxxlBQF
         5aad0R3AKZVkI9sjXrq8ZDZh3gsw8PRJyMisjAI0rumy7n8RyRtqfdSJdlTHh/T9BVIx
         aP2OsDINPzIhum6wYj/PvhAIgKG1oLMs4nSK7MdJLtF1Rwtqq3sSjxj+RNS4LbKldeOv
         SDFIZTOuJnz5Koog9/FPgEPqtnFZQKf1WvkZTrAzm2e4CZNs5R4w/hJPvFOAJl6WO8of
         /EeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773040331; x=1773645131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03443dTqeAHAAj77YpAeSyMA97ePpWH1nHHn5egmzGs=;
        b=iMAiWHEgajdk23LY9/qbUoQ136DBFdVLN8pUg1e1HEFaZWlYEL9I+WoeGlmAx33o4i
         /xUEG62jdesUzmLZWtd4Xcx500raImcZY3hV+h/PBi4fQouH4R5II6hPMXCATLc4zXvj
         NYTPnJ/hBhWL1QEg0KPzXtoZCnM/7pzohiaiHYPbaHs9lI9rEJl80clIPSfOEHkQB1VT
         nqt5Kt+vc+U2knYrAAjz//SmOCam7Hh6GwsMJP2dxHdwX/e2Jvn2ubt1ooxQyk0Z1U9y
         kp5lIAA1BLuotPBTx9rKbL3K54XGm7h1rO4DtjilMOSAsbGQGBC56n/tTUdqjbPcYKbI
         W2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773040331; x=1773645131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03443dTqeAHAAj77YpAeSyMA97ePpWH1nHHn5egmzGs=;
        b=PCGFRiN0smHea1vdnXAK8HXwVgfQLxnkovnjDnyJ4Fa4mxdr7FKAF73g3wcKjeEDi1
         4nfVqxHpkz7/00LMkRaAVrYvBk85OnOT5TkZyyvgysv0bHJ+et96P0GIOn0vizvS1bvh
         2NAQ2M5qQ5nQxyyI2vtXlpNymjJrhMpmIF/R4O7sT7DPWJelx4pk7aB/+s+tDuc9qfE7
         n/zP3bfYVI8sKPf3pU27RtnPYIU7u06e5T+gna/s8Vsh6GqdWWkE+FxvVVQof4oKPn+X
         ybwOxhlSBdCNRaxTZc2Icbr1Rp5XAYqaUmpW50TC+846Bkx9amhOgA9AzwxaQc8b7mga
         Gd2g==
X-Forwarded-Encrypted: i=1; AJvYcCXdG6bB7rqzwBXQxXlH3vcKQKNTzIV22eziVPW/SSv3NJMiIWYOgTGi4CvLO5HwRrGHQcTOemfq+ReSGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIIJPlgTA20IU8yDE9ANLRai4M1UmfRM1BLbkSvzUbmAubIj/I
	x2WSJJRUjvR/+iziNIL/V3RFeZGebZpE0tro2PHAMXG5HY1yDGDYKiTXD1kroSeLOrYieaQFjmw
	FoYIXSaXDo+WR/VrUPB1vgvQNrGG/TNQ=
X-Gm-Gg: ATEYQzwxBBM5CEimBrdJFc/Tftpvxi+ukcTGoPyGswk7Y1Pigjmmwjx3WfyLN1VJBvU
	8YXT7zYmt4XX7QYz5DHsZej+XRTY3H4myTWfASzdCu1Zkc43sr1bAizrh7LN8qycdVe/7RSZZr1
	OdSj7Gtm9CZmMH/ghwHsqgwUOgVtT5gbZK5wEnrkkz1llSTM3Hpcc6RkgGUjB7JgmirJavHpAlN
	qDkpQjWlThi499Z/8QbAK3rWwz/OsD/1FphPMidad8JZrrWEmqXyDHMQAJcEjjcZZfoVElYU1ar
	SzkvyXiy
X-Received: by 2002:a05:600c:1c0d:b0:485:39d4:2dd9 with SMTP id
 5b1f17b1804b1-48539d42ea2mr56493295e9.33.1773040330593; Mon, 09 Mar 2026
 00:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com> <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
 <CAPVz0n1Jf=rNyNu-M9Zp0aUTWm61yo_VLXJ9QHTvAV77ZGn+9g@mail.gmail.com> <11698628.CDJkKcVGEf@senjougahara>
In-Reply-To: <11698628.CDJkKcVGEf@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Mar 2026 09:11:59 +0200
X-Gm-Features: AaiRm53tEh8OilsdhhGNDpH24piM2g1MTdF72EIyftzunYlWOMmLwKFbvW4PYuM
Message-ID: <CAPVz0n05UaLVDFCiNqTo6TWU0RrNVe5eQhMm3duTCisXJC0_KQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 07:21 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, March 6, 2026 12:50=E2=80=AFAM Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 5 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:21 S=
vyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > =D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
3 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > Tegra20 and Tegra30 are fully compatible with existing Tegra DSI dr=
iver
> > > > apart from clock configuration and pad calibration which are addres=
sed
> > > > by
> > > > this patch.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/tegra/drm.c |   2 +
> > > >  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-------=
----
> > > >  drivers/gpu/drm/tegra/dsi.h |  10 ++++
> > > >  3 files changed, 88 insertions(+), 31 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/dr=
m.c
> > > > index 4596073fe28f..5d64cd57e764 100644
> > > > --- a/drivers/gpu/drm/tegra/drm.c
> > > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> > > > host1x_drm_suspend,> >
> > > >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> > > >
> > > >         { .compatible =3D "nvidia,tegra20-dc", },
> > > >
> > > > +       { .compatible =3D "nvidia,tegra20-dsi", },
> > > >
> > > >         { .compatible =3D "nvidia,tegra20-hdmi", },
> > > >         { .compatible =3D "nvidia,tegra20-gr2d", },
> > > >         { .compatible =3D "nvidia,tegra20-gr3d", },
> > > >         { .compatible =3D "nvidia,tegra30-dc", },
> > > >
> > > > +       { .compatible =3D "nvidia,tegra30-dsi", },
> > > >
> > > >         { .compatible =3D "nvidia,tegra30-hdmi", },
> > > >         { .compatible =3D "nvidia,tegra30-gr2d", },
> > > >         { .compatible =3D "nvidia,tegra30-gr3d", },
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/ds=
i.c
> > > > index 02a661d86751..ebc78dceaee6 100644
> > > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > > @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
> > > >
> > > >         return container_of(state, struct tegra_dsi_state, base);
> > > >
> > > >  }
> > > >
> > > > +struct tegra_dsi_config {
> > > > +       bool has_multiple_pad_controls;
> > > > +       bool has_mux_parent_clk;
> > > > +};
> > > > +
> > > >
> > > >  struct tegra_dsi {
> > > >
> > > >         struct host1x_client client;
> > > >         struct tegra_output output;
> > > >
> > > > @@ -82,6 +87,8 @@ struct tegra_dsi {
> > > >
> > > >         /* for ganged-mode support */
> > > >         struct tegra_dsi *master;
> > > >         struct tegra_dsi *slave;
> > > >
> > > > +
> > > > +       const struct tegra_dsi_config *config;
> > > >
> > > >  };
> > > >
> > > >  static inline struct tegra_dsi *
> > > >
> > > > @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_=
dsi
> > > > *dsi)> >
> > > >  {
> > > >
> > > >         u32 value;
> > > >
> > > > -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > > DSI_PAD_CONTROL_VS1_PDIO(0); -       tegra_dsi_writel(dsi, value,
> > > > DSI_PAD_CONTROL_0);
> > > > +       if (dsi->config->has_multiple_pad_controls) {
> > > > +               /*
> > > > +                * XXX Is this still needed? The module reset is
> > > > deasserted right +                * before this function is called.
> > > > +                */
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > > > +
> > > > +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > > DSI_PAD_CONTROL_VS1_PDIO(0); +               tegra_dsi_writel(dsi,
> > > > value, DSI_PAD_CONTROL_0);
> > > > +
> > > > +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x=
7) |
> > > > +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > > > +                       DSI_PAD_OUT_CLK(0x0);
> > > > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > > > +
> > > > +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) |
> > > > DSI_PAD_PREEMP_PU_CLK(0x3) | +
> > > > DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3); +
> > > > tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > > > +       } else {
> > > > +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) |
> > > > DSI_PAD_CONTROL_LPDNADJ(0x1) | +
> > > > DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) | +
> > > >                   DSI_PAD_CONTROL_SLEWUPADJ(0x6) |
> > > > DSI_PAD_CONTROL_PDIO(0) | +
> > > > DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0); +
> > > >       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > > > +       }
> > > >
> > > >         return 0;
> > > >
> > > >  }
> > > >
> > > >  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
> > > >  {
> > > >
> > > > -       u32 value;
> > > >
> > > >         int err;
> > > >
> > > > -       /*
> > > > -        * XXX Is this still needed? The module reset is deasserted
> > > > right
> > > > -        * before this function is called.
> > > > -        */
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > > > -
> > > >
> > > >         /* start calibration */
> > > >         tegra_dsi_pad_enable(dsi);
> > > >
> > > > -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > > > -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > > > -               DSI_PAD_OUT_CLK(0x0);
> > > > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > > > -
> > > > -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CL=
K(0x3)
> > > > |
> > > > -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > > > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > > > -
> > > >
> > > >         err =3D tegra_mipi_start_calibration(dsi->mipi);
> > > >         if (err < 0)
> > > >
> > > >                 return err;
> > > >
> > > > @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_de=
vice
> > > > *pdev)> >
> > > >         if (!dsi)
> > > >
> > > >                 return -ENOMEM;
> > > >
> > > > +       dsi->config =3D of_device_get_match_data(&pdev->dev);
> > > >
> > > >         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
> > > >         dsi->video_fifo_depth =3D 1920;
> > > >         dsi->host_fifo_depth =3D 64;
> > > >
> > > > @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_de=
vice
> > > > *pdev)> >
> > > >                 goto remove;
> > > >
> > > >         }
> > > >
> > > > -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> > > > +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
> > > >
> > > >         if (IS_ERR(dsi->clk_lp)) {
> > > >
> > > >                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_=
lp),
> > > >
> > > >                                     "cannot get low-power clock\n")=
;
> > > >
> > > > @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct
> > > > platform_device *pdev)> >
> > > >                 goto remove;
> > > >
> > > >         }
> > > >
> > > > -       err =3D tegra_dsi_setup_clocks(dsi);
> > > > -       if (err < 0) {
> > > > -               dev_err(&pdev->dev, "cannot setup clocks\n");
> > > > -               goto remove;
> > > > +       if (dsi->config->has_mux_parent_clk) {
> > > > +               err =3D tegra_dsi_setup_clocks(dsi);
> > > > +               if (err < 0) {
> > > > +                       dev_err(&pdev->dev, "cannot setup clocks\n"=
);
> > > > +                       goto remove;
> > > > +               }
> > > >
> > > >         }
> > > >
> > > >         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > >
> > > > @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct
> > > > platform_device *pdev)> >
> > > >         tegra_mipi_free(dsi->mipi);
> > > >
> > > >  }
> > > >
> > > > +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D false,
> > > > +       .has_mux_parent_clk =3D false,
> > > > +};
> > > > +
> > > > +/*
> > > > + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2;=
 this
> > > > is
> > > > + * simply not modeled in the clock driver yet. If this functionali=
ty is
> > > > + * required, the has_mux_parent_clk flag can be set to true once t=
he
> > > > clock
> > > > + * driver is patched.
> > > > + */
> > > > +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D false,
> > > > +       .has_mux_parent_clk =3D false,
> > > > +};
> > > > +
> > > > +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D true,
> > > > +       .has_mux_parent_clk =3D true,
> > > > +};
> > > > +
> > > > +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D true,
> > > > +       .has_mux_parent_clk =3D false,
> > > > +};
> > >
> > > Mikko, I have an update regarding Tegra124 config. If
> > > tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
> > > =3D false) DSI will not work. I cannot say for sure what is going on
> > > with clocks since my tegra124 device has broken usb in mainline Linux
> > > and without panel is no go. I would like to address this before this
> > > series is picked.
> >
> > Ok, from what I can tell, tegra_dsi_setup_clocks ensures that the
> > Tegra124 DSI parent gate clock is properly configured. I propose
> > setting has_mux_parent_clk to true for Tegra124, and I will add a
> > comment to explain why.
> >
> > Smth like this: "Tegra124 and Tegra210 don't have an actual mux parent
> > for DSI clocks, but the gate parent clock they use requires the same
> > setup."
>
> Have you found something that tegra_dsi_setup_clocks is doing that could
> affect it, or is it just because it doesn't work without?
>

I have not found anything that tegra_dsi_setup_clocks that could
affect configuration. It just does not work without.

> I looked at the code for clk_get_parent and clk_set_parent, and there
> shouldn't be any effect if the requested parent was already the parent.
>
> I don't have a Tegra124 board available to me right now, but if we can't
> figure out why this is necessary, I'd put a /* TODO: figure out why this =
is
> necessary on Tegra124 */ in the code.
>
> Perhaps you could check (with the clk_set_parent in place so you can boot=
)
> what the parent is according to the clock framework before we call
> clk_set_parent.
>

Yes I can, I have checked clock hierarchy and it seems to be identical
pre and post setup.

tegra_dsi_setup_clocks takes dsi clock parent and sets its parent
according to dt definition.

pre call it is pll_d_out0 > pll_d_dsi_out > dsia/b and after call it
remains the same.


> Mikko
>
> >
> > Or flag name can be changed to has_mux_gate_parent_clk or any other
> > name which fits.
> >
> > > > +
> > > >
> > > >  static const struct of_device_id tegra_dsi_of_match[] =3D {
> > > >
> > > > -       { .compatible =3D "nvidia,tegra210-dsi", },
> > > > -       { .compatible =3D "nvidia,tegra132-dsi", },
> > > > -       { .compatible =3D "nvidia,tegra124-dsi", },
> > > > -       { .compatible =3D "nvidia,tegra114-dsi", },
> > > > +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D
> > > > &tegra124_dsi_config }, +       { .compatible =3D "nvidia,tegra132-=
dsi",
> > > > .data =3D &tegra124_dsi_config }, +       { .compatible =3D
> > > > "nvidia,tegra124-dsi", .data =3D &tegra124_dsi_config }, +       {
> > > > .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_conf=
ig }, +
> > > >      { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi=
_config
> > > > }, +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D
> > > > &tegra20_dsi_config },> >
> > > >         { },
> > > >
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/ds=
i.h
> > > > index f39594e65e97..d834ac0c47ab 100644
> > > > --- a/drivers/gpu/drm/tegra/dsi.h
> > > > +++ b/drivers/gpu/drm/tegra/dsi.h
> > > > @@ -95,6 +95,16 @@
> > > >
> > > >  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
> > > >  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
> > > >  #define DSI_PAD_CONTROL_0              0x4b
> > > >
> > > > +/* Tegra20/Tegra30 */
> > > > +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> > > > +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> > > > +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> > > > +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> > > > +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> > > > +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> > > > +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> > > > +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> > > > +/* Tegra114+ */
> > > >
> > > >  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
> > > >  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
> > > >  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> > > >
> > > > --
> > > > 2.51.0
>
>
>
>
