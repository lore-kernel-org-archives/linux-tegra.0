Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3632DA75A;
	Wed,  9 Jul 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064289; cv=none; b=TGZywonWtEY2ahD2snHYFQyiPlqG4p79dx7BUgi0dPosQOx85UHSsQ8N542p+i8bdPcfpKJl2HFe3L5P7FBOxf7jr56ha+CXMYoaNnQXq/nw8terb5kXUPAJzphIZxfxMKwocbXhe39N+kEPWujhaKMrHIyYSfg3oQluInBgEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064289; c=relaxed/simple;
	bh=1pfqYJyzyICeZghezgrG610OuPjosLSdxxoic9pAJq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqCj/I8K1Z11HuqBF9pI6oG8iwR3zvlINIeoPwlhZdqIG56eEUBWdH2HAv36FRSUx5i1rGAxej3Rw4vBLJJOuJC9yiZMYUuzJPTE4xWnL0xGdYQIns4aid6Bv0m63Ub/eQ4UxABvL6nZaS3dq1KUBmza7D/ySvfuWV7aMUtS4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyymeOuC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyymeOuC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45363645a8eso38653605e9.1;
        Wed, 09 Jul 2025 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752064286; x=1752669086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfRoQVMGljbReBXs19E2sn1Xup7fKJ5lonhUu/4oGEs=;
        b=eyymeOuCDqZyO6A8r4tFRyA1GNKpG17HzFCe8O+ToxODgVO+w8jU4a6TnqrHf6gSh2
         wnOwDpGlfUvePAJeGB+nxHQaLe1eRj8F3mjGx51qMoZxd7KfDqXEl4yEAZ7ZDMatPU3V
         4baT/NXcnbUWI1/yCaf7Eipnp22Xxif7dNTHxIFfQFy7IR8hcCmtavObtpsu0lCQbTnm
         jRzA0OmPAZNb722MExRu77E4yx2ai6tFCbr9brkzFI1wnnZNe6Rth/O6EZF2qpaOH7tN
         sW/BTRLFOVWEphOipL9MdH/NTZEzqWwwiDj1vGVdniFH7TIxO+Ztfvwr5bhYTBNXkloo
         705Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064286; x=1752669086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfRoQVMGljbReBXs19E2sn1Xup7fKJ5lonhUu/4oGEs=;
        b=TO/7Z5YYobNDp/wHEGtH2L+Flcm8YYRF0O04f1MNIfDqpcSf0LhvB1dwWXRkZJC1NY
         idG3Ki01jGvD08wpeA9zEew5Z4c2gL1C6QCxOpcWejpYdkHtX1VmEdX75c89mrkck+R6
         8Vzb3ZZj/0cj08relSACsRZ9uYXpEelB+RS5xyLINosXxze0YKtfFLlu3g7ZbCZpvftT
         EFCgCxzGowqPm4diDPgsbj81VNYmyXvHITMGhSLTtrauzflWmp5/H6n0yqEUDp4IUaKs
         KbrKWAoZw6lU0K9GXCIlO8lT13kOn1w/zW77bWSnurCEoGJ5DDj8FvAUo0/KMwIoXvgU
         WxXg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Qt2bVVTCF9eNEKlwM3pgSnYQfjR6GSqqHwYJ1UJuqHtNTBDYj/MX3O+pZZeqNIgNgEwkdtr4Shtgohae@vger.kernel.org, AJvYcCXVTshxSXUZVqTyJt399r+wzUcp/bVSAaq5eY+lQZ9E25wTFDSF6KcKVB6HMWIGoPW+J5jr2TZfhs4zuq4=@vger.kernel.org, AJvYcCXuWljE1Q5wMIYuUXe/7sbFqfsrOC7N8rGMLH0oGcaCiysXh8KqsIIb6kLDTl4TJBMTTXuJvLuwkA4R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy40/+plIhAmg/pEconUj5XQlpA5AJqvTBhIk/XMJeVFtVBt27S
	xlf5JAimGq9qfRcueFYUdyscygJH08PIYbGCI7MiTmDStutkEp7AmcnpzNkNgA==
X-Gm-Gg: ASbGncu0CePCp+ucK/o6KtMImII4Ga1EqPf1lllKb+lMsyboU4S6vd9RJw97SgIdjkB
	9MxPZlVrREkzKLiLlAdNfhmDTDYXkJ3qT3UyVdgdd1H8y4jKje1Bk0ml1I4qQY6Ukq3vxb2z9IE
	/lvwlopc39DybWLzrzZQ9qNfL8PXW+yM+ezn4GL+Xe8jlcnAUcf8BxlLZFo6gnY2sWfu/h63UPu
	Jr/MfzdnDQRQCGRWj9uGbDWUGfVt3togk+fU+AulOPFCRyHGkNTmcM2NhYdCe+j9cy7QbgMCXqt
	XQt0BFXk3N2vAv+45j9FWhmwouaz4Pm6H3/4+hBHotQs01oT5ESFDFS5fQfv+xR3+lU3noCuhK1
	2AFDkg99jbamw0wLqWgHjrOE5VHuq9YWVUlBjSCfuz3k9XYgf
X-Google-Smtp-Source: AGHT+IHpLYTmMGsRn85E8rtAsthFXWZR8lTlpIo/NA8OR2OMn3yEsRBVdsSn9dM0e27DNVoe/djuOw==
X-Received: by 2002:a05:600c:198c:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-454d52f4e20mr22132305e9.2.1752064285807;
        Wed, 09 Jul 2025 05:31:25 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030baa5sm16061019f8f.12.2025.07.09.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:31:24 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:31:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tbergstrom@nvidia.com, 
	bbasu@nvidia.com
Subject: Re: [PATCH v2 0/8] Support for Tegra264 and Tegra254 in CBB driver
Message-ID: <5xkzehwr7k3ycpd3buqahmvamn6gvaol3exv46oe7nfpj7aw3q@eze4dbhplgqa>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qncswnh7ljhekzcb"
Content-Disposition: inline
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>


--qncswnh7ljhekzcb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/8] Support for Tegra264 and Tegra254 in CBB driver
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 04:08:21PM +0530, Sumit Gupta wrote:
> This patch series adds support for Tegra264 and Tegra254 SoCs in the
> Tegra CBB driver. It also includes a fix and some improvements to
> make the driver more generic to add new SoC support.
>=20
> The patches can be applied in sequence. Patch info:
> - Patch 1: Fix.
> - Patch 2: Change lingo from 'Master/Slave' to 'Initiator/Target'.
> - Patch 3 & 4: Improvements.
> - Patch 5: New feature for HW lookup.
> - Patch 6 & 7: Tegra264 SoC support.
> - Patch 8: Tegra254 SoC support.
>=20
> ---
> v1[1] -> v2:
> - patch 8: change name from GB10 to Tegra254.
> - patch 6: added ACK from Krzysztof
>=20
> Sumit Gupta (8):
>   soc: tegra: cbb: clear err force register with err status
>   soc: tegra: cbb: change master-slave to initiator-target
>   soc: tegra: cbb: make error interrupt enable and status per SoC
>   soc: tegra: cbb: improve handling for per SoC fabric data
>   soc: tegra: cbb: support hw lookup to get timed out target address
>   dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding
>   soc: tegra: cbb: add support for cbb fabrics in Tegra264
>   soc: tegra: cbb: add support for cbb fabrics in T254
>=20
>  .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
>  drivers/soc/tegra/cbb/tegra194-cbb.c          |  34 +-
>  drivers/soc/tegra/cbb/tegra234-cbb.c          | 758 ++++++++++++++----
>  3 files changed, 606 insertions(+), 190 deletions(-)

Applied with a few fixups to the subject lines and commit messages.

Thanks,
Thierry

--qncswnh7ljhekzcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhuYRoACgkQ3SOs138+
s6EQ+w//fkomOwmgUj7XFjnfa43JfwU7dy3++PHFs+YwL0vAdqNtYZKpmBUOxzWA
yhkdvX8JReSMUBLSxcQGZKjSNzm1qvV9/gigEtyWs2BwKT3ScJwZ8POHc75tQCsY
TyeUe4uQdRA0EV6Tw3oYWgVuQNItSSM5SpS6TV6pcr13reloIpA4HG/NxTozlU+Y
4nZrEku7y6QAcBILJ6Fnk7K1JL+5muQSjBP4oTmvIE9uDqQ99xc0Xe1Gi5Cs7Okq
mvcQxh6kEqBcZHevkfi8KH2I5Ep7Oxf8+LUpTZi9EtTwUM+EhVCgcj8HLoFBFP1M
cD3zXnYdR60xtysKVtmvNjfjxRP1LEN1e8nWcqYRxfRdPFuKC+3pzgQdxOnmkg5A
55S0sXymQHJA1KmQC6Qa25rH9hWE8hyn+7jKTXkDLfzaDW9T8R5ULhqMXyvUkLMK
xw8wDIJxbKGgISwUPjNh0j64r8NqGdbIzSLx+xQDUeoUV+Tzd0T6hdPNux2idbAc
DHp/GElE7AHAFCPsMSVKuIrUhJnG/UV7pW/jMSRgwB6q1adzowRpPseM6YDGXXBD
wgi6d5HLCWN/gfN2Howvr4110mOr717ArsPyuvv1pnyl1NiNI/VPAI+QoThmDbl5
eL1un8qO/iZ8/ck3h6eYGtOxmOL/jH2XYt13J4tGSmqiWVCpFmE=
=Phzg
-----END PGP SIGNATURE-----

--qncswnh7ljhekzcb--
