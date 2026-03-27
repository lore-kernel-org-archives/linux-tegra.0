Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE763F23C9
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620966; cv=none; b=D6szey+wmYCgGn/JV0Pkij9K/7ZcxqGWsC7ks5xZNFjL5LKd+c1exARAOB+ayyVqeUgZhpllgQOJjy0TvVxR6Cb0jMc+BkNJUZSo1q5KT+S4LMh6zyLmsivSp95fWAJRsLvtj9LGqxYRdJUGWe6zh6/5KI9ke1e0AP1NO9bojqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620966; c=relaxed/simple;
	bh=NfrnYldXFrO/1qF9Ja2/ZsHIIPRQQkg5X2+EI9uzL3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLdeNpOHy1qroTtAxoUkYI3+nn89j2JaiRXrtCW8pfh14moNGoIe4qfOURKd1/oBu9FQLjSQ7y/RmoiIgKZmnKHI+Hl5rUU7/Iv0idcpIdYyXpZLE/WjeY8TyxJfGChXNUfe4CGcSrTUbxM+WhBzDv1w4kcKUZcqFU9szt+ky4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgW5CoXW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgW5CoXW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-487035181a7so13510655e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774620961; x=1775225761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBkxPIk5mN2wlX9oRYIP2oX6TOJ+Vspsy4ZAIncQljA=;
        b=GgW5CoXWmeK7VeI75VGxZ7QWX/dRELJ3ywtpUTpI+1iomP2bqjSo8jkW0WKnCYMiDe
         amKy7tc/jwa+jIlMacB1ZREY1uOUwNGzmQ53g/TRlwpYLUiy4j2/F9LSj1rsngK9BovY
         lgygmZQ7nnE/zCgiHQ9G6bbNa1IYmYeSmbXSWEALbLGg3KlKMGUkrwg/InNdQAEnoIgt
         Wom2Rrhdf7d1K0DE12wN8X5HZwO76gM4FPBNp245bvIK7UUV0pGVLteruPgZIEb8xOQB
         X+IR6YcwQ3lft6QnCbRPOx+j4WQNrBJpGfkx6MUMGHUEK8LZcrjsrRc1D1y1zTEHMwMr
         xKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620961; x=1775225761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBkxPIk5mN2wlX9oRYIP2oX6TOJ+Vspsy4ZAIncQljA=;
        b=q0EvDyPy8ATzSXvatGW03fYfHnZZeH6azW2pR0ETv1rJZ3m3WAipGMwnpEaO7UHpLr
         YOBDGUfp/IXRmiME+ogOafUBBRIAczF57A6k9kON9AjVlq+YQwip7Mm22bne8lv1ZA9j
         Fd+Gnmc9pcyHRd1EJg0Zh53oi7JB/ft9PBYp+OG6w5aUxv3ucoNfZz1wMnr32S/XxNXV
         a0Lj0oGVl7JKSiYcJ9NcpykfdiZrwzDSfD1SdJotoBF1U3eFIEXPapCOzhl7PN0Apixk
         RCCMCRSgheP0lAhRSCQtdbeWpXtwMURRPlxOa9X/RHgNkr8v0q75u7HTfvu3IAjx7nhQ
         Ulxg==
X-Forwarded-Encrypted: i=1; AJvYcCWpLwp4OsveuiW1tAKbBD0WqDaW+bpECuaHhyVcIZtNQqGHoFaF9otXOAUlNV8ZWSNLSj39Oy2U/WkEIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxih+ARE1o/k7b5dvrbqe/UhaDuZlVPhwg8Sq1nCzAaoIKEwnkF
	pAl/kz43Dw68WnKYktG0heB0K51XPl0J0bqBAXs8yOQjsWDb49n0AjwQ
X-Gm-Gg: ATEYQzweqjTvJ4qV+htuDsmNsZRtg8eDDHsnETqykh2A6yG9gSqBpW2rnz7f9Q0sdEy
	TPULYc2uEzd2pnMKrn/3mOHAxyT0IW8LXe4vEfeZXKIBPiLcL2xFMPxVrV+RoC+OgcfmZiAIqf8
	6HY1JcvEnJVOACpujhz6jLJXqgdb0rOiRyIa0+WwD1Q6m5AYBD7TDWniGfjGBH195PFNDSxwsUN
	d5uVukVmt6uUvPzpCG1tDQKOM+de1DIwKuod82YbQzFGzSTx+UlCmtxY20EdyOKf9a7dBRux+uS
	gNSsVgbxbm7yiOmIs3Olpq1PHJ9w78+9icku77Ckx5Rv/P5gHM9pVzjjGwWi0c8q4G68s0cVG9s
	icwyaWiSTrARSNyHHmSLfomigx7hHzIHc+a2VED5qE7o32tzA0w/rfX1cH4UGMXzHD3yE2J9eGU
	0GNVxYOSkjoB5Sq/euUijyGeKFVf5JwC3OAIAds1O/yiU7dsls6rocB0IbIjxTSco+ZQBqb9ve2
	zkACSvz5T8Sew==
X-Received: by 2002:a05:600c:3504:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-48727f0b109mr38616025e9.28.1774620960702;
        Fri, 27 Mar 2026 07:16:00 -0700 (PDT)
Received: from orome (p200300e41f249a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f24:9a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm15534748f8f.30.2026.03.27.07.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:15:59 -0700 (PDT)
Date: Fri, 27 Mar 2026 15:15:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, andi.shyti@kernel.org, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 RESEND 2/3] i2c: tegra: Add logic to support
 different register offsets
Message-ID: <acaRFEjSEJsQ86iT@orome>
References: <20260324055843.549808-1-kkartik@nvidia.com>
 <20260324055843.549808-3-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5r27mzvj46mjgq5f"
Content-Disposition: inline
In-Reply-To: <20260324055843.549808-3-kkartik@nvidia.com>


--5r27mzvj46mjgq5f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 RESEND 2/3] i2c: tegra: Add logic to support
 different register offsets
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 11:28:42AM +0530, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
>=20
> As the register offsets are now defined in the SoC-specific
> tegra_i2c_regs structures, the tegra_i2c_reg_addr() function is no
> longer needed to translate register offsets and has been removed.
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes in v9:
> 	* Do not remove dvc_writel() and dvc_readl() calls.
> Changes in v8:
> 	* Replace usage of dvc_writel() with writel_relaxed().
> 	* Remove dvc_writel().
> Changes in v7:
> 	* Fix Tegra256 reg offsets, change it to tegra264_i2c_regs as it
> 	  supports SW mutex.
> Changes in v6:
> 	* Do not remove dvc_writel().
> 	* Keep DVC registers defined as a macro.
> 	* Correct Tegra20 DVC register offsets.
> 	* Remove sl_cnfg, sl_addr1 and sl_addr2 registers for DVC and VI
> 	  as they are not used.
> Changes in v2:
> 	* Replace individual is_dvc and is_vi flags with an I2C variant.
> 	* Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
> 	  patch.
> 	* Use calculated offsets for tegra20_dvc_i2c_regs and
> 	  tegra210_vi_i2c_regs.
> 	* Initialize registers only if they are used on the given SoC.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 359 ++++++++++++++++++++++-----------
>  1 file changed, 237 insertions(+), 122 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5r27mzvj46mjgq5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGkR0ACgkQ3SOs138+
s6FKqw/8CweAE6Y7dffR1PBWYGu1uJ4ojibdZhPDKm5M2SV0Bpd+YfuWqkNFM/Uk
Hgp8aHA13L06Lb7JPeVUoQMahlEpf3KjDwPD49yPGdaZM4sY5d2VPpqjAaeOGI+R
IevR/bkhmdgiRSlAVYSzo0+GMeXhKZdXa3pAatkL+6Au1p+aT+/yNwlI8xmZJO/c
5JXUsBoh7dO0t6OkBijUllGLgjxjK6c5PQz8Q2X6GZTIE4VUARCJc125jYZfpJFH
mrTKhOBXSwbeGPQOWMwA16mmtRaag3c1ddwyYXPA1Jh1rpg8qhUVr4L0kfDHOO1n
udbOrl+d5Hxpg6xIh7yRALG4rFcGYXauHa72QX3U+eHxzrBX4BG7OHuTLNPvqqNi
iGkXn4w6Tkl/LGrFjXzAFGMjuZ0dWrzkpq0yS01SgQOV+bD+V868PPxYCAs0rvDo
BETvI6svaHiEgY66GPtH838YLN8kQvca5lqzUHu8skUCONl8xkB47lCtLsEo5fIU
g4XOcp6sozYQI9j+M1oqneKg7p8ENaTqGkpdU/kBzoZfTgRa0XkKN1QaWj1S+Ds+
K/qtEb1DrFBnwxYQYEdUhna93FO+WEmFfutyd3GH/+FxJforcdu4llZ5mtcAMHcb
XXxsFmaToEepajaNCDIGSJbIOhxClEs1rKp1OtgoOgXCzHCAteA=
=FGJ7
-----END PGP SIGNATURE-----

--5r27mzvj46mjgq5f--
