Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344554F85
	for <linux-tegra@vger.kernel.org>; Fri, 19 Jan 2024 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705678624; cv=none; b=kfDZ6f1iRVtx7HAHVuuTEADWfgECUYSaMJy3nzndaKRHvwDKGdh80IeNIxqy0OcM2arUJ66NaSZrtcCjjx/Au81NHWVCXOtu/adpdGKFK+KvZoxo/3NP1p5vkXicRCyOK68tenV3iHs6p92Kx5PizvyqDlDO/KWjdT7ZXzI6+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705678624; c=relaxed/simple;
	bh=pAZF+CcOS7COHkN3f5UecPKXi+AzP1cWv9/JbZMjY5I=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To; b=FZYQC5Z9yBJrwxM7a1ajoHl25+HsJVOAZXbZ54anYf5tspKVCxSdgHBNo6vaglEV2qkhYzM1/A+FoRTYAiTNqCAP+KVNEnjypPaqzde2CiTCpi8pZefahImaxkGN0R+SaGrRammN21y6UnuR7hGlr/+0uYdcrOKT4anu8nVD6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU7aBiAA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU7aBiAA"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso367082866b.0
        for <linux-tegra@vger.kernel.org>; Fri, 19 Jan 2024 07:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705678621; x=1706283421; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3RrqAr3/KFr32/ENgI15U/tyA44dY1QTAio0IfQb+Q=;
        b=TU7aBiAArmqyIQYrJc+zqzfnOJjinbC+TMwDf4BJEncrE9BjIjhzSLN/vt7igSiVIz
         w8eRNTYkRxhVLLQoLyrI8sXOohgUjbfP/v3f8zV5FTn+8WAQ+2w7UnjZdCodnnX4LSja
         2L3rfYyBuv/b1g4OkuYgfXy/+3hIj/f1OU+eqpn6x5mSwzFJCZZFcDatZz/WgICPisNK
         46sFXvWjMYUaR9jQul8yY2vF+pkgHRrRGW87zzonAeo9JAZywueVWOKndIYVgXVs5tv5
         bsDGMk8Yc1FotfUefjPwxQGIUIK7N1FvGylI+4Fi5CKYzZjfjl0MtEvn596NY0DhyC53
         bTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705678621; x=1706283421;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3RrqAr3/KFr32/ENgI15U/tyA44dY1QTAio0IfQb+Q=;
        b=lmXMFNT2mkq8hbya2HLS1NZZTGBVmwYw9yFIBOMo9aok6o+WecmUK3uS2T26UUIyfj
         kdtgr2AQVtPU/8inv6BMoFZZ7+7bSa+GLDXpZO1mLz5qxNZW8SUFSgbylnUnU9f/NhJv
         Z2HM/vyAeHDeGBvLI1/OrQGr9ouyU+7WoTIq+78mEcTQJRdJBHybfVjpJK2TErK9JzX3
         yGgYfojcPFbE5+cg3LSiQOK90ky9hC5vigWgp4/k6BZPa2Wnomd7gGXvwryPtF1mn7xy
         n7hsEIfwacvQ63NbF+wJHjLVl4BtAZqdWf4m5PCFjHZQL3S1p9ir2YoFNFxSRiFk3mcl
         YR1Q==
X-Gm-Message-State: AOJu0YwBldlLvCA/NBRs6df3mbFxFCla30nl+dA+1JGvou5lNccuoXE4
	qalR2QsxiWLf+uBSkSyptVANQZaPN+LAS+jbcE6eEmGnoXRkN5gi
X-Google-Smtp-Source: AGHT+IGqvugpC7Tdwxz4cS9qUCUvFS13bXmNnAaiHHXaD8SQzqISe08JKMTM+UquMtDClekDaR/8sQ==
X-Received: by 2002:a17:907:20f3:b0:a28:bd9c:8363 with SMTP id rh19-20020a17090720f300b00a28bd9c8363mr36817ejb.57.1705678621321;
        Fri, 19 Jan 2024 07:37:01 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tk11-20020a170907c28b00b00a2cd84c659csm9016337ejc.70.2024.01.19.07.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 07:37:00 -0800 (PST)
Content-Type: multipart/signed;
 boundary=0a8074bc8a72996aba5d93a89482b11b55da8480e36070b6b127691ba7c9;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 19 Jan 2024 16:37:00 +0100
Message-Id: <CYISLWR02ZWF.18RE3DFIINWF5@gmail.com>
Subject: Re: [PATCH v2 1/2] bus: tegra-aconnect: Update dependency to
 ARCH_TEGRA
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Peter Robinson" <pbrobinson@gmail.com>, <linux-tegra@vger.kernel.org>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, "Thierry Reding"
 <treding@nvidia.com>, "Sameer Pujar" <spujar@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.15.2
References: <20240112093310.329642-1-pbrobinson@gmail.com>
In-Reply-To: <20240112093310.329642-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

--0a8074bc8a72996aba5d93a89482b11b55da8480e36070b6b127691ba7c9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jan 12, 2024 at 10:32 AM CET, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific

I prefer spelling these out as Tegra210 for better greppability.

> ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
> this driver.
>
> Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> ---
>
> v2: fix spelling of option
>
>  drivers/bus/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index e6742998f372c..b003dad62d596 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -186,11 +186,12 @@ config SUNXI_RSB
> =20
>  config TEGRA_ACONNECT
>  	tristate "Tegra ACONNECT Bus Driver"
> -	depends on ARCH_TEGRA_210_SOC
> +	depends on ARCH_TEGRA
>  	depends on OF && PM
>  	help
>  	  Driver for the Tegra ACONNECT bus which is used to interface with
> -	  the devices inside the Audio Processing Engine (APE) for Tegra210.
> +	  the devices inside the Audio Processing Engine (APE) for
> +	  Tegra210/Tegra186/Tegra194/Tegra234.

Perhaps we want to say something like "Tegra210 and later"? I know it's
going to be in at least one more, but I would think it's likely that it
will stay around even longer.

Sameer, have you seen any indication that ACONNECT will go away in some
future chip?

Thierry

--0a8074bc8a72996aba5d93a89482b11b55da8480e36070b6b127691ba7c9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWqlxwACgkQ3SOs138+
s6HkiRAAq/kJJCHJMiUx8oATn094ZXp5xhtCuB9DyM5/f39QItd93HGXUHTsYWc5
GdDu+MAtIsAXURCYFwa67iLhlOocTeW9foa8VXuBoU0QUP03uOyaCC6I3oARyAen
MU9GpZBZQzJa+OyiYPoxLHiQ1eBx2y1a5oTM61ZB+0nG9fcrc5clgOGH8HOzNLP1
Yc9I88rfKbDN1RHQig+BTGvlikHo2G+7hSJpjn6p2WGrKs7qx7bwi/kcYyMdCVi2
CSvV5GX+hUMM04g7ZN4GSbpiRmWZLiFmuOWypsiFNTo5C93NHQHgwzBXYdDZXzcQ
NrOhnVJgtqQ3ie/fsH0esF8ccHYe8bYPxIrf55uljArMq7W6/lLe7RoigSRegCB+
cJr9JQu1MSL8IgMhN9FxNZGd0nL9GRyVAP03LbS+qcyxjZZcENhjqed9+0TlM+po
yuRDh8zMHMTJ7I65jpH2DXBd9Q6v9ieTEQTvmV1+xB6a/vTfGSqMAzmTc1hCo2Re
wCNFLFM4ra4OWnFiXljJlNwLZA0hCRbOh+zNRvAgUDYEwrLAvnZ/yttxHT8jI3VA
vD7mlx6aW1KndLg0S3neJG7KTFHWLO3QZAluPNJRTJJbqkPl8PiFku1HSw210oEU
aGwlCTCYd/g2TLZ77w0ZfrU4fYwF1hK3DZcYMYIrJ80DRrzf1cE=
=4B7+
-----END PGP SIGNATURE-----

--0a8074bc8a72996aba5d93a89482b11b55da8480e36070b6b127691ba7c9--
