Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91883B28D
	for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349843; cv=none; b=Rtz7BMSVsbsnQcynFeIYK7KBUP4oWXisPIWZnRxDK+uBWEy8/p4Y+9MeeD4yE2JunWfj/LEZPBeesOX3/lRfQQEx2Lo4ZDvJ3IZSAnEQZjm2fzrVrWJJsqx8QlbcgYeUX4wHeztsywkBnVowfIR8mkXg/Xp+sSOT73xRQChO2zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349843; c=relaxed/simple;
	bh=gfLBIxCP9gTBkqUQkCDioJa5j+uF4TVTBk1UlYn4f1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd7jtsYVexCNc8Wf3DjAfmPxdgtAlWY6dRLV7w2t46hzh+YSKNOvXQbpIVjFkzf0/AHb3gGUFCeDI1PAx6FhOsWa2nJ0+VnZAHgCv3YxextPnEo91QkzHJdI3tWV+6eIxo1Wdz3mWhr/ZD7ACPe+ufAtmRy1MWMagpnszHFSF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJ6zi6Ln; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJ6zi6Ln"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so124630565e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2026 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349840; x=1776954640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+kwLEL1gpqQktpl52WXxb4CxP8KVAiLEC1DOuEVmbLQ=;
        b=qJ6zi6LnKLsu+MVzgdExoi4dB2CNROHGceCpeUcLO51pEu55t4jM8ha3AaKgEZMJn6
         dTKO5cmYsRyBj1MlZOzVWvvgkDbyOVvDTucPxMIAzpwdwEOf5d0P5OldH5rf1mO1513S
         ypzDiC19vgV+PW++gkvJcfSsCbWD4Y3bvoWTvsamW3lPgA12JPcEcki4AluTghtOCc2n
         kflv7+hQG8A205uy7G8Oa4FoBithYCUp6WuV9O16Tlzja8B659SFVbZFmznNcSN9N+hg
         ghxj0sGUTdxGJ6RpBttuPuJ/mlO/xV0R4lmSPdxMSHuV/FDtoaGYEwiayhC0JkWUUkkz
         9bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349840; x=1776954640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kwLEL1gpqQktpl52WXxb4CxP8KVAiLEC1DOuEVmbLQ=;
        b=B/uXCs3DTTmyztRa8gY/I/myGokbSL+mxqU8TLbP1+bzbKXSHEn5DTBbJ1qiL750se
         pa7OvOqbuVeSTj6kVCLm8V1R2f81H9Uqh5X672GSa+F3lxXSNh+HBw7fba/PdhPq000d
         k9tN/mggZcA6B59MXoMPmIPFsiuJkmDggTfbpW3vIit8JGdv5IhBzT8hU1tDVHERP0QJ
         RfxqvKZGoLR59TeRLuhyEARhan507ilCkx0QEvmfdY9abPYGtzsZjtEkFKXnFRJkYjaQ
         R2WqZeL3RxCkwbVsAK8NwlJ7Lkqi0lbR0V3fBSXAjRr0AVhgNqDLHIqdsjzCzCU+tiZd
         FU6A==
X-Forwarded-Encrypted: i=1; AFNElJ8PvgKFbj6QG0u8dXYA49bYGYC62M28RE7LxLMQ7H0svlZWa9K4b4UE8y3jB3Tg9QjP8Z7zIraHSn7dHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYG+DzJA7Zmj8MZ5RcX7jbSRP7eGQBz3B7y0ojdes4lH9DIXP
	jvfyN4x2EjPX1h9KKHlr3wL/cvgwlyIyjy00SwJupo+WVV+qVoz0UY1Z
X-Gm-Gg: AeBDietW7+SdBkCIgU1YbBzctZR99O1SN+bkFiZMHnZaCKiB6hDpg87nNBaUSNrQ65A
	5HZ8W8bPfjbD352JiKlLtM9OwhH316+7AAjYC4bTrJkwZ8Lco2TnIwrAmS/UMBwS0mtfAbhA1dm
	BVq97kWY6URoaYPBl5czH2xhqbndLhiqooxaFhVc8q9pJuXlkKH1Xe81Yakw112y7hTjrEEF2lJ
	yiSJM7KvfLwKUBze3roWr+H1HsRTB0XFcyDWFnoOtvYgC+6se17fnQ+TK57+AX2QuWV606n9+if
	6oGFHavJH8kTo7DDVQYbju2ydOw031QIjgu/+JBT0FxDSKkQjhDsS/746DtLCxXR4RUZGf+zJsA
	uRy4I+YMxYK2Ft72dkYT2+yRTDry/lhGW+NslyILqzxthrCPul4+WZnjlFvhTn7t/t4Vp5dBblZ
	CXM0noZuDk9JdRtLUgu4HUobgk1kdbfpfgzHBLESdC7M6oWVw8/EZz8DQrM5hH8+XVvh6kLXzF/
	ZBqVg68fLZYcHk47dpttatu
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr377654785e9.9.1776349839862;
        Thu, 16 Apr 2026 07:30:39 -0700 (PDT)
Received: from orome (p200300e41f131500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f13:1500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5813970sm54034215e9.1.2026.04.16.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:30:38 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:30:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, pshete@nvidia.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, bjorn.andersson@oss.qualcomm.com, 
	conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org, 
	geert@linux-m68k.org, krzk+dt@kernel.org, kuninori.morimoto.gx@renesas.com, 
	linusw@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, rosenp@gmail.com, sven@kernel.org, 
	thierry.reding@kernel.org, webgeek1234@gmail.com
Subject: Re: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl
 a loadable module
Message-ID: <aeDv2oI6lJOlfJxR@orome>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-7-pshete@nvidia.com>
 <9408f231-7a12-425c-b8de-2990d3162bb3@kernel.org>
 <097f71e0-cbc8-44e3-ba60-8bac79cf5217@nvidia.com>
 <19f390ab-ffa9-4237-9f24-ead07b627a89@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdz2kxftdpnb3xlu"
Content-Disposition: inline
In-Reply-To: <19f390ab-ffa9-4237-9f24-ead07b627a89@nvidia.com>


--zdz2kxftdpnb3xlu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl
 a loadable module
MIME-Version: 1.0

On Mon, Apr 13, 2026 at 10:49:50AM +0100, Jon Hunter wrote:
>=20
> On 10/04/2026 09:25, Jon Hunter wrote:
> >=20
> >=20
> > On 10/04/2026 07:37, Krzysztof Kozlowski wrote:
> > > On 09/04/2026 15:13, pshete@nvidia.com wrote:
> > > > From: Prathamesh Shete <pshete@nvidia.com>
> > > >=20
> > > > Building the Pinctrl driver into the kernel image increases its siz=
e.
> > >=20
> > > That's obvious.
> > >=20
> > > > These drivers are not required during early boot, build them as
> > > > a loadable
> > > > module instead to reduce the kernel image size.
> > >=20
> > > So you replace built-in into module?
> > > >=20
> > > > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > > > ---
> > > > =C2=A0 arch/arm64/configs/defconfig | 2 ++
> > > > =C2=A0 1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defc=
onfig
> > > > index dd1ac01ee29b..f525670d3b84 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -711,6 +711,8 @@ CONFIG_PINCTRL_SC8280XP_LPASS_LPI=3Dm
> > > > =C2=A0 CONFIG_PINCTRL_SM8550_LPASS_LPI=3Dm
> > > > =C2=A0 CONFIG_PINCTRL_SM8650_LPASS_LPI=3Dm
> > > > =C2=A0 CONFIG_PINCTRL_SOPHGO_SG2000=3Dy
> > > > +CONFIG_PINCTRL_TEGRA238=3Dm
> > > > +CONFIG_PINCTRL_TEGRA264=3Dm
> > >=20
> > > No, you just added as module. Why do we want them in upstream defconf=
ig?
> > >=20
> > > Standard question, already asked Nvidia more than once.
> >=20
> > Yes :-)
> >=20
> > Prathamesh, what we need to do is ...
> >=20
> > 1. Add a patch to populate the pinctrl DT nodes for Tegra264 device.
> > 2. In this patch, only enable pinctrl for Tegra264 because we are
> >  =C2=A0=C2=A0 lacking an upstream board for Tegra238 for that moment. I=
n the commit
> >  =C2=A0=C2=A0 message we should add a comment to indicate with Tegra264=
 platform is
> >  =C2=A0=C2=A0 using this.
>=20
> Thinking about this some more, I think I would prefer that we skip the
> defconfig patch and just add ...
>=20
>  default m if ARCH_TEGRA_238_SOC
>=20
>  default m if ARCH_TEGRA_264_SOC
>=20
> ... in the respective Kconfig files for the drivers.

I know some people have objected to this type of construct in the past
because it means that you automatically enable these drivers in configs
where it previously wasn't, bloating people's test builds, etc.

I also know that people don't like it when we add seemingly random
options to defconfig.

For this particular case, given that the options are dependent on the
per-SoC Kconfig symbols I think the "default m" above is a fair
compromise.

Thierry

--zdz2kxftdpnb3xlu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmng8ocACgkQ3SOs138+
s6GLDw//UkW/3SDVTez5uuRcccg2eBGqX/zaY1yU6TYz909vpObsLW+WrxFfq5Un
qspGtIXmoOokDmBhG8UNvSainJ/q8PKsEfUIO7+jzvmr/FoxFdttJO7Ouo2D7SQL
FuOg8npa4zaeybyh/PSr/XK1ET8CFJ8uJ7bNo7dq5lvnLA4LxRRrGgbJPUQYzIAK
ZA8kwfGqWN6ZSaK7L57hRg3iermVGG803wyscNiFE3Vgqy7HuNjnFy79JIcYsvll
cixH9CydPAbgzXyJK1vdl97JaMpm/PhfclkEq5tYycCRSTWp7FJuGrRizzDOeUaD
8VyrvMmA1qnT/ou+oTi9OUaroPtqCWRebTkAKEy0toLCHanv9Tj9HoZYfSccos6i
u2ZMQkTXTj5+2mdF8WrRq1F9arlq1K9Thox4K7XSq16rmu3mhd35qZy0wtXmlgVi
3eUbtiD5oQ/syXHRCcm1XsMf7t1LWwGBsiFGXeiMVTJ7mrN59MwVft/1Z8vKkM8o
YRbsW3shvFvQPQfJwiTLtxO2TDcgs43iOyL4g5CjHhYdt+SFOpts85y4Vuk2/3l6
SJOFv40RNRUWeIl+PGzIgmVJmaJkYjQE9bLUQQzwI0E0nY9M+tEs6j4fCvlEXLij
PCSXdQILNYyGAv6rccvVV13KUuQWvuldNdTr7e9AR0ceMYen2u0=
=RApE
-----END PGP SIGNATURE-----

--zdz2kxftdpnb3xlu--
