Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB99224220;
	Thu, 27 Feb 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740652509; cv=none; b=cwbYI8sZqBFHYkcN3tEzdekn79D3CDkZS7K58zEAiXi++0zhLSKLof0FccmigNGf3jnus26TTNQsa5KkbHufHbXw/y7OypKgu+BsRrTlCQQBShlhnH23/hxl88ZNBI6plLEHklcpcHLf/QND2gdUOklx/0yhYAtqa+ApOqs664Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740652509; c=relaxed/simple;
	bh=/gSiPfl2IWIVmGQEQpnjZOajWysmeHjZBX2nnKMmtf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZOjZaSKW5ALbb1e9k/oZHy8YEO5klPc1mecpl4eu7rFeQwBwsJs5Uu3DFw5e2F93GjuDLc51t6a2cB6Rmov7fnBE9Dake7adQnLX0Y0akd6M4Nxo3GxsCNqvShP0twY4eJXTzn9QEAK4YMsN7hWUjY6Z0woIpbh9u4qmF3eU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmO6QNOj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmO6QNOj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7430e27b2so120165766b.3;
        Thu, 27 Feb 2025 02:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740652506; x=1741257306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9sxkJWxd6UsgKUfI4wcK1yWzsn8f/a10WzHxCIztzwo=;
        b=LmO6QNOjvtnxTK5qRExUOhjeEuVLt4xzptorsRFhlcwrybZvYUDOPfLBat1mJbX1jS
         hjbQDxF9Mv/GO2sWHFAO//0IbtfPZJcdV1iWXqZeS4jzDfcaovSkiqPbZzmcuoDE1Abp
         TIU7p2mII2tykem58j8Z4iHJlnJP1BpclnQW4HjQyOUUBTlHl3P+QPhlo2OYTDud5Y4/
         yzsen7vyS2UgGdyfA27StnJRCi+U9erUkut2j9HbCjIrADG6w5gDnYKp89ZyLsbrxgb2
         E4kS20XDBNDXcmhpy9C0WO0hh+ba7gFMWrLbSF3/m1xpvw/3Z8AKZKS9mDZWXn2nGcwa
         fsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740652506; x=1741257306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sxkJWxd6UsgKUfI4wcK1yWzsn8f/a10WzHxCIztzwo=;
        b=jUA8BuKMWUU0XX4mHxQipKjael1w5u2yG3sGylws4IYaEOR2cfbLTW5gzJ8zNkAaon
         wztyR5jQjXqnfVHSfQ6HXUzUFEcwIJTMCS4ZhaDhcLGKjwwftW4RdrhYv/XsHQyo0UVZ
         ERWiig31S/OhujavECVKMGj1vHnijN2aT19adjGwRiR3hcDYeokE5AWUqHpkdvmhy7HD
         6oA99mOt2RPghe7+fBPykJ8x+JFFtXMfDwIc5w/0/Ep7z6N1WTyRjmW/Yaddjod/uvHs
         jJWSp4yDJc3dIJNbjJEanRKNTGyhokt6YyhgoVrgjUvvGup9mamsFX4JVBrtmLh9hj6C
         bkvA==
X-Forwarded-Encrypted: i=1; AJvYcCUKRixgDAOYIOFU5eVBIsxu9xoduP4lNJ1R3ZuKQMlQNzctEHUZzD8CBjAkb28R3Y89ybVUVbN0X34/2FY=@vger.kernel.org, AJvYcCWt7c15V80CdZ90SC84kheJmtTunoWedYVm/0u8qigoPgCHLPnNw4FgeTpewnrz9UbmE7rMDnIDL4kvYGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMFwpRKZVE9HtBk+Gq7vvamaG9EOHE9VQPxfLFequur/2FYfb
	NsliP1gU/tBrcj7fwkYsbqzAo/mZzQ4e7uh3gLky1CrJeAfBA6BO
X-Gm-Gg: ASbGncuhw2H3vNX09JqGTTjy/UKhKAEFztw9Ajtmal2j0wyKlmg1oopxciB8q2p51Wj
	XV+G0NtlXNMoB4rJkBJUnjArM8/AKxQ56rM2xglsKvGRcvVxVIgx1wM7AK+FjOu0/CT62tt5tQQ
	EH8obcIz4uKEatVSxFm6MBT1uw6vsqzlYY+h1VDwXwiAVlWQo6tiRZhzEQ8MJJcdxFNfCZS+MAM
	KGNi+XpSnXVornIFB6V8PiSnSaG2kpGWaYmd56583x6TV7BaTmfDujZbql4tFBf0/uu1104GlpI
	csweY9wzPKqbqx4HZ1nWvA90rAnvhyPV5Sz5+QebQGXrKts4SymwZMkB3tTdBwQ2fdtQHs3+hnq
	xxAfROP94rNf7
X-Google-Smtp-Source: AGHT+IHpSCLenbOlVJa2Jny2cStNj9M8RbZyNt4dxi/XKa8JppqmdIO9byNQ6LgMxixRIdveAOBMJw==
X-Received: by 2002:a17:907:9619:b0:abe:ebe2:6747 with SMTP id a640c23a62f3a-abeebe26b4amr1011525566b.9.1740652505788;
        Thu, 27 Feb 2025 02:35:05 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c1013d5sm99944066b.76.2025.02.27.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:35:04 -0800 (PST)
Date: Thu, 27 Feb 2025 11:35:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
Message-ID: <hgvxugls732nt5yfoqygvxn52x73ioh4qpbbmu6swwmafsrmm7@w2gcbjinmujj>
References: <20250123124632.9061-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6wisknckvtuuvxhj"
Content-Disposition: inline
In-Reply-To: <20250123124632.9061-1-kkartik@nvidia.com>


--6wisknckvtuuvxhj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
MIME-Version: 1.0

On Thu, Jan 23, 2025 at 06:16:32PM +0530, Kartik Rajput wrote:
> Tegra264 has updated HSP_INT_DIMENSIONING register as follows:
> 	* nSI is now BIT17:BIT21.
> 	* nDB is now BIT12:BIT16.
>=20
> Currently, we are using a static macro HSP_nINT_MASK to get the values
> from HSP_INT_DIMENSIONING register. This results in wrong values for nSI
> for HSP instances that supports 16 shared interrupts.
>=20
> Define dimensioning masks in soc data and use them to parse nSI, nDB,
> nAS, nSS & nSM values.
>=20
> Fixes: 602dbbacc3ef ("mailbox: tegra: add support for Tegra264")
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>

Maybe remove the blank line between the Cc: and S-o-b: tags. Also, "soc"
-> "SoC" in the subject and commit message. With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--6wisknckvtuuvxhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfAP9YACgkQ3SOs138+
s6Gx+A/9E6Cz7K9Ry67u9s3XR5mnDMquX4N1K8hkQmBRHmi28tPDgAiutEMelyzH
PV4KYTpZ+e3eJNDMj9p3BCOPB0rHIlCvvh/vODHo6hkSm15vWNR7dYx5+rep7Krw
YlVfLjcDpS8FsZiOCblmRIWdApte+VmJ4E9W9juFT/kBqscpUaPPLa7JTyHb1aBd
etdyiTM8dxHOgjzHC4I/v40Ar33Gyh8eGRENOR5azeexdQLxFlhrBli6V/niwWwi
GGIlZTPGG5YYRiS+AZY147VSPS+I8NDMRdTtVHYW20z2b88QyUj/LnnCVM7u2YT1
419j5idHIzL10sSjFKIJJs6SOKl2PRLNkl/MPUftCGxrclz7E/1fDICd/lM3KYwC
BFFJ9OnaQv8elRB34YgE21WkqLZzK3BZR0pYB8hAqiF9AJdv2QgnphNJXHbjIIGL
8V4CxqnvAS1Xs+9OwAxJNkoT2GWEH+0aZQHRhVfSs6zH67a4cbI56/uaI2LjwAiC
WaxWgyeG3zCx2nmO1PQHikCkEo/OfVoIUKJ2kleOxhGBnMpq95c2rh+syE6EO5Gs
2EFwjK5RAiPFiB+cDgEIfKgCt85iITaJrkxvqlLV0ZhBm2sLY3krN1Qr0jzgTDyK
wDjZ/7XsyLDCxXlLvD97x3rPb7iYftv1azil7ZKLZGj+3ebRqPQ=
=lTHa
-----END PGP SIGNATURE-----

--6wisknckvtuuvxhj--
