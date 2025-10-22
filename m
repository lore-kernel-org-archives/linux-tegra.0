Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AE02F39A2
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116446; cv=none; b=l2U9prmR680kSOJe8SfbtO9OkApLWwIaBIVW3XP76qaa2tmPwnz8xsV/WQwzqko/uSBreGLhvfAMtNSo3i2G1KJth4LXZHI5O35NNX33cW2Mp7xe2VoAtrIe2DeU/TpFNxJ3zW2ZCx2IArta+h1OMZH3UL/M+ZGs1y69s1NCGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116446; c=relaxed/simple;
	bh=H8JQ1rX5IbFJccoPRURxRkqH88JiF0MNlpJ6raTZSVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs1qXR1agfXHMUqrfPTyh4FaksS7y5/UZLlp+nldSp5eQNwEnaXhNYvDCZauO+2BWnynGrGXCWWeP2N1f5p3b8lEJtPX0YIAlSAe3ZDFkoV9pB0I9zv8qqaYX5fxNso/C5xrFvEABPzujj8FagquebFuL0DihrhXYj8Mp0RPexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=epKs7Xxf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="epKs7Xxf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so802650566b.2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761116441; x=1761721241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MS4biszQ2/uHLk1P8MSGvcA+rAl/T8gqyB50uLY2uZU=;
        b=epKs7XxfY6ZPqUZ5T4cftporSc+55bd6JiFnucbqr9zu1auBqRmX1yiHgluAoS1fJ4
         vMcX+Cj/nWXEGSRXjqMCGX0+r3YOM1veYoMkoWuqWj5YOYk2JeHuyk6Qhl0gNkdx9/V+
         jYUHmrPN7uaIcY7/K7QLDAhupWy9X5qtWR5yU625NNd3iA2DxB1s2NJlbLv6SUWU2Oer
         Cf0R27Pe10P6l2rE9GgVtgSZ94v1PXWSrUpsstId2R6+QMv0wThsYuhNDJ2xw68AClq0
         wnRpqCfw6960NEtFExCz6DvghMa3AIxkOaZbECzkZN3DEFyBUzlxP6fftTd4PVOf7X0b
         LOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116441; x=1761721241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS4biszQ2/uHLk1P8MSGvcA+rAl/T8gqyB50uLY2uZU=;
        b=IcwlVnJGHHiiyzt8P60/xmJ7ZBKmVc/0JfCu1szRmZYHaVkPw6wGxOK1boLLQyQxCv
         TwfmD/sVdxTCuGWjNnwsyCkupLBllhscI4UuAdMNUDzEfy3r1cLKxlj5oOFQ9mLnwcdD
         3AMDkAWtnqVc8cuYW+3ZtkBOm8mF3oPnuWstBukHthAbbeor08iAtwERiXybRzBEyZuE
         GTe/7ap4iuZNDBMhUYqTCDO5K9DK8+s/ZnOqje5YsiQ0Q6EfWHPmTKkqKuOZ/fz5dR83
         ZWPf+B0wvXS85AJUp0kKcsTJJrqv8Ayl5E6mkx0P9kdcPCCpwf2zQ9k+NHhxNFI6H2RD
         byqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVjpXYtUTj5+zJIXoKEMloDxnXd1IPjk+PHkQPsUeeSiotQ5ERWVLCo/f/XQkONMGhyDxcU0eKqpiGRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhj/Tyb11gZuayB1xLUcIDCqeguR/LFKZXGacDTNO2Sm0y/UHO
	HishKZxO32Q6kF4kM6UPtihiXLqPmytUhkLB2UfbC9SIgDrx7QW6MezNSFQ75BCq6eA=
X-Gm-Gg: ASbGncsDmm2fPAtLAbF42nR8AKTlNUXwCiAe052PLGzOCwgyWyPQKKMMr/lB0sOnGNw
	skX5AgwMLuPHH09G5fBdDxCvLOHRKZTrUjtnDI1qFRkVUukVVH4Gl39uDmmn+SYSu7puwMIQi3O
	Tym7uMQCzmRqH5j6H2Vj0xISuqSijnnzjsm17ohCIkCNa5mF9mVF+kzD6yqIcxL14WfT1ESjD90
	mlQv+tGmfn9VfuOnoi4yr7FCH1Un0+XTwN1VRsiGmhA6lScDzBIZf1x9YGFyNDtPkI3qeE+Ok7F
	InjhoI+EWcF+aI5SF3nBWPBs8W/iXNzO5h4TRzWB26ltMR8NybpQPpY0o/lWKRHEKYcDDCIKVxE
	ZxDlo9htdlxSrrSxXU9v2Ahm6QwBbRC0+G+VSfD+2oTl4BPCpzEvZ/R6g8K9AsOUhi/L6PjUdMo
	Uuz+l5
X-Google-Smtp-Source: AGHT+IH0bPwIgjgA8i2sMaJgf1lSX56gTQkOTRQmgcBQCv3qEtFdupNIOrvNnhwmUXe7/9y/B1pttQ==
X-Received: by 2002:a17:907:7e8e:b0:b33:b8bc:d1da with SMTP id a640c23a62f3a-b647403a5ddmr2228210466b.1.1761116440475;
        Wed, 22 Oct 2025 00:00:40 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63c4945ef49sm11082908a12.29.2025.10.22.00.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:00:39 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:00:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bruno Sobreira =?utf-8?Q?Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Gabriel Somlo <gsomlo@gmail.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: Resolve a spelling error in the tegra194-cbb.c
Message-ID: <7ani46dskesos6ccfabi5nqdbljabjtlt4xtmrupta55ga4stg@k3az7he7xnbg>
References: <20251022015511.7257-1-brunofrancadevsec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjgngvca4ihobjy4"
Content-Disposition: inline
In-Reply-To: <20251022015511.7257-1-brunofrancadevsec@gmail.com>


--tjgngvca4ihobjy4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc/tegra: Resolve a spelling error in the tegra194-cbb.c
MIME-Version: 1.0

Hello,

On Wed, Oct 22, 2025 at 01:54:54AM +0000, Bruno Sobreira Fran=E7a wrote:
> I aim to join the Linux Kernel Mentorship Program, so I'm currently a
> ddressinng minor issues in the kernel.

This is not describing the change, so has no place here.

> Signed-off-by: Bruno Sobreira Fran=E7a <brunofrancadevsec@gmail.com>
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb=
/tegra194-cbb.c
> index 846b17ffc2f9..9a52cd3aea65 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra=
194_cbb *cbb,
>  }
> =20
>  /*
> - * Print transcation type, error code and description from ErrLog0 for a=
ll
> + * Print transacation type, error code and description from ErrLog0 for =
all

My spell checker does neither know about "transcation" nor "transacation" .=
=2E.

Best regards
Uwe

--tjgngvca4ihobjy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj4gRMACgkQj4D7WH0S
/k6F8AgAu4ixm4ZMXMgDhIZB7UECtpQKZ4HPXd/Z63QZfQt525G3Crw4mAG8z0Mi
zrWuuEngBaSzvJkf2/2v6mY4b3FFkjnpRLltBxNQXu4PebY7fYuoowdGedxRyXq6
VSUUGgJnji9goXYbKf6isUJOYq4lY11n7xNa22RrEQA6Ia2ite/Tz182C8Pg1+wS
moGH+myUhUkvxvp1YpkRUYyknYcE6VQYdUSOi3iMA6U+icMu2sWadf0IL8G0j/fY
g9Wen8Gm13uNFHah2Y26hAQDpAPjB8+f5YZ6DFpZSC3+F/bPLdTIbmTEsAZ7EplW
NBR3zxt7VRs2smctkyl43X9i2/75Lg==
=nefc
-----END PGP SIGNATURE-----

--tjgngvca4ihobjy4--
