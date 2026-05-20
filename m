Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60573D6479
	for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277750; cv=none; b=NIeMrDAiLzMXubhfK/XPGpdNPDvjDHws2wsI2SULLlXUDvaZgyTPyeSVsRkqrEFjXjn1VwfGlbdqKP4U3EYXDh1n5TTwsuIqsHkw0WYps8Y8DopdMCrpr5jOHxuQ/C6lNSVLcgejNPVk2VSt4xE3OA4slsFk0tH8satrbJOpDow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277750; c=relaxed/simple;
	bh=SAKdMRrwrxyrUR3iGZMh/3C0jSAZRWttw8Mi6ze60HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJw9WwOp9a3rcP4CNpbr6whTTImEeW7R2wNdC/2f2nIuJTU1M9gOStXmjFdsR6cvVvjJamRDxVMk6fQJ9ZnAgMO8u5TYzYvI2I+IEiAboPhNVAyeky5nkZT5cZWkMZqlZw3+ZMurraqL+8N7NJRVsu1QHtxts5Uo8GVN3XnSZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay6reLMA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay6reLMA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso39797795e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277747; x=1779882547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6/8aj4m+D5ybmDyl9iVOYQPhVs0pvuYJTLfV4l6glw=;
        b=Ay6reLMAFfVEOIptSzKk0Ytu/Z0XOXYRGzb6MOMtcVA45wEd9YsbLOMw2QQ6hgWkuf
         Hg0aR5FsD3zHRVsYx2DGBcnyDZrXmFXnmG7uOTn1CoE34d7G5PueeC/jMMkEbFPLg1z2
         Lup121gw44HTXUtYo+4w4QRb96rYFG6/ml4musDu2/gPpvCXUPPuivB4xP43huX5M+8v
         i68v6ctVp0H25oT6xzBmAc7YsVCzJKddfLiVNo1bWoAnO0gMz4lY5CN6cx85cBkGSSvT
         uUJ+iJanoIZUXrS83IRzBGv7fp3/RwBvA9S0MUZdY/1rS7owvPKtPQkdSR3guYuUzVDW
         s1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277747; x=1779882547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6/8aj4m+D5ybmDyl9iVOYQPhVs0pvuYJTLfV4l6glw=;
        b=kGkEisDOfgISaszgve2b5gXGSPmP66+0sPM75ThlO18ST4M1jonOELq2pnf5J8l2HA
         EtwJTsyeVB0mcHX77is04Jx84gcIRzBB1+vZiT5hE4zTka+7lJpzfe99ZWhkgSU8jnU9
         3mVrnh3WW55bWzgszZva3mbUXhstGFfZqSu7SIoWCE/BALzG0Bn5mm5bqATsULjjjeOs
         J2zQfb29L9v578EbROH+ZUziofQzTuKIs/JrajuO7IYL/rAdnF1S2l78XfRH6CF2Gh+3
         ivV0acw1wiP97ppYdJBkkz4298aKE37mCUk00YQMr8NraGqDwgWiATc4vH46wGaxYOTg
         8UJg==
X-Forwarded-Encrypted: i=1; AFNElJ8WRa8Y5ox9uHtkP2T0KWML4o/uOCjG7UX+AgKO5cLlXy0BKEfTyO7apeE66fAiBNyvLy596JbCutAONw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZ4WPBWExlhYqhxUnR7F+zFhkWgMaaBbDLLDAxh10LHItMfrS
	7/FLjowtWhycaGfTEAcl4sNhzhE+Fd9BWbFo9kAPFlhF9Ll6bmRcSJ+3
X-Gm-Gg: Acq92OEXxO/syAcSCqkNoyCZNGSSey3TOtbyZucla876gpHy9zQKIh27Ds7slzISvIe
	IEa2+mnp6rpdd3JXeend9l4C1x4sDiI5wWqveWiOd+Xjn2WsuIb4sXM7R97FFPSHnH6NadDpmlV
	nO6ZrjjRviSyNjAJJ696FxFlqed5ar56SCSlh/WdFo+CO32yd3Q3nPrkdpO0lOrrQwLdAD6z1Nb
	9j6Za9gN1fNKKg2NoIlLZxxKV3K8FxV6wpgerv7ePNzIpDrlY8ostTpSzgAwhviCVURYop8iH/k
	UGSVVvdcnKq18QR7LOqBcRPN8+puBF92BTrMSpedukDSp/th0KsdoGtuYfE2U/71l956q/2ATfJ
	kEpZAvnhywBigPrOg5vawYoG97Usl9poOJCECNFb6ucJK9CBWTRik7mZntXzNoL5Uvdz8cMJ2TS
	9+YKMqKuTHU1uktORC9+yCpqLblk+xVo6qk8MCMhMBQxmD6Y+gtGIgBF5J6W1EVBt3Qh4FzdpWv
	EXfCpjdATN6CQ==
X-Received: by 2002:a05:600c:a11c:b0:48f:a75e:c21 with SMTP id 5b1f17b1804b1-48fe5fcdee9mr274348865e9.6.1779277747103;
        Wed, 20 May 2026 04:49:07 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm392216045e9.7.2026.05.20.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:49:05 -0700 (PDT)
Date: Wed, 20 May 2026 13:49:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
Message-ID: <ag2fjPWwKJmrdYMl@orome>
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icyuwag5sedcnnuj"
Content-Disposition: inline
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com>


--icyuwag5sedcnnuj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
MIME-Version: 1.0

On Fri, May 15, 2026 at 03:35:29PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Without iommu and dma enabled, flash storage such as the spi-nor on the
> p3668 module times out and cannot complete any transfers.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1d659454a6f9fe..0e0a20befe9e68 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -923,6 +923,10 @@ spi@3270000 {
>  				 <&bpmp TEGRA194_CLK_QSPI0_PM>;
>  			clock-names =3D "qspi", "qspi_out";
>  			resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> +			iommus =3D <&smmu TEGRA194_SID_GPCDMA_0>;
> +			dma-coherent;
> +			dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> +			dma-names =3D "rx", "tx";

dmas and dma-names are the only properties that you should need here.

Thierry

--icyuwag5sedcnnuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoNn68ACgkQ3SOs138+
s6Hluw/+N5YaDbztosRTGmjR7qpOpnOt2ap9RA/wL/yIT1zPeTymNmeR+HOyzmDm
zMxAxZCth+e5lbRSAdkCUImrsTDOvPylnrxsMIk7/WM52Q7A5HUmmaujEoRg6NwU
dOOw4eooJjOvNmlIviygSlhGt0nnU4euc8xCemDY3YCaXZCMwB1AvQMJUEWPPQD/
873dKL/l0rgY6UcEuFsFj4gSRR095Mn61X1hj6Y+fBt/CQ2d+/anIKWHU7/LdqKS
TTLWVVfHeMBt5JqGtt5AooCVf9/z711S2M+JW9gM1DLeBzvUMBvnK7FF+bQcrnFI
LWy7sVf7GaFZGup3ZwSnsQbFBnNLktos8ACer0jcHYqimqVybKQQsDFb2ja4YYv5
ZJjTFZQKM4YX2PjHQd3dI3ljR9nDI01p5rVJFa2JaYDwh9qT/X1BRSHfv9Y7Ekdd
aJkRSP2/HEUzo0F1B0d+c7/BbDoUHznzsLf6FjmXKjA+AmTiBSzqrCXANsJ0N06v
/At1XtTSMrnwai1tD+Ny3IRk8RyB+8mjaZ8l4GmjLx0gyD33Y7dU7icHmjY2Vz2m
x9L5p6aNC9S5N2vhcmcaCR9tMLlgsc2YP3JTlBqd682dORV5DuSq+K/7QmjvOybT
75Pf05MjZvaE8LSWBiDJuRwmhak9vVGNlNi424TXco1GAD0U+yw=
=JrGA
-----END PGP SIGNATURE-----

--icyuwag5sedcnnuj--
