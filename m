Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E59386571
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655743; cv=pass; b=bFCT4A7e+5LiBhLk36+3Mn3wUvZ4cWAwzTI6+Iwdv3QOnotWJ0KW7mierFITwrJVTtP+rpJk5pG28Tzl8i9bn3H0/l9SAat5G1aLZKct5DTwArDda/y7jjk7IWT8ntN1+hbPh1Qs16tLHBs9FVIFdex9uxL4AXVv+OpWARYG9Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655743; c=relaxed/simple;
	bh=tK+bZLcsdQ8qnewhBYqhGihItfIiZUpVHQ0hH8OrxvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGPiYYO31XkVZXQAKvAX9fQaUdLRrxn5pe4D+nMxnYi/VAcHZNqjzCT8Iex7Biyq/ToBJPnLE6Cslro5qL8fekE744ueogDDAQ29kR0NMFoh4QyHCqR9DT4Yn9/fOt/tCxOiCMZk6B6wq5DbgIz3+CR99bATAKyka4ljD+qZwS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9YAV96j; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9YAV96j"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so10364503e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784655740; cv=none;
        d=google.com; s=arc-20260327;
        b=LXioWHqXk3Ouq16aoa3NJaZ72+qSuktFaHv3Ky/O4dy2wCjiOmYT807xX+mHCfbmjy
         3COlafwiw2NATcHKJrkv2Ku4EqB7Z/Jy3hRbVryoVFoFLJK6pD9lGIMGAs9vD76VKAYU
         H15vvy4d+yz652Xk3jVOoHRxxvuh2ZXN4BJ3njiXENowqEfrLgyWMdUzvaSvcnsWQjTX
         4gkIZz6mtV+xiFUuIQaDsqImJmUQT5aLijAOqfUd++QjykmmyFh2V831esaqmZNWmEpF
         2MaJo90Rw7XXUsVnXjYpdlN2YYrQlyLA+ZLSnNXHg21n9zT8qfAkyZVrwPBLKCO+HHlZ
         6FKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wcHwhdeQPiyGFea8RRLYBEqK38jdeuTu3+dvRJn5SpA=;
        fh=0Aa31It1m7HFyvVR2Vcw7EpSxLN6RSHpV5eezFZaEac=;
        b=gytRyHEwYuJs/ueNuUQ7R43P1+FHaRHA0iMSKgKM9Wnn0GF/Ef/iD5/WatKf17GCAx
         eJ5SDWopv+zdEB2LWY1ywVsYg35qL8DLvTflxDh55meZLKISpFCGLNwYsbruBsNtyisH
         mvaa/ybQNY+LLmawcvIFnQmtW0Gp4LhSoyzmB/W0Y8uSA0LxHMDSfkehjm6KNCjkMdIa
         VEYnP9g94A/E8paRQPsCREX8rBlXNC1snUA/dkLk2AQ7WKL/Bxa2jibLzT4pXOa2900z
         Co33kFxJ3EVUA99eEqvHq18otEiw30zC86nvGoMjJH9xeRftP4ntC28lFKXSoFYO+3kr
         /8fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655740; x=1785260540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcHwhdeQPiyGFea8RRLYBEqK38jdeuTu3+dvRJn5SpA=;
        b=X9YAV96jxo7lOWIxIPkChB0PAWO0eFKMwom+yz2BNuLbDNh1dcyqRfJ4BGljECqO5A
         hbdEIBMdeFFJ9u88gvQMPSBTuLsQZJnoFDD1NqVuA/siVMfBeOVnBApbMt9bqLihjYQC
         le5W6kHh18XGl4iXljz2pu0jC52tQbxLyHsz8HFPpE1u15QH4TAOscBWFdsBgnVj6K5y
         hKCzkrYsTxd6a2REtjaJYRS50ciSMdj34QuXfbnW0tCYEx+LgxBmgW67OxhppOma4ga4
         8GaDRSv3AtwYdDIBWbzP4BR/XsxH2onlGmLrr/Ql7A0F67GkYVTJOm9wfuoBeXsvu6uz
         SyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655740; x=1785260540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcHwhdeQPiyGFea8RRLYBEqK38jdeuTu3+dvRJn5SpA=;
        b=SGrTR2//VQu1zCZ7kc5LizqryWCNGDmxZYKeYOoLesoPfJYHv+sN/1R4909W75ziYs
         ymBih1jNKquLrzhbvaXJA2LmNiyjLPq7NVvTZoyWUbcgrKSOleKDN4AoEUXRM6RCREz3
         xZUdwb56085D8BGJXp1tXbYAHjdLoKmq2UUU7+4l6qC06QKW5TIhqfFUtmlYo0b0mmGi
         IwJFulPwF/H8LNaxroOgSYe5fqF35M2tX5E1FBlwPWPG8IdF5x3ufLNZ7Izv30I4Q4xr
         yDUhHZoEyH5EnN9RRZlbU8M6jFKlTpO+3JYfKEw/KFzwQMzGLyn8wOdGOT+s8J+itJQF
         Un3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpdmFdqfrcwe8qBodccvRJH45fdi5a0/Fa1VoJ2Wef9Kuh0JETNvTDy+qs3Vr2/52CVXSDlTteWdlvqKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuE421nIAHGlUAwZJ6vb1I85Jsg+G8k/KAdH3/WmhSwrOqrPAr
	RWZ8mzwAJKHHCCi9LAOw0I6HF8G4LCKKjAP/ozfqWW/KtA7Z0V+TtNe6e/STGnUBIvgZXwBY9kg
	cfAT3E4zepSk0VAfZ5MIbq7Pvfp0bYeM=
X-Gm-Gg: AR+sD11Fng3ACxpr+OVNc59nD61bzIURXEtv0L6zapymZRC++Mu2ErBHr6GYpd3l3Hj
	heRr6R0IjMubgUbdUNTE/Uvrb6c69h0dRfeU/XsIN3K+igHxH+SQZI42FTU92VgEgwsvtx/Vlzp
	LGGn2adSH6gpgvb8OczDoRguZUUBT+sqYaQO/8PUy3bQw7eUMW6BsbvSSHcmObOv+Sp1naIEomA
	QX/7cwapSOySjwWFgvtkX3SV5lL4L5uz0VBMG2DVtHyH6dHwHGvmGJ4cRDVR+i/Y2sYq8xddGVq
	tsX3bgI0OrHoJkVDilkKA1CDN3yOCz00VELG61h8ZA7MpcygZHfpsCXjXQ==
X-Received: by 2002:a05:6512:b83:b0:5ae:b5bd:5e72 with SMTP id
 2adb3069b0e04-5b28fabb816mr4439164e87.59.1784655739596; Tue, 21 Jul 2026
 10:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
 <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com> <rrmQkm06RD2JduKX6eSoDg@nvidia.com>
In-Reply-To: <rrmQkm06RD2JduKX6eSoDg@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 21 Jul 2026 12:42:08 -0500
X-Gm-Features: AUfX_myE-1nDG631FIG3IHwi8gO93TqS2Jbav418JH0CG_P0J3Xxa7JV1kei1m4
Message-ID: <CALHNRZ9F5RkcdegeeOncTD-6eg6+25cGn0p+Rabboj5oTZ_=Yw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra210B01 support
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Azkali Manad <a.ffcc7@gmail.com>, 
	Thomas Makin <halorocker89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 2:22=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Monday, July 20, 2026 3:31=E2=80=AFPM Aaron Kling via B4 Relay wrote:
> > From: Azkali Manad <a.ffcc7@gmail.com>
> >
> > The PMC in Tegra210B01 is very similar to the one in the original
> > Tegra210, but has a few powergate differences. Add support for this soc=
.
>
> The tables are a bit difficult to compare directly, so maybe list the
> differences between 210 and 210B01 in the commit message.
>
> >
> > Signed-off-by: Azkali Manad <a.ffcc7@gmail.com>
> > Co-developed-by: Thomas Makin <halorocker89@gmail.com>
> > Signed-off-by: Thomas Makin <halorocker89@gmail.com>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/soc/tegra/pmc.c | 62 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index f419a5395545f..48ae4ff3f00db 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -3897,6 +3897,67 @@ static const struct tegra_pmc_soc tegra210_pmc_s=
oc =3D {
> >       .has_single_mmio_aperture =3D true,
> >  };
> >
> > +static const char * const tegra210b01_powergates[] =3D {
> > +     [TEGRA_POWERGATE_CPU] =3D "crail",
> > +     [TEGRA_POWERGATE_3D] =3D "3d",
> > +     [TEGRA_POWERGATE_PCIE] =3D "pcie",
> > +     [TEGRA_POWERGATE_MPE] =3D "mpe",
> > +     [TEGRA_POWERGATE_SATA] =3D "sata",
>
> T210B01 doesn't have SATA, so this can be removed.

Ack

> > +     [TEGRA_POWERGATE_CPU1] =3D "cpu1",
> > +     [TEGRA_POWERGATE_CPU2] =3D "cpu2",
> > +     [TEGRA_POWERGATE_CPU3] =3D "cpu3",
> > +     [TEGRA_POWERGATE_CPU0] =3D "cpu0",
> > +     [TEGRA_POWERGATE_C0NC] =3D "c0nc",
> > +     [TEGRA_POWERGATE_SOR] =3D "sor",
> > +     [TEGRA_POWERGATE_DIS] =3D "dis",
> > +     [TEGRA_POWERGATE_DISB] =3D "disb",
> > +     [TEGRA_POWERGATE_XUSBA] =3D "xusba",
> > +     [TEGRA_POWERGATE_XUSBB] =3D "xusbb",
> > +     [TEGRA_POWERGATE_XUSBC] =3D "xusbc",
> > +     [TEGRA_POWERGATE_VIC] =3D "vic",
> > +     [TEGRA_POWERGATE_IRAM] =3D "iram",
> > +     [TEGRA_POWERGATE_NVDEC] =3D "nvdec",
> > +     [TEGRA_POWERGATE_NVJPG] =3D "nvjpg",
> > +     [TEGRA_POWERGATE_AUD] =3D "aud",
> > +     [TEGRA_POWERGATE_DFD] =3D "dfd",
> > +};
> > +
> > +static const struct tegra_pmc_soc tegra210b01_pmc_soc =3D {
> > +     .supports_core_domain =3D false,
> > +     .num_powergates =3D ARRAY_SIZE(tegra210b01_powergates),
> > +     .powergates =3D tegra210b01_powergates,
> > +     .num_cpu_powergates =3D ARRAY_SIZE(tegra210_cpu_powergates),
> > +     .cpu_powergates =3D tegra210_cpu_powergates,
> > +     .has_tsense_reset =3D true,
> > +     .has_gpu_clamps =3D true,
> > +     .needs_mbist_war =3D false,
> > +     .has_io_pad_wren =3D false,
>
> Any particular reason to flip this to false? AFAICT it is still needed
> to make PWR_DET_VAL writable as on T210.
>
> (The reset value is already (mostly) fine but seems prudent to write it
> anyway)

Ah, it looks like I missed that d4f0c189945c74 inverted the value
along with the rename. Will fix.

> Thank you!
> Mikko
>
> > +     .maybe_tz_only =3D true,
> > +     .num_io_pads =3D ARRAY_SIZE(tegra210_io_pads),
> > +     .io_pads =3D tegra210_io_pads,
> > +     .num_io_pad_vctrls =3D ARRAY_SIZE(tegra210_io_pad_vctrls),
> > +     .io_pad_vctrls =3D tegra210_io_pad_vctrls,
> > +     .num_pin_descs =3D ARRAY_SIZE(tegra210_pin_descs),
> > +     .pin_descs =3D tegra210_pin_descs,
> > +     .regs =3D &tegra20_pmc_regs,
> > +     .init =3D tegra20_pmc_init,
> > +     .setup_irq_polarity =3D tegra20_pmc_setup_irq_polarity,
> > +     .powergate_set =3D tegra114_powergate_set,
> > +     .irq_set_wake =3D tegra210_pmc_irq_set_wake,
> > +     .irq_set_type =3D tegra210_pmc_irq_set_type,
> > +     .reset_sources =3D tegra210_reset_sources,
> > +     .num_reset_sources =3D ARRAY_SIZE(tegra210_reset_sources),
> > +     .reset_levels =3D NULL,
> > +     .num_reset_levels =3D 0,
> > +     .num_wake_events =3D ARRAY_SIZE(tegra210_wake_events),
> > +     .wake_events =3D tegra210_wake_events,
> > +     .pmc_clks_data =3D tegra_pmc_clks_data,
> > +     .num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
> > +     .has_blink_output =3D true,
> > +     .has_usb_sleepwalk =3D true,
> > +     .has_single_mmio_aperture =3D true,
> > +};
> > +
> >  static const struct tegra_io_pad_soc tegra186_io_pads[] =3D {
> >       TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, "csia"),
> >       TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, "csib"),
> > @@ -4824,6 +4885,7 @@ static const struct of_device_id tegra_pmc_match[=
] =3D {
> >       { .compatible =3D "nvidia,tegra194-pmc", .data =3D &tegra194_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra186-pmc", .data =3D &tegra186_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra210-pmc", .data =3D &tegra210_pmc_=
soc },
> > +     { .compatible =3D "nvidia,tegra210b01-pmc", .data =3D &tegra210b0=
1_pmc_soc },
> >       { .compatible =3D "nvidia,tegra132-pmc", .data =3D &tegra124_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra124-pmc", .data =3D &tegra124_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra114-pmc", .data =3D &tegra114_pmc_=
soc },
> >
> > --
> > 2.54.0
> >
> >
> >

Aaron
