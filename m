Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38F27FD5B
	for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236074; cv=none; b=bnB8b67Thns04vPbXC1hmJhZCJot19PlXiB4Vi+9s8OIS1YO/vFscH9oTlZbuMneREF29E1W8d3FzRAsVGn75A8LKZmEsqToskKrbuu3kAQnTwEZXA4B9BphGEDn9iparVjyCtHBKgVmdmQix3N+lulfFKsl/bmeXwtZoze3Yp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236074; c=relaxed/simple;
	bh=M19dOg4329yPcAWEHCYBCVkz1FRPeCwAf6atSkCZZP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsHvqKV0DEkHZs9YQFNCIS139L1CiokRahOSGuZZv3b5iR4w6Y+ZaFlqmm1beHipWFsklXfROt/fqpFC9keNNzY8JrN9XgvmmvOfwIfbQIXI07C+SiyBloPtDuoyzLGuBajYQE1rJQq4ov+7G3lL5pGPJjAfCuO+MN+5B1g0ewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPxzOb59; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPxzOb59"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775895d69cso2422345e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 01:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236071; x=1764840871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjxoBT+Gu2GC1qFZkbaCeJ3h4UMPe9NXTvdtSt2sLpc=;
        b=nPxzOb59oGj0KfVUf031odnvFkskXakIbt0Fw1i8H86jIRh9PbgzC+L3jxFDIwjsPl
         NdrTlxZGn8KoiJmO0bEtXBVDeVhxMDJxroJvgeiw46MA6FiwEebg6c+23XFH8mG721RO
         2neEViGBjDEtGoILz/iQ1DvnPhfT6BGYyjPKEiJeaApcdFQcSyhw31PiuXqPzzkQbmvN
         9kQXd9/HrmHlcpdXYVBWYbjdeLsHWRyrNVbv1TP6WWJeDsBqrqGbxSKMPc+st0Fo7se9
         UOo0HxjKsFIwSXkizKckfUIWUtQkfnzFUE+4tRGLhnnlnQN8I+zoIAHcY+xIeHQ2E3sJ
         1CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236071; x=1764840871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjxoBT+Gu2GC1qFZkbaCeJ3h4UMPe9NXTvdtSt2sLpc=;
        b=SJ5tp/W+1sVv/k5zDOAF5zJcjZv50pTCBujYDaPyq2Caf+HDAZO/pHArMIcQHjGbnS
         Gsz/+qC2YN31A/HOyru9glOWrq/N4sKaT3NaCBfonjH7fLhsnwYZwHrNitLityKwh/F4
         LipfZXZFpFESHJZp3gzE5m2/uPVM3JNoCqRWyKtRHj86BczfVEAnyAMPEJGW+AxVi4iO
         0GgEm7c92jXFjcPac+9fnDD4zbBDT/q5fyB3vB74I+qpJ3Vy92doPhrqqpWOE+iprzM5
         bKeVqUT22Tz3WO9ZTF9lfe5TJsRr07GBP+fYk5+NcOjBDuq37W7C9tXVKlhXEH+/1l5q
         wHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxH1oAw73tmmv8ObjkNTNRkLd/fZ3FSE7eBRz8llGBtOWrzRKikYU3R7dzpjoqbNNxY8i48nBlNSp6Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjoLcoDkaW0JjbsFZDFw+Hw4OSlg8oL+sc+/GS89GLOzCPzuOQ
	S3nhCjXPAzbXF78NEGEWUjUCGIMHRXF6UKqlEIfWkPAyMYoKrYq11/Jx
X-Gm-Gg: ASbGncs9mlDf/9Y9G4Dv5fUya37GJRYhHhqmSFWUsCGzES2VHumYbCNsvHkvHJJRMBg
	/kwHrN9iM7lTPyW7QNa9t5SbwsO+QeBLUb1UhcIt3/QU2Myh/piRwzJjA5g3/LT4BeAAOtrHwo8
	xY+MrpYniPuANGG5+r7Paa6lCFkxdFOBU3YWgpDXoiZn6dG9BrODQ5ebG/NILnTKlSIIkg2nGni
	y5o+M1TJ/b+4hFWzMNw99VbIi4OBLbfeQzT1pE/Gf7WHX9b6Wx96I/WdwA44sj7laBFA3ILkSaa
	Q11KiHAukffFxA3nBMqptM/IRVlgs34d+VzhAvYThe5F1MzkFGVqKC393ysZUvXWYSc1s9clVet
	FrvbXQzkXtML7c+uKoFyocZe8z8RmiiiDR5tW3pQX2fjlKd2GQeh08L0GdstZhx3m+gzAqg9oeb
	H4DeNFY5w0df1Z/JrM6BSel2o2c30WZt2bHyKf4EdqmC/oNMsbfltC8lgyMvBTJ5P5aANJkMjfq
	KW5Vg==
X-Google-Smtp-Source: AGHT+IEsCnpgMz0IZxHL4yBtoDAMLDH1bJaimQ3Wm/oAyC54xhkBDp7gbDn+EON7NPb5ElDiC1PfTg==
X-Received: by 2002:a05:600c:3112:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47904b2b2e0mr98407915e9.32.1764236070757;
        Thu, 27 Nov 2025 01:34:30 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052d9445sm61046355e9.11.2025.11.27.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:34:29 -0800 (PST)
Date: Thu, 27 Nov 2025 10:34:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 4/6] i2c: tegra: Add HS mode support
Message-ID: <oojxbkgsa7wxbc5kglyfsmkee6ubtk3h23kwb3lwnj5sni5ys7@3cuvtx2afhi4>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-5-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krmwvyvrdwhwuz34"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-5-akhilrajeev@nvidia.com>


--krmwvyvrdwhwuz34
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 4/6] i2c: tegra: Add HS mode support
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:18PM +0530, Akhil R wrote:
> Add support for High Speed (HS) mode transfers for Tegra194 and later
> chips. While HS mode has been documented in the technical reference
> manuals since Tegra20, the hardware implementation appears to be broken
> on all chips prior to Tegra194.
>=20
> When HS mode is not supported, set the frequency to FM+ instead.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v12 ->v13:
> 	* Update has_hs_mode_support to enable_hs_mode_support
> 	* Update the commit description
> v11 -> v12:
>         * Update bus_freq_hz to max supported freq and updates to
>           accomodate the changes from Patch 2/6.
> v10 -> v11:
>         * Update the if condition as per the comments received on:
>           https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kka=
rtik@nvidia.com/T/#t
> v9 -> v10:
>         * Change switch block to an if-else block.
> v5 -> v9:
>         * In the switch block, handle the case when hs mode is not
>           supported. Also update it to use Fast mode for master code
>           byte as per the I2C spec for HS mode.
> v3 -> v5:
>         * Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
>         * Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
>         * Document has_hs_mode_support.
>         * Add a check to set the frequency to fastmode+ if the device
>           does not support HS mode but the requested frequency is more
>           than fastmode+.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
[...]
> @@ -1508,6 +1550,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2=
c_hw =3D {
>  	.setup_hold_time_fastplus_mode =3D 0x0,
>  	.setup_hold_time_hs_mode =3D 0x0,
>  	.has_interface_timing_reg =3D false,
> +	.enable_hs_mode_support =3D false,

Technically you don't need to initialize these to false, since all the
fields will be initialized to 0 by default, but it also doesn't hurt and
in this case I actually prefer the explicitness:

Acked-by: Thierry Reding <treding@nvidia.com>

--krmwvyvrdwhwuz34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGyMACgkQ3SOs138+
s6GTQg//d65pzylmk+Z9PfWQkxJc81lPHRmT0ZRcXtIqlI/VUDQ+d3PbnFXqVcPc
k93QBTqWUgU6voZwHydFTRu5OEa/p6fsSfGT+cHqsALJW0+rCaT34It3NrlNmaI1
oRzn3SX0BLGrwE+DB+ewUjI5H8fifVXVVJYVX40+hlBbEOaHA6QcnGo5cct4TDH6
wPZXuOd58QdyxNouHzFezQ4NSQYaWI8QGb3e5ZbswNUA1hSmmgcSSDxJlubWtiRL
pBG6mxzePNQTrhhL/ILfCg8Np0fFjaCN6d9JTic8SUZiqv5A2ssdt0PgYlfMRd4y
wMRq2PFr/qoShnXjmQEB/Y3hn9UdpxHqX9k8FZOX/MnCJeJDVUpFMM2t7cR3oGht
hkHRqZ/9ypKyf8AGnt3q3pgIkeiVpvcpgtLHOQJcJfCSl8mDNzYCTku9za/OQICo
EViFKwTiJEAk5pULYwV4ougAFgv5P8sHrXDHUnmOBU15KwXQYHW5Hd3ljjh+Jqmj
sWyfhSs08YsRou+uRDPNjXIuGzwZxG2Y0d6QCZEMkAqYdzK+kZ1Ik/xeXYZnj2Z2
6e5PtgvCtksKdaCm71OqZ0m/tm8cz1fVbgOQXcSlk3HvJu7CgEGYWFcJmWYSCyEI
KSmfWP8UsS8X68Zohv+P7mM+msKtwHcNxtoStLV+4vQNt7Odfwk=
=0JRW
-----END PGP SIGNATURE-----

--krmwvyvrdwhwuz34--
