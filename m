Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D13B8D63
	for <linux-tegra@vger.kernel.org>; Tue,  9 Dec 2025 04:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254465; cv=none; b=f/cNRYTg8TT/cEHiAfXwFvTgI8sSMziM20k2wFVvUwwh6Q1SycR3qdeDIKVFXIhzA1yIDe5ong7zoj/clNVOd3T9/CbYUt5624Wgh2+2BtHlAjAEtQkwSdjsuf1qKom5Ss2m0nR0Ep+JTBt/UsrU+TeUjHCPoHotUC30k8JbtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254465; c=relaxed/simple;
	bh=Cbqrmcc54drJXoEx9wYOJfemeR+eB7sGSu4BM2rb9Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNYrbrTts9tYkN0yRu9w1/O6slZo+KzBELoujDuZDsX69s3TYuPp6AlGLEOR8gR7vsXRhenqOn6RltXbkQAUl4YdGPYT/ZAuIusuC/M3/mLQEE/2qZipJFKm7W6ns8KhQ+VrcK7LTEx9htLcqHJSfEfpvyMw+Z9zgOuJyX7NWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRkpHss2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRkpHss2"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59584301f0cso5631469e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 08 Dec 2025 20:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254462; x=1765859262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4WpmHTbKcifGYAFFryKnbXtddGIYXrVx0U5IkY//qM=;
        b=BRkpHss2EiFSbMQ6oNoNAqoPK6KEas3tIV1MgM2A0XQ0WQav7ZYZomnnyugad1lex0
         5vckjsb1sVSVsD8fEv69xMS6OlUs1vPdlnfXI8aDgraUZFZRfyfe2oxKzFKGCmaaCoL4
         kiI5urbcuUzevFZuPqceWd0Gf0g0cRbgv00gU66ogNbT/HnA8wHDdSkyUcoAFwDowBJQ
         rupvmY0p7a2Kt5Mn0nDK/k0jeSFW0oub/jYSo9/wyu7dgGeKEKhAhIUbkXcm4dkBvLv8
         qOWTZXpnFZw2rZ7S/gIbJqdLWioL1iiMW+py/TIvVo2FWpY5+hVjayIGmpHsNMweCd6w
         nPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254462; x=1765859262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4WpmHTbKcifGYAFFryKnbXtddGIYXrVx0U5IkY//qM=;
        b=wSBKKEbUZypQJm2gSvtn4D1HWYNw8zs0X5r5Vxwa9lUA8mN7ZyjJ5PnqWgPJbWf92I
         w1ykVzOHcYjq8FeEYbb2fk9ud2fHRQE0UETmxIGKQY/5EDAF380TOJ8yx3xgH40GMhxY
         A0gPrhcLBGPacfqcq/DTq2Nksre5hrk9tesdGdMw3jH/zaNpbK8AIeqGFrlRQOjdoQnX
         DFXr3Eig2iPRxIadQNU58TO9M8Tth7LC3Xu+coZ0OzeiwDEj+6grak4/wwnsV/oM+pSS
         5IQXBjbtM9sv0fssaeOVVxMKAMkXavWCnF7/xjj2vLhuC9KUHyBmQVG/NCbM9vE5pqaA
         diXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWd7HZKK/dD8AWggSCOLQXfwxKA0eINgZiy0MP7+d9KLXi2YX7EoefGCYIxxgWdgOTIU1tHr6P6UMb/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZa7AC/O/96Ld/OdYGOS8CBPV/9hEk4zbSLQLQgRifDu3utceL
	dsfjPvjsct4zyTv6pI2uHovPU1BTkPYVLRlEdfOj4DBCNIOtkX8ThY9w7eTINTCR5fLnnaigs0t
	3TclbJB3dDyN0BvLZ5MxV0d0mSeWVJuY=
X-Gm-Gg: ASbGncvYlG8Od5WohTIltAHRlK82qHwiIsLXNCaktDHZ9k0EvuBWJPOZ5sDSDg2Ehx/
	tmnOvZM3ZGRHO2TDVY1LaNQVhe1gZyKEXnoMhjQxQIhrlrm9isJs/yuadHaICaxFQ1dyK+O4Nxt
	VjpbUrLfBqOhxgue7MDaWenNLMLIm9U3TKrsD1J9p936t3NHyY67EwobUrpynaVcnPjjLBPi7D8
	aYam14AAyQW+iZMpKYuidLLMWjRbjU81Z1hPt1INudtTrJMXbLVULMN1M7em0YYfGyLpGc=
X-Google-Smtp-Source: AGHT+IGvfbU31rATrFW7yKgrfprgR+nt3X9seL3vdzkCriOND0amwqexHU+zTbNxhLhoihgc9v5Fmj1r9zqeH+vbdrk=
X-Received: by 2002:a05:6512:3e04:b0:595:7e73:995c with SMTP id
 2adb3069b0e04-598853b91f3mr3260088e87.44.1765254461935; Mon, 08 Dec 2025
 20:27:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
 <20251021-t210-actmon-p4-v5-2-4a4dbc49fbc8@gmail.com> <56aed0ec-b104-4612-8901-3f6f95e0afab@nvidia.com>
 <CALHNRZ8Hc+kqWVCjTZvtJ+hBrsgpjO9EySOQFfLaLHvt9P_reg@mail.gmail.com>
In-Reply-To: <CALHNRZ8Hc+kqWVCjTZvtJ+hBrsgpjO9EySOQFfLaLHvt9P_reg@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 8 Dec 2025 22:27:29 -0600
X-Gm-Features: AQt7F2oCKVfzdOHI88ZZ-GHLP6TDXGTHzetFCKsT_okj-D0HByOTmpoRN0mC8y4
Message-ID: <CALHNRZ8qnVGu130Yxsf2e_6GHJj13H+_gA0T_JTNXT0xx7NyjQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: tegra: Add interconnect properties to
 Tegra210 device-tree
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 1:32=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Fri, Nov 21, 2025 at 5:24=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 22/10/2025 04:13, Aaron Kling via B4 Relay wrote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Add interconnect properties to the Memory Controller, External Memory
> > > Controller and the Display Controller nodes in order to describe hard=
ware
> > > interconnection.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 +++++++++++++++++++++=
+++
> > >   1 file changed, 24 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210.dtsi
> > > index 6da10db893add44a98fde1666c382511212fd43c..2fcc7a28690f7100d49e8=
b93c4fb77de7947b002 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > @@ -202,6 +202,19 @@ dc@54200000 {
> > >
> > >                       nvidia,outputs =3D <&dsia &dsib &sor0 &sor1>;
> > >                       nvidia,head =3D <0>;
> > > +
> > > +                     interconnects =3D <&mc TEGRA210_MC_DISPLAY0A &e=
mc>,
> > > +                                     <&mc TEGRA210_MC_DISPLAY0B &emc=
>,
> > > +                                     <&mc TEGRA210_MC_DISPLAY0C &emc=
>,
> > > +                                     <&mc TEGRA210_MC_DISPLAYHC &emc=
>,
> > > +                                     <&mc TEGRA210_MC_DISPLAYD &emc>=
,
> > > +                                     <&mc TEGRA210_MC_DISPLAYT &emc>=
;
> > > +                     interconnect-names =3D "wina",
> > > +                                          "winb",
> > > +                                          "winc",
> > > +                                          "cursor",
> > > +                                          "wind",
> > > +                                          "wint";
> > >               };
> > >
> > >               dc@54240000 {
> > > @@ -217,6 +230,15 @@ dc@54240000 {
> > >
> > >                       nvidia,outputs =3D <&dsia &dsib &sor0 &sor1>;
> > >                       nvidia,head =3D <1>;
> > > +
> > > +                     interconnects =3D <&mc TEGRA210_MC_DISPLAY0AB &=
emc>,
> > > +                                     <&mc TEGRA210_MC_DISPLAY0BB &em=
c>,
> > > +                                     <&mc TEGRA210_MC_DISPLAY0CB &em=
c>,
> > > +                                     <&mc TEGRA210_MC_DISPLAYHCB &em=
c>;
> > > +                     interconnect-names =3D "wina",
> > > +                                          "winb",
> > > +                                          "winc",
> > > +                                          "cursor";
> > >               };
> > >
> > >               dsia: dsi@54300000 {
> > > @@ -990,6 +1012,7 @@ mc: memory-controller@70019000 {
> > >
> > >               #iommu-cells =3D <1>;
> > >               #reset-cells =3D <1>;
> > > +             #interconnect-cells =3D <1>;
> > >       };
> > >
> > >       emc: external-memory-controller@7001b000 {
> > > @@ -1001,6 +1024,7 @@ emc: external-memory-controller@7001b000 {
> > >               clock-names =3D "emc";
> > >               interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > >               nvidia,memory-controller =3D <&mc>;
> > > +             #interconnect-cells =3D <0>;
> > >               #cooling-cells =3D <2>;
> > >       };
> >
> >
> > I am seeing another failure on -next for Tegra210 and bisect is point t=
o
> > this commit ...
> >
> > # first bad commit: [3cad4369399a31277e9e20de723c665b30cba574] arm64:
> > tegra: Add interconnect properties for Tegra210
> >
> > The tegra-tests [0] devices test is failing and after this commit the
> > DRM device is no longer bound to the driver.
>
> Upon research, this one appears to be a bit more complicated. The dc
> code in tegra-drm sets up an icc connection per plane to emc, I
> presume in order to prevent underruns. If the icc path exists in the
> dt, but the emc driver has not added itself to icc, then dc will
> infinitely defer [0]. And per earlier statements on this list, the
> regression test setup for Tegra210 does not pass emc training data
> from the bootloader to the kernel, meaning the emc driver fails to
> probe.
>
> I am not sure how to handle this. As far as I know, the previous archs
> that the dc icc code was originally written for wouldn't ever have the
> emc driver fail, because the untrained tables are in the kernel dt,
> meaning that the driver could at least load that. On Tegra210 since
> the dt tables were rejected, there's nothing for the driver to fall
> back on, so it is possible to have a hard failure.
>
> Does anyone have ideas on how to handle this? To allow dc to report
> icc bw on Tegra210, but not fail probe if the emc is missing? Making
> the icc path lookup non-fatal isn't really an option.
>
> Aaron
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/tegra/plane.c?h=3Dv6.18-rc6#n778

Are there any further thoughts on this patch? I would like to get this
requeued as soon as possible.

Aaron
