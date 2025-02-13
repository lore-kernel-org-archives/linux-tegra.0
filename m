Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41149257AF1;
	Thu, 13 Feb 2025 20:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739478560; cv=none; b=BjrpHRavfmUJDu3ZsCrvQTXjKICMB62ZAcZpgLqy/4DJqovX77heexIvWuk84RKRkbeztIQJYyrxiInVnAEy6/llSQBpovlXPPxl9xREaSfNHVkokTv35zTC7o9IPcw9y3tv4GPezU/JLcGKE0hAU7465WpzXTXUckeZEWDKB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739478560; c=relaxed/simple;
	bh=YppzhLV/rFWU5bXPekJ7n27J1mtqKJ+RmDLes5j0r7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WV/1W40telKtkiDhB+Jh5Bk39mqYZMKSc6gLEUvh2/2QTIz9VgMOxlROZe4NWBQ8pSx7gN2hEbj28wlX3bjCl401UpT99WViW8+rhBp7hRzYlfI6W7T7QA887n3ss8ySQwWeMENLPm9QNZFqqJnQ5tqPd5DLbDaVZCdzcPnT6Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CH1/khpn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CH1/khpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F11C4AF09;
	Thu, 13 Feb 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739478559;
	bh=YppzhLV/rFWU5bXPekJ7n27J1mtqKJ+RmDLes5j0r7A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CH1/khpnAwSHv0v/TORUt7bvTSslWqvT+7z6QS7Z4w2m2s8ZDDswHzCBIy4giQUPx
	 CpOPcFx2ZL7qjLAsoCzU9lJ/wdN7Yg9Ok3QJ6IzTYzuUL07v8UBofG+JPgLCd6OAMX
	 FbJoXsPz4fRbW/5Vs+ruqBM5EBpC2pN3tWlggxC/46TsPqV9f4Hvqas0eJK073idR5
	 Kt3DHXTOp+J2muWYlsu52I/MJGioAcQIig9tP4ZwPAeJmyu7Ida5jnztUcRcLKKXst
	 J1n6QvtdGjV+7YSGm6C5/mNMnPe4BQTLNjNDXf5kNDfhRpPbVsu6ESUf8cjuYXzd88
	 Sir8dsCVCJOuA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so1991732a12.1;
        Thu, 13 Feb 2025 12:29:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgQ/ukS+YksRqWy6qjnQMMv4Nnu1MGfcMZ26SH97EAZKO6OiG8sPEHWfagtgtHgBN9ly5l90VuuilHDy0=@vger.kernel.org, AJvYcCXi4+gHGvNwT01soqhl/yGcFbhHzfDazFsa3RznGL4t/eMBAAv7zq+EhBxaKQLzyrrqX3sa+zhDYkl1wUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaMUmQWLbK1fkCx6e/K7Zn8RLlP0k2dWi4VA0U+1HzDgXn94Qs
	85xDHRmRHyGP0KV4Un3bjn6vXUyt9yh/jZPlAgD1YMQqRXN2zn7aXJPBssoppPwl5AuPfYgG/gz
	kq8kEk/3krI4gxorZ4KiTHyLjmA==
X-Google-Smtp-Source: AGHT+IEXVitIjVCDOm5xYt53H9+9JSTgqyspa689L/MSfkj4BshuTrjYl7R+w5GsXZmrMafsMmFJz4EvkMLWpFgEpOM=
X-Received: by 2002:a05:6402:2748:b0:5dc:c3c2:225e with SMTP id
 4fb4d7f45d1cf-5dec9d3eb64mr3747640a12.8.1739478558277; Thu, 13 Feb 2025
 12:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115193445.3619074-1-robh@kernel.org> <CAL_Jsq+9jNNF2yWCbSiiey2ubn2WAX8PdA69+cbXpWCDwPEm_Q@mail.gmail.com>
In-Reply-To: <CAL_Jsq+9jNNF2yWCbSiiey2ubn2WAX8PdA69+cbXpWCDwPEm_Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Feb 2025 14:29:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMcSU0NCgkbuLjKd567nvwHdc0os=6avZtyf=Qf01UJA@mail.gmail.com>
X-Gm-Features: AWEUYZm5ygLbqYDPrwlTSKCLbdlDwtmYsC6_pLReODMb6-exZj-ap83lI-2bv6k
Message-ID: <CAL_JsqLMcSU0NCgkbuLjKd567nvwHdc0os=6avZtyf=Qf01UJA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nvidia: Remove unused and undocumented
 "regulator-ramp-delay-scale" property
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 4:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Nov 15, 2024 at 1:34=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
> >
> > Remove "regulator-ramp-delay-scale" property which is both unused in th=
e
> > kernel and undocumented. Most likely they are leftovers from downstream=
.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ----------
> >  1 file changed, 10 deletions(-)
>
> Ping!

Ping again...

>
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/=
arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > index c56824d7f4d8..0ecdd7243b2e 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > @@ -266,7 +266,6 @@ vdd_soc: sd0 {
> >                                         regulator-max-microvolt =3D <11=
70000>;
> >                                         regulator-enable-ramp-delay =3D=
 <146>;
> >                                         regulator-ramp-delay =3D <27500=
>;
> > -                                       regulator-ramp-delay-scale =3D =
<300>;
> >                                         regulator-always-on;
> >                                         regulator-boot-on;
> >
> > @@ -281,7 +280,6 @@ vdd_ddr: sd1 {
> >                                         regulator-max-microvolt =3D <11=
50000>;
> >                                         regulator-enable-ramp-delay =3D=
 <176>;
> >                                         regulator-ramp-delay =3D <27500=
>;
> > -                                       regulator-ramp-delay-scale =3D =
<300>;
> >                                         regulator-always-on;
> >                                         regulator-boot-on;
> >
> > @@ -296,7 +294,6 @@ vdd_pre: sd2 {
> >                                         regulator-max-microvolt =3D <13=
50000>;
> >                                         regulator-enable-ramp-delay =3D=
 <176>;
> >                                         regulator-ramp-delay =3D <27500=
>;
> > -                                       regulator-ramp-delay-scale =3D =
<350>;
> >                                         regulator-always-on;
> >                                         regulator-boot-on;
> >
> > @@ -311,7 +308,6 @@ vdd_1v8: sd3 {
> >                                         regulator-max-microvolt =3D <18=
00000>;
> >                                         regulator-enable-ramp-delay =3D=
 <242>;
> >                                         regulator-ramp-delay =3D <27500=
>;
> > -                                       regulator-ramp-delay-scale =3D =
<360>;
> >                                         regulator-always-on;
> >                                         regulator-boot-on;
> >
> > @@ -326,7 +322,6 @@ vdd_sys_1v2: ldo0 {
> >                                         regulator-max-microvolt =3D <12=
00000>;
> >                                         regulator-enable-ramp-delay =3D=
 <26>;
> >                                         regulator-ramp-delay =3D <10000=
0>;
> > -                                       regulator-ramp-delay-scale =3D =
<200>;
> >                                         regulator-always-on;
> >                                         regulator-boot-on;
> >
> > @@ -341,7 +336,6 @@ vdd_pex_1v05: ldo1 {
> >                                         regulator-max-microvolt =3D <10=
50000>;
> >                                         regulator-enable-ramp-delay =3D=
 <22>;
> >                                         regulator-ramp-delay =3D <10000=
0>;
> > -                                       regulator-ramp-delay-scale =3D =
<200>;
> >
> >                                         maxim,active-fps-source =3D <MA=
X77620_FPS_SRC_NONE>;
> >                                         maxim,active-fps-power-up-slot =
=3D <0>;
> > @@ -354,7 +348,6 @@ vddio_sdmmc: ldo2 {
> >                                         regulator-max-microvolt =3D <33=
00000>;
> >                                         regulator-enable-ramp-delay =3D=
 <62>;
> >                                         regulator-ramp-delay =3D <10000=
0>;
> > -                                       regulator-ramp-delay-scale =3D =
<200>;
> >
> >                                         maxim,active-fps-source =3D <MA=
X77620_FPS_SRC_NONE>;
> >                                         maxim,active-fps-power-up-slot =
=3D <0>;
> > @@ -371,7 +364,6 @@ vdd_rtc: ldo4 {
> >                                         regulator-max-microvolt =3D <11=
00000>;
> >                                         regulator-enable-ramp-delay =3D=
 <22>;
> >                                         regulator-ramp-delay =3D <10000=
0>;
> > -                                       regulator-ramp-delay-scale =3D =
<200>;
> >                                         regulator-disable-active-discha=
rge;
> >                                         regulator-always-on;
> >                                         regulator-boot-on;
> > @@ -395,7 +387,6 @@ avdd_1v05_pll: ldo7 {
> >                                         regulator-max-microvolt =3D <10=
50000>;
> >                                         regulator-enable-ramp-delay =3D=
 <24>;
> >                                         regulator-ramp-delay =3D <10000=
0>;
> > -                                       regulator-ramp-delay-scale =3D =
<200>;
> >
> >                                         maxim,active-fps-source =3D <MA=
X77620_FPS_SRC_1>;
> >                                         maxim,active-fps-power-up-slot =
=3D <3>;
> > @@ -408,7 +399,6 @@ avdd_1v05: ldo8 {
> >                                         regulator-max-microvolt =3D <10=
50000>;
> >                                         regulator-enable-ramp-delay =3D=
 <22>;
> >                                         regulator-ramp-delay =3D <10000=
0>;
> > -                                       regulator-ramp-delay-scale =3D =
<200>;
> >
> >                                         maxim,active-fps-source =3D <MA=
X77620_FPS_SRC_1>;
> >                                         maxim,active-fps-power-up-slot =
=3D <6>;
> > --
> > 2.45.2
> >
