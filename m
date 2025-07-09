Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2B21CC4D;
	Wed,  9 Jul 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063495; cv=none; b=UskGtdwlsDxVFGfP7v1cojnho4vlojC78gqXYSqcO03xpfADKS00NjPnt7JN/g5P/ePS+8H1ICXCtv26R5MhngRRaa/mamh1BjibZDMK3razPTJ05AZUTDiFLMSVKAijYsvTyGzjY6grLo2c3QqIVGY6ffZF3VyVcNXmnXpcslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063495; c=relaxed/simple;
	bh=LTQb/WPBpiA1G5Eo6phjdBhMW+t9CY9M2pu2tV1a/C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEuEhzF7gzqjaXC532HXxKkj17CXmDIFnw9hoVPFO+pLgW6zNuz/KfSzzidSl57g97S9bzFeSjMaa2PIFYB2+9PdGhV9YpUKDL7TfS/RXIkDyOYs7zEiKRcdqMX9mGOq1wD9sUV6sf7Be2EahdcqhI3UyHqbQsT6aLGZUNZd1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlt2ga/y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlt2ga/y"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a5257748e1so4463599f8f.2;
        Wed, 09 Jul 2025 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752063492; x=1752668292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X4q587aW3PXbLz1cLnzpc10VmfIDVk9l4eUo54HA5B8=;
        b=jlt2ga/yMyG/NvoFVkVQzBvFK5uchqIPS9z4Su8r0qqsc6IrNLxG1BLljDV+MjczzM
         zoauMgnS1i+Qs6q9bHZ1e2P37iJAuvX1yI/aWmafWS9nRe1miysNcW7EvMJ5H2NLknub
         j8Z2DAY8wgnpMx8DvbK7Nrhv/66yJ//WR8lLv3d6ted+RX3u4w4Q1/OVnRu1yKoG7pLw
         RyxiO9mkyoBojt1ZPGbHjBoaisLKLEgS8O6KZsUsyKntXMFCOIL5VfRacuxIQ+j3n6Z3
         Z/psf6tTKUtzinS2gcvpsKzqeAsal7XzTBEfwTMNnq4+c8IP8pVWarwPBomGSkaTvPlG
         GvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752063492; x=1752668292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4q587aW3PXbLz1cLnzpc10VmfIDVk9l4eUo54HA5B8=;
        b=REmn4MuTMoVIbY0t6nqfxovVlg0tNkmwHSMgJzoF1szuy+8ao/HigsPuVqKcaktmyO
         U5x8o9AZyqzaGGXydShUDqWcilP1nUTNa+yZMMo1n/I0mt5vR+xTG8H72QUo7syaLk6/
         E+ZsYtpcpBwqcohNCsvLzcHGAas1JYBK8OJmbv4ZBeaKIH6VOefC6IrePLcYi9sPVXoW
         z37qJuOD1WYaAorWoKKLGnwIcTk/yjueXXJCZ3dmpgNfQL+JRkdaQiKf278UGi3cstsh
         r5gtolrqg4Yi7jpYUw8v0a2GC5Kvb5jDViyXbpEGa4UPzIkTcfgK+a0j6gvJOt161isd
         Lm+g==
X-Forwarded-Encrypted: i=1; AJvYcCUm1sM0lXLR7VARXEy2qyBwKfoSVFF8CppIrlrfstlsY5aqjnpxE0CSnjk3d0HvHNLiTL7wQfe/cLXCczZg@vger.kernel.org, AJvYcCVESuaaBWsDgLyrAWiTO3Lq+WDz/rTuwIsusU2Ke1zByOPzw/s51tg8pfBbrvcWq/lRcKnutUo6hZ5AlM0=@vger.kernel.org, AJvYcCVkkz3w/Hci7D+WuDrsBrBDULqjHZp3eWSNn35TELAlnf/bn1DWMhF8A4V2c9dRYnmehKtV2wAVehpb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1/hdOz8IBdPpNlZVgYAlqO30ps+hw/wsPyspBfF4XynigWJy
	OQj1csGkmwftuG1okqklYE84b726cPkbMIzqeJlThk3d2UZ+szdesDyDHeLLuA==
X-Gm-Gg: ASbGnct7klWfUPucXzKJT+7YAB1zeHcc4fECRI2fPzfjDVhzu+fWBP7+D3GsLy/XtwN
	P8wc3BCEjw6cTHGwE0dT4IOIc+M/yKvi8Yj4NdVhjGDu5DUiQv08Hj+coDb3v5dXU+E+zHklPT+
	Pmf/EoElTRnI2J/PdWSZiEaRrJq+ep3C8W0AlkeDJi36uyIroB5SWdcTI+MgUdIY/qHgux/0wiP
	jfGMKgu1h9ACZUGkBr/YBDvc39DrCifUmUsVDuXFqfJjHTBvNQjfGJoAMpt3ZwtrYHnGowUlFFG
	oqRZK+JkPF9/6hCKO1B7ZoTNJ2FL0fx+6Q7pYhPc8nzX3jEPhVXrEycNl48I79B1ZmtQu4zww82
	VOpmQiK9mS4b/dxFQIFpO/rjCSWtxRZoW2Bhsvk0aVRyLiVhB
X-Google-Smtp-Source: AGHT+IFEMGUeze9X3qSxYsqLrz0dFf4f23b47ds5CoRc+BsOqyfOe/ETd1/kWf2fWB8CcW0PvVMbog==
X-Received: by 2002:a05:6000:26c4:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3b5e450b3c4mr1707425f8f.12.1752063491506;
        Wed, 09 Jul 2025 05:18:11 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50329d5sm21320545e9.6.2025.07.09.05.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:18:10 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:18:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] memory: tegra: Add Tegra264 support
Message-ID: <dnwxijowryyoaanvzcz4cfkpt2cejx4mnfu772utkt66fdrelk@n2prert7km4y>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h65bakmejm7mjtdl"
Content-Disposition: inline
In-Reply-To: <20250708105245.1516143-1-thierry.reding@gmail.com>


--h65bakmejm7mjtdl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] memory: tegra: Add Tegra264 support
MIME-Version: 1.0

On Tue, Jul 08, 2025 at 12:52:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This set of patches extends the DT bindings for the memory controller
> and external memory controller for Tegra264 and add the necessary DT
> headers with memory client and stream ID definitions.
>=20
> The driver changes in patch 4 are mostly an extension of existing code
> and the bulk consists of the memory client table for the new chip as
> well as the bandwidth manager calculations.
>=20
> Thierry
>=20
> Sumit Gupta (3):
>   dt-bindings: memory: tegra: Add Tegra264 support
>   dt-bindings: memory: tegra: Add Tegra264 definitions
>   memory: tegra: Add Tegra264 MC and EMC support
>=20
> Thierry Reding (1):
>   dt-bindings: memory: tegra: Add Tegra264 stream IDs
>=20
>  .../nvidia,tegra186-mc.yaml                   |  65 +++-
>  drivers/memory/tegra/Makefile                 |   2 +
>  drivers/memory/tegra/mc.c                     |   5 +-
>  drivers/memory/tegra/mc.h                     |   9 +-
>  drivers/memory/tegra/tegra186-emc.c           |   5 +-
>  drivers/memory/tegra/tegra186.c               |  17 +-
>  drivers/memory/tegra/tegra264-bwmgr.h         |  50 +++
>  drivers/memory/tegra/tegra264.c               | 313 ++++++++++++++++++
>  include/dt-bindings/memory/nvidia,tegra264.h  | 136 ++++++++
>  9 files changed, 594 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
>  create mode 100644 drivers/memory/tegra/tegra264.c
>  create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

Krzysztof,

There's a dependency between this series and a series adding device tree
files for Tegra264 (both the driver and DTS files include the memory
client IDs in dt-bindings/memory/nvidia,tegra264.h), so I think it'd be
easiest for me to take the driver patches here through the Tegra tree as
well.

Let me know if that works for you or not.

Thanks,
Thierry

--h65bakmejm7mjtdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhuXgAACgkQ3SOs138+
s6EPbQ/9ET5ytCQw/qExnetrPR7YSVS+P9xKFt4MFMY1vWr2I5vo+yNrZkg/rSGD
1kJz3SFhyYRucknOOQ5Qkq7nxbNBbFsBFPHpJlKoD5il5qsCnItfTyVVUoggcO2R
z+h60l4Ni92lzjRHkTJb6zsNEDd1CX1ZOFJukeAITKke72QNfeGWyglRLzI/+N50
AmUq3WDFnXffjWaoGr8RGe2Ro8zXXcue3l07a/a4IGEZoCUE16n5QEcCAkIcRMsH
yUfDAHzEzUgCuph0aBPjIYdr7IfPUY9+RJcTrKfnWfvok20VKDpdvlqVy/wwQ7zU
L4YljT6LLqxdRliaBNKHQQHx+O51XJ1glDwZbRQ+SMf65Vgz3Zqf49i4iIX6kmir
2hvShoOVcnpw26FP8a9rRwv5F1OE9ZiFdvQjRrWaT/Qd2cJlGEfgj1z3BYSOS0AL
e59z6+5zEs0GAn6ttWaATFjh9RPEXeiz+kSFJk3rz5CY9K3MPOMKYO6eBXRX9HXz
UBVOY6jwJ7dVenGeG7O8cHv1EXeRwxM+vRNuVDnqv3ZdgjQMljS6PH9DukPGM7hb
OZ9wqlI7chwVusIjeYjBKV72S8PfYebWVwU3+Gc2wUbSAZIKrOhu37/ZMb02CGgT
41dYs5M1fb3IEAJn0Hwy3P7XHt/bt0NKwspUwJRpTnxtU8nldIg=
=PSyq
-----END PGP SIGNATURE-----

--h65bakmejm7mjtdl--
