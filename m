Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C838D278165
	for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235897; cv=none; b=V0mB9UK1ogXxOkk5WQNawmzQJlKo4iTvzg/e9wccUrnE3KfwiJedqcMK9h+3A84r+W9L1uDq8gVhOBVuKXKXymGK/lXvyr+xD39ACfWMoI3OzIed/YfDD4KJXS5wQGGpvO/MHCxLyBaiTkFMeqEkOgJacubGl6kIrfRRcFhAyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235897; c=relaxed/simple;
	bh=/08PcHxw51nm+it2dWrgJ5eWk8Yd/Pq/YzWZXPSWdUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYJ4vvb+gctFycsNv4xQRhuqNFYIVbISozeIpf8/AhDUALAXMA5m7/kgKo/hOmcUVT7Uo2FkScKFHjVQuK6Z0BnhNIeN5Wyx7FAGs4qm7c4LjNoDOYjRzHAFSXCsTv9R5mlE8RiMTAi2ukdZuhSv9decrmSqWpjFWeP1bHUrUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXsGE/lc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXsGE/lc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so4393585e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764235892; x=1764840692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjpdIzupHn93R6eK11UuuUB2G3dSLzMnj28Tach0iXk=;
        b=hXsGE/lcbj1OKQ1NDZdvCpymphAqWwMgc9UwbG0xfOAt/iSQpDbJL298HyDQE51ua/
         cfR4hTtzLFyZv2DcwxZ0QefDbbvAesSdVoXDb2P8NYpnb/ZiZUrj5zuAPUqNrjTJBgcc
         OCAMON2zHHkoSTIKyFNWkxaMpYvmv54ogkZ0/cRvrp6JNCmtxIXkdLdl5iDwGpMNVIUe
         GyAJAKW0hoIHDwiW2TX8lxRczSMHuAimocz+hvHsFzUviAWw/GHqnRwurHczOM7J28mm
         uBqBcIPI1JxQzwV87AYUiQTD1FDW/H6ElXtEj+/KUxM+M8XsQt31wRXx8GHFPkqi5JPM
         0cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235892; x=1764840692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjpdIzupHn93R6eK11UuuUB2G3dSLzMnj28Tach0iXk=;
        b=FimG8kSGuRIp+m1fHcVRJnLkv0kGhpyxUlM6scEKFmIgdELKAQSzAXn7NhNcWNsEG1
         BAYbKdLr37cyHE1tL5iNGzz0U4roXpXzGiUbY5wmd2HyMwKyXV0IDxWJwS7H/RGo9HHh
         Q5Ian17V6IQyrY5KiFGEWyAmaNsuzCqgPFdgp8tcbc7CGuuvnGvTc5o/XmXLlo+2/aSO
         Yc9acuqnZ9o8FfTRPgfeI54+ymRlv/WdtbEhHli6sYLjcXswI5igIV7dcpylAdsKhn9r
         KaXEHx5ZanSTPo/j9FCdT49+xq9C1BoFKFHOb6mTV/YoEDyy3mIOsiazdQn+AivrxyKk
         uobw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0JTHvCysw59X9p+mQsA4oVivGnXwvVF7GvapwCethHlZdX+dbyA/uuA0DS0Pq4e+OoGHNorFeTW93A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhtLa8rINicD5IPzJmT81+61JNvTpbskD3Xsy8lgYfTyfGYNF
	xm03+w1SH7gjcSlYvsl6AVOmWO9Qou+6aUl7oDnxGEO7MX6D6mIN/w5+
X-Gm-Gg: ASbGncs6Jir469pvFYXF9sSbj+N5WQjiBYbLLHU/LxVxMFuQrfbrUVwMsMUTF7ceMIr
	s1EhnxNxXjtXG4XhoAaJoBoR6nY0pQgywIEkhBNV2xWTWmmLVoFxHM7Dx7smLf8+VmpBGHrC1od
	oU2x9CGo2k5M1ODNnwqGi4IKfR1nbvNg7bkp3i35CyhGlYHO1HyWkg1y9T9pr90trB67X4E2QXs
	ChgpDdwwLDYixm6CAp46WNtFMZ4ZfQefVtuxtEgS9ZNOiGWX7RGcfARvFlG+3Db5dKBxc1yon/z
	zpwCqd8QOA9VEHrKyJPhyvSZp7KJT2gzkXscr7RjOgriRaiNz1icg/FxPuqoO581bmBH0ZgP/74
	wnMv9fngcgH2xHZ6NnfE+ULrAjnzwfv0Gmy06PKVne2KgRVGiZd5g9Ya4WZ0w6ZHtCaR5BWfqSY
	lhZQ74mxlBpsYhrYigSgV3YZ/kXy+TGt2g3FBTmeHuiLZVSJ9kf9GCoYhaRhA0Tud6gbDQsLKV8
	bvxcA==
X-Google-Smtp-Source: AGHT+IHHZV1fl/8g9lI9eJxNjHacdNGXvjIn2me3Q9h4Yz4Yynh+5UaSfxvv9G3kOMyGmEYIeSSPNw==
X-Received: by 2002:a05:600c:8b37:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47904b1e86emr83504095e9.22.1764235891973;
        Thu, 27 Nov 2025 01:31:31 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm84894705e9.12.2025.11.27.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:31:30 -0800 (PST)
Date: Thu, 27 Nov 2025 10:31:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 3/6] i2c: tegra: Update Tegra256 timing parameters
Message-ID: <7ras6ev4ljd4d3zwhq3igrpf3fph472q6o3zkxh7uyjj2gwb52@4wyse2zipszu>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ckj3gwx6elm5l37n"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-4-akhilrajeev@nvidia.com>


--ckj3gwx6elm5l37n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 3/6] i2c: tegra: Update Tegra256 timing parameters
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:17PM +0530, Akhil R wrote:
> Update the timing parameters of Tegra256 so that the signals are complaint

Nit: "compliant"

> with the I2C specification for SCL low time.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ckj3gwx6elm5l37n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGnAACgkQ3SOs138+
s6H+qQ//UlZJT/+M2rR+ZHLJqLxmBqFCFZm6Ak8BLhKAUxVk3JVwQmEXm9VEoDLL
ljktGTY+4GTL77VGfhWAgY5J5Dv0vtxQMx/ggki9KC+0Tldj8W+4y14+H6mVwkPS
Xzei8Hom5FuT9NcThVx68Q83gOidXcy9+IQguW3cHsC2PZdhu4hdWH1ueC8uty2G
UK7USErbzpc3R28NLo6/Qo9PEou7uVXNVUIc+XgBkUC/lrPkSIDOMjohmNOiHWde
LbStpSUe8kqQGGTVmCnGEpp15eTgfnugBa3tXYMKZR3FLLK/ASOFV67uCbgqbcbj
YiVG+YO4y2n6dnDv00r0Z+vh+ROgsEm3KTplVaFVXxiiqFpucTWMAqQWlPFHOqcy
YEkMFxazIwrcm3CFhyPXJ4T2r+v/R1eHN4lbldETGXtCiSA3CyxEOG0aJatG4g4o
eZMZvG7096mLPPZG822Ycl9pjmoBLm03yQVki/178JujSNCxYI0PMQANz7JVIHH/
lAmVE077dhwcV/HOwktqEQ18aU0YIo36bgWXULy6f6NnOE/IVpZ9P5ZZDOZ4/Cel
Lxyt3lzziVIvP1ho0cCo+gVSi6Ba/o2hnwhwLHe9TKwZZTnREHU7+GrxrSMMmsgQ
CbLf91oqvDS9KringyXrbihoqRBgAMyu3vzSckNqfFGBcIWcxkg=
=kHv9
-----END PGP SIGNATURE-----

--ckj3gwx6elm5l37n--
