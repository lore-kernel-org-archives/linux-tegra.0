Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7903570CB
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608061; cv=none; b=gilVFd+CKA31iui94BmK71DFONS1CtevJS3q1poiddrfauiZxQdCcucJ3KmTKTGq/+dPXJ5E+lc8Sq9/CVoU7J1XKJBpN4sMQa2Jd9LIe7LEz7n563OFoIzMRMaj1t9/w3/r5asb6esHuuuGshG5RE/Ckl3/yBXjPwlUCg/JriY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608061; c=relaxed/simple;
	bh=F2DS23IYCKCbmxYGqz7wOiytR/HeVWVXloi3B1Ce1Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nApNcsPkk2YAjtsz3WT+N4d/sxsDnl7yJByPMbFJ9pFvb0ZYNEHHDQyscmCbfF1n/a7YS4NE5/194h+mOz/qKAZhOKlxL+lO+d2n4zuHEckAdOEERAnkwkHB4r0viVptt67sM0eM+avpjxBOZQTy6KT43gGCWIr0t28KlGKxneI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kASjJZEd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kASjJZEd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo550210f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608058; x=1758212858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uulERqXtmIIqPZaJPSJ878rKAqm1x84Yk9KDro0jsvU=;
        b=kASjJZEdP0cbIDzYcLg9sGvkF4FaGGpolCqBBbF9AitTsFR+UWL7BF6wq1fAYTlSnI
         PBUa202MgLrfKnxGE42F9NLSItdx3jr63W08GJ8g7cF0XWmsbu4ZxjPOQqfKnqfIExf9
         hyOguAGPrQvLoo02tNOkLYK/RGGh5bhIewI/GRggzhrc762NzxhBUfcv0M0Ih+4ieMJZ
         5/dDJFeFO6a93VR90KJMJLjVqNyD/xRaALTKwRA1wN6Ar1xb/YgdJ6AxBs+205lnJTZz
         5KImcKPRAHpnQ5EJenCZIsv0DdEePlLRNSlcLcnWzTEgiEFMxafky+gX3sZ3U1L/tUg7
         +bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608058; x=1758212858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uulERqXtmIIqPZaJPSJ878rKAqm1x84Yk9KDro0jsvU=;
        b=XFctmdxo3hS9X7ttb69n+r0wFIj7wHnTPUTIs8GgszrkYReKwtcfhQvpbslfSp3QVI
         koYVdMRh3eb0NdVKLGM6YR05Q+SI2WJ5ybcfHi8RNcvxFme+HcStKfd92yIJrPVfoB2l
         rnwO/zwUeKm9aYaH8ONOp5VpsINSwzWdi4NciH9+NdNNJlZM5JdlsmR2KY6xt8oesYz3
         1Ja8b+lkF7xK4Jp92qrJHBSpD3WdHHz5b5EMvhICEksiVMUJ9kj0zYK+pLc4A05Aomkw
         ZfSn4awK/gkHWcx0MIWbwIcSKTrfJP81XzEHMdevLv0RSHEv8rIJxX18MtEJndbEl/4W
         s8rw==
X-Forwarded-Encrypted: i=1; AJvYcCULdUwbUJ5as5sJoc3zNoRKmOP4EbXh+9XF/V9e0tPrIPbp7poVCEBbKifyXRtcGH/3Mca6gc96+OQOYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxBdSaWvmZupilVlwXF+c/GHVt9oH/tWCQUrTKosuC6NRUs3Fv
	OuWCq6K8SABuli4VUsXR0etm0QS2Mt44tG19pLcuT8Bq9ExQiNZzQ3zj
X-Gm-Gg: ASbGncuK0xUA7PwjZkSWtMk8uzbGibHD5exJ2AOD5hwf5Fi/DnuHuyon1JWEgGIgeML
	yQDiYD8gVy+x7wOxFj3opuVjysBDZLdSxHTqf7uHgKHvgA0NSiJfzVNGN9CBu2Yqj2ROP4zxYFw
	OWf12vuUtTaMSKysthn0ig+lx/xItCXNMOq2cWnmdYHTiIqH1fFSYSJ5ViON6mbwHl5gij+1ZHW
	ZXhYlRftFEYHgkLIOC+Vr/pgGFDQ3ivEFQGXi4CTMOjWHZvysOmqbn8VS+YsYtlAzNhypvgyBaW
	OhAoo7kAiGmz58z1qxWdvL4fEkvNxrY/eY5mdxMkgfVWopUHJqypr+8yCilCWtRq6j/PtPo5Jo3
	Jn25HykkfCYbTSOKITNlzbfKEi5SCkgRoryTCBad2mIS9bPPT0m/xRNOt0O8EWV+W66zYjs5F7+
	/i4Cl6Q0Gr2Y1BOaSmCKI=
X-Google-Smtp-Source: AGHT+IFFi32QxzOdl2cjeDTiavFcpcxdyTuhwR2Hej9Pf5mnYeNRpH6Xd3E7OQUxqcTWFSZ1jF/clA==
X-Received: by 2002:a05:6000:24c5:b0:3e7:615a:17de with SMTP id ffacd0b85a97d-3e7615a1b81mr2212313f8f.47.1757608058345;
        Thu, 11 Sep 2025 09:27:38 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03718c64sm28987815e9.3.2025.09.11.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:27:37 -0700 (PDT)
Date: Thu, 11 Sep 2025 18:27:35 +0200
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
Message-ID: <tdknls7jieu4ple3qhmdqntllmctks2auxhxzynwjjmgl3hnx2@nubqlzpgohwf>
References: <20250828055104.8073-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlavv32ljfhhfudc"
Content-Disposition: inline
In-Reply-To: <20250828055104.8073-1-clamor95@gmail.com>


--qlavv32ljfhhfudc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/6] thermal: tegra: add SOCTHERM support for Tegra114
MIME-Version: 1.0

On Thu, Aug 28, 2025 at 08:50:58AM +0300, Svyatoslav Ryhel wrote:
> SOCTHERM is thermal sensor and thermal throttling controller found in Teg=
ra
> SoC starting from Tegra114. Existing Tegra124 setup is mostly compatible
> with Tegra114 and needs only a few slight adjustmets of fuse calibration
> process.
>=20
> ---
> Changes in v2:
> - no changes, resend.
>=20
> Changes in v3:
> - expanded desciption of "thermal: tegra: soctherm-fuse: parametrize
>   configuration further" commit
> - changes title of "thermal: tegra: soctherm-fuse: parametrize
>   configuration further" to "thermal: tegra: soctherm-fuse: prepare
>   calibration for Tegra114 support"
> - Tegra11x > Tegra114 and Tegra12x > Tegra124
> - ft and cp shift bits dropped
> - clarified tegra114 precision
> - lower_precision > use_lower_precision
> - nominal calibration ft and cp hardcoded into SoC specific structures
> - added tegra114-soctherm header into dt-bindings
>=20
> Changes in v4:
> - fixed Tegra124/132/210 cp mask
> - dropped TEGRA114_SOCTHERM_SENSOR_NUM from header
> - TEGRA_SOCTHERM_THROT_LEVEL_ made SoC specific
> - adjusted soctherm node and inclusions in tegra114.dtsi
> - dropped use_lower_presision and nominal_calib_cp options
>=20
> Changes in v5:
> - fixed CPU and GPU hotspot offset values
> - added static_assert()s to assert the TEGRA114_* and TEGRA124_*
>   counterparts are equal
> ---
>=20
> Svyatoslav Ryhel (6):
>   soc: tegra: fuse: add Tegra114 nvmem cells and fuse lookups
>   dt-bindings: thermal: Document Tegra114 SOCTHERM Thermal Management
>     System
>   thermal: tegra: soctherm-fuse: prepare calibration for Tegra114
>     support
>   dt-bindings: thermal: add Tegra114 soctherm header
>   thermal: tegra: add Tegra114 specific SOCTHERM driver
>   ARM: tegra: Add SOCTHERM support on Tegra114

Hi Daniel,

there's a build-time dependency on patch 4 in both patches 5 and 6. Do
you want to pick up patches 2-5 from this series and I pick up patch 1
and hold off on applying patch 6 until after the merge window? We could
also do a shared branch, but it may not be worth the extra hassle.

Thanks,
Thierry

--qlavv32ljfhhfudc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjC+HMACgkQ3SOs138+
s6FmAQ//Xha5LNouKuDOjR1aWxRbsRfL60ImU88sqfgV4EX+BNrWtnWif8KYz0Pp
vZJ41PUNxz6Hw62m8AhnxrjQEkmMKpXD8ditYLTwTsYrxD5CO70SYBc4mWt54lg4
bcfULRDLSbCdDa5tGnovhPXnGUCM1JM19YbOVlBUXu2YhSVR3BBzXzKW/PsLUx9F
ccT90oxtd8m4eTFFiKBXkzgK0UsV0cB0MicKygDwGCQbtEl1SrN9rhYzBJF0XldI
7vS4j8CuMSx/Ia6C3mZQKh4a9Tjp7NCfmEb9HiwTzclvJFDt9BcbgbnumZKzrfUh
DIfPF245ye3Xea9+tDLOmdtzhrGx3kwQ9D6yRtrFHFSroJd+d0ScSoj3SsIbHz4e
krFuYnm/9lM1IekTTCYWGgUOmrE2UNk3qlwInDpl1oUJh7S0if62YxsCBunypIKI
NFw6D7JrEFkUm+fnTSYPKZ9tUl9WsdadpxJN0EMezLEcf9Nti9WeWwvPgTSbZlTW
M0IbTWH17CWaIo//mK00xa8m96cZVC5qjGmUFIBSCd1J0yJwLw+S4lqYXckufdsg
xi2uqkA1RQ6Vmt+t0xceanoZsLPnOo7xPuR1bSf+KhyYsWf4g3LKi9HWOWSSn6nx
0jPMGnKTwXzxUj1LEV1B2teXeefp3iFh8vINM890oVlPIhUPWts=
=QXXu
-----END PGP SIGNATURE-----

--qlavv32ljfhhfudc--
