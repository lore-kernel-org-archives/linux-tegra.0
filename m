Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F37326D5E
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133128; cv=none; b=W5TCygYld3olEs4tWuiCbG/cDGPOdtImS4UvSB+umqPdjz2MLpyFgzll6HfGkhtwTRljkSCqv/Oe9x1loFXRff4DSKRLnDQC9yeKIoIzReI4ECgaLTHKE1bNuH9ZKcdPhaCXqpKNMeOfdPHwTkknPh+H0m2UK/u8O7R8DRshI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133128; c=relaxed/simple;
	bh=voAb5/VWXrSfyBk2pDRuVMB2qmR4O+wj6U1yYvtSv08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2c4sLCEzixQGnI3cdRLbME5OH9TCxDBw4BTk4DbSSQxSR8VJlDpHMCT3DdYEw+KHoLik0PrbaVPC6B1iSIq7+fiMX4lp9Nm/x/ljrkiwsveXG24zphwZyyaGjWmH9ZwPfHHR0wseAiN03C3OkfXgZSMzPIssAhxtDIPeK7eEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0hmEfvF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0hmEfvF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563e28a3so14427085e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763133125; x=1763737925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8r5/EliQfOua7xX65iMj9ifBX816MRf+D+dek3dRiuw=;
        b=m0hmEfvFZuEOLuMKtdSUXPHAX67QYXl3plv8CznL289WbP8YkEFjNL/5x73cTTbUrf
         XqbvaK62C1C1pmKhW6Hp0ypWdjBUuRiEWeZ9FS9fbm++xS4hHt2NdgDT+KCJPvoJfvlT
         mc7klBN/rbDxmL8K3yWIWkUpgSW+ZavQgU/88Bc9h8RYLtGI8jMvma8+eKQ0qbLTZJPR
         STW9qDR0+9R4tVCpihR69RfcED4OkqR3p16SC40nF2yzsHreJ8Z170T2Sey6DSUh4PBT
         vniAaV5VZX99oMOxyMbzXEW9RD7HnYwtDffmUvspgv0R6Z5LBZbl0OnFOGIXrF6RD3I8
         gijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133125; x=1763737925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8r5/EliQfOua7xX65iMj9ifBX816MRf+D+dek3dRiuw=;
        b=CheLQK1uxw7bIGtgIHO+VAUSr+rBCPNM/Z5h/HEoYH/vDc38kaycN3QrmKMpxAsN3S
         zdel1+ZJhjPAUH2C6PNmDib3ueBLXATLUBGrNLEDc7JpkHkvgFQdVWpPWCmDEUjTFuwh
         nhm1JoRnDEQGkGOYy+E2UIPcLZyH3o2Aqi9XYLNe/qPhyS/sw8UMePlrwM0VBWUcT0Ia
         8HLq9B8B7Ns7VILrwq09vlPTbelcRtNAhtlSaJ9iCMsbGQDAhyuG/nVkNkUaorN9igDw
         univDFtKbhCoQ8x9dzWGpIl61HUxPzZvGpGuqxMatZqFfHGGHdAO8fFW+o5u0ey0cYY1
         pIYw==
X-Forwarded-Encrypted: i=1; AJvYcCWKIOE16LAIsisSat4gOBt65/Wu7alIcfYya/4NutxsYoaCB02+hhLjWk5i+GpU7O8YyLUofCVSJuXzcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQblQulEJQof01luPtmlOa8b7NMkJ6nt2ufFZSZCM4H9RY2IC
	sIj6z0NJG0pWbm/pPAyJ/t8q01HCo4RK4MrTScZly6UjMCN5Y1sgP+Lu
X-Gm-Gg: ASbGncvR2Z03RQag+B1A76lyEQxE0B1wdiY15qeQTWaj+W/uOt7uJ2RnPVBA9HTWRAC
	1F3cnut0dtuEUQmcINOnM78m3ybJwST4bdtyJdryM/dEWgbH8QdmTDTs77lb6JZHgN09CF69SJj
	CLJPmgxtZztkT+CJBpxjB8QOkkW+aE+oIKOhxQLi8gxI/QSJa+Vf+TikdfIIohcs1SDHkfVt1qn
	HPjbgwd8BWwEbOoys/ysMPBdoTwbw16pd/p3w/RqX3G+v0nOxn3pSuqXM+3kApCmgyT13JGW+qF
	gz82g/VqrojqJPqteTZ1469H2iq1DgYz4Qxu9/Eh3iXFPTGc8MjphTCryR1G85OtZHUp4X8zeyu
	uX62eZJr4hCD6LtmmM2DIt7yuqyjlEvbB0wHli7c9+WGiCpaKCCsz5a8eTWVC1C8H1ZG937p6HO
	hcqIvTlfiBRKwpe7DlfFdjTV3SUS45k58KMls2JH8IZJ742QaUJelu3JmDB36AYsM=
X-Google-Smtp-Source: AGHT+IHlbOOTvrmcjU3ZGEriGOa14ojvkFk4Zj94HNl1yT+L3RpIuFB0z5aqf2JpxrCIuwwdjhRyAg==
X-Received: by 2002:a05:600c:1c23:b0:477:8b2e:aa7f with SMTP id 5b1f17b1804b1-4778fd874acmr46993815e9.5.1763133124615;
        Fri, 14 Nov 2025 07:12:04 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e43c2fsm146920545e9.6.2025.11.14.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:12:03 -0800 (PST)
Date: Fri, 14 Nov 2025 16:12:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: jonathanh@nvidia.com, sdonthineni@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: fuse: Do not register SoC device on ACPI boot
Message-ID: <i3kz66ndhxptxz2vvgdnfqqxjop3ivaj6brdnvbihwby6sfmab@bneli45jube3>
References: <20251008111618.703516-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ysn2tryu6hxuc6n6"
Content-Disposition: inline
In-Reply-To: <20251008111618.703516-1-kkartik@nvidia.com>


--ysn2tryu6hxuc6n6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc/tegra: fuse: Do not register SoC device on ACPI boot
MIME-Version: 1.0

On Wed, Oct 08, 2025 at 04:46:18PM +0530, Kartik Rajput wrote:
> On Tegra platforms using ACPI, the SMCCC driver already registers the
> SoC device. This makes the registration performed by the Tegra fuse
> driver redundant.
>=20
> When booted via ACPI, skip registering the SoC device and suppress
> printing SKU information from the Tegra fuse driver, as this information
> is already provided by the SMCCC driver.
>=20
> Fixes: 972167c69080 ("soc/tegra: fuse: Add ACPI support for Tegra194 and =
Tegra234")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thierry

--ysn2tryu6hxuc6n6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXRsEACgkQ3SOs138+
s6EmIg/9EKMefuMWc6CjJS4aAAyAzAicRRkohm78OqPgrMKIy8VX+gdiKMxOoP30
uBM9/Q9QB4N5cOCneHwhRqJDokJFqy9jwxVmD7s8yzI1C395cB0oxRlEhnk3um19
+J2j1CusFgC9x29xlc4IJHNFye/UOlbcNY/pRCGr0eCW/HTU1cygfWXRyY2qWSDQ
z6Dnz2ZhUpGZf0HlwU0BfiYXp0JmVaJi5Y0Q2lH1h8eiW/axJd1JCD+TrvD/tMuI
KlTmvmtkDboMzjvzHJ7iFkvW5yOnIuTEyU7+nRI9FoMsSbPIihKSeW9Z+tZWfJOM
4dJseXOEbDOgCsY8m9ueE5bdDAja7SBgWHafZKX7UDHRs3srVsVzl4sT7un7NU8V
UOYbNqikghvH5AzH2O3RBYsUVAuMrId4RPalnwR3zPyjifa7dMy2Xc7jqPaRe3c5
dl2nz3kbwwhdNk4YwQPqyORgWOXNQLrnbREFszFWczANlLwKXqewsgU2PxbcTkGR
3oCP9K3047febHqNPTkEk2ukHLqtcHnbn0TPswH4TtDDW/FcCRHvSkjl/UZeROv4
D/sviOCvplsuArAZ8mrl29bolOqWPjVCxuopIXsW8ydFvExdobwvPG5ga8jcdPNr
16e5d9yUvE46G5smdHVJuf7+5pC9gsBPu4PNTQ780/u6jDOLXio=
=dH9v
-----END PGP SIGNATURE-----

--ysn2tryu6hxuc6n6--
