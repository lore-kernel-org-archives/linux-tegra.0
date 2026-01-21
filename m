Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A14ADDAB
	for <linux-tegra@vger.kernel.org>; Wed, 21 Jan 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014666; cv=pass; b=pBdhuSwv3GOcHQwdZfkDvlVSznnwnpc53EkWi0lAPRqQ23SDQfQp6HzKRvXtJpXDJ25KwSBRFPIgzIArBgfoQ8/rE2yJgm+Ze2D5Whd7vBpO4tu/Hm7WqUntGCTc5Ehm1KYaTfbm4LBG6kRERkBCBxtRny5jTtgVN317DcJ03vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014666; c=relaxed/simple;
	bh=n9LGtCCoNWJYT6s8g8s+u64o/APoDWxPMT01RQqJz/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4qj9Uv32D7K33nMxLQGw6Cp5M+DMoqDJYeaBzE43Wf3dgzXvi9PeNl8mcimGyr1otnI35G/iTBO7Wb+9neLzrUtIFOvv2yicm7ZTEjp8M2urgV45Vg+vzaLIV6SU2Y1pHbcPqMDhH9NgE/YJSTWVrB7VMHC/1lfbWCGmba+JZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKz09Hgl; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKz09Hgl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43246af170aso23238f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jan 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014660; cv=none;
        d=google.com; s=arc-20240605;
        b=TXij0xG6/JW6cudM3Nbhi4mfpy+RpjY5qILbiHfIKEpamfMStzJr4nKBVIZsuXu22R
         7BAd7s+aRIFJmloSsAYcQdKZQGPGEbg5ngxTeoYx8cYpXq9tqH0r8aw4lGiG2kc0RLyc
         r+X00TZzXoQzlmYsaH84oY81opG8UOcistt2lFTxp7RaprT5M2hO9BpqYwKxoi4p2Nce
         /aQIE0C7v3UnBTWipVA2yt3hcTKMq2prTehGDcLE7WtK6E2069Wq6xRt096+IUdHyF61
         HM9XnfqOdohfFAFF04E+Fus2RCq69TvLwzXdQ2F+CyJmAtJkrYxveCeNWHCnPiKkmnRb
         QGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bnUdOq88S5jzPpVoyj19K4zXbAbMVOiRE4Y/7ikog0w=;
        fh=WW9+ThvU/E8rNk4uA9ZAC3wTvdGud+eOc0VRM9Jq4ac=;
        b=T1l0/ZCasH4+LhGf3si7PB+NaX0P0eju5m5ivF9QAEZE/RWYloNpUsNDLbvsPcbDiz
         dVDpB0duxjRtaFP8e2/IlmrjHgaJXb+k/v4MEokMWr19AAkHXRrCMMLLmmQm8rwXydE1
         hf5veFAGcK6j2qJibbrBBkot1iMZ6ulkPImTwSBBh6cxfbbwOXUj8alTgOZ7r4KgYFg9
         Mgtu3hicyLunvTwiCaqDusV5ZrUv/GhOknlw+crZn2QFrVgvBEGib6szfGhorUbQqh4g
         cWY3dD3y2tDMc2mio7O6xdv1YH+Y+QB/wTnHVtQ9Ca6IUBkRwDcUiSSs9JFkhZblKTQO
         68sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014660; x=1769619460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnUdOq88S5jzPpVoyj19K4zXbAbMVOiRE4Y/7ikog0w=;
        b=BKz09Hgl3lIelVXmMkIqX51HjoGjTyR2dhIE4AhhoglxZ5zn1Y4dJ2dkNgJw9DHpXc
         40UJVULiUxwCH5WMZqOlaaTf+OswEQUN7TDnLsay4Aqkcw6CFtLmKix+5lIzoHtk79kv
         qZggeVrVpC3hWqBlMM5K9hpgyut79Gv0uTDHyvEyh/idpZrBMDRaYsFDxolodney3tKA
         AzrHabBYwzjNEeEWJcw7KMhybgAx+OvE7ex3wTPfqgHiuBHjtx//INyhBmaTNJOATNr/
         5PzIGGAio2YjyEaRFSIMoZINuWMERWCxVO6tlMZnScnM0P/DTqhbJN3hWqYk+l/nLjUI
         BH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014660; x=1769619460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnUdOq88S5jzPpVoyj19K4zXbAbMVOiRE4Y/7ikog0w=;
        b=ReLTEXEb0tPJaGbU4Wmf9IXkCYH5K8fUEhr8/0rBLnI2xsKn8odQAo4AOpYGJVqsKX
         55ZnoyG/ji/vytq4M92ZX6jjex5b8nv7CsdxHlFo8+l5utIRieAYJ4cNinbzNUhBiqV+
         +o+buCIv6FHbgn4sAaNiHqoIkNUjERcWLyW89K1UlAf+X+1B5H9KO2abAY6Jad/BZNOw
         8u0g2RXvw6QNq6QP65zRyFUT5ZuZOw1vYYTtnpC/1Yj5uyj6sjWEj0jIGbsyBMxv0LMQ
         o9oViYN0HuwwZahl1Kw2KJXOeylTIujdeX/qTEL8xWcznQgQhrMDNk3e6hb3+iZyvnq3
         5MUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz4HpoQq/YC0egftFQb5cFcsIwmUbkRV30qbC7g3ChEyLgbK08Li1x3Zu5rB8rUsfTLZlIVVimT3q5eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4D9q2Vgrw+X+jY52a1iXIE6Ti/5MPelapUl9D+XWfYaxcmiJ
	NulvmAq88xxveZtPTM49l+U1602eG5Q5wh1NsVhtgt6KtBFN72bCDsdQHQnKxrukHxRtBaJjjzZ
	jK86+0h11zL6jfAeyuqtnB7vFfsutSiw=
X-Gm-Gg: AZuq6aKER8AuNt/jI272gFJ85II0Jbt7d+5ivAasnhXyCgnLXU2CkzK1GH0RZWXrnGK
	Hc57kue7uqPixrPZyovDOU0e4xlKG0dbBwTQjJEch1Of9U9db86qnjFmeX0LFU/KQVEpHzA+XsK
	gS2clBaYz68GTREsU/1ccAwqjLVNxQgs2F/gvKni+OnKNpaDAf44lFdFRQLyI3NomadqyXqL5bh
	PdoaLrIgmsbW8onkVOyeJXyVvt3Y2y6l8K3E5hcNgHsl/LoVNmiEoC6XiumjASmWi2r4Zn1
X-Received: by 2002:a5d:64c4:0:b0:435:9144:13fe with SMTP id
 ffacd0b85a97d-435a5ff8c0fmr101536f8f.26.1769014660302; Wed, 21 Jan 2026
 08:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125120559.158860-1-clamor95@gmail.com> <20251125120559.158860-12-clamor95@gmail.com>
 <4370037.mvXUDI8C0e@senjougahara>
In-Reply-To: <4370037.mvXUDI8C0e@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Jan 2026 18:57:29 +0200
X-Gm-Features: AZwV_QgURCnhkWoxVxcJP63yhkPm-ScQ-p0XP69L3txSPXMFGvGuHj06hr84FTs
Message-ID: <CAPVz0n1zqo1TyaV=+fc6YzOKH9TqOBEatruZTAVGg9hFEWmXsQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] ARM: tegra: Add EMC OPP and ICC properties to
 Tegra114 EMC and ACTMON device-tree nodes
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

=D1=81=D1=80, 21 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:56 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, November 25, 2025 9:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add EMC OPP tables and interconnect paths that will be used for
> > dynamic memory bandwidth scaling based on memory utilization statistics=
.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 151 ++++++++++++++++++
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi        |   9 ++
> >  2 files changed, 160 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.d=
tsi
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/a=
rch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > new file mode 100644
> > index 000000000000..1a0e68f22039
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > @@ -0,0 +1,151 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/ {
> > +     emc_icc_dvfs_opp_table: opp-table-emc {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-12750000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <12750000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
>
> What's the source of the opp data?
>

I have used tf701t (T40X) and tegratab (T40S) kernel sources, to be
more specific board-*-memory.c files. Timing struct for each clock
contains min voltage field which was used to compose these opps.
1390000 is the max core regulator voltage, taken from tegra11_dvfs.c

I have converted an entire core_dvfs_table table from tegra11_dvfs.c
and I am planning to submit those later on too along with
powergates/domains configuration for tegra114, but that is for another
time :)

> Cheers,
> Mikko
>
> > +
> > +             opp-20400000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <20400000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-40800000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <40800000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-68000000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <68000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-102000000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <102000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-204000000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <204000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-suspend;
> > +             };
> > +
> > +             opp-312000000-1000 {
> > +                     opp-microvolt =3D <1000000 1000000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <312000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-408000000-1000 {
> > +                     opp-microvolt =3D <1000000 1000000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <408000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-528000000-1050 {
> > +                     opp-microvolt =3D <1050000 1050000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <528000000>;
> > +                     opp-supported-hw =3D <0x000E>;
> > +             };
> > +
> > +             opp-528000000-1100 {
> > +                     opp-microvolt =3D <1100000 1100000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <528000000>;
> > +                     opp-supported-hw =3D <0x0001>;
> > +             };
> > +
> > +             opp-624000000-1100 {
> > +                     opp-microvolt =3D <1100000 1100000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <624000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-792000000-1100 {
> > +                     opp-microvolt =3D <1100000 1100000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <792000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +     };
> > +
> > +     emc_bw_dfs_opp_table: opp-table-actmon {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-12750000 {
> > +                     opp-hz =3D /bits/ 64 <12750000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <204000>;
> > +             };
> > +
> > +             opp-20400000 {
> > +                     opp-hz =3D /bits/ 64 <20400000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <326400>;
> > +             };
> > +
> > +             opp-40800000 {
> > +                     opp-hz =3D /bits/ 64 <40800000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <652800>;
> > +             };
> > +
> > +             opp-68000000 {
> > +                     opp-hz =3D /bits/ 64 <68000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <1088000>;
> > +             };
> > +
> > +             opp-102000000 {
> > +                     opp-hz =3D /bits/ 64 <102000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <1632000>;
> > +             };
> > +
> > +             opp-204000000 {
> > +                     opp-hz =3D /bits/ 64 <204000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <3264000>;
> > +                     opp-suspend;
> > +             };
> > +
> > +             opp-312000000 {
> > +                     opp-hz =3D /bits/ 64 <312000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <4992000>;
> > +             };
> > +
> > +             opp-408000000 {
> > +                     opp-hz =3D /bits/ 64 <408000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <6528000>;
> > +             };
> > +
> > +             opp-528000000 {
> > +                     opp-hz =3D /bits/ 64 <528000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <8448000>;
> > +             };
> > +
> > +             opp-624000000 {
> > +                     opp-hz =3D /bits/ 64 <624000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <9984000>;
> > +             };
> > +
> > +             opp-792000000 {
> > +                     opp-hz =3D /bits/ 64 <792000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <12672000>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts=
/nvidia/tegra114.dtsi
> > index a920ad041c14..6221423b81d1 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
> > @@ -8,6 +8,8 @@
> >  #include <dt-bindings/soc/tegra-pmc.h>
> >  #include <dt-bindings/thermal/tegra114-soctherm.h>
> >
> > +#include "tegra114-peripherals-opp.dtsi"
> > +
> >  / {
> >       compatible =3D "nvidia,tegra114";
> >       interrupt-parent =3D <&lic>;
> > @@ -323,6 +325,9 @@ actmon: actmon@6000c800 {
> >               clock-names =3D "actmon", "emc";
> >               resets =3D <&tegra_car TEGRA114_CLK_ACTMON>;
> >               reset-names =3D "actmon";
> > +             operating-points-v2 =3D <&emc_bw_dfs_opp_table>;
> > +             interconnects =3D <&mc TEGRA114_MC_MPCORER &emc>;
> > +             interconnect-names =3D "cpu-read";
> >               #cooling-cells =3D <2>;
> >       };
> >
> > @@ -655,6 +660,7 @@ mc: memory-controller@70019000 {
> >
> >               #reset-cells =3D <1>;
> >               #iommu-cells =3D <1>;
> > +             #interconnect-cells =3D <1>;
> >       };
> >
> >       emc: external-memory-controller@7001b000 {
> > @@ -665,6 +671,9 @@ emc: external-memory-controller@7001b000 {
> >               clock-names =3D "emc";
> >
> >               nvidia,memory-controller =3D <&mc>;
> > +             operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> > +
> > +             #interconnect-cells =3D <0>;
> >       };
> >
> >       hda@70030000 {
> >
>
>
>
>
