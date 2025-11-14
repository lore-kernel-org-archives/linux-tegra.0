Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF8338925
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139949; cv=none; b=Dss/U+u3Tzfn4TDVAILHYhs7cUkGefnFOGL6iZe1CSbnIVsnawhiWEa8NNLyg4nR9ODjQV0jCFaSUjja7s6V7+tK8ezgiij4kHAND4qwO4qieGXFx/lKry9r+RNcURH7xI0CkDMViE8K5F8an5dCNmfIidPnpCWWGcsp937jO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139949; c=relaxed/simple;
	bh=OH5hIxPoTQPUemMaT6gOHq8EzIkaGheF5/Z9UjPiOv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh6afMM5Wh4TOUCeP28CEXlXewfOB+wWk/RWoFP2gpQGkUEsigoPKmLpjOOAlRwIosTbnSW+S+IcxKCOzxgl95VZ4y43USLQNKla2vZHmhDhmTAUrywOEe6nLZeaaHOwqI2qO67zkMnjG8zQjShbdrTZHfe7QWF6eK/U7xcGeSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuoaSCrI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuoaSCrI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso20422035e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763139945; x=1763744745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KwM59tVfyflKAhPmZndrw1u8i2PaDEpbrdk1YPSFhU=;
        b=TuoaSCrIGkjHIrYdJFs++qBl+xdICoTY2XhpAO8xFWj2m6FRxP0f7/DftGQBHR6/3R
         dHmsx/lc+/0T9/sormqhxmMsvOIwMs/dxvz+udRfkpAHmKuTTi9LDHgOLykv3+BDuNOE
         xzezzk7G0K8Ybge8gv9cQIp2WYF1yGRHyuLO1/FZQst2Jr1reeb6+KSEREbgdLYjhqAP
         R/8gy+HfA5Iz/f1kcecwpjCsK/FVGtk9ag3E5hyliiw5eFW5OE4XOFnrNBApiDvvt5yu
         O96SjdRIJq7fpoH/kwPQGKawv0NjYP99kkNUtGlk/mj7TBrTm022c0vIgPKvPX6C/y1t
         7LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763139945; x=1763744745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KwM59tVfyflKAhPmZndrw1u8i2PaDEpbrdk1YPSFhU=;
        b=ipaOgrdlCgsh+NVO0fMtE2iThzfDWn8Hsr7h/ZY/QeTskZvGcHg2CdOc0HM35IJzdQ
         Y7RNVSCgKCycADNo7vo58DDrXVh1Jb7nRruWC26w4eSHvadB0IitWJgQXMV36pr6frar
         PFdGDl88TXgjlSGV7i2DiH+UoUDNbyFrIYRTn+eYhpyGx8wPgrn2M6kKgK9LPT56DAOP
         oikmSHysMp4x5m3910DyvHySg1tSNL0Bv1EOmmPS884v3c0BV211gmt9wK4VTIFkLBtj
         KfY8ApAFL03YBA+6hDj2lg737ubCSE0Zo512OFGhbb1w4XRelv6sdAx5qDfooSOwckp+
         hC3w==
X-Forwarded-Encrypted: i=1; AJvYcCXdT0l5GFAV56CmB4uNXwVXEml9pkAT6xDY8LXFccXzRXVDMctM4ceFJHWqldumryNkU+i72/AeLsnc+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9jcECgK73iYzv+Y4K+iF2GW7S1yTb8HTXtKu/k+si7znGoBZ7
	Ibhw/lb51PIMuyUKQyFaJKzs7ExFQh3545Neey8rd3zJWm/GGX+Yz3EP
X-Gm-Gg: ASbGnctwVjw3N7clzksTfJSGT7WZ72FQbIiG2zK23JDiTFYWMLYDhGRGAPwcBoxPUfi
	GdvI0iRpuOwUdaWCsMICUM455cPBrTKlMF5FifCgend6EF+ldhAcOz/xpQRvr8PLNF/rSpCfE9e
	hUWmCGSyd20v5zAIuNk57Ltaj7eiz2MV9hwWk1Avpnve+7NLM41No38stHSQ68ZcdC3adR0TrW8
	tHLDfX7ZHAS6O7x0XNP/88tD2RKA1jfRL3CO38aFqyXEgGtFBHdXKJA0owkT20O4pADkFP3//jZ
	o5mxtOQaxfGkZQh6pZi734yZGX9sDGfcU2BAZUyqPcNOzImookJr7FSYX1kvEVSPgbhpKov9ajY
	6R3042vjmuzwI8xgDpyrCSYxo6fai0RoJ7+NAxbcNDvmKQNuvW376u8picC6ES0+ByuXs5MxUy+
	zGWS0Z9Z/HFpkX8ypVABDmspS1aqs44DfdHahfkiJBcDyEZP7PPsNXnIYp2B9v5tM=
X-Google-Smtp-Source: AGHT+IGSrEjb8JIidJB59pBg9e6FGeWjjYrJDuFzsyaK55oGlWsIWqJPZRjSrpRNuZji3S2HxrhhYA==
X-Received: by 2002:a05:600c:3586:b0:477:7b16:5f87 with SMTP id 5b1f17b1804b1-4778fe121famr39351005e9.0.1763139944999;
        Fri, 14 Nov 2025 09:05:44 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779524d2ffsm20720795e9.3.2025.11.14.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 09:05:43 -0800 (PST)
Date: Fri, 14 Nov 2025 18:05:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] ARM: config: Enable EXT4 for Tegra
Message-ID: <nsrxdywn7xlcd3j6ztsrcraxqwfgenqdwwjtezzzmjyscnuoz7@uku62g4lk27s>
References: <20251010103613.236283-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wedxe3auyivqakp3"
Content-Disposition: inline
In-Reply-To: <20251010103613.236283-1-jonathanh@nvidia.com>


--wedxe3auyivqakp3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: config: Enable EXT4 for Tegra
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 11:36:12AM +0100, Jon Hunter wrote:
> After commit d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> was added, when using the 'tegra_defconfig' kernel configuration,
> mounting an MMC device on Tegra20, Tegra30 and Tegra124 boards is
> failing with "unknown filesystem type 'ext4'". Fix this by updating the
> 'tegra_defconfig' to use the EXT4 config options and remove the
> obselete EXT2/3 options.
>=20
> Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/configs/tegra_defconfig | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--wedxe3auyivqakp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXYWIACgkQ3SOs138+
s6EAGQ//WwdO/p02HDYI2AI7kanr+7xqXQuVLjXVjZcwUvDE4vIY7OKhLpsVruvs
QqHBAdvUleObU4OTlDiT+xi2U2tOljSpfjE7at69uErc0hGzQIXCSTYBBi7KhbtS
Mk4ff3RUwr31zsCKQ4FlPYeYmikQgA5EhO0At+Z9axf+HSth72RyjqSH7mdgDyQj
TFHucPa4IM6cK0qaKlXDNVn5lRvIm6dkDCa0sgGiY4XkivzXQbucStabb1Kq0euw
wOSpm76OzTU3AJuG7GfqT9MmozKuathnZ3QE42l0Wc/dE5yzPR9aT3tVInMWUr8z
KvkcQqn6nzGOVn3tQqOKZA2b97HZc/ItHokQ/E3+jmaRD7YOOiXH+Nju3yFUbPXt
x+7iv//eZT3ioMF1oRwHkQL5GGhwxmcsP1UbrMcpkNWBePRywinAz3f+Rq8XO+Mf
SW1pnjzwQOLmFs3IyNkhjf1rR/C63YNdj1ORJhR6m4A0qs3r+QQiK+ve3KYIvLJZ
xtuSgyleYLY7Yq6kXdsvaglNZWYO5quyRAS0U/L41ofr/NaHPZgu5pwS9Z8c1T1N
Y/hGNXyDeO/QI0ZXn1HKeY1vcTUISb6nZAM9PQvNCy9hUrJHnIdaWAP/erYwL0Yb
F4q7t2cl5z6hejctzIeVG1lKtFZPjQ3uOg4pe036EHPZAw5QyRQ=
=vZ5G
-----END PGP SIGNATURE-----

--wedxe3auyivqakp3--
