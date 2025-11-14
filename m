Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38832E746
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133476; cv=none; b=f5hes0ScGWNSTY2akUc5UTE7H/4n2TfcnaqRLZ3SDw4y373sQlk0FWjHoOIvuartwNQF5vfDLizgFzO6PmxbQXeHn4pFZuIW14OVw7SfemX471N1YkIJRVK6kGrGSRE3m+WG60+O7mPHMaQoM7+0B5eePXHuyBFjaBdFE3yxeMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133476; c=relaxed/simple;
	bh=lNd3w5V7l0mgcXPo2+rUiLSDJLwRACc4LFeAoLe4Skc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIxy4pY/IVE/kz+TWpRb5xo+i2y5BLq1PuAfNbEseH0V5nOToY4zvq7BOEPGYCqFy7Ttao1KLtHSWwKdJMrATnIXtLlJDmKqguPJ1kbXpjZ7wn5PggPm+KiD90gV8ybdoCR7HieOGD7DluE/syVORquvtW8f4pUhC6hLfn9UtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRvOfRju; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRvOfRju"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47777000dadso15925005e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763133473; x=1763738273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejOkNEGXJncUQ8v1bhY9HLPgQaUXqAC2+8Kmi0a8hUM=;
        b=cRvOfRjuuy7Ybfyp8dPjbJxnrvV2xHf41cKK6kqN8KMCHWPnzjd18338fdCTJAqBnw
         5cz8eGfL5BdOMDeIpIWTlZYhM3ygMCWsfEZ+wBzU+kgQdTGUkLq8rZO0/P2qd78fV1wc
         l/igvbhVUR2y4VEfggdzAncxplg0wd9j4WpPsBABRAbzNzPFftQFPqP4lTiyZNX/bF76
         NPrdxnk4Tvn3gpJqgYWPyMiY6bmkv4AaBvRd1Lg+Eax55YhUC9acM3Lnxu9Lgc9O9BiF
         RPBB/CfgV3A3v7ThKWVnXFFf+Qnb22H20SpSiUlstsRbt4JRY1Mr49f99Oun7P2UlPVY
         3w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133473; x=1763738273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejOkNEGXJncUQ8v1bhY9HLPgQaUXqAC2+8Kmi0a8hUM=;
        b=eA+BKeryIkSK1fisJV9kJCDHUHCd1dGcVAnt/tTP3ew77BWEOyFeeuspxLK+K+JcSI
         ov0Z5y0cwJ8ElZyaPcQFVt15oUCeeB4GUos9oTQLXXNYGfvkGCF1lbxp5BRsBit9EVo+
         zp+PnSyGm7Uy48/dqq6Z3MIC8rEo7iVZWlBoGzhEYvPt9sCln7ltwarDlNXCa1V48vRs
         2A+33GvbAR6wuNr6JMdeyu/VqCyA9xuG6fX21dClrv1F7xOxK4glAUOWgyU3Rtd4T4sP
         hywj9SBCBbYe0OEoPp4AMGGJy8zZr7mZQsZOmYwL3l5AA7+gZx3WiaPRcGEdmv55K/1y
         b3xA==
X-Forwarded-Encrypted: i=1; AJvYcCUif3GszsqZKYOoA73HiwmLHgxO6rFoIJVRkwlwCSUTYRolbvzcjhwwhSfwZnYWDqqHM5MuI7iS4JZA5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuC8e+ACQMaIKIzUZIdUJ4bTDMU0qFByE3l+vVvgXqZClz1f81
	PJJcRDmZVMLCC52w/LidlPL0vWBrrv8EdzhSc9fd+6YBsuYnVnFpC3A7
X-Gm-Gg: ASbGncv/kkBE9JtLlQoMH35yfwnwSkkwc1Q3i96xUvy88PksOb33oHuhA0ug1H+JeCX
	5wEffWDpYiAB2hCWI4mva2QwuuxQ3SSwq8UpnfJ0QSuHLhkleuv/xO9etuNA+goZGgmlQ8xBpvh
	Rrf8TDwg+U//z9VLa73YfFVjFkXzZdj3Dx1HRcBN/aZs+l9/zJY34H09b+mX5+/BnKiikH7/0+I
	Qv4xyiN+95RGVTx3G52NZ8toyDT0cuHiLjj2yXE/aiHAzjeiLnvcVJyZy0WJ87reiXb5QWDvuDR
	WkkLRv1CTat1logBDjyOfc1SazcQQlpazMO26aRhS03K5JGazXUtLP+/UDY6BFfUtfxqQdnkHjf
	gOcBfyL3TvqgQ2pd/TAhAUzNBBVqc3OAVux3ZLqSc79NIomXXQ2af4gv7B0FnjD8z8z8UWAR3od
	w6Qy8ei2x8gvtbJLzbCCCsOUuQjV4/RHihgPGxsAITXol4fHPv2vL/j13sbzIUn5Q=
X-Google-Smtp-Source: AGHT+IGoVvbJ4stZweWJvOdjzDSzxYzeqNZe3z43JnONFHTe/bO1KsXn/qtJ80ZaU0iWMJpeN/i1vA==
X-Received: by 2002:a05:600c:3587:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-4778fe7e760mr31161445e9.17.1763133473056;
        Fri, 14 Nov 2025 07:17:53 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm10874989f8f.19.2025.11.14.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:17:51 -0800 (PST)
Date: Fri, 14 Nov 2025 16:17:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bruno Sobreira =?utf-8?Q?Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
Message-ID: <eavi37q66snsbctp2slb4yz5venkwyfol6kqrsilvm3rmgtylp@lvhwcc76d6fv>
References: <20251024013528.1542-1-brunofrancadevsec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tdu4wmcdfhx5hqxh"
Content-Disposition: inline
In-Reply-To: <20251024013528.1542-1-brunofrancadevsec@gmail.com>


--tdu4wmcdfhx5hqxh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
MIME-Version: 1.0

On Fri, Oct 24, 2025 at 01:35:14AM +0000, Bruno Sobreira Fran=C3=A7a wrote:
> Fix a typo spotted during code reading.
>=20
> Signed-off-by: Bruno Sobreira Fran=C3=A7a <brunofrancadevsec@gmail.com>
> ---
> Changes in v3:
>   - Improve commit message
> Changes in v2:
>   - Really fix the spelling error
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It looks like this was based on an old version and didn't apply cleanly.
It was easy enough to apply manually, though, so that's what I did.

Thanks,
Thierry

--tdu4wmcdfhx5hqxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXSB4ACgkQ3SOs138+
s6HajRAAu7P8sVlVzULh3zd75CbQQ9pZ8SprDRNbGGTmHVpec8XDGBaETj9mSJ2f
kuIf72KlOjL9pdyEG1pzZ0oqM0tMvmhU4gQLxjXsPHau0oXSGu3Y7YHEgpAHudgg
j+YUrizOZyFiYBhV7kyit5y9Gn4NZNzr8130ieQbRtU79SqT3Dpo/NlmxxaEp/uR
N65ygSX2MhXzcl7FqXGArLZ7X0felD4mKUD6d+1XzqqdHbDqxfYvchIqLXWXItW7
5NOQSiok+ytl5X0O3r9Us44eM3lxryNy2JK6McGOAmtT6JsWBCeSnU7EcRsMAc9m
yT4loEa66sgvZ7BoexMLDrI/lAbZrgkJA4CqO33lte3SXG6u+IbBXRfwSZHqXOEp
1GIiLmWhbpz+YkYliGHdRUmm6Jf432OhfGC/5q8szt6dRWzYYEWp0/L7Pl5ktd/K
uBQ66qBl2hudh1aDcfxQbPteLEJO7IsKV2AQM5d/YKP0UWflF+jkRpUei+HeGIXu
9+12A4PYxIOaogIgfHqIJu+Wu22e1YEKT3tnIrQc6Q5uKGh98iqsNy7hphcsw7an
tenAohm/uOPh49TFuOMK0uwxeORhzkkhpi4foa/RTcerBaqzWk1EDBDzwMh6N2JX
ixjaUVH8xmjCD7Pr777+ud416ZQ6pluefl13dyDe5UkIlB/Ck9Q=
=/vrJ
-----END PGP SIGNATURE-----

--tdu4wmcdfhx5hqxh--
