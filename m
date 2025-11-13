Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F129993A
	for <linux-tegra@vger.kernel.org>; Thu, 13 Nov 2025 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044163; cv=none; b=KXjnAhu8b2aYRHSx7NVYAR6TmcvqNQhDvAh8mBkEO1jh0CZJ5Q+W9U/a6UFIILQrLz+3JYlbj2C1VtzkKQL2Ij/L9FfKEorGBwBC2pvIoEqPBpItdpX6S2xif9JALcFrjMLmA/ZRJeSLDEIXhoD/u2I8xF+Zx+u48Aq4+I2TWho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044163; c=relaxed/simple;
	bh=enukvQUkWp5qWLLQJutYEr5eHCre8gtyCfegyL8aecU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dALwQZzyYEKiaPFDja78Svp20tbVNHG27Pbr6maDteY0QeqN6x7a47lw7gHvFM+bL8AT+uxFpr0amiXrtt0mKg+rkJiaun9T6FJjG51YtllRAsugRxo24sxC/mXQ9DiV1AqbIJXeJu/wVFqW2XROF187cAmnhwySBispO/zFiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTsXoWdL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTsXoWdL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so471311f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 13 Nov 2025 06:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763044160; x=1763648960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNomNoVs3/3wdBsUcq9EZSvX1zLpw+oNIAvlqkMmZEs=;
        b=MTsXoWdL5q+SKlKFYuluPzOD01u5Un9K0DErqJEcgs6WiRpSbbI5NNZX3gSvFhXKR6
         QY5Kza6huPV0tgxIbLxCwu1+wExP9MxfVJmtk/5yd1zvprODuYXu1RHE5/b5gCI2lyXe
         E7vm1+iNcnvO5ULiHvudpmhjgiMXsf0tLRZTL8hu7aTAPyZBOrzazrR8oynNh9FAF9Mh
         M1qixhxtDwJa+ZIF/HMxw6f8uWUrsiAvWwAMrLz29PO8EChBw4JXcZRqbwXZsERb1tSH
         0MORytgRr3WbRHs8FX42JeDkoiwqk/im9aMBRG7CmwRK62YZDsl1rlJJXJ24Gt8pjuak
         vz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044160; x=1763648960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNomNoVs3/3wdBsUcq9EZSvX1zLpw+oNIAvlqkMmZEs=;
        b=O0gJN7O/FmsiX/+ZtQE+tglF/GW2JIxD2xJmFVZUMJJP9eygbd28oqywODLixLAu6E
         sBS9KFQhKzkbEnX40tG8MeDWpaTmFcLfjXmVKfz6JUJHPXcFHjdiT5i35EigPrAl2dDa
         hp8XxdrdAY5gFtzddePCcQHbZVq0aZHS5aRpOptYfKYMhaVevfjc9lADVbLa/sScTOhM
         JIgI0qkChOogmx04Uizko/MaO15bWYvsEKs8WV2cBiNDnES2A+4ZJbmoNFqfZVmFuhAl
         utoUOBEaZpzadD4eh/iG2kAY/Jn2eloRivnlhX9sgmUJeQRVSJPa8UmWxjvuetXmRvey
         pKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdHEeAlJ/mOGDfTWKuI0LHqT9WA03jM9/Z0KzqdxT7Z13n3uzrHw9ngrwgRn41b0RSVsGEVd3ktl7d1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGuXFxqN02U52NUgwx+TYFEn/Cl37oHBArj8QEm4in2W9jwSdt
	QUMph15584oOpmXgTB1btxqjBTS8LWvI5oHjGnLBw3/deKAkUqpfa1cH5nWZL21OoYNtVl2JbHK
	5WjwEmO7C+eEzNpKPQAYFE9h/2yxLlxE=
X-Gm-Gg: ASbGncuhtpQIHj523Eh2/a6ol5/ALKHR3N+VAU7nMAFTgAwZgeKm/QgFwysLuQBgvuN
	SWhqeNeIZC5kuR+qcrP0OOuw6wJWjHFQz6zVokYRYnuLaT/asVweBg17eqmatNq6HykbcymzsV6
	NqK5Er1U0Xj6P63pNgHnmApjrpMbbWzV7kvvCENW8qtrG643Htvj9JunZlm/quE8v/0Ia9dixH5
	I0JqId4ij9Mt9yN3sy611+brb41Qexi7qH49/eHTfC7mlitNB+WKRTEJY9Qwt1MKpeOiTH8SUb4
	xLznsvU=
X-Google-Smtp-Source: AGHT+IEjZesfWe6UAJr9rfneLrz6LT9ITsEcvC5EG+9+SI64dIq/3Wyqp3hO3mKXfLSgOhg9/PSLnT/sN+ozMuJc6zU=
X-Received: by 2002:a05:6000:230b:b0:429:d253:8619 with SMTP id
 ffacd0b85a97d-42b52795624mr3292848f8f.5.1763044159375; Thu, 13 Nov 2025
 06:29:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915080157.28195-1-clamor95@gmail.com> <20250915080157.28195-7-clamor95@gmail.com>
 <6112196.aeNJFYEL58@senjougahara>
In-Reply-To: <6112196.aeNJFYEL58@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 13 Nov 2025 16:29:08 +0200
X-Gm-Features: AWmQ_bn3skm8vRUEdsGZ0nnCIIDUv9P1uoNNzH9ij76xxg0XWrgAcalJ4Vq9gRI
Message-ID: <CAPVz0n12YKGfjvYZZOkMaB18gk74xiprB7=XbcSpPvi9=Jtt4A@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] clk: tegra: remove EMC to MC clock mux in Tegra114
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 13 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 07:0=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 15, 2025 5:01=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Configure EMC without mux for correct EMC driver support.
>
> Rather than just 'removing EMC to MC clock mux in Tegra114', I would say =
this patch removes current emc and emc_mux clocks and replaces them with th=
e proper EMC clock implementation. I would edit the commit subject and comm=
it message along those lines.
>

Noted

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 48 ++++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index 8bde72aa5e68..6b3a140772c2 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -622,10 +622,6 @@ static const char *mux_plld_out0_plld2_out0[] =3D =
{
> >  };
> >  #define mux_plld_out0_plld2_out0_idx NULL
> >
> > -static const char *mux_pllmcp_clkm[] =3D {
> > -     "pll_m_out0", "pll_c_out0", "pll_p_out0", "clk_m", "pll_m_ud",
> > -};
> > -
> >  static const struct clk_div_table pll_re_div_table[] =3D {
> >       { .val =3D 0, .div =3D 1 },
> >       { .val =3D 1, .div =3D 2 },
> > @@ -672,7 +668,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max=
] __initdata =3D {
> >       [tegra_clk_csi] =3D { .dt_id =3D TEGRA114_CLK_CSI, .present =3D t=
rue },
> >       [tegra_clk_i2c2] =3D { .dt_id =3D TEGRA114_CLK_I2C2, .present =3D=
 true },
> >       [tegra_clk_uartc] =3D { .dt_id =3D TEGRA114_CLK_UARTC, .present =
=3D true },
> > -     [tegra_clk_emc] =3D { .dt_id =3D TEGRA114_CLK_EMC, .present =3D t=
rue },
> >       [tegra_clk_usb2] =3D { .dt_id =3D TEGRA114_CLK_USB2, .present =3D=
 true },
> >       [tegra_clk_usb3] =3D { .dt_id =3D TEGRA114_CLK_USB3, .present =3D=
 true },
> >       [tegra_clk_vde_8] =3D { .dt_id =3D TEGRA114_CLK_VDE, .present =3D=
 true },
> > @@ -1048,14 +1043,7 @@ static __init void tegra114_periph_clk_init(void=
 __iomem *clk_base,
> >                                            0, 82, periph_clk_enb_refcnt=
);
> >       clks[TEGRA114_CLK_DSIB] =3D clk;
> >
> > -     /* emc mux */
> > -     clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
> > -                            ARRAY_SIZE(mux_pllmcp_clkm),
> > -                            CLK_SET_RATE_NO_REPARENT,
> > -                            clk_base + CLK_SOURCE_EMC,
> > -                            29, 3, 0, &emc_lock);
> > -
> > -     clk =3D tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOU=
RCE_EMC,
> > +     clk =3D tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_=
EMC,
> >                                   &emc_lock);
> >       clks[TEGRA114_CLK_MC] =3D clk;
> >
> > @@ -1321,6 +1309,28 @@ static int tegra114_reset_deassert(unsigned long=
 id)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_TEGRA124_CLK_EMC
> > +static struct clk *tegra114_clk_src_onecell_get(struct of_phandle_args=
 *clkspec,
> > +                                             void *data)
> > +{
> > +     struct clk_hw *hw;
> > +     struct clk *clk;
> > +
> > +     clk =3D of_clk_src_onecell_get(clkspec, data);
> > +     if (IS_ERR(clk))
> > +             return clk;
> > +
> > +     hw =3D __clk_get_hw(clk);
> > +
> > +     if (clkspec->args[0] =3D=3D TEGRA114_CLK_EMC) {
> > +             if (!tegra124_clk_emc_driver_available(hw))
> > +                     return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     return clk;
> > +}
> > +#endif
> > +
> >  static void __init tegra114_clock_init(struct device_node *np)
> >  {
> >       struct device_node *node;
> > @@ -1362,16 +1372,24 @@ static void __init tegra114_clock_init(struct d=
evice_node *np)
> >       tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
> >                            tegra114_audio_plls,
> >                            ARRAY_SIZE(tegra114_audio_plls), 24000000);
> > +
> > +     tegra_clk_apply_init_table =3D tegra114_clock_apply_init_table;
> > +
>
> Is there any particular reason for moving this here? If not, omitting the=
 change would simplify the patch a bit.
>

IIRC, I tried to align with Tegra124 EMC clk driver, I will try to
drop this change and check if all works as expected.

> >       tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
> >                                       &pll_x_params);
> >
> >       tegra_init_special_resets(1, tegra114_reset_assert,
> >                                 tegra114_reset_deassert);
> >
> > +#ifdef CONFIG_TEGRA124_CLK_EMC
> > +     tegra_add_of_provider(np, tegra114_clk_src_onecell_get);
> > +     clks[TEGRA114_CLK_EMC] =3D tegra124_clk_register_emc(clk_base, np=
,
> > +                                                        &emc_lock);
> > +#else
> >       tegra_add_of_provider(np, of_clk_src_onecell_get);
> > -     tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
> > +#endif
>
> tegra124_clk_register_emc and tegra124_clk_emc_driver_available have stub=
 implementations when CONFIG_TEGRA124_CLK_EMC is not enabled, so it would b=
e cleaner to just call them always.
>

Yes, I will adjust this in v4. Thank you.

> >
> > -     tegra_clk_apply_init_table =3D tegra114_clock_apply_init_table;
> > +     tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
> >
> >       tegra_cpu_car_ops =3D &tegra114_cpu_car_ops;
> >  }
> >
>
>
>
>
