Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2678D1519A4;
	Wed,  5 Feb 2025 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764927; cv=none; b=qr1HPH7c7MOVltp2Eo2sTBjq2FlorL0tu18+bO0/VBE4niLOa8sECYUlp9pn0XzNTzGpGf7XSWUghFbCgLcRH1+et8PQiXXS0YvkC5BsGOLSkdS3lKnQeWe41IlPJzfCx7/JpyA8LRE1EmVbuWt6qCVVOOwArAp5BjxNZsjLZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764927; c=relaxed/simple;
	bh=K9MxXJAzE/5V8y3RnE95M277Dhdg1tieL4Y2vxbi33Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRE6Up6PPuaykmdoFZ7higy+Kg97yT7zzItTzxGbV0M4lbNnpfDoBX4O5eEZumjQcj0th/FqG8FhMNWRZsovBuN9L4bkMCUvNKUntmMUIvq9t7VeJ2u05Z4XpEktGuxo0Mykn5WpprhFGWMNjNJ3F+yMvkH2RpEZPSYnEzntxNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQzo5ObJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQzo5ObJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436281c8a38so48354235e9.3;
        Wed, 05 Feb 2025 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738764924; x=1739369724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/NXXdDcgKO6ZclLlGW4nSts7m5ZN5bv2I7qQmsbW+8=;
        b=fQzo5ObJgvkk557gPbhZETS/YY46dlzv1IN9zVtcbRTqHE7KoCdfM+fRD99W1ry4O2
         8XBcSa0VPO3N4av0i25NrYinra6K9hh2pHGWfOA5Q0MkX5mdAjqQLj7FPQpx8K1KdW2p
         qtZ8Ryv5UQzwErNn7EQNl7yMBZ0SBHHUvsbZr/pZ2i0+fhjA4KDFD1TC+jfrTEJusvfM
         rRNVIWc+kDyEsJdg41FKvziPopR010QYmNmd0+Yqw9gCDNftWnD5VSwP+QRywzdsoIET
         0/HD0hvKPQ/qEwgyQUiiPrFfHUkh0xQM/f7oeHJzsPTanT69B8UNPR1u4SGI62JMIG7R
         rKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764924; x=1739369724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/NXXdDcgKO6ZclLlGW4nSts7m5ZN5bv2I7qQmsbW+8=;
        b=LjsA3jt9tAX1S70lmWStJ8hi7HDdVkxdUjbns08OnsLul5tlReXpevVfQTcdKBXzCu
         50LNjVglQw45ehwRcfxbGlbUQayjZS1toz2vGcsKwT2Wp8jlNxuc7WKp6Rug9bqkJ1R8
         M630eM/kQvqXsVKtHVEFiZwC1ivwdfMSEP5/G55QBf/rWuAeS11Yhnp3jJZDkesb1hx6
         NYL68GJKOWtXn3Mf8lZpunzCPtxSZTzIqSSVkC9Aaw4FE2YeBSjcytdofiQg6MaAGnmw
         yLMOwZ8zLInlWVVNEMx8D0+0DDV5gldxR6W8eGjfghfTk9O3eOtJAB5JuYIHwit4WcKT
         wE5g==
X-Forwarded-Encrypted: i=1; AJvYcCU25a18u805JNTJUiGaWirp3o4uUg59VVlBoSwLPSrIs9KQUHXP8YJ8Y3XWIRaDibYAv0Fra1WNruOAAvk=@vger.kernel.org, AJvYcCVrBtusXzYccvX1TI9S1YfZtQrr0uRWSv//xYR/5wYaKNSOqExzou1+drpf8o1uR/gIVjKVHktJ1qDJlWc=@vger.kernel.org, AJvYcCWqXzC5x7rebEl+OM9iIt8S9vYzGAHuI9HII3tUVNlwvvfc8+iVlsDRHHE0EGhJb0NSHNpK9dD2X1orkow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtkugnkJ5CHipVd26ti8jXYKuMpLyuzxwc/6VpxxQAo8VD5zez
	Q/2xItkfsKP4IwAjGN3i5iPozdgSMXI1ficJQAue2qwnZew5o2lccAe5aA==
X-Gm-Gg: ASbGncvFYEsF3j8zophhWbAQcQ9ismXlcmcoB8d4ow4CtgNBY0Q5ypBlsObq0aHDNMY
	XXNM6juyYbdE9M6LhrMkytUPH4iXyxSPKLOAX/fLjAN/rXCsGYTIsegLJovXNFzGDBLddAYBXm0
	Txd9uxbU0mhRTIJwopSNCU0kCLYqJqyvZKHJX7scSR5CaAp144O/0HJ/FJxWSYUpvd9i5iazQvR
	Y7vzuxQCgz2LxYoWFNyFFTYOcE/evloKnvwmEZvpLmDbyfaDwiVZqSm+cPbtOK6BlTtPtSJ8jHn
	lXzMzWD4mkD1mGaRgbbK3ohbmOMC8QfdQlGWYSe5PKsEO5NlUImBMQaFO+DlkiHtBcYL7fDgfeA
	aFg==
X-Google-Smtp-Source: AGHT+IHOCy8i2UKdFurN9zjvJS7a08G1zOqiWVyrthDhxKETqjPjeaQ7WgsWUtA5m9zAKOO4/kBpxw==
X-Received: by 2002:a05:600c:4452:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-4390d42cc54mr24356075e9.4.1738764923968;
        Wed, 05 Feb 2025 06:15:23 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm23234075e9.36.2025.02.05.06.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:15:22 -0800 (PST)
Date: Wed, 5 Feb 2025 15:15:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, 
	mkumard@nvidia.com, spujar@nvidia.com
Subject: Re: [PATCH V2] ASoC: tegra: Add interconnect support
Message-ID: <ftyikuzu7avxlbyfruubjg5zucbstq5psilehpoahvdhpuqlr6@pcubq7dsm6fw>
References: <20250203105304.4155542-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cqh3gyz3giblo4rm"
Content-Disposition: inline
In-Reply-To: <20250203105304.4155542-1-sheetal@nvidia.com>


--cqh3gyz3giblo4rm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2] ASoC: tegra: Add interconnect support
MIME-Version: 1.0

On Mon, Feb 03, 2025 at 10:53:04AM +0000, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
>=20
> Add interconnect framework support to set required audio bandwidth
> based on PCM device usage. The maximum bandwidth is determined by
> the number of APE PCM devices and maximum audio format supported.
>=20
> If interconnect property is not defined or INTERCONNECT config
> is not enabled then the audio usecase will still function.
>=20
> Validate bandwidth updates by reading the interconnect summary sysfs
> node during PCM device open and close operations.
>=20
> Signed-off-by: Sheetal <sheetal@nvidia.com>
>=20
> ---
> v2: Fix pcm_id parameter uninitialized warning.
> ---
>  sound/soc/tegra/Makefile          |   2 +-
>  sound/soc/tegra/tegra210_admaif.c |  24 +++++-
>  sound/soc/tegra/tegra210_admaif.h |   9 +-
>  sound/soc/tegra/tegra_isomgr_bw.c | 132 ++++++++++++++++++++++++++++++
>  sound/soc/tegra/tegra_isomgr_bw.h |  31 +++++++
>  5 files changed, 192 insertions(+), 6 deletions(-)
>  create mode 100644 sound/soc/tegra/tegra_isomgr_bw.c
>  create mode 100644 sound/soc/tegra/tegra_isomgr_bw.h
>=20
> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
> index cea4b0d54378..defea7f53f11 100644
> --- a/sound/soc/tegra/Makefile
> +++ b/sound/soc/tegra/Makefile
> @@ -13,7 +13,7 @@ snd-soc-tegra210-dmic-y :=3D tegra210_dmic.o
>  snd-soc-tegra210-i2s-y :=3D tegra210_i2s.o
>  snd-soc-tegra186-asrc-y :=3D tegra186_asrc.o
>  snd-soc-tegra186-dspk-y :=3D tegra186_dspk.o
> -snd-soc-tegra210-admaif-y :=3D tegra210_admaif.o
> +snd-soc-tegra210-admaif-y :=3D tegra210_admaif.o tegra_isomgr_bw.o

I don't understand why this had to be tacked on like this? Why do we
need exported symbols for something that looks otherwise very specific
to ADMAIF? Will this ever be used outside of the ADMAIF driver? If not
this should just be moved into tegra210_admaif.c and then there's no
need for the EXPORT_SYMBOL() either.

Thierry

--cqh3gyz3giblo4rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmejcnUACgkQ3SOs138+
s6GDExAAoAoyjpYgo8IxgRo1iJ0rnn3HHg+tYI5vmZ38biLzRJe+N9HpoBMrjPwd
li4HLhhIzhH57LXkALCuBFfxdR8/72YbHSvNlTEk4nIkIblbyA0MzojF5z4uhAsu
DnnSUYcqIWOM0PwK34Ak3heQ7Y4OCvQ/+SRdneJXmrJK5STvnJVULes5+69p79RU
mCF5kmQ05cPfZc+ZXmjl4kKyb1Dk0/s5c8MTfzMrhZOnlJNRMou+/F8TqmadxgjK
PJaKlpeNM3gmy9sv++RQUF81lBfYHf1Ge2w2w/sdaxs8uFs9+kNMvmAKRvuMsro/
OEsftYyzpKNdLrJK+BDUBzQPkRRE5+sp6KhFdkYItOL782usz7obBINNm+ibC6fJ
HBooQqXLxvPwpaKh8CZe4jUnkijMLAd8EWm/e4F5x1302BNRGfkg9WpDLCJ5wMAu
XIceT4wgW9TY+UsFamLOnEFDsKE064gaTaLwWAXkXsyVUJvjBDmTH+2hy+qNWJ/z
k3GctRRHEnwLlasTBUH/P0r+N6xQd9PpUlkIvBqOiGSBO63OMrvk5Cd1JKmW+zh/
kGamv5rMdGkbbdYndYw6mWSNuCetSPpOomAjawo+DlJe4a/C1r4v5dZk5ksEfxhZ
vIg4takTlcqzAlRZK//XM9ZaSnl9RNDQe6BO5hJAAJ2U89nC2Rs=
=8TgE
-----END PGP SIGNATURE-----

--cqh3gyz3giblo4rm--
