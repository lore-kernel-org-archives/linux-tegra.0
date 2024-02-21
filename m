Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49A8286F;
	Wed, 21 Feb 2024 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532731; cv=none; b=OAtO/ksPY3ipSkoETcfp+87N1GWg1zi+lCIeYV8pATPfkGIQ4r4vH9e4uMQwmmXSDLE406sARlFRZNnpNvf+E3I7hyI5AzYuGA8+LRD/8R9Q69rP29qhmaCia7EtAdDtyl5QwdzFBS3TE/911+hyKSuVe81WLClCiVJrHnsI5to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532731; c=relaxed/simple;
	bh=2GH++iFg55PT7lGJbftPrDc2UDnZ0fiNhGV7I1SaPOs=;
	h=Content-Type:Mime-Version:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JICTDL1R0fEmjxOPtos5PxvitTFzbR993JmWoLbi1dUxCXmlrLaiV4p0OYyZpGC9VBI545Q3nRL+W72Rzhp3w5fzCNpkoAWGJjZSGxBC5hDRsHZBsHZnWk9cV5DNidgr2ast8DbcQFloIBxtjDfgkfc5vD2txvK7GGpgpbsZ/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7TSNY4l; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7TSNY4l"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41279203064so3449745e9.1;
        Wed, 21 Feb 2024 08:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708532728; x=1709137528; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x5+vR2ekzu20AFjxsL5xv5k3p1BsOZITFMLwlxeVU4o=;
        b=h7TSNY4lxn6xXCnkaw8a5zJU0mWtf9a6hKofFp8hng2gnaWi9MeruU3feN/GpgARUe
         PZ51RcW/tw0x6Ruwy/EHYxgR6WdP9PshmI9ExyCuK/NiPM/x9IGbmffVae6RHc//T9wd
         O+MS8eaIEidb6N16JeIeBATjSqqyrIlanYmcoAnxh5+/0KDu0iG4AZ49WnTKayF5RGmn
         W/gMWB5L+LjhMNVjW9riPmp7XhOGL1H8UaX08RtTKqg+ebk2Mvhf3cua5V0ipbpvc5vo
         WaTNNT1eQOHReo7luzT++ELOKGMdWSYvhLvJM94jZiiX6wphwMWr03Ag+kSDjJRIl1l8
         6fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532728; x=1709137528;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5+vR2ekzu20AFjxsL5xv5k3p1BsOZITFMLwlxeVU4o=;
        b=OEnTa22KT3KE0YFfAGWXprcp3RSWWxIb09Xfcqh8wmuaumKLseM1u9sKAOlslEjrQg
         gvDZVjVzOTjjQH4W+TV5TkNJIlz8IPjxM+jmeXe64IOWPXSVyj+/Q0DaC7k+st1gyVE6
         1D4ROQrfUmCaaceEsCl7XN3S8vMtrhl3Pd2sXvedZT9NO9jJcR5w2H40e07uvfWvTg2z
         Gd2aomh5mJRPmPKwllKjqUVYd1gviWGd2o3Ecr6gbqXKn7YOipmuFfQgSzH+fafqrP3J
         h1ly/dB+/igs2wnKfG5x2gaFN3WeYGNxsDJzP1KJFLu//kuPm1KCTx3cASSRiUrSZPEd
         sA8w==
X-Forwarded-Encrypted: i=1; AJvYcCX1pCSdTrg4CJJ2z0ALsRfeiICMiWSTB+Na2EXe34PnE7czCcka3MFyZixWr8/2UZIPiy8Lb+vgnTFZOOeNtmDG5mh9OCXM+GKXLro=
X-Gm-Message-State: AOJu0Yxy1jsWYSS1nA6m7OX0RyMbQG251cSvAcLjIVsw9o5OVzSfDwJ/
	h88rTedANpLf1Ae7mrOEZ/Qib9mq8oFON9PPc9IsNib/RsIGWbYx
X-Google-Smtp-Source: AGHT+IFDXbSkqEpgc8NgjACYWWUHK71w9yeeDYalcn2NJj91xzfBx0a/F6JnB5DCCMuKTR4+yksLrg==
X-Received: by 2002:adf:cb05:0:b0:33d:3896:be5f with SMTP id u5-20020adfcb05000000b0033d3896be5fmr7366739wrh.54.1708532728219;
        Wed, 21 Feb 2024 08:25:28 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6784000000b0033d39626c27sm12959326wru.76.2024.02.21.08.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 08:25:27 -0800 (PST)
Content-Type: multipart/signed;
 boundary=9b431b1840d6d62518f3f7dfaa394198e3d0eff296828a15bb82876af41f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 21 Feb 2024 17:25:27 +0100
Message-Id: <CZAWAZDE4BVU.2UICKBDWVQKGX@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jon Hunter" <jonathanh@nvidia.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 MGBE power-domains
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240216115748.24845-1-jonathanh@nvidia.com>
In-Reply-To: <20240216115748.24845-1-jonathanh@nvidia.com>

--9b431b1840d6d62518f3f7dfaa394198e3d0eff296828a15bb82876af41f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Feb 16, 2024 at 12:57 PM CET, Jon Hunter wrote:
> The MGBE power-domains on Tegra234 are mapped to the MGBE controllers as
> follows:
>
>  MGBE0 (0x68000000) --> Power-Domain MGBEB
>  MGBE1 (0x69000000) --> Power-Domain MGBEC
>  MGBE2 (0x6a000000) --> Power-Domain MGBED
>
> Update the device-tree nodes for Tegra234 to correct this.
>
> Fixes: 610cdf3186bc ("arm64: tegra: Add MGBE nodes on Tegra234")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--9b431b1840d6d62518f3f7dfaa394198e3d0eff296828a15bb82876af41f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXWI/cACgkQ3SOs138+
s6FoLw/+Ixrt0iqmTN0PpMVTsQCcMzGXFu8VIEb24TGfCo38vYlDI3XAntdBArSX
kZP0nYSpF5sWKrDYlgOlWr7kxxv1pcf35T4hDrwP2wmp8eV6SQzofmS0f836JVh1
PTcuiCjYFMgZN3Gz7MRjp8XkySy4iQjtfym/itH7J+1tCqYC5ZK/uL9aMGZy0ikT
5m3SX/XpTB/bzUU6FHz4qbpo3r0BiVQDED7y5wuFHBlSQiiR3HW4sCCs7i+15b4o
Udp4Wj2FowtX1vIlFTUPWaf/KR8DWvWOynYESmY1BWfsZZMIg4vgpDTOZj6vSQlI
MJfw6HNTpS+oWYfTRCuAuiPQ3pPSNEmHp6EvaqH6nLJLsruWRbLJWMdfAHmlGo29
UDlWgE89A+UYuPk4BFzHOX/zM93p3Dm+WwbRrqIbUY0cXWbbIyAynMkc7MjOk6nL
zBXaZ/uEXF42vhJpe9EkTPLCBfbFG60H3uw56bvJF5mepMcSvajh+1n0D2VW/qpS
da0EP16QqOwR2q9N93ZXOVUwptydCsbj67aRC+zB+NUkNoV36Wmtf0G18gnAU5dx
xqjdgNdKRQ1oBPq5HbRvVdi2aZac8ZVkDpfdY/mhsIOENAUOG3okcNFEgvdaG69A
0elnnyzKGBuRKKesIQ59ps5DZc3OIv/F2Pl3FVrhd8URZwX/Qmk=
=kNll
-----END PGP SIGNATURE-----

--9b431b1840d6d62518f3f7dfaa394198e3d0eff296828a15bb82876af41f--
