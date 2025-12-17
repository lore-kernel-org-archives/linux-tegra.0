Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D547E30B509
	for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004193; cv=none; b=C3TxVHSQw5Jof2q3iHY0gin9VwAPg/CZzl3uKTO2a0p4A5eYEEwtIvslvIfKIYppvyObOqfXQeLtVtFPVQtZ4QO6UxjUseBI+jVnMZfQR4iwfkWJ3aFulF4R9TqMyEFc1yq22DhVOV5bZLozXzILizaHKDu7ef/a92K+fDhLQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004193; c=relaxed/simple;
	bh=Z9IdB1u8PZBntSxpNzgqYyKOujyexq+XNlF6bns6O5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+k7lhN9gSpBGclCOenvTbOtNY8MkzbtGeu0NtMbuKbe9gnHNsARzobWNLTrWQrGlrAMSo8uOPnA+H51LjFv5w4QI5IAC6nrMAoW4B4d1J7IAF4Cxwoc9pmn05a4uklohRrqdBftgi4kRfVZ1M6qRYpjJ2uBR8Jyxoum0MjjALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBcRb+ln; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBcRb+ln"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-594330147efso7835505e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 12:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766004190; x=1766608990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9H0cg0KIoEtN0SL5lx2VgL8bqTA/+IdaFlnJLK6zvAU=;
        b=eBcRb+lnp/HhMHq1EvYFOatMzn3JcCTZTYAGM8YsPkv821V27LVAaJ7cW+w4UV6nQT
         J5z3/DunbBV4oFu+pvykRQ8JlWGgX9GRzc+oT+hzn4kO/FwKM1lIEQKMRSR9wwwEPsVP
         j4jnYGLy3ZaEecYLNBF+Mcgh5/BFvFlyC4T1xqphcEqUNhXeQfpghVfBsz8zsxJzHr28
         Xbeg7eCbkNFdW5mYJ6aTBU+IJcaR7ruH92GMr5Y1PrnnMFp3rlsx3dXVj95QC8izvoaH
         LjifUyq+LLDzQo3wDt/TH1JZo75hxsz5fAIRk6eLJT5QXtlOyUyvLcSLnxenoWieS0r2
         ZqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004190; x=1766608990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9H0cg0KIoEtN0SL5lx2VgL8bqTA/+IdaFlnJLK6zvAU=;
        b=Seyu0TlOzj63EZhnRBU84M1sqG4zqm+BpCyHb1rP/Eb3buVd10lfa2YdKM0gSLAngr
         hRZE9ssTT7IqTP4/zveohg9WEY+9In2CVOEujPooIV3xMoQrT2Z5M7+YEHNPdZjMX7HM
         Dj2ICV7Fsl12D24j+CIQNfaicr0AAstdoTo6TYC4VEFDqNJkexlO/j+57kgKz8IjdRvs
         xho/AjacoHMOU3fnUiNwsOEk3C7VcAmwWEzh/3GZlMW56qeahIYOHqVUuzb62YExF1F+
         Xjf2XVgvJ3JtD2S2leuuEw0o7nwg8/+iFCm9bFxobRSKEqdDEunXX+9LUfetUpVX5bYx
         Ki2g==
X-Forwarded-Encrypted: i=1; AJvYcCW6I2njck3c9i0IfO99vuOxmyFE/jHYhQ4tIlWp0W1XuFzqUpOMw01bN4OP8zOhqpj6Q6tM4Bw+1YoB5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+Kh1C/TCT+6S1Q1dSlLEts5nxsbr6aUPjXGomFfD7RORReue
	6/CSzvQpz0HbBem4w04QXha4uMtGfPN6Qh+BqU7pjdqgceWy6Yr6nmxFGRH5WNpCW5oePmD3DNd
	kSOUlKrXMO0543yKGGGWkNfUdCnqoadE=
X-Gm-Gg: AY/fxX5kreXAq8N4OwQA7dQRLIWzw8wKy7v3XEbpDw4GYS5Q/j6xcUy5QZTQ280zJpk
	77k0C1/uHpjrOn1hBVTEpwhr8urURMvvihh/08agaFf58sKkcdZbYvMZK87xhai2zEZQs7ajdky
	xC+z2yAGjrHBNA/qCPxRF4tan3wc7PT4PuJV4S7KMr5qzzGU3mNLeUTS517k/YGkUtXAxsjXTkG
	zH6dn4eTz893WNrOzvZM7djjJ9z1r5UCSwOiF7V7iAmdwjPWtWYuagm/ykRNJrOeLpBPSI=
X-Google-Smtp-Source: AGHT+IG9yysa82uqqj5swEUDtGC6ZEIgwghpjHX8r8/iWO3DelPwl3bhrA8gmisvPgTCDfguYcNSYWH+rCmlr4FTJFI=
X-Received: by 2002:a05:6512:1443:20b0:599:105a:67e0 with SMTP id
 2adb3069b0e04-599105a69d7mr1822943e87.20.1766004189673; Wed, 17 Dec 2025
 12:43:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217104744.184153-1-jonathanh@nvidia.com> <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
In-Reply-To: <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 17 Dec 2025 14:42:58 -0600
X-Gm-Features: AQt7F2rK21aygGIAL23whTZr3cC8UgkDV-Vx3CDMwDAsJDzHVI4whhst3QUKEkk
Message-ID: <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 12:20=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Wed, Dec 17, 2025 at 4:48=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> > Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> > Tegra210") populated interconnect properties for Tegra210 and this is
> > preventing the Tegra DRM driver from probing successfully. The followin=
g
> > error is observed on boot ...
> >
> >  drm drm: failed to initialize 54240000.dc: -517
> >
> > For now revert this change, until a fix is available.
> >
> > Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Teg=
ra210")
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
> >  1 file changed, 24 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra210.dtsi
> > index 709da31d5785..137aa8375257 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > @@ -202,19 +202,6 @@ dc@54200000 {
> >
> >                         nvidia,outputs =3D <&dsia &dsib &sor0 &sor1>;
> >                         nvidia,head =3D <0>;
> > -
> > -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0A &e=
mc>,
> > -                                       <&mc TEGRA210_MC_DISPLAY0B &emc=
>,
> > -                                       <&mc TEGRA210_MC_DISPLAY0C &emc=
>,
> > -                                       <&mc TEGRA210_MC_DISPLAYHC &emc=
>,
> > -                                       <&mc TEGRA210_MC_DISPLAYD &emc>=
,
> > -                                       <&mc TEGRA210_MC_DISPLAYT &emc>=
;
> > -                       interconnect-names =3D "wina",
> > -                                            "winb",
> > -                                            "winc",
> > -                                            "cursor",
> > -                                            "wind",
> > -                                            "wint";
> >                 };
> >
> >                 dc@54240000 {
> > @@ -230,15 +217,6 @@ dc@54240000 {
> >
> >                         nvidia,outputs =3D <&dsia &dsib &sor0 &sor1>;
> >                         nvidia,head =3D <1>;
> > -
> > -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0AB &=
emc>,
> > -                                       <&mc TEGRA210_MC_DISPLAY0BB &em=
c>,
> > -                                       <&mc TEGRA210_MC_DISPLAY0CB &em=
c>,
> > -                                       <&mc TEGRA210_MC_DISPLAYHCB &em=
c>;
> > -                       interconnect-names =3D "wina",
> > -                                            "winb",
> > -                                            "winc",
> > -                                            "cursor";
> >                 };
> >
> >                 dsia: dsi@54300000 {
> > @@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
> >
> >                 #iommu-cells =3D <1>;
> >                 #reset-cells =3D <1>;
> > -               #interconnect-cells =3D <1>;
> >         };
> >
> >         emc: external-memory-controller@7001b000 {
> > @@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
> >                 nvidia,memory-controller =3D <&mc>;
> >                 operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> >
> > -               #interconnect-cells =3D <0>;
> >                 #cooling-cells =3D <2>;
> >         };
> >
> > --
> > 2.43.0
> >
>
> A little bit of documentation on this, should someone read the list to
> see what happened. The original report of the failure is here [0] and
> only occurred when the tegra210-emc driver fails to probe. After this
> report, the related code change [1] to tegra210-emc which registers
> the driver to icc was silently dropped from -next, but these dt
> changes remained. So now these interconnect routes do cause tegra-drm
> to universally fail on tegra210.
>
> Aaron
>
> [0] https://lore.kernel.org/all/56aed0ec-b104-4612-8901-3f6f95e0afab@nvid=
ia.com/
> [1] https://lore.kernel.org/all/20251027-t210-actmon-p2-v6-1-1c4bd227d676=
@gmail.com/

There may be another option here. I'm beginning to think there will
not be any way to set the icc routes for the dc's while the emc driver
can fail to probe. The next best thing looks to be just dropping the
interconnect nodes from the dc nodes and leaving the rest of the
original commit in place. Then reland the tegra210-emc driver change.
This should put the no-emc case back to where it was, while allowing
actmon to do its scaling when emc is available. And I will move to the
dc icc routes to downstream dt's, where I tightly control that emc is
available.

Does this sound reasonable? If so, I will go stage the changes and
verify that it works as intended.

Aaron
