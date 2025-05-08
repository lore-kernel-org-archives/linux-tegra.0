Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0F220F41;
	Thu,  8 May 2025 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690106; cv=none; b=kXwtt8aeFSSyOvII5sxNkOd4ZfgEhFASELKA3/o8VgjMyS3If8CvTGOQ7VG8cgjrYtqhJhksPjuLfA1iMhz0nGT3wxu0c3GphtfcdeZ51Dy/obSNPKNWAaNFsASu8flw+MygSPxPVPAnffqMMoEP7MNDV6UEeyUsbjL4JJzBBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690106; c=relaxed/simple;
	bh=LZMGa+sNdd/7ypFwlQIyhR4SJrCDbccCWGjTEkdyzqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAt+521ffd0TDohkQLzo2Wl8y+AaHDj9FoK4zEtwBSVzljUM/OkFul5d9GSLIX13OeqGhp/cYRSFALoVGeG6fSWnha84XY64eR4aWh24Y6CYAemDzrSlEqnmKhFJF9kZK707MMefCIZIkv7Xc6/j3VlCRjtZ0h0nuCrRmK/yDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc9NCs0i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc9NCs0i"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so6944245e9.3;
        Thu, 08 May 2025 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746690103; x=1747294903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wInBD0+S8ogpBYTrt7N+Mqd0fIS7ldl/Cpzv19xsKvY=;
        b=Zc9NCs0i/JidJwvhCc/1Cm33CArjbUaK/12tskdyiVqX62yrPUfG2Dc9H3RLMPZSJA
         QDGAni1dMvIDQUO1CeCXo98CTJBRvjoxkBOMGN5Q0ZgvHMDuQwms+qVWhy7LQb5gyWQ/
         pKQJ2haO21z4XG/9dd7wJGsBDMcd06viMW5lf+pagbtj4kfdrvdpNs8HOoDyXQMaEHRz
         wqx2S1aNU50TEiVItrsbyMIpI5GpGAtpNXVCbyBoFU4hChv+HHhjhmunxyRUmYVAYsRy
         di9AMdkcwBHzcgmy6+QX5k8pqjOnahkCZn4eprebCK0SRE/fiHbKqD2imFrO/JIBuQQ7
         UAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690103; x=1747294903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wInBD0+S8ogpBYTrt7N+Mqd0fIS7ldl/Cpzv19xsKvY=;
        b=ChEMU6ervM1Y4qo1C3NO1XBq0tquOsAsFLnsTjo/nYLAHZNTwv9NR/jWfqQA4VlkKb
         pY6cAwLQNUYs+/4EHfbsf7PEABW2YL0QKT0bKNYLRNVA0CDDLzE34FX6XB0c9JThhEaS
         OHfAxEb6wrU2bDqmGdNnTclUil5CRwvi5HCM6O4BmRkfUXDxdWx0XIeHntvedenuh5qX
         WHsfRFmWwm5zg+WFyzKwLlSfuIC7rDT2mWDaYt/S+7qCSXYRrRcw2PXK8ZlBAjlBey/Z
         auwwRNJ4ZqP31CmKgL2GIH3tlz30mqtMcqzs0pdwQ2oJqZ50rZmjUBZ2CqFaK/0o/2d3
         TZFw==
X-Forwarded-Encrypted: i=1; AJvYcCU2KyBVyQZfWZ517Swrjl6AZxjhB0sMf4Fj0q/m7hvd6KEiCq5o/y/vRuDPtnDjC6KJNsMdWdK4FtkJ@vger.kernel.org, AJvYcCVO+FNtrzqLp7KaxPzX5F6Waaa2QFIVGVC8uB7cWR0GgOjVVS5sA+YxP33I7oaYAHemX22oskra+BDj9afA@vger.kernel.org, AJvYcCWSUtwYL0LTkzhC2UIOPnHOz4vZ987puk852PPYXSqBlOugN2Yk4Z7rpQYpDVfhooyw5/gYSwlhHDMOOrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsW2McPLIsuLAzhG3vQ53c4GtaUM15fJOg5ppREh4u+U5jWGO
	zxMJ/bzPqxUjxgzSOXpu9Pn/0ajqUAdtzxEnTOG9qnPsu6x8o0Z2
X-Gm-Gg: ASbGncvLD6dw57JPPgQqf5tBFnY1Yfaw96AqHOjtStEHGBYLl8ItPDC36pBsZOWfv07
	W+xdeUd2HYZEtR5dh4fa89b8a4Cy77xfNVsv9KdksG2lWuXbCR5ljGS7RYauDWPk9lagsgWSWBs
	Tjg1Hg5X7yDDZkDRDkAiQetHqY4f5eIxQHPLCTdTR0s2fpo2fh63oH3YMTsITRSWCnxMfD3JQZz
	Oa/UN3Hx+pOhqbIuCsA62gbtSk12sdtS8LcdzGCqsoMCdx8UNoEXX//VMoOpm/AFq3PqS8qnDFV
	ZydShI6h160itD+rtvhjzHHKj3jtb4/GrqvXMjy3V3XVLVtuWrJK6ZTYF6yUAtcVrL1JyWSakZ2
	PrnXDfZ0ckVkWaZrLm1kdyI8F1DY=
X-Google-Smtp-Source: AGHT+IFro/41EYrU+HOca/VbaYhbXNGLbd9BWBtPcwSmPCLoxLac9ReY2lvgtSDg9U8/P7DGSnih6A==
X-Received: by 2002:a05:600c:3d15:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-442d02eadb4mr22081505e9.14.1746690102785;
        Thu, 08 May 2025 00:41:42 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd333326sm26956295e9.16.2025.05.08.00.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:41:41 -0700 (PDT)
Date: Thu, 8 May 2025 09:41:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
Message-ID: <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vrbfmczrdwlcxhxj"
Content-Disposition: inline
In-Reply-To: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>


--vrbfmczrdwlcxhxj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
MIME-Version: 1.0

On Thu, May 08, 2025 at 01:07:37AM -0500, Aaron Kling via B4 Relay wrote:
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Add patch to describe the emc table bindings
> - Add patch to allow a fallback compatible on the tegra210 emc device to
>   match firmware expectations
> - Add a patch to include the baseline emc tables on p2180
> - Link to v1: https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1-998=
96fa69341@gmail.com
>=20
> ---
> Aaron Kling (4):
>       dt-bindings: memory-controllers: Describe Tegra210 EMC Tables
>       dt-bindings: memory-controllers: tegra210: Allow fallback compatible
>       arm64: tegra: Add EMC timings to P2180
>       memory: tegra210-emc: Support Device Tree EMC Tables
>=20
>  .../nvidia,tegra21-emc-table.yaml                  |  1692 +
>  .../memory-controllers/nvidia,tegra210-emc.yaml    |    44 +-
>  arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi | 49749 +++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     1 +
>  drivers/memory/tegra/tegra210-emc-core.c           |   246 +-
>  5 files changed, 51721 insertions(+), 11 deletions(-)

We've had discussions about this in the past, and I don't think this is
going to go anywhere. Device tree maintainers have repeatedly said that
they won't accept this kind of binding, which is, admittedly, a bit non-
sensical. 50,000 lines of DT for EMC tables is just crazy.

The existing binary table bindings were created to avoid the need for
this. I don't know how easy this is to achieve for all bootloaders, but
the expectation was that these tables should be passed in their native
format.

Thierry

--vrbfmczrdwlcxhxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcYDMACgkQ3SOs138+
s6F3YxAAn9VDKgGgj3LaRyo7aobSxZQZ+pFtSQy6+5C/SD5DweYmFbhh/tMm0EZ+
TgZO2HGhhxeBMBKiIuW0eV3koQ/Lt80DC6ZX9vvQGqTQ/9bRM8LBpD5xi8UlXM06
oZfg0vC8EDNo+/4f9oMsjcHafopTnLmxyA8LUC6dE0SZ+sUN8X7ApnoA7oCFtTFD
GXFDealI9c9DdIFu9dtsGD3EOWwaauM3d0RoQePR3d7tIeWGaJlEwxsxhJrFjNzX
o+VcAbEykbDbtsqbiZIWl5i7VEt2SzjYycCmoP4w1Dk52L5fmv/0gPpZRvmRzPLT
tupK6BJgRMl8etiH/j7hDMTaLHaT/yUMEnM6cO8qzBvuzEkHgwKiRAEXb/7JJMHK
eKbZtF7vr1bBODUaydaIeL2t1dQ/TVLp6iy4+folI3JK7j4fulVSem5om2Db6kAZ
AdZXYLRW1f+yDTk5NiYpfbz52Zpsdjy6GnxX7cooYAkyDUvMONuTldpHMH0+3g8Z
GIn2IrWOjZyfz0iaMAyfajKy/ygALtRk+XZkXwhsUTuaMM1mlqDvQRHNX6E81NnO
x6whhXaGFZWoL+K1SQZJjraym4vKxo1zWCIlXMrf1EpOtX2qpeOD0dDNbkcNsfUk
5d5NLj4YX6Fpr3NRyQV2JFvfaqAGCBPcWj9miUwykEa9DxK0EhE=
=0Egh
-----END PGP SIGNATURE-----

--vrbfmczrdwlcxhxj--
