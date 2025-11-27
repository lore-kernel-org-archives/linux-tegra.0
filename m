Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C012BDC3F
	for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236218; cv=none; b=sQY2d67hBwoFiZSk0+un5qSaYPRJl5kK0xR4YlSgUmwmgu2sAxSTGOc9+kdJzzMLmIizOU6AtMA/vrg3slOFTxYG4kyJ2bjTsp/jzU7UBaPo90iz6BVEooIf0VOnYdEUcTwD4RgJ5f5BZOExzTaJvbs8NqoLj5nQYr54a1nDwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236218; c=relaxed/simple;
	bh=pY3yIpCqHy9NnfvKjK/24G32/d4GhZhQNfpvnRNw04k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMpU9Kix3c35pn6mrcfEmbeceUPwvlm2k8zdOqClxk+p2SAP2hzw8KBh5cBLxEaFwcXOHTilrzDwQgAF+hPv6mAUww+TQFduG04NtuPjbxC6SxQmNnfcI1Dny8caAymcLAfLxdlXJklJCfKuztmXSGPW+dN6iEePGnMipCfIrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7McMcWV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7McMcWV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so1307135a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 01:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236215; x=1764841015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gu5JNlymI+xjkbE7SXCQkiY8aeTYQf5loqFwPHd5EQA=;
        b=V7McMcWV0LTvwaZz9adtMAXTmTg6dWvGW5iQ6rJ362bkMv0qnK3buREbZKPTlfOFj8
         0uQRVIDELnTb6Yu67wwRkGGlxN0220Fh3cHrEMsSx6m9z8Hq5nV9lW8wxHGjo+FYBwlz
         ee5Ssxml9pIldtjuUqLjfc+lW3jzuyjifEK4gkRITx4lq4uqGh6QVtEFC4+T01JI8Snx
         tTnpnz4rNBg/dBb6u7N7JZbzJj/t0c7jhAUvwBFy1gPO7K8R1ABGQSvnuzC0q7vn3b58
         k7IN8b2xH4HdwDC8h0t3/ko3YnmQwEK5w73UcqrbvNiECbSeb13Ms5WISU4vkX9Oa/yG
         4XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236215; x=1764841015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5JNlymI+xjkbE7SXCQkiY8aeTYQf5loqFwPHd5EQA=;
        b=ItvAxhLQWgheoFy42qt+xwohwkgQt2V17zXcWiE5lx9gn3kOUsPgsq/fyy1SBFctfO
         YlSKebAVYp2i5T/gZ9YJKODcBRJcTRop/jH/8NR7bEUw/C6R5C5ZFBnJmeabN6SMRnh/
         KfYhUf9dMrDod2YRj//GS3VZ7tj8SLZgrtx5VbOr5lWcVSlZ9x6jKWeWEzmj/3Y/ckx3
         FPzAhPJ2Afa3qYmUgI1bWDqgu/dhn/rdXaVaNa+6nsM3OE+JxRyX4h5cTW+5q0/VYA4M
         flF9abJnlnQrR2Jz9g0966cxR37FDzV2rSDyobwtJtHYOLoiw2w8KvvpMCRCVKRZGnKX
         4ogA==
X-Forwarded-Encrypted: i=1; AJvYcCUS+fXb2uoqiMMCXk9uMTrHNTdG9Ud9minglHIn/xu0JAieR2fHUBL18+6VTs//0rz0QX4idYK3HSjh7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBRyanHDl3UqcM5A4i0reLW0PesoWX4M5Iq6rrTmocpid5GzPu
	BYz1KK7lZpZje52GTNjPIZuoLVgJZg8plQBk04LWYngBoCPrJO0Bl3Er
X-Gm-Gg: ASbGncvy9BOq4ZPndQSo/t7fydzl4CCLq9Tvtwtv0ppRc7QVP62hyX5sUFS7fC0yywQ
	kY747/EfoGDbwZSdmcI/SBevGc2WvcnMHei2xFBqV/Zfl+plm6gvv5F7vu7PkIL0Zg+pzcWV4TQ
	fwpPHTwktWY7shg+FEBdA1CIVqMItN3m9DorEEI2aTdliGT/Avy3lgyB2lAE2Du+rBjUxaU8u5K
	ma3LpUCanyWum7izNk8lx+bbYuCqiJQIln8dl9kPpGZGE3AcXuEVsghYU3uR2fO9uq2n5iyq5rE
	THw9DkdKxd8OsKLpgfsHlHmiFhAijHUGZAGwQP+etEE3Go08J3Lw1hxekphLw4/9ICzXGSM6bcm
	snzsyayZ7Tyu2Ll5tiRvdRH9qjyY/l+XYJqFgVnw67uJQCZIeampVYhYTT9YQbMtXZN4zn+qqT/
	l9eIc6/XpVcSq1s4rStW4TkrSPSQWwlXV2KTE6z1r3ahYbgLS8mGAFcgLI0svy6+/+ppdXvu8y9
	M/Pww==
X-Google-Smtp-Source: AGHT+IGQ4H+rtLVq+LXq012Qv9pYnjuQXeNvOCcH+r5EbiQnQb/cgntH1MokjpKmaFRo2H6P138cbw==
X-Received: by 2002:a17:907:6e9e:b0:b73:6d56:7459 with SMTP id a640c23a62f3a-b7671705640mr2690672166b.38.1764236215082;
        Thu, 27 Nov 2025 01:36:55 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5199852sm121459866b.15.2025.11.27.01.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:36:53 -0800 (PST)
Date: Thu, 27 Nov 2025 10:36:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 6/6] i2c: tegra: Add Tegra264 support
Message-ID: <f5xz4k4udmisatxu4oeymngoy3uyxpoihxlaxd7ymenrvbocmh@cvkgtls3eiej>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-7-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="beon2rnby32vl4ue"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-7-akhilrajeev@nvidia.com>


--beon2rnby32vl4ue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 6/6] i2c: tegra: Add Tegra264 support
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:20PM +0530, Akhil R wrote:
> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> two of which are in the AON (always-on) partition of the SoC. In
> addition to the features supported by Tegra194 it also supports a
> SW mutex register to allow sharing the same I2C instance across
> multiple firmware.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v4 -> v10:
>         * Set has_mst_reset =3D true for Tegra264.
> v1 -> v4:
>         * Update commit message to mention the SW mutex feature
>           available on Tegra264.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--beon2rnby32vl4ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoG7QACgkQ3SOs138+
s6Gm6w/6AgXf5tCWx6wKOvXGVYML8fA6p8cgTTKbMVCL0a9Cb30b6mlITGAwIcWQ
i0AuIno0SiR5dSNi9L4IzIOUqFlF/SY1sOeGgl+YbGlV8UWkLIsN8Y7t0UVh++RN
MNVgYxUKhvzJa+ECfM/vnqyITnKPwH9CK3HcaqmwHR1mwO8hEjampx/j1p525Z7l
r9xkWLbjLHok5+W3H9JE+AMo2/lx/7ZtHFV2HB4Ogl01knKoK2K23NEqilnsF7D3
PCR21yqRUwCjLS/Id093QOVYTiRhhTpc84srM3cFh5SmrRk4zgLtsKHnu4rnjqum
5xhsJlEdl5YZgmX3LCs++SCOlybQL+YRTR8zqyDhC71CwMD/vqZNWtlQSuklwr8J
R/YtjG7gTv5OxUnBsv5Wvr+tTO+ZeWs6qSVcwen+X6+/HdQI773/axFYi4prxA3F
K7qMg4x7aWwoH6f5pACNFLiyVE1ObOgcgpixCvr0e+s60ZZoUp+IusQ8ilcbS0UE
OnckUTZfCfn97SS+W3S1fZFxFOA9pzH5AxFs073zILDZU+Sa0EOh7Aa2/YVH/TkC
5qtrz01pPWymeHvwbP+V+UiIZgN2xNiRm/xFWA4fFfkTV+CUtCjaiPsdZIeC3GO6
0ISgFBLX8DY0PymnALm8DDZB6a7ncVOaIjlG1TYM7ttN/rRgeHY=
=xJ5v
-----END PGP SIGNATURE-----

--beon2rnby32vl4ue--
