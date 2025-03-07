Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F721A43C
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741369760; cv=none; b=qSdS39bPApDJCt0ApdBxuMAzlYCYoYMAihvNCa6YAJ4Vosj9pUk7GTFpmnXCA52gQ8uGTqItKJzj1Ka0XjberP/1UPQwJ9ENv61DAn6OvCfDZWi9FZ3C0geKCfb0WKO7cWcNYl9hBIE6rMtErr5rlKLbQpu4RGpj2hsi1BpSo0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741369760; c=relaxed/simple;
	bh=lydFLWj67WtyjXuomBRVH2WkhbZf44SVom2Q3MnbuTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdvbu3BwlGJGdfbaLrIe75pJyGysLWp57KTOE7KjbHvkMN7lsTs553/l7F6NPFZk/TvTOwslrWSfB33GYGIsA/hvtfp8N6YBITxstlA7FYyfBXYP91qjbcj3gELnmY/6qzWEEORdswdV/8pNhK6LtIK1seiS1TAeATAtPhMvcgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCSRh2kX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCSRh2kX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1119427f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741369756; x=1741974556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=;
        b=KCSRh2kXslutUFm+bYIjSh4amM1Eu31Bldy+6/Qos8qkNxr1vf5WplarVPBiDWRqq+
         BzwZpoKvXsPepr2n8geDa+NBudoFcctz+wYZFSW9wQPIftIjfmYouynHwtF0fa9F7FLc
         b0+370sRVUKgbS54CTn44ARR0AyX5aq35hAc8F/ddU2+GZIAF31SiaFrLfC6KHThZAKL
         hamCI4u2R0r1fu90x97x1t9SEXdIlQY/GVOr5L85Nv3JscJZAxzWAv1NT/jtIWjxv83G
         3AM+ojALTqIzVwTI1nQbcLdvoz7gAjmMaM/m+Zf1xg1b23QlAl7Fh9rEMT10YRC2jHtu
         RFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369756; x=1741974556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=;
        b=B+tvos+USEpCjiQ9pMbu2pKoS1zNp9u/rxTI2yGGDeujAwso+7p8Yu7rxHy4sBQ5qz
         sdEjtTmKiXxaDACslBaXYvOOe/Nk5qRN1kFLQFJNhtiKlNaGviOjFR775HM7Tkqr1icz
         jm4+5eTucJNMWTaljxu7GjRKsuOuFsOAtZeGGWIWIWJAQnH/uD/NViOYLkLk3Z8nZ6Ea
         u4OjQPRtUlTo1ONnIkmS4Sgka216sAk36Fp5afhbxKvBzTbYMlRYEIxvuVgGHqCd8GZ1
         13hp7cuOm4Wuky9rQU4Qns1/Hyk7BXjmEkf51L6kGh/CzcNCF+FrVx6wlQdqQRmRM96x
         f+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIev6zZ2J4eNPRUmx/P03wZRfiVFAF7NM0o3xrI+MgjNDKMt9wEr4RXCa2/7rs4hLRN/y41ADQupsy1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx73G2z6IyJ6gJuJRq+hfpgr0UuPPpTPqc5W/DLnE1uiYkgv3q6
	IZaoPxjdcWdQ3J8K551n8gzwrE3xHA54Nnvb/4yIxGXijn9p4gvnfz4gCA==
X-Gm-Gg: ASbGncsSYSKaD7/RNYpR5rkOZxxsFxANaEpe+I5VWtg529ekuQE3i8aVI490Ag4NHIE
	4tG1RldP/0bBtzD9Bdj2ooDL1aS1O6g2wCOAF5yMS70ci8tA2r6452XSBENKSaIl2WoTGbXfWwg
	SpEKnTSiOU3ens9wdeB3my6ap4F7MYP8rqDaRsKapwA+nhR92O5HLq8kX9wTdB9cCFsuOs9Objd
	LYlva/ObFdecy9qwEGHqEdzc6xJE9F6nqnPfp5khltrMZg5NLcT0duDeAy6zcwNEdppJGonf2bx
	j6tFam4EP2auejSuQfvI3pl2AIv6+M222NJG77txuLMFRn4RdLzXmbnI3MH//llqQVYcOchgo+d
	lCIUTmw4tc4Iqjr5TtzYVQL5w1T/yfi8=
X-Google-Smtp-Source: AGHT+IHX4k9h2dUIfbIghSN4dswH6DxltJKXaksN3tcy+Fhl/9UKW5pGEUDWt7ze0avENn0h6Vn5sw==
X-Received: by 2002:a05:6000:18ae:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39132da96b3mr3169491f8f.43.1741369756267;
        Fri, 07 Mar 2025 09:49:16 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm6174821f8f.13.2025.03.07.09.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:49:14 -0800 (PST)
Date: Fri, 7 Mar 2025 18:49:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
Message-ID: <ei5lzgdpckb23la7xdsyyaeru32whrgyb6zdzzp6srawfi7obc@4mb35lgik26a>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
 <20250307162332.3451523-5-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bhwaqg7unpd2doim"
Content-Disposition: inline
In-Reply-To: <20250307162332.3451523-5-thierry.reding@gmail.com>


--bhwaqg7unpd2doim
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 05:23:31PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.15-arm64-dt
>=20
> for you to fetch changes up to c33a71fd0e3644520af7b5926926c06597d6d355:
>=20
>   arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-06 20:=
35:53 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v6.15-rc1
>=20
> This contains some cleanup patches that remove unused properties and an
> unusable key that was erroneously exposed. A fix to support GPUs with a
> large amount of video memory on IGX Orin is also included.
>=20
> Finally, some additional devices, such as a temperature sensor, are
> enabled on Jetson TX1, and the output voltage of some pins is adjusted.
> A fix for the VDD_LCD_1V8_DIS power supply is also included.
>=20
> ----------------------------------------------------------------
> Diogo Ivo (4):
>       arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
>       arm64: tegra: Define pinmuxing for gpio pads on Tegra210
>       arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
>       arm64: tegra: p2180: Add TMP451 temperature sensor node
>=20
> Jon Hunter (1):
>       arm64: tegra: Resize aperture for the IGX PCIe C5 slot
>=20
> Ninad Malwade (1):
>       arm64: tegra: Remove the Orin NX/Nano suspend key
>=20
> Rob Herring (Arm) (1):
>       arm64: tegra: Remove unused and undocumented "regulator-ramp-delay-=
scale" property

Sorry, I missed that you already pulled this into the ARM SoC tree. I've
dropped it from the Tegra tree and I've sent out an updated pull
request.

Thierry

--bhwaqg7unpd2doim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfLMZgACgkQ3SOs138+
s6HJDhAAvkmWYhwK6ieB05CXS9ujeUbGdmfhD/JFL/eZy53b99HyVWdulPnnFHMQ
SWpEGGKPAHAWVijcJTlWY1flPd8vRcuzI+lDo+3rUIOpTkcZcCNvlNxi4sTY3ee1
uUN+YMlDPYKVMOsAoyTHt0k4l7GvbTaGpCx0dHuIi/qhaEWkn9t4ny0Sq56hVpAF
C3fk9rr3mAY5uZQcCpqAn2uyzMVPt/KTkiz+qDgm/3UW+zRiIHomihf3ijQVmY/a
yUoqpKzFzT+Q1aJUvn2qumkgvfgqYtvm8bL+ML6eDGvIHUQVXDbjDlbY3FKKRh/0
zWZZBYBPSi8iq6nYBUpB4JHNpALUue0lh65VvXFeIPDtMLk7gRbG7hmS/Lt1kOPl
ILz73L54sdZo0HcWMD6C0WlQlCu6HrEFLchpDx8t5fHN+bBrtuNY/XiPZAMZFmM1
xL3HqLX2cxRAlavE7aiCgXiRtmQ+Jbxk7YbD79UQSA3DtOwa3rYfOMu1gCISweGX
TcrcM0wp6g1DbFtiZloKJC7ZEUDhk41nf+wKikDtl4nPq/w3KWgy1fURfvN1+/6a
rhrPwKVStMp2yunrmY1/UeMIUekgI+bTs/M3rhx93Z8L0wyk3dh+zbPwWawc+WaT
wdX5DSqXPKQ4tX4wWCmcGU6gwbXRnEv9tSJDbNP1ameR23QH4Yc=
=v5V6
-----END PGP SIGNATURE-----

--bhwaqg7unpd2doim--
