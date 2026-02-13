Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91962D97A5
	for <linux-tegra@vger.kernel.org>; Fri, 13 Feb 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970244; cv=pass; b=qCYKdik+1Jj+6X79ks4fFZXBdj+BA2yleAV8Gvk04FjMqymAF3zMjHpVUfGTz84Res68JUcXYVrsHDfY4xP7han0D/XPE7vsQEAXwp28J3szpmeQscMXUBIMCG02KnSkff47dwdNWaFcB8HEXgcrNYMjvKcZpt8qatYvgjw9yQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970244; c=relaxed/simple;
	bh=GLp4dFZH5Dh0/9zN2TZWcmJzLYuy4JOfbFcHtRYGlyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvOS7Kvlmg3uZ3CaeF8zn25gi/tKGhYxLKJ2ZIu9iPyhOOYHHZm/Muk+MofYAJl+ZmrUD2A8K0w0JKJB99Rywnb2luYV7x0HsSoHeUurxiw4j+WD0RmIlFttvUzcsrYYIUDeSpA8aMG1G1jGpPwlrzIalahkLPOq8fjNSAYiaes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2El5B5X; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2El5B5X"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso5102575e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Feb 2026 00:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770970240; cv=none;
        d=google.com; s=arc-20240605;
        b=KydEx3mKEiRqUGfVOINHIMo6fl08ELyMWXljpQow3U6OraPuqO3UH3mcT0Kj1pGJ/C
         CiEzRE6pASEIgon09ntxjBds/e/+FqyMRO3kHRC5TDxKApdSF9NTpq7R75YSLZvCuxtl
         X36tKyAaDoJ7/Y2/l+Wef//jnux0KA5YTXvEiiadNM92X+VGhonWaZVRIkTesGE1NfVe
         rP1LZhNOzf92WjuVZCblkB/hHEKSD512ZtqKFlSjOKKOXRpulBzXNKMs1jHpdjRq461e
         wO1QfdO/EOu459tph4CEpUbktSaezfopfR5+8yAvOmOEAKKfjbJbzxJs7JR9IA67f9bj
         A7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tmSI2jAhYtI7ZLsx4RzoCyPtRR9eH6Xuh33KxtJVVj8=;
        fh=lM0VO8Zbo1IIA/mUxjJIEluZqPi7IO/QHggCGVh1fYU=;
        b=OaTisvGWoGBQWYrYp3bOc1RHr4XalnYZpxWCcrLwnW8iUsIjYtYzYl7EXz6ue+3XQ3
         rh//zLg15JdEHis7RxeE+lbtwQvxTAH+/A8cL9/E6h6Kou2E16+SudJAQt2NtHufepwt
         vjrmFA5z8eJWyShmOk2ci6a+WSxcCMC49e1SC8D9ZP8ddo5LDxORr925SrafPcQn/Fj4
         Zh6uM8SQ1BfiosYmO0pKl1ll7U69XzSV3cR/EcnqMAONuYtzgIxfgpMfkIeVYoeg//nk
         qjRd6XCtiXt9db/so32gH/iilJVtsaAorZwZPVhljzVjeNchIfq08NPjHsFXXupoFvQ5
         2mZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970240; x=1771575040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmSI2jAhYtI7ZLsx4RzoCyPtRR9eH6Xuh33KxtJVVj8=;
        b=d2El5B5Xq9SZztPoS76WzCAXfaYqiNP+iFfI1ZGACqTFFYUqfcfa4/4kFvjmXyISk6
         kgQt4AkaUWGrc8KfuxihBHlpsX5LxWItsTQnqGYFgnVC4Rr8Qr1eVvpiFGJu8fBgQBQ+
         AetYg4HJ9K+pFHVqYammgKBrVJclC/tMgK7mzFIfcytJKuNN4QbXNffVTX85ok3AcFVq
         eq9KgSFNntzj2Xkh8j8723gDrAgTf6BABZfmpviq3QZAaKuUNkot+rIJtTnKjNX7+Fsh
         fZT/bosiZUotTPTQskt5Ma75WFV99gXIHpa9G+CvMnRi/weBXKGmdS3/vgazH9AW+M+W
         mmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970240; x=1771575040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmSI2jAhYtI7ZLsx4RzoCyPtRR9eH6Xuh33KxtJVVj8=;
        b=wj5JClN3dmT3646Pz+lCMtsJP4Hn70VGlzRBWv5BubSYk0VAStuT5TClGIGbMnbvRr
         w9DhjySCw5oDDtMDBIl2Ta9K8sm+3liHCs34db7MSnY6THOsc0PInr1VQs8Hr0gaVC1q
         dkd1AmIFd976xVQAg2sTUZzCp5MduBywfJAOGkNKQviFf52sWYAemq5e5UEgE8+B2nbZ
         TiJeW747mRX7G3HPP3QpEn4zPVfqeKhzNVl8DEXwnO29/7IP5TDD+OaDQGTpZJEYb9Vw
         v7uaj2r/H9kiVGCNM1IKriPy9UsBleAGKq9li8X6yCrl17CoaSkDxFrOvPSwjplYKso3
         GiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUITLvutYbqzzFv/3QKx/Yy+P1TgDkS5xIbPkj5dHEhcZHxJGgjlJi3YMZvL97q3/t8j4bc7yUdIg1ejQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03C05E8H3/dlgd777owawaXzkPSnYWvke5cK6JArF7cO1heVv
	bT1pfUl2YJYcIhO3WOYGiAmOgB9B7q+jAn79/h7IjhrgR9wMskCMJVc9EZKwYzCsw/m1CIzqmnn
	x35l0bWpp7XkDomyCYWEMMP20TH0IQeo=
X-Gm-Gg: AZuq6aIPw3rrlUBXx7fJWEEus3ow8QLndyBR+IkiCxuR09KbDnLPSR/zhknU6iubpHv
	utaMZxNcDanc4KGQxUBMiTRMP7O7t5orhwKZdcXKS24qTwTrLPF+Jb8B5/8+dtOd9b0aaB4XLBT
	DQ42l10lHgSxnlQskT3e2zTZr/lKK+YvqZcJ5uo+sE4agbIreEpkDseIwhziLWoW4XtthD0JJYc
	ficF54nRY4EBT9pQMQQKLUsiScFtbbKeDPLsEiP6R8/COUWh1zUTI84FyXFIX7p8zsyZejN16Ar
	KTIV4QCf
X-Received: by 2002:a05:600c:3d87:b0:480:3ad0:93c0 with SMTP id
 5b1f17b1804b1-48373a5d6d5mr12271545e9.23.1770970240070; Fri, 13 Feb 2026
 00:10:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126191536.78829-1-clamor95@gmail.com> <20260126191536.78829-6-clamor95@gmail.com>
 <3152548.Lt9SDvczpP@senjougahara>
In-Reply-To: <3152548.Lt9SDvczpP@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 13 Feb 2026 10:10:28 +0200
X-Gm-Features: AZwV_QhSOgiPRAPx2Z0byJxn5tRA0sX_heVg44H-sW_-S1oDy8g3MrQUXJy_z98
Message-ID: <CAPVz0n0z7gGmGNk2Kj08ZAZ5=8-+TZ5nQZdaAYVBb=zd6Cb=eQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] ARM: tegra: configure Tegra114 power domains
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 13 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 05:44 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, January 27, 2026 4:15=E2=80=AFAM Svyatoslav Ryhel wrote:
> > Add power domains found in Tegra114 and configure operating-points-v2 f=
or
> > supported devices accordingly.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1275 +++++++++++++++++
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi        |  126 ++
> >  2 files changed, 1401 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/a=
rch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > index b40a1c24abab..5e66c1dc8fb7 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > @@ -1,6 +1,76 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
...
> >
>
> I compared these core rail opps to what the roth (SHIELD Portable, T40T) =
kernel defines.
>
> The HW 0x1 (speedo 0) opps match process_id=3D0/speedo_id=3D0 perfectly e=
xcept for msenc/vde/tsec where the curve ends at 408MHz at 1120mV. The roth=
 kernel also specifies a process_id=3D1/speedo_id=3D0 with almost the same =
tables as process_id=3D1/speedo_id=3D1. process_id=3D0/speedo_id=3D1 doesn'=
t exist.
>
> For HW 0x2 (speedo 1), when compared to process_id=3D1, the opps in the d=
evice tree are in some cases slightly conservative compared to what the rot=
h kernel sets.
>
> So I think all of that should work (except maybe the msenc/vde/tsec curve=
 extensions?), but it might be that there is some further potential on T40T=
. Hopefully these values are actually just a difference between T40X and T4=
0T.
>
> In any case,
>

I might not have used the most recent T40S source. HW 0x1 table in
that source looks like this

_clk_name, _speedo_id, _process_id, _freqs
                                900,    950,   1000,   1050,    1100,
  1120,    1170,    1200,    1250,    1390
"msenc",   0,  0, 144000, 182000, 240000, 312000,  384000,  432000,
480000,  480000,  480000,  480000
"se",      0,  0, 144000, 182000, 240000, 312000,  384000,  432000,
480000,  480000,  480000,  480000
"tsec",    0,  0, 144000, 182000, 240000, 312000,  384000,  432000,
480000,  480000,  480000,  480000
"vde",     0,  0, 144000, 182000, 240000, 312000,  384000,  432000,
480000,  480000,  480000,  480000

I might adjust table for T40X and T40T since my source does not have
speedo 1 / process 0 (T40T) and has speedo 0 / process 1 (N/A) which
is odd. While creating these tables I assumed that speedo 0 / process
1 mapped to T40T and since T40T and T40X are linked, table from T40X
perspective looks conservative.

> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>
>
