Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AFB19D88F;
	Mon,  1 Sep 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738664; cv=none; b=kIo6i7MMORvnrupxiOYiX3XG+PdDi9jz1yvCg2NBJUQjJjFvI1SxMlzBjDHWz8SkevIduPYI7qQe4fK021LAcDWX8+UOSCY4ACMNqEecdi6duhqPgJv3SqpPGrDLR3bhz9kZYRCR0C1uDMYd44v8C3dbMfMs9xyTTPNBDVHFZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738664; c=relaxed/simple;
	bh=KhrAj3svwPmMiNuyFAaTwNKFm+CBl8pX8pjNBKRqhJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msKxTdcMwQehcUrUYGv1irq+x0PBniqoG5/8O+7ZHymw1rHHdC/luUnZiYAlfJfE7ibFNn/yTMBE+aEw418XCF5ZoXMJVQDxAtu2NA4QggAzq0CnUSEqmVhVmOvSsz9SJejtclbmG3JqNsuF5rWJg04h7ZN7zS9SJVeIMymbL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRmTwtB2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRmTwtB2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b84367affso20631265e9.3;
        Mon, 01 Sep 2025 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756738661; x=1757343461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oGbqfiTvrLcDF8H1hydxp4U/XcoYOTOG9IjwOSDF2oI=;
        b=RRmTwtB20vdGOCCkaO4hmnEL4ggDXjIjBPQ8TxfZb2mAqThEmYaEZ+9huOo2qOjg9i
         UNJwjzEshj1gYPraSR9NDSc+qRZXbnPBKcHg+4n9kNateuspzRyIQ4pPmpJt4x818b4M
         /yEHKLetYEuN7WV0s0Osct/lbGGx9aGTnke60uOtOthSoMMaWtNnbhPhTzsHDT3P96HR
         Sd2NgUVti2CKCAKa11TBOrtMkGFtu4gTcJnPusU/xmjKCTScd3Mpfjx2WONvcIQ0F7/z
         Cxg/U4/whYwSIRzzW1P+CsLCWqVaPJlwdx8xsSU8VAJpYOGEW1ob9li2R8AVjGXMs2uP
         65EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738661; x=1757343461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGbqfiTvrLcDF8H1hydxp4U/XcoYOTOG9IjwOSDF2oI=;
        b=JegxAnuI47VuiZ8D3e/WgWLKuqUYooWJWlNxoGmxX5kR46Ah0nw7AlrXd0d79OtJV9
         aumODBkH3jXt54s9P+eX01WmIgnIc6LNmlpag3u51faTWwlpvnOmLX4xVghJ0ajhRu2M
         5WtEgf3ezuTQyVkkG483rVnCE3W3WWTJsh3P915xm5Ybkv99kLZT9ZsMNwPVbE5yrjjM
         apXVvOfiWolMKs0CQkRF+0MJMlshF9nZaYpM0ORGly92PVftoXL8soXDX8II0xoy0FcI
         yUr1SSd4b0wQI67C6yATSCCEQmOyo7/trbODn5k6fZFlXq+YvT2NJvqiCZA6sAxjD45R
         dz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/OHVLK3KVxuB+s5tHyUiOiDA9NBP0MLvvp8obkkKroDT06Rx0wdkF5+xbx2bCtSN2+9mrGF0NXHcMC7gO@vger.kernel.org, AJvYcCVw+3cy03ZwtyClR6nPKDD8jfvj0z3YFfPV7csYdjhnL3H1QaaWCOjjEecV893yqJnqg+zSj1CrgWFL@vger.kernel.org, AJvYcCWGi+YOQ/9XbMulFnSCsJ34Q1C6B0swQ7lxX3q7+RGApptrS9Jo9gbrzXk8sJz4XV3F7Ux4PWy3J7GS@vger.kernel.org, AJvYcCXY6ffARmyQt+9xYyB1sxgN3JLooj933MDBfpvspEUDkeYQy7AKA1Nkr+z0Xnmy7V6bJeMgmz+/mibK42Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hQfbIDCuAM0A2ESt+fqAVR6s8D5mlHHqSYWuHbZjeXG7GMy0
	ksq8gs0P6atcQv7xUJRupHm+pTtdpOwIMVeSBJWwomiyWQc4UGj2ARYC
X-Gm-Gg: ASbGncu8/vqywxpERMIyXfunOUglQ1lF5z+j8+yHxqA2UOnD5hCtvizLlFxlQLKO3wF
	4Yby6qgycdixFXPamzpOzD9OnkOGyDea1Nb0/O82s+q83kspMcLzR1KG94pQtE6xleHdlBCxyXn
	MUJqm6F0yDst+dWj1dog3/LiVEHS9JdS7DZ9YjXmY4Q1mG6bTF0EyNDqLxR6P9zqGjUfeNjbiBU
	WDsJvotrPy7CfTuP3ChxBQnbe1rI/iZAJXHVBxUXQH6Rv8epIMSjLF4eMmJqo+QxVn7V1rdXlZY
	5NShOZ2fcBJgaWyYK3FwRsJK2+Btj3tvXEFKVEZL3a45WIs/tq6YfvuHGthks8bIceBJc5YVT4H
	pRHN+9TFNQHecMiYFmMuo6ilm8+rZIAk6hi9reqOUrYKz4LZL2bgxxHp5yVsdfO45veGUNaubV5
	lL21UvdGKIlrxGw3U+Lyk=
X-Google-Smtp-Source: AGHT+IE8oJAQTsRIreD3B3G8iVhHG5yD2Ojfb6uoThjNjE6os7CLdXOhZ5jtB7Lc8aVcNrY1HYylhw==
X-Received: by 2002:a05:6000:22c2:b0:3c9:b8b7:ea40 with SMTP id ffacd0b85a97d-3d1de5b08ccmr6018724f8f.38.1756738661236;
        Mon, 01 Sep 2025 07:57:41 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d520eada16sm6918744f8f.41.2025.09.01.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 07:57:39 -0700 (PDT)
Date: Mon, 1 Sep 2025 16:57:37 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 0/4] clk: tegra: add DFLL support for Tegra114
Message-ID: <wmbbnybxsnbhnkifqfwp7g7bklurxgx3qe4djxcwdcs6aketcy@kqiwizt46gee>
References: <20250829122235.119745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tycn7npmaoa7dfae"
Content-Disposition: inline
In-Reply-To: <20250829122235.119745-1-clamor95@gmail.com>


--tycn7npmaoa7dfae
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/4] clk: tegra: add DFLL support for Tegra114
MIME-Version: 1.0

On Fri, Aug 29, 2025 at 03:22:30PM +0300, Svyatoslav Ryhel wrote:
> DFLL is a dedicated clock source for the Fast CPU. The DFLL is based on
> a ring oscillator and translates voltage changes into frequency
> compensation changes needed to prevent the CPU from failing and is
> essential for correct CPU frequency scaling.
>=20
> ---
> Changes in v2:
> - dropped 'drivers:' from commit title
> - aligned naming to Tegra114
>=20
> Changes in v3:
> - add DFLL support for Tegra 114 was split into dt header addition,
>   DFLL reset configuration and CVB tables implementation.
> - added cleaner commit message to dt header commit
> - added T210_ prefixes to Tegra210 CVB table macros
>=20
> Changes in v4:
> - expanded commit message of car header adding commit
>=20
> Changes in v5:
> - renamed tegra114-car.h to nvidia,tegra114-car.h
> ---
>=20
> Svyatoslav Ryhel (4):
>   dt-bindings: reset: add Tegra114 car header
>   clk: tegra: add DFLL DVCO reset control for Tegra114
>   clk: tegra: dfll: add CVB tables for Tegra114
>   ARM: tegra: Add DFLL clock support for Tegra114

Hi Michael, Stephen,

Given the cross-dependency between the dt-bindings header, the driver
and the DT, do you want me to pick this up into the Tegra tree and
resolve the dependency there?

Thanks,
Thierry

--tycn7npmaoa7dfae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi1tF4ACgkQ3SOs138+
s6GCjw/9FaBlmOFR66ZgQ4g/k7rwkx5Hgs+m6KaCb08u3lPgkjX0F1Gs9nY3OykP
jbZkiF/ySaikqLVlRx1tubkMqxUs95IvC7olR0RMdS6LnYhNfYTya9sLsMlRcVFI
G3vBmESQmnjeNhsRTu09rVJKdm9e+Lf9U+g1OIkc0Am4seATEboMsjmlkAKD0ShG
lNFBogwug4mR5inB3t0UGoi32e+jAzf1OaayhVCg4B+dQvsu3Z83ezjpGhbvOnwQ
wZim9UI0P9V/LeaoUsc1zzGjzxhvxRQ2gd7UpcGZAC4jiIrOqm+Tk4KP9uAkPNEC
Hzmekdf1DUVh90b33DftkXqEYnacfndauCTokb7tbV3pwsgcm+2rgFkxYpnet+pS
11cmXg9P1Dk8HbzIkoEjv7jypbzVIlbAwWOfkmyoQH2kV0kM7Zr3THv/YdbkOiY9
vzFfzkDIl73c0XgjEjWDnbpUdCzyMruJwxs+vq4MF4+HxaPWXMKBquScQT10M1S+
ciVtQkVNEm2VI1KOQIpgqMmOuS41+rOVTzlYZMRYF9hKHJZTl5zm3RpnYcInIi0W
z8sP+tC6+mgo3y4PDJ/NDdZh6ubHUn2iprz4U4mVJZcKwR1KA+Pm/FKeYEFUm89+
kbom4wlZgRZA3yh547LyK1yDh5zi+3eg6lcQV3I6Ki1D07k95W0=
=AP1F
-----END PGP SIGNATURE-----

--tycn7npmaoa7dfae--
