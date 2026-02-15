Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30B2309B2
	for <linux-tegra@vger.kernel.org>; Sun, 15 Feb 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771139831; cv=pass; b=LClUiTxqU7bv6ys2qGG0EIZAvMXvwba/rRohd2So2UCjzvWO0G5FxzUm2sF/24mBZGFadWt1qTzUBZzhe9BIs02Ah4Th+k3cNUe16rzg6ATJHcJVltVzwf6GYhS6j3ZAXnxgTWVR/PI+irZP+nyxKcRnXe51RY47pqzKSxkK9tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771139831; c=relaxed/simple;
	bh=JS0BhaI0M0T4OEwZE5zY7caL8Sh/25K/U2LDuisyfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDFdv1tI0mYQJLbHFJK9vkQnyuZBn2aljXL/+USV6J/KqcPiyimOkJvAUQ2WEK+OQM+ywH7w2HyrKP3qhqFQUoDup8h4R6jSAd0nCtY+RMkyWhFmLuTJPu0UeCPWHXJ3YEDg+KUIUmJ1+oYlImv3pdUQeFilUQh2SbDIC617Uks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcHS3NZa; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcHS3NZa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483770e0b25so15783235e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 14 Feb 2026 23:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771139828; cv=none;
        d=google.com; s=arc-20240605;
        b=QeCcXvi8IGijV5rYY6Jb5h57SPurGBxaMJ2fgCBEJoRNqHCJCZCYCqDMhlzoFmIme+
         0esGeikkgdkrNDDM3lfKgLoNBaQcsIPcAGx8iAPpz1WQTBNoFLHfDeubJ5zcoEE2wEDW
         1NNSm2YmPOm841AvBj6M65j2rGiXbjeXI+nCFO3itdfyVz30kkhWRfPfj/3ED84vuiY2
         5f43BzjXVfPWepVPyRpNtF5yVvVp58tp1z+40l9ZshAKxal9xLyYHas/+JJSpUFXhwot
         /Zw0uUNHZ9k3eSsOyLaDuvJsElz99eI8P41u4PSCJtTH5uieVg+idFje2p0ki9X/QJYy
         +bkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeJsvif0Hv7LAaNzH9fCosrikSJya4xCU2x26mkmqJQ=;
        fh=x+CbN7dVJUye6/n1nXqr/pkVZOL/r1dvrHS80XHZze0=;
        b=cmwYeEtkIPDU+gfK06uc3zXEXq5MR1dsi+B9UA/joiBPSW0jcrymfuDeKSBVLHOZtl
         XQ9yLR9uxqLv8H0Jp8LsHl22eikWMy32MpaBqYQ7ALxwDEZEdmdn+n9UkzzZMWXpW9zd
         CV0xQuETuOoHoB3j/VNLXchGJgRUeGh3Kyl+rbDtjdEJneI5yeFkXRqyzOQLN87UHss/
         YJBvwoB1+bEIZq9Q4Ay3d5yibYF6OLgB9OT2uBXjVK27ITWEBYyayT133NmUXO+UIQDw
         vGpcWr6LdaSVtUgDXnXLTbXHpwlQzpkra65dhFXDPzd98Vt8QfyG9FfDyvvVKrKUiS3C
         /kMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771139828; x=1771744628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeJsvif0Hv7LAaNzH9fCosrikSJya4xCU2x26mkmqJQ=;
        b=UcHS3NZaUFLXn2Pho7FkrZa/l1Sx/cjepb0MyVOzQTAQOPQkPdRlSLYn1/ymY5kOw3
         7wJivbKJZeSIyb7OzKryecZcklTFl7tSJclqf0aCNZX70WloZJb1hSHdfWKf6YRPpooB
         +BJf/Ky/5NrEFDCcEc7L75fEoEVMK1MprVSTEBjKbZ7LBXfOxk8v00iE90u8gRc9dDl7
         vnFhWuyDAYy5mgghkDsnIVn5JJH4AR95wyFeEUmKL7/P4DleOum3EtceTUXalc2cXIvQ
         TmuxAmNcA7xc9ncX+1pXsZkLDTYSKG56BL9rHDVyp02/xJtGjLqkQNYLJg9zrXdD2jBa
         Y6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771139828; x=1771744628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeJsvif0Hv7LAaNzH9fCosrikSJya4xCU2x26mkmqJQ=;
        b=GX2CgjvxVRX4oh7lu2fJ1QLRcqNMkEINU2vqPGztYAvkmTDqUGAnuSvqPdf0/NnA15
         bkrnIATEKOnMbAkm9DK3UGEI491dTSQRQlC+gf8fXgr2uBZv+PKuyKGL8ZK/4VBMLxmx
         fTR/QORK3jRXAJZaxx1QL/luziY/6EfREFLhGaBjDJ74QhzHU+zJ26p7zn2n9AOS7PsG
         rwOGKLPwSR6yo3Nkfh5ZdwGpZslWBvfDvzIrL4bsQW2T0QFZKSH2esk1ufKopLomyH6P
         bS4KFJL3D0gtE5xfFNAEWIfvvHaLpmZt6He6wFaC9GIjFvXzOb7hjAJNVw9kKTMOfsLD
         OChA==
X-Forwarded-Encrypted: i=1; AJvYcCVs7BrCOGJTykEa5xReeeFMGQYAQ7RxbxcvErdNOpQTY5m42d3ysJPpD5Z2D+OhjjrzMzhAAR5V0ikeIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQG7mMNYH20wLzijeG1J6oWunB1vXrttPy2PG3ukPD2UsP6+3
	25AlG9JwSBAC/ShAbli+Mmkw5pxuUDwR6uNsWRQBg3+NFH5nhH2mVXT5bh6c0VvvuAEgecgB/k1
	3HE/0Kyb1PiiGCpXxuHAnpfbm4O+tE40=
X-Gm-Gg: AZuq6aIevq2l82o0E/M+M84dX+WhYv9GUbcstrhJRvjMD7+V5WmWXhhAVcMBrNNJ8uw
	lyDw6sCzQ7WmmibaPQh7sFRXDFFdr5nZCmecKaXnRRUgvsQjSsbWgaICTRXxz3AL6auMTvfEI+R
	1n/ksbp2htjFfn9uCVP9tEort71yB6mDZ5kpbd/C+saijXBEfIslsBpIo3XkOXVNzIh+Wf/mq2m
	aZ15dGHeCAYX4LJveH1fTHm1tGUGDufnL0v0bKXUNEwfh2NBaSp9wmteY2C2QFp/PKi9jW3TEYI
	+hSnr6UF
X-Received: by 2002:a05:600c:314b:b0:482:eec4:772 with SMTP id
 5b1f17b1804b1-483710962c5mr95610675e9.32.1771139827996; Sat, 14 Feb 2026
 23:17:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828055104.8073-1-clamor95@gmail.com> <tdknls7jieu4ple3qhmdqntllmctks2auxhxzynwjjmgl3hnx2@nubqlzpgohwf>
 <da8aa4c5-4aa0-42f6-acb6-55d37cc29774@linaro.org> <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
In-Reply-To: <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Feb 2026 09:16:56 +0200
X-Gm-Features: AaiRm52Z85WpK7PRCO4DxAthTZnDrmXah2vXpcFwOt0kQol8-3vlcxVKAzvYBBg
Message-ID: <CAPVz0n23UwST=jy+B+QSg+6A6B7uw1j6hY_p_b6J=ZmRU3zJig@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] thermal: tegra: add SOCTHERM support for Tegra114
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 12 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 13:27 Thie=
rry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Sep 11, 2025 at 08:56:12PM +0200, Daniel Lezcano wrote:
> > On 11/09/2025 18:27, Thierry Reding wrote:
> > > On Thu, Aug 28, 2025 at 08:50:58AM +0300, Svyatoslav Ryhel wrote:
> > > > SOCTHERM is thermal sensor and thermal throttling controller found =
in Tegra
> > > > SoC starting from Tegra114. Existing Tegra124 setup is mostly compa=
tible
> > > > with Tegra114 and needs only a few slight adjustmets of fuse calibr=
ation
> > > > process.
> > > >
> > > > ---
> > > > Changes in v2:
> > > > - no changes, resend.
> > > >
> > > > Changes in v3:
> > > > - expanded desciption of "thermal: tegra: soctherm-fuse: parametriz=
e
> > > >    configuration further" commit
> > > > - changes title of "thermal: tegra: soctherm-fuse: parametrize
> > > >    configuration further" to "thermal: tegra: soctherm-fuse: prepar=
e
> > > >    calibration for Tegra114 support"
> > > > - Tegra11x > Tegra114 and Tegra12x > Tegra124
> > > > - ft and cp shift bits dropped
> > > > - clarified tegra114 precision
> > > > - lower_precision > use_lower_precision
> > > > - nominal calibration ft and cp hardcoded into SoC specific structu=
res
> > > > - added tegra114-soctherm header into dt-bindings
> > > >
> > > > Changes in v4:
> > > > - fixed Tegra124/132/210 cp mask
> > > > - dropped TEGRA114_SOCTHERM_SENSOR_NUM from header
> > > > - TEGRA_SOCTHERM_THROT_LEVEL_ made SoC specific
> > > > - adjusted soctherm node and inclusions in tegra114.dtsi
> > > > - dropped use_lower_presision and nominal_calib_cp options
> > > >
> > > > Changes in v5:
> > > > - fixed CPU and GPU hotspot offset values
> > > > - added static_assert()s to assert the TEGRA114_* and TEGRA124_*
> > > >    counterparts are equal
> > > > ---
> > > >
> > > > Svyatoslav Ryhel (6):
> > > >    soc: tegra: fuse: add Tegra114 nvmem cells and fuse lookups
> > > >    dt-bindings: thermal: Document Tegra114 SOCTHERM Thermal Managem=
ent
> > > >      System
> > > >    thermal: tegra: soctherm-fuse: prepare calibration for Tegra114
> > > >      support
> > > >    dt-bindings: thermal: add Tegra114 soctherm header
> > > >    thermal: tegra: add Tegra114 specific SOCTHERM driver
> > > >    ARM: tegra: Add SOCTHERM support on Tegra114
> > >
> > > Hi Daniel,
> > >
> > > there's a build-time dependency on patch 4 in both patches 5 and 6. D=
o
> > > you want to pick up patches 2-5 from this series and I pick up patch =
1
> > > and hold off on applying patch 6 until after the merge window? We cou=
ld
> > > also do a shared branch, but it may not be worth the extra hassle.
> >
> > I can take the patches 2-5. Regarding a shared branch or wait for the n=
ext
> > version, I would prefer the latter
>
> Alright, let's do it that way. I've picked up patch 1. If you take
> patches 2-5 now I'll pick up patch 6 once v6.18-rc1 has released.
>

Thierry,

Patch 6 "ARM: tegra: Add SOCTHERM support on Tegra114" adding thermal
sensor nodes to tegra114 tree was not picked, should I resend this
patch?

> Thanks,
> Thierry
