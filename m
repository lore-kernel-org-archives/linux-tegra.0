Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E9B351C27
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678432; cv=none; b=i8vISaN6T9Xusp4ciyL7DS/KMKUZuj6w+wyU9oXspBzlwnYh2wXSi1srttaZhhRz9GcIJOe/t83XgY0fylKG+QCDFtb937pERB1NyJrTVdt4P2SJlKSwfbmmkQbLnG2uCyGoKa9vYf4eY1t/5KuHCbHAZTi5md3qhmPLx4XMkO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678432; c=relaxed/simple;
	bh=M3l9JXgwWke6SdO678VepxI0ktRrr7WrMunhD+C1J3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWndn6pxI/GvG5Fp+sj1wZGezwplrfACCjE5vkwkdiJSSExORJyf8nWnqahSvXebgnr2i/aOukJNV2ba5lBnSetc06ByRDBkR1PemzbgHpAGvZXiEfs3I7AfuBO8PrTXG6Z6VzUu2wYQN7CEn0yi3XERLuE/OvB9KLG7Um9bLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiGJQU+d; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiGJQU+d"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so1033873a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678430; x=1784283230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3l9JXgwWke6SdO678VepxI0ktRrr7WrMunhD+C1J3c=;
        b=PiGJQU+dhCvcF3dPKhoxdjCocYv0mLdUzwzvjIJN6kf4Wqae2N1GCSOHK1RPctuSyV
         9pVqCt1LqUugk+JPetdT8JrQHa7NfX8L+oBdOsDy7V9kyNPDKC1qmXCSfMRnuVCw4llT
         +v3kQp8xZIZSdm9GDehJx89CQrnBYxTbSGrwCIJGhKFD7nf0Daios/sjwRIem6hiDTJG
         PkX3AL2QUQBzirOuEjP1e5dHJ9bLdDJy+6qWorWspdsh1PrxfcAj9slqt60+cC2hEpPr
         RjpjUJSTUKpKht3Me+AUJH1CDVh2RP94F1pRpuSF/XTuNwkIU0IQBaNyJZFzmlmW96ok
         y2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678430; x=1784283230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3l9JXgwWke6SdO678VepxI0ktRrr7WrMunhD+C1J3c=;
        b=Vz5rlNm+94H2sV6P0Hv1SRxSHNyjUinKvmBi9A6RN/sdfSF9zTIBOPaVkmaOULA+2C
         HPukikheau3ClTySyG1HZMBJ0+bk7VMux2AkAxbtNrS9ca/OS1OADNgZwgl59YQn+2MH
         hGbK4XpcOH3LaUlnnF0ueC732QuuhoI8bp6caxdFroQprEb/L5l8bAwf28ip2xJrn4Ax
         B8Z9wTx/ODW/6u9e4Szb3gmyz2/G4a65uNlclSqaZlegTMKUPLB38ypybpZMudfvtHxS
         m/hmdKoUZvoCwHuW1t+BOGd+6PKvKdFPcd8IGBLBO18TPWVMoDrRj9NnDX9/Iw2x8Aqb
         +L7g==
X-Forwarded-Encrypted: i=1; AHgh+RotmR2ImwZv03cCTBbwDZjquc+SjjaoE1HeoK8C7bXvwFjiHaMed9HyT8v6OOcp0VR/DuKVOZHW0q4dBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZBZdW/zI+pKUrmH/Foo71pjeW3BE88Em3hfj2GOfBlyF49UHa
	/gD1Jm62ZFDwRnPkOK2CNb591j0MbEiTfPNvHUdYQh7ddWPmL0IskKGf
X-Gm-Gg: AfdE7ckd7Pi+KQ3tqqHUWpCS9uOjTevZj4/JBVh9wauKLZ5y6kjY11o3tpVnj0ppSoJ
	OncZghcNc/XlIoEaEVA+KouF2B7IuNfwM2/ZBE6hlzX+hbrXvIyYUjFaG9V7Qqs0cwrLX+QDITb
	59mMhBpmQL/pJPBgribXLGjrKgLgAsEEPR3n4livYyddC0WULdYD2eSuEtyQJ0qPzww6Cnc7LJW
	o8HGzlBqLFlJET0nJ6Ftzk7+TtQZ02P0RslvcuM+9+1Bz2Bw6ZKfhmYQZhhaxp1glSOBLkwEkHz
	G56IDaWpi3TZJIVGwmxyT5NCf6Csr/7RHmGTWnjM8ez1PwJ2VuP+FjvzAFNQXMhlpX2Y/csqaxx
	A5p/bjEZPNbRNaiKNA82+rNRo4AJS/GmIFjAIXOd+1nORpn7Mnny9KT6cEYHZpi1orYXAxLP+Cx
	93ELveXyg8+LjSn97W+w+z/M3y10uTHjJDs9ZkXa7ANKIqoUQGaOA/uQaECiKGtsnTNN9xWL8iT
	sg=
X-Received: by 2002:a17:906:fe08:b0:c16:12ff:dc8d with SMTP id a640c23a62f3a-c1612ffe27fmr3110166b.14.1783678429676;
        Fri, 10 Jul 2026 03:13:49 -0700 (PDT)
Received: from orome (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d026a479sm388529266b.18.2026.07.10.03.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:13:48 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:13:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] firmware: tegra: bpmp: Add the Memory Bandwidth
 Throttler ABI definitions
Message-ID: <alDE1JBqyRaHshnI@orome>
References: <20260615083731.888055-1-anrao@nvidia.com>
 <20260615083731.888055-5-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mg4exf32md4zkfhs"
Content-Disposition: inline
In-Reply-To: <20260615083731.888055-5-anrao@nvidia.com>


--mg4exf32md4zkfhs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/6] firmware: tegra: bpmp: Add the Memory Bandwidth
 Throttler ABI definitions
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:37:29AM +0000, Aniruddha Rao wrote:
> Different workloads can place different memory-bandwidth demands on the
> system. Tegra410 provides Memory Bandwidth Throttler (MBWT) controls for
> PCIe and GPU connected over chip-to-chip link (Nv-Clink) traffic on the

I'd like to standardize on a spelling for this. I think officially it's
spelled NVCLINK.

Thierry

--mg4exf32md4zkfhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpQxdoACgkQ3SOs138+
s6EGjw/9Fd5epnuhfF7HcfKg/Ke6J2sOjM6mXkZreHUIwU5IIechHg2B3nazGRAE
93Sp1j4YkdYUBdnRYDQgSFhsud5BnJDSUF03MHH8Ofbcm55GipxYXZr5Iybu6zjv
KrQkW6t6Ezn4BoDdV+7ptcIqFYcqylJ5fXgcTtzr5lmzitSRrmPDke+FFGg3dC/S
r38O+isrnT4DWnprfDdKw2fLGeI4UW1O5zUIy9y6xtyeCtyhKCXi+ee0CRDOfvO6
i/Mri79ULXDg9jCdvVX0ce0PoK4Q8BsGtXQadUjN30GkH+K3/G45C/lue29Lk0y8
OCCDNhmL87fP0CNt+TMFqRVMisVRkBMzdT17z0PEEuOfRg5W1PI1f5HcAM7dEy/J
KsQ35nIhSyEkgJvUEspmxwxITzOcYCLynJkrecQsLRb/QuQQrp0H02GM68L81tGU
dHg9MV6pz2Bf6+WbqWKiOFqRbPILWVyR3JkzisVVS3bnPqrwBNjYfcTbNbnJAtXD
usMHFUL3H6u5XardVAbAT7Nt6lJfF5cQuI19niA//K/diby760SHFgTUXbDcyE8d
Eg2uhegOBs19fvouk4OYfyt+EcxaBy3lMVQtmok62xedRKIRYhBZNvKPwd31q+2O
lS8Oim01IFVJ9YsA3yuCVRASZ49aeIADv2wmBsUdJYF6vPzM2iQ=
=9KPO
-----END PGP SIGNATURE-----

--mg4exf32md4zkfhs--
