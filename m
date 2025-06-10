Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3028B7CE
	for <linux-tegra@vger.kernel.org>; Tue, 10 Jun 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547207; cv=none; b=evqo4dbBoygv8eW/8eBA/qbzs08/Kje0Iyk66s4ojBjBHP83dp2nd12ZMg4lXS97MbBl3KUOGQnl3mqd/tm41ReCgnpmYdOmvofBYBKfww7rkTx89CzjCgblicaVosa4Ub3zwUGthhtMZd2eWwWdqU6uGglTIEFUEFt2kbXmTKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547207; c=relaxed/simple;
	bh=nyPvhoX/Ffji344tkDnaespCSI9q4T1UWrnyikAL2Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krFWXX+iErV0KVBqABXrPL9/JRznbC7s0WfcYlLThb13i4ofV+l8ga+dk1Db2HyVU0MO1uWx/DaGkSdwjFE0/T+AUzsi9KZQFJ1R4Dxe39eSRycH08VeOZaKyY5i0x8h1rlWZCzTNrkQmekaMCdZfbWg+CMjYgS5j2QAA1DjI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQfNPtGU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQfNPtGU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso32535085e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Jun 2025 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749547204; x=1750152004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YBJbTNWnmhAa1OyVMuSiMucR3l83+Rg+SCBbERWj1I=;
        b=CQfNPtGUc9Zm7084rf4houM2qrYWxeymEA+utb5OiZ6wNVccMWTsiX5SRHyrUxr3KG
         Z2jLfi9Xgmg8V88tDjTxfDXoPyOanVdOhVge+LztT7MDmWRDrp/hGIrgyqyGJSoVcwia
         l4Ut+uJM4mPc0r1TB3YB8igtUHtohG5SemQuJEGxGwmZ6M/ih8998e6ZyFATcMF6yK+J
         HBAX02gfjx1VcJylMfT+i58aiO24HMyEZaGg0fPqvJSoerc04VJSKS2wDQFj9kxVUVv1
         DqKLyOjSK0AFxPIsCQ3KyXcxuMhHm1OWw5QPFkCtMRNiiLrb62nRhPBLARWatjv5Mz1T
         D9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547204; x=1750152004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YBJbTNWnmhAa1OyVMuSiMucR3l83+Rg+SCBbERWj1I=;
        b=h9Pa49ZtVV5MTjWTz4hXPOcxddtvOM6CUsgP586lfon7sH5qI1N472wT8I7QXYV11w
         dTHltOKuBhoLvztzW78iJVFZQnke2KZJ9gfKUq2GVUgs+RBxKGdJa01dLrBakR+tZo0v
         pZ5MsHRJNvv6oVt5c3JvmBxU9B39JdGKYyBRgLYMdJm1hzdw1zv2JCV9qqMnwmLfh81Z
         7CxzzGs6Xm/OuqattFUM68ozzhAwPs6juM0KKdbHBZGK0M2DoYBgYNgyQ4dMMlJaQyu+
         cg7tGtuSs7wZJBd8l5GiANeeD7NneiNzJWKRxCDzVHvjOHpYNw3ux7u620iocF8yfeZV
         0MEg==
X-Gm-Message-State: AOJu0Yx1y1JEspba6atzPu2fY6T3pWKYE7KTF+S8TMiz8DPtQ6nGBZ7U
	Z1qsER/QiPPRPzHt4y8qecU5FHpCIWeZfxPDvpQCzgUwk73yzLlVqvio
X-Gm-Gg: ASbGncvtOwEJGxfGelJ4gYvbYH87YVdTLIhLl/7df56bEf6o04lfOBmPA3GV2549Ad2
	kpUD0oK3QR7Ra5x5dyt7FOiq5wOAUdb2711W20/plWOvBvDQ+5Dc9UoA7BGRK+O5cGGbW/R6y4K
	BSn2x/+nQJ6IrpMm84z+ntLN1Kv+HbtryZA2+HYTh3tOk++gSrk/N2vaBI/DcV8Pbkf/Sl5c9QB
	GqJD+6Bv0d2ewYuaphqTLruzP/uwKBTiuriYLWQNsYveqiVzQwoTukF9BAHZhIfoOGl8+NB+eBU
	5x0oFfp57DW7rzE/12ZnIA6dhl+TaUswvOo1GAw3m5fmPNHU80gxYWWaKxfeDqf7vpGzhUMsCs3
	yFqvg268j4HDGNV2SaBEsLH3gI6YmaVTRnjBepvSPvFKrtFh/
X-Google-Smtp-Source: AGHT+IFDd/gXp7EEWfm6JisRTyh8AD8ARnN79xdGGrk4QwiNZ4USWkO6ap5bx9a619Z/aIlSm/TWjg==
X-Received: by 2002:a05:600c:8b08:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4520141635bmr188289705e9.10.1749547203661;
        Tue, 10 Jun 2025 02:20:03 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm133002725e9.25.2025.06.10.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:20:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:20:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>, Sumit Gupta <sumitg@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [BUG] cpufreq: tegra186: Denver cores do not register
Message-ID: <73cbbuahttztsfkz36ndl7mla5dswo4wjqvzvuuajfuuxdo3gn@eiq3q2jniajw>
References: <CALHNRZ98_gh5dKw_GoayG4ieU3TWYAFFt29=495g4+dNLzwjbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uvvgfrdajviy76uo"
Content-Disposition: inline
In-Reply-To: <CALHNRZ98_gh5dKw_GoayG4ieU3TWYAFFt29=495g4+dNLzwjbg@mail.gmail.com>


--uvvgfrdajviy76uo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] cpufreq: tegra186: Denver cores do not register
MIME-Version: 1.0

On Sun, Jun 08, 2025 at 10:09:01PM -0500, Aaron Kling wrote:
> The boot logs when using the L4T r32.7.6 boot stack without u-boot show:
>=20
> [    2.648162] cpufreq: cpufreq_policy_online: ->get() failed
>=20
> I have traced this down to ndiv [0] being read as 0 for cpus 1 and 2.
> Prior to "Share policy per cluster" [1], this would also fail for cpu
> 3, one of the a57 cores; but with the policy for 3 being shared with
> 0, the driver no longer tries to read its registers directly. This
> issue has existed since at least 6.1, which is the earliest I've tried
> to use Tegra186 on a mainline kernel.
>=20
> I've tried to compare this driver to the downstream 4.9 version, which
> does work as expected, but I do not see any differences to the
> register offsets being read. If I hardcode ndiv to 35 for the failing
> cpus to match what the downstream driver gets and what the other cpus
> get with this driver, scaling appears to work properly. But that's not
> a proper fix. Does anyone know why the registers for cpus 1-3 aren't
> read properly while 0,4-5 are?
>=20
> Sincerely,
> Aaron Kling
>=20
> [0] https://github.com/torvalds/linux/blob/19272b37aa4f83ca52bdf9c16d5d81=
bdd1354494/drivers/cpufreq/tegra186-cpufreq.c#L117
> [1] https://github.com/torvalds/linux/commit/be4ae8c19492cd6d5de61ccb34ff=
b3f5ede5eec8

Adding Sumit who usually knows this kind of thing.

Thierry

--uvvgfrdajviy76uo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH+MAACgkQ3SOs138+
s6F1DA//Vga4/HY4S0MRkSof8p4z2qOhjtt/+xYByyNm707v84vjFV32Qy3JjUri
k+eURNtrI6cVIAbatts12qCxcK/BILVFFsqdWSCoe69P8wEFbDG2dhtCbdN8GSxj
ayKOajI8KQEJJYVgLwBY29E4Na1HC4duYbNIFvPiInbaUb+Yhv7uogvIUrCG2LOm
9LpGWj+WQhk3C24jdEo7MpjNZMlIqjK9o+zt+I8T/IGgSVzzw8GBPTE5ViZTpdMO
hAVb0H2UoApVMs6vPB+FYVBDfVBzYM4XZXtW1uC8x9Brrg0gcdVIVpbUt2nesYRj
RTBuf7mt33HMMqiaKrKySKW+h8oL/+ahXTR4wryqJhgoXPHHUzffB6mgME+Z7wrq
MDwh5Wpt5DYH7h2enrwEpgyZMS8aVElVS05yHNiICeCUaRFe3HOq7Q2ny8DHQvO5
6gr4KriHJHa1tFDudbOyboA49eZLPEP7JF/ApUvSdofpu/2Aocr3y2tVWn1pMM/9
2KrRQG9rVwyIcy/P8MJR5M9fUAvMGK7WykK+PYbCgiD3GHVeTyJNAVGdaQv8WGVF
cv2a8ag0v5ITHsIA41c0Y08rwnVwVIUZdU2+r8wT0r5Z+pOhX0wPkW5zRyLOe18m
1IoLeRDAc2T/e8LvChkyHnI5dL3Vf+8Yrc0s7XB6BUtDm2+inYs=
=YhLj
-----END PGP SIGNATURE-----

--uvvgfrdajviy76uo--
