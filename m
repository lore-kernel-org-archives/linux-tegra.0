Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F13199FB2
	for <linux-tegra@vger.kernel.org>; Fri, 12 Sep 2025 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672824; cv=none; b=YCcY8bpWrftWlaYtkRJUauvWv0kf6qZvv3z2XkQ5MxuX30NzLlq+8EoPat0c1Dt6y7YLfRhx/36Ekf7PCVM4NrcCyWrSQiWePzHesyyy5bizlMWgKPg7OSKneDqI/bD9cSAajGha++jX51GeBb+R/MHJaqYJ97aycpUz2u+yjQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672824; c=relaxed/simple;
	bh=a/aXEMGb2BQDbPqE+kiC0jbKGYkUHUoAmyib1xRnP7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvfxadkrQ/wA3ndfscxGsfO0rOWOOjPq2QxRWHz/qpWu115M1pKNvCHnVJRYuTbKT1+6Da9naL3pdlcJMNhSqyiO3KbeCZij1cOUTaordolAS3zhbfN9Ru8hbs4tVGqGYyPigXFR73UoPEiE7kPWdlic/Ga6vE6zi8qmxyNs8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RE/4tV7Y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE/4tV7Y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso11415625e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 12 Sep 2025 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672820; x=1758277620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEszHJ67kocets8ry4iAcIkKEULLubcUd+fSnC0UnKU=;
        b=RE/4tV7Y4LN1WirJdE64Tp/ROSNGu6T/IPF8AWszaNqFeUgZ4g9RRu3L7R0vMVrSLC
         b7STZLa6vCwgdwWH+PHLS43tYUH2ZDlw8aGtXfrIytZqmSZtVQLO6kzKs8wGfaKm0H8M
         PelDnxWJMlXosRGSXMStlKlYViy8YK/aTQxQr6iioGid3HseYrmuQfNGXjISFeriBXwq
         p1m8ciQPoGUfeDJElUI7TbEbQ/pTyu+ICiWk29phNLUfr9ErSc664eoZAtGjdxrZgQex
         xWAnr0E3ExmtnGeVo5exREB6d1uQLFxlv9KgrwrWcNqgH1iUDapR25WsZESydkT9uQma
         e7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672820; x=1758277620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEszHJ67kocets8ry4iAcIkKEULLubcUd+fSnC0UnKU=;
        b=qOncH0HH17dqwcFHn2mWTXqXRCwY7MVei/FSDTTtIxfGmo+bfwggkV3h/ctn8hT6NP
         +aD9hWXDCX+vg6QmyMSL1xdQQE8qPtWlW5zw6XH7jePX7QD3xuaLBPvZVbbLiYAaW0t3
         Cgo8crhC7EIWd7ya39sONEDFd//PUsKgYoi0tbfo4ZdTe8DMLoqKzwMmqpl6MOgji4Y1
         ZJA/SrLdFVgwI6L+wcKfsVPldTRHWhCtVCmNkdPE+g4PxRyFniNVBIs5jZI8CA4D9Kgu
         oabJ51/rqeKbVFt4XqO4W055T2zCZmuiXfgUdZxWUsdJx304Xl4hxPyiouGeRDBSD2Sq
         baGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyFQRcAxTZIlTE2sbGkVGeZUsIjF8xVpWj+Tq9Rds/DLtvt1Xe5TecJeudnoM4LZ2qgS8+XUQWjrwZYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyqk14UuNgkUzClHjvLtpruaYR3Qq/3jDY5oX2b+jktxQiDlBB
	R5loADWiCOVj12+K4Ffc0d2Om5/Q4nU8ttgrP+Y0QWNhhrSPHBVapymh
X-Gm-Gg: ASbGncsrZUoJoaEaQSsT/BkaPoBbkrHRPX23LUC6thHltSy5PvkNwh9fSZTiSSHa5jT
	p4LE2om1QWJf1ZEPqUfop3k9QOa+0FbPbTp7A8AtPpBy6MQJD4xd5O0XNzMSZduX0phnpFNW1B5
	EnI8oQB5ni04FqQ3QSF98ALR/bgBCa/lEvgdxkIR7FFUWveooVxwadnaxY2EpA4dhgX9Y2Q317s
	kW8QzDFY0eYv9NTjxHiQT2xZ27tghlKTZ3qwOh0baGOQ/FHiF7I+pOK1p7JHXbx8hIdkYmStyWE
	X5SD6GT+SEGAKwlBNDzDEmpLBdWo7Vflr//y21Is+EljNBbAVGMzRNbS+kAU4CNjuswVOl/U3xV
	bfmJtvRPZDw1AD5etWOx79iRfq3NpZVw+qj5nbOqK8WlXNCa3uJaPS6r3LVDiiQnZ+D6eYAnN4Q
	ykYvznyastxwU1t5mnQpM=
X-Google-Smtp-Source: AGHT+IEbyHndbn+wwznPnv5dSbk1PDx0bdvxUnNmyX0t9tVPgFtH6+RjNOs4QbIfK49oM38shQc3wQ==
X-Received: by 2002:a05:600c:354e:b0:45d:dbf4:8882 with SMTP id 5b1f17b1804b1-45f215641afmr19183295e9.28.1757672819578;
        Fri, 12 Sep 2025 03:26:59 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd415sm6002552f8f.30.2025.09.12.03.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:26:58 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:26:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] thermal: tegra: add SOCTHERM support for Tegra114
Message-ID: <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
References: <20250828055104.8073-1-clamor95@gmail.com>
 <tdknls7jieu4ple3qhmdqntllmctks2auxhxzynwjjmgl3hnx2@nubqlzpgohwf>
 <da8aa4c5-4aa0-42f6-acb6-55d37cc29774@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="77pu5semdcfvsxfi"
Content-Disposition: inline
In-Reply-To: <da8aa4c5-4aa0-42f6-acb6-55d37cc29774@linaro.org>


--77pu5semdcfvsxfi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/6] thermal: tegra: add SOCTHERM support for Tegra114
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 08:56:12PM +0200, Daniel Lezcano wrote:
> On 11/09/2025 18:27, Thierry Reding wrote:
> > On Thu, Aug 28, 2025 at 08:50:58AM +0300, Svyatoslav Ryhel wrote:
> > > SOCTHERM is thermal sensor and thermal throttling controller found in=
 Tegra
> > > SoC starting from Tegra114. Existing Tegra124 setup is mostly compati=
ble
> > > with Tegra114 and needs only a few slight adjustmets of fuse calibrat=
ion
> > > process.
> > >=20
> > > ---
> > > Changes in v2:
> > > - no changes, resend.
> > >=20
> > > Changes in v3:
> > > - expanded desciption of "thermal: tegra: soctherm-fuse: parametrize
> > >    configuration further" commit
> > > - changes title of "thermal: tegra: soctherm-fuse: parametrize
> > >    configuration further" to "thermal: tegra: soctherm-fuse: prepare
> > >    calibration for Tegra114 support"
> > > - Tegra11x > Tegra114 and Tegra12x > Tegra124
> > > - ft and cp shift bits dropped
> > > - clarified tegra114 precision
> > > - lower_precision > use_lower_precision
> > > - nominal calibration ft and cp hardcoded into SoC specific structures
> > > - added tegra114-soctherm header into dt-bindings
> > >=20
> > > Changes in v4:
> > > - fixed Tegra124/132/210 cp mask
> > > - dropped TEGRA114_SOCTHERM_SENSOR_NUM from header
> > > - TEGRA_SOCTHERM_THROT_LEVEL_ made SoC specific
> > > - adjusted soctherm node and inclusions in tegra114.dtsi
> > > - dropped use_lower_presision and nominal_calib_cp options
> > >=20
> > > Changes in v5:
> > > - fixed CPU and GPU hotspot offset values
> > > - added static_assert()s to assert the TEGRA114_* and TEGRA124_*
> > >    counterparts are equal
> > > ---
> > >=20
> > > Svyatoslav Ryhel (6):
> > >    soc: tegra: fuse: add Tegra114 nvmem cells and fuse lookups
> > >    dt-bindings: thermal: Document Tegra114 SOCTHERM Thermal Management
> > >      System
> > >    thermal: tegra: soctherm-fuse: prepare calibration for Tegra114
> > >      support
> > >    dt-bindings: thermal: add Tegra114 soctherm header
> > >    thermal: tegra: add Tegra114 specific SOCTHERM driver
> > >    ARM: tegra: Add SOCTHERM support on Tegra114
> >=20
> > Hi Daniel,
> >=20
> > there's a build-time dependency on patch 4 in both patches 5 and 6. Do
> > you want to pick up patches 2-5 from this series and I pick up patch 1
> > and hold off on applying patch 6 until after the merge window? We could
> > also do a shared branch, but it may not be worth the extra hassle.
>=20
> I can take the patches 2-5. Regarding a shared branch or wait for the next
> version, I would prefer the latter

Alright, let's do it that way. I've picked up patch 1. If you take
patches 2-5 now I'll pick up patch 6 once v6.18-rc1 has released.

Thanks,
Thierry

--77pu5semdcfvsxfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjD9XAACgkQ3SOs138+
s6Gb2w/9FzFuO93dIq8o6wF8l7bzhiJ1Xadi6emh4ye9NQ/Xzu9S1KPszf+WaJYl
WQPyLCxBFvFb3BuARreuZbgnbM37jEW2N+JZbpbOE7Mq8cfXUPJ0xcR3hO7a6YiY
R9xDYSVAvFpAAxPlUU07wYRswWpQHRUk2kiFO8goc0m17/kd2nbiwhdYVzRg3wrJ
YC2ZX9m/3l7TmsVd29NfEdKV4nW5FRH2v3aSi+IScXwjObd0oHo4ygrruccMbCPk
RSRSXCqvEpol7cpx7kY+jCJTQ5h7lLrewycb1P8Dwxvz89ER9mtk+F5kwJiACGgN
G3OeAaN9H9z/yuidIrgczHu1k1NezHBE3e9pytu7XHBlvC44Is/hOeGn3Wr+KBux
as8CB/cfKSAnIn6SaXCbgxfHqQrBlO+FvTWWpN/6HYz+KRQQD42pz7AdhOMeAuCG
Q+9sExxgd5M8BHZIdLpHvTalHbseuZm3kQdMJgfqCQdwGXgM6rCBaq2XN9loILdk
6F/JNKe5ktkTT6DGtmDjXGfHKWrVa6oQ0F5MXo63EDHUwdPZVPBj3BQfAtRBbMjo
mJQmDcOwACPS7wnW9wuDyJdPdllXRajiRIwt1j4nrYms7kVnOoikJf81msUwRucc
ze5Fz4UK2uARv4qMX0qNDms6am7uL9DG+kWRaIFWUeERiSOmbDo=
=ilf2
-----END PGP SIGNATURE-----

--77pu5semdcfvsxfi--
