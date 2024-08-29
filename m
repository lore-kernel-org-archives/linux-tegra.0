Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95E1B1411;
	Thu, 29 Aug 2024 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945175; cv=none; b=eu3ByUvZe+fhsjyLUo/JjHoe6Hb3QjzTHZ4Hrh4MGkVgdnYb42qpKCfHH6RrNhqRwX5cTzb1ammo6H4uU2GhZpfbqh7F/gcvRADV8ng+pMrDgjnvKaE2+MQFR+o0g9it2x4bqay80LlTlFYDd5WkUmCJa/bcWK08wAyFEPWFf64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945175; c=relaxed/simple;
	bh=E64+/rTlHIhV8w2ynBojlZI0qR87eW+72PsmAVPKhvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyfJimnHpcmXC8OB3aReCxm2y0KtBq8x+38pE1GBOog0AohJ0Lu5lCUR6ihfyXW91AqQ+7LV+vAv8TTdS1nMUkopu2NPS1pPUlCddrTma8JUh0Kdu0bGuDr4ukZV2sT5itVBjJr0zeB1TauJ6tdbkCrFrhAMn+FGDT4yesqvChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y99SYHQi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y99SYHQi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso500975f8f.0;
        Thu, 29 Aug 2024 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945172; x=1725549972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oj8SbGZsIPIT2zmoQ3FCznFjgKHPHFcUOdD/u1KoOXU=;
        b=Y99SYHQihsvbcnA1aAQZ1X2hUGKOEhw5m5czkm/8HFkD4YdsrxmurfQ0dtBnfhvG+w
         YzHYkzJN/9McLLRii8xET6WQd9uRO7re/6q6UiWESNxTOgyr64+UywvAKo//UlISnrGi
         9xrCoNC5g05jEuTqRF8P/v+jMT2oOgypWwdNaOml/ZYhuNGKYvVUB4/t63NHztn/dDSc
         uenLWL41jhOsXTLLUCzxocLFImt/rFC7trxycUG60hUtdHzJ8n7LW4/o2rEJJn1rHkaS
         tGJQprl87076F+p9YzIp2adxat5j4gEoEiaLHWcnsNSMOgNThjXB0/KUpDG9neBwG6QP
         g8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945172; x=1725549972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj8SbGZsIPIT2zmoQ3FCznFjgKHPHFcUOdD/u1KoOXU=;
        b=s9dbu86ESx1GTCaPt42EILoWUbgGRi5wbCLKQJOXc8uU1+9IUAFEnZinOLcacrTTbz
         NTfAi+8dz2mASme+zA8qZLxqyF0+J/NJD6LNJMnAC4HhrKI9evox6cc6JTy0qZ1LwPio
         Tv2PqJJf3TyIzSNxDCCfewd3gpAwg8T4gmBV2ev83qaDO+zd8hujaoBCpRg522guHeDa
         mgnQb3DBeQrWmC+3nR1TM48NQwUKpVdNJLr6ao30HYKFfJctkIhtEcl1k8AT6zRP6x61
         IE1mnunb1rY0Xp1c6PRpxDr+5gue0hqYd2sAfRbXvNpkD3O5gbZOhNQe9LWAfG97RzcS
         9y7A==
X-Forwarded-Encrypted: i=1; AJvYcCVNKkaDtRDx74utCmknCJYUe30r+9QeZKE3B2DvGErBbEgVm9ePRCH1Q/EZYPaegZVib736dqNymUlVfjPd@vger.kernel.org, AJvYcCVsxRYIYuCMowL4Ln3v/odCI6hWl+opGyJCLrM59uXnzFz0Rnfq7eX0jHu4UmBvTtCqhoiYcoPnpQB5pc8=@vger.kernel.org, AJvYcCX+5HTg7p3GQvsAAbNRfAu0VkrSilOxo9XuujBCnR7Oz4SuN0f6zlM53POTWeL9K5yofKCw6hqOsaVg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb52jwoRAOGr4nEUiJW9pWJ6O2Y40ZiArXWM6Z90hPsqzFoeaw
	XkHF7ZETAsZD98LAmtrudeknoQXowwJeFkR5ag3lOxZlIoB4HbUnLsCITioI
X-Google-Smtp-Source: AGHT+IHP0OXJXv4WkuN1TcI72+6EAU4MNPCBF7fJ0ui7mZaXbtB/CGHPHVVxkmwaz7r45EsaI6jU+A==
X-Received: by 2002:a5d:4a8d:0:b0:367:958e:9821 with SMTP id ffacd0b85a97d-3749b54d0c8mr2455333f8f.29.1724945171897;
        Thu, 29 Aug 2024 08:26:11 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abd2esm53798565e9.22.2024.08.29.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:26:11 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:26:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/11] Tegra114: complete TF701T device tree
Message-ID: <deznx2y3vb4zj4y6n22okly5cqjq7sbe6lwmtlqkag65mcmcto@exthbprmgvpy>
References: <20240806123906.161218-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w2xhdq6xdnppmbho"
Content-Disposition: inline
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>


--w2xhdq6xdnppmbho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 03:38:55PM GMT, Svyatoslav Ryhel wrote:
> Complete ASUS TF701T device tree with available information
> about the device.
>=20
> Svyatoslav Ryhel (11):
>   ARM: nvidia: tf701t: use unimomentary pinmux setup
>   ARM: nvidia: tf701t: bind VDE device
>   ARM: nvidia: tf701t: correct and complete PMIC and PMC bindings
>   ARM: nvidia: tf701t: add HDMI bindings
>   ARM: nvidia: tf701t: add Bluetooth node
>   ARM: nvidia: tf701t: adjust sensors nodes
>   ARM: nvidia: tf701t: complete sound bindings
>   ARM: nvidia: tf701t: bind WIFI SDIO and EMMC
>   ARM: nvidia: tf701t: re-group GPIO keys
>   ARM: nvidia: tf701t: use dedicated backlight regulator
>   ARM: nvidia: tf701t: configure USB
>=20
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 1516 ++++++++++++++---
>  1 file changed, 1289 insertions(+), 227 deletions(-)

I've applied all of these with some minor tweak (mostly whitespace, but
also updating the subject to use "ARM: tegra:" as prefix).

Thanks,
Thierry

--w2xhdq6xdnppmbho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQkxEACgkQ3SOs138+
s6HVcg//SnxLMpgN4WY7+lFi4oZfB3Oq7hEZVTUuz2sptaYuj3ylkYn5JJzv2ApF
dSbdO65D7dZajgWCaR6kRWISmbAMKmxCifQU9u/dQKnZegvxEBuKbloGAS4thWh2
46KLg4GBjT235SbjOPoF1Lzoie0/SiJNWTbPeaLH+n1IrORVZs2QAbZFbl/X5+HW
RqMsPGAndur/giCjtxYTLLAItGLA33/5X1+4nzTdFrL76Fzlr5hMX/NIZJ2n1/vh
/N0GGKeVP20u6QegGNnfaeZQEJaOlMCRSiLuuCTrugYq9TCm1yEiiWVi2tc2UItf
IMlJeL3r8Hizuc8nU1iQVEPTLxrRa0wO/u0gag2qJhA3w/qISSXFeviwm+/XVh+B
KpFqr4vixOINZvK3p4/qmy8wL5LUF+IkYaNKXxruQH8BeiMYLptyJYZOc5FbeAmr
EHvFFf8R24X1twMobTuK+3veDy+ZVH42DRa50Sz/X1GI8Oqn+ByqxZpR6VkmcbYu
WcVsAQdOzMhf2vGPiwxTMhsmxTvjIR1YTr5PK0v6WEwLDM0sgyYZ2tTz1BEbDrgx
dXjXBGw/U2khlZJzoRMnRIykMeC3Kf9zrH6ecGof99wc1dREPjRTkVRzx91BkRxi
/3RRahQzuEO8BeStuwwgdsGbtDWue4bxsEmJfJqu91/UAXcQotk=
=1owH
-----END PGP SIGNATURE-----

--w2xhdq6xdnppmbho--
