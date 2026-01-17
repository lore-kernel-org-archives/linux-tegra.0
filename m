Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE8143C61
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609185; cv=none; b=RcGYjGn5wDOwWI1j1bXq6ue5b1tRRR6BEnQiVivx3TtbllrQTXkth5EodqGYWPiITo9sGuLzfOHtX3hi5y1OQlXgFl9/EZ7zUDQSujRmWeK8lzGyUT8u1f2nS61ktw/5HD6kQFaE8wdWim4o6ibRFRfToFnDYa8TvAiJHG22Vok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609185; c=relaxed/simple;
	bh=WddixO14B+NrKX3RH6X9bhZ895fa1HGCFdVzPGvd3eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5GJTTdwff382Ep58VFNpRs1R9BjU90JA/ZZq3sepA/Xsi59s86GxaGooHd+Q745S2Fmf+Sp/qt6C7ttO7rKBKGKVBYVDrMUxAkncma653Q+KW0H5ZjwWaYXz/BY8Wz1TYQn5s9hyhGdcyJQPVy+Y3i4miBjCugh9g9kkVEQ6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGEUtYeI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGEUtYeI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so9721275e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609182; x=1769213982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qr4dd4sRl6alXbR76AfI/u+BBUeNx88I+aVBJKJ/FKc=;
        b=nGEUtYeIPv8M7G1sWCyWOVHK8AE9lRN2HlWUBQUbeTUFn9OiRwOHtc7EmYoaRiaeot
         XRj3mat8ttFSrr9KJ8s0PsCz7BcCirNR8E/OU4KCbXpYlr2T64RbsoqTvUkfnBEPO+q7
         jEj8iaOXZn1r5Ms/sYccEzrA5jVI04r7NRLR7zNnx5lJVUFe2hy33N8UzNHhfs87YGcQ
         r/ohaf19Gx4zs4uxqlh2WTId1f+bAVUowZCxtqt1wmKtsGskBmvNOfSgs0QG6scHomJJ
         upgsTU/JE5HW+jUKkIiUZWTxjWVQkPVlXrMEqVrFQgoAokV1On7BB//qnOcyPo0PhSf9
         17iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609182; x=1769213982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr4dd4sRl6alXbR76AfI/u+BBUeNx88I+aVBJKJ/FKc=;
        b=jlAZ9eXl0SeJerTSy5RhT1liwPkg0xFG0PfjSWfQBWbWSXFn/czn5s5l4i9SBvPqL8
         xNKmkbIfZx4dIPhiY91JV2ORIccsjI6HaROEShOGc47rWPuS3nNZcWJojzVZkqNx3vAo
         4fPCpsLKoXTVbmoGDhzRHwUe82XedtSgXpDXNYdEDQX7eOscWe1s6mozVGJ2lcWDcrbA
         TkyKHGXwJZVKj7l6AlgAtx66pqZ/24XQt9DFrOWJ/GMtyK76LyqwhpRC1tu+qnWF6Ozq
         guE3rDSnXsbWBvxwTcHsytEmbCK+BHFOkS/C4FNLwz0Jtni/F9Ssotk1i5WlEjcTjXHV
         RKcA==
X-Forwarded-Encrypted: i=1; AJvYcCURKJjRckL3lLK4X42iAQdp/4NlNCIxWtikP+dQOV4v1uQy+UE4akMyArwgIB10aIWnV4DIbEbP3D9Hlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2AYoKrEye/rMsZzxZv+8KEf858vbJBy8lT2OiB6sXl4LeHCDA
	DFmSf77XQcVbP2H7FlbaHLhM544PZmlrbl9X0u4MtlGwd3PUFs1w6z+j
X-Gm-Gg: AY/fxX7geEa/RTtHSNuxFzxaTaBXZniP1eV0Pz6gS50N2CcgbUirns262XGwSmSpPxE
	y8yCCkdFswrjSKNF6M++RQNoYTrkfQ7AwVgEBNd5BF5WOrMXuNgbeKefPP2c0WRmbuP3LTYYY+P
	59Vl2mPMNbwMRZTJxrRG/dtLaYkxnZ+7+0uvnygW3mSaiwtuvzDqy+pEuAZaKl472OLHyZY8sL+
	a+n25JS6DBrQvTYzzYt0rWMlAn68qKMfEQKCHcqg0ra+fpw6JZ92p/sne+Z84m8mHomZ4jny2KI
	31oAmiPklnvbSyoITBFlWRC4vDHOBRrIok09hej0qPNDITB19SaDaTqbpJiCSJoz08KBpbgZsus
	guTZhaL9d2cdfM+pjX6SipswtdyEoXTATC+CWL0dOlhdoLV3YBmx81bNYYuiMvpI+ywK6eOk1C+
	Q1XVoovAosum36KJ+3BBLoaA1Sas2Z480saAx1rowwubVDWtQ9oGbOgLNsCT23xBJKCIKEN7NOF
	Q==
X-Received: by 2002:a05:600c:6091:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-4801eb04160mr48471585e9.22.1768609182440;
        Fri, 16 Jan 2026 16:19:42 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b7aasm124804445e9.2.2026.01.16.16.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:19:40 -0800 (PST)
Date: Sat, 17 Jan 2026 01:19:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for
 Tegra20/Tegra30
Message-ID: <aWrVjkNzmowjPr0i@orome>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ps3p3ummquvspuh"
Content-Disposition: inline
In-Reply-To: <20251204061703.5579-5-clamor95@gmail.com>


--3ps3p3ummquvspuh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for
 Tegra20/Tegra30
MIME-Version: 1.0

On Thu, Dec 04, 2025 at 08:17:03AM +0200, Svyatoslav Ryhel wrote:
> Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
>  2 files changed, 12 insertions(+)

Applied, thanks.

Thierry

--3ps3p3ummquvspuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlq1ZoACgkQ3SOs138+
s6FU/Q/+JnHz4z3iaM5N3GbdNqivjMvosUv7yPpTe+rH1fd0qedCwH/Ozg5mOBAA
fj89b6CFl8jNcxU26br2W7ePbJCqnz9+SENaMtlKZbUMXOd5rDzcdie2PMSclLxH
vC2ycq79lAOsKcUWCClkQb5vqR2Dny0w+Ph3Z94DhdxCpW0/NWWswmT8NePMsiNK
dgFtnWfsbzDYLzuNi6tSfngA4sHR68lmmoywqje+s4L1LEgCjVQlbJLDt7ztniOt
zp9kkVMbF03fOeyjk0L6iw+0MEHHGpCWWBqg5A0YG54vwot0kkb8E97tdJUBQJ9K
2vgxQ5hrsAYcJVh0h9SSiAsVXKJq5gu+0grEiFClSZbHMbFb5+J003t8Stk+2CwP
vKtIurLRZ65Dn3eQt2p7trRJzjfdQcSmATMUeoEqV0ledh40y2b/ACm8OgtE0HTq
hEJYyaOjbKUHxy5Asmp9Ioe7iDaXlOlK0L2w+ZAP0Hxaaem1Zfr9RRkA1wZIdhsy
/8ao0kVBfZCC0l8vN8/wEQm+3+P6QS45JpqCe4xj8OgJozy8qZU53UJVr1T9cc+l
BUuegRtXLa3Lv3vnxfHkQvNJ1CiwyrOEzFwOsoC5fjvToYWY0zQ5WSF/jW6+8yeH
yjb9+tfoli6Gml1zk63cL3Srqflb5bX2FxXT4dxCAvU3V1ErZtY=
=KaHS
-----END PGP SIGNATURE-----

--3ps3p3ummquvspuh--
