Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0993C9EF6
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446309; cv=none; b=a+Kkr3QOGxGPSbQ2e7UMAeb7bx9I9eRVB3VuhyEuLrDCAsY3Tx1rZPdnx5M+xTPVuPqsQqQle3w8tbHL6AV/bWPWXRNY+q+AFjOeDESl00piXOFZWcPqIls1CvK3KtbngpB/cVED5d0GutxtmLxiZV2KB+/s/nlcnWWPuqyoONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446309; c=relaxed/simple;
	bh=/wJ57xNPnCf8dH8DjzmbGHCzUBmnFHtfYvzgs74xh6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFnkfzk7cvKuNx51OO1C19PVjsBabAhFL1XwGzlmbh6MqzScYmI00PKucWN1Tsox1nboWmwzNeMZPugsk4xK6oVheJcwmz1HJIG5tdAG1rLec+TVOjyS3W78f7DUDamtiIYczZ//tjdThXyHNPmh/5UXLGVaTaPIKgXmCUAX+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQHxNiJn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQHxNiJn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso37373315e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779446306; x=1780051106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mLsUocanVpLcdr3xQCUl3kNzYIEe9clsefrb8kWlcvk=;
        b=JQHxNiJnKrHq3OULqFsFgAz2seUp3wkoDGf56P609Lz8zcvIRqceYfvhxA02DLMXYU
         mMwnJptOGIzJxZymhJHIjbWvLCmeuj8n7UIOICLHS1gmmNzKr8p2KhNzX6DVGRlIPlpF
         VSz47h5C310AHM5l0xhftcy5tNUaVEPxRuSyak2yNSeWwErCCIpAyjoV+RbORQCkxRmX
         m3NVnxQYrV1baXShcz2azKhJZtASpm5UrCWmDSnwFuG70S1h9x8Z4yPPgKS4c91gBA64
         MA64GSY7llXVpYA9LFZ9x/2syM5AohGARrIEuPf7aGGumOsihGLkUvpC+Z11FmkpZpfI
         muiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446306; x=1780051106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLsUocanVpLcdr3xQCUl3kNzYIEe9clsefrb8kWlcvk=;
        b=Dc33YUTnWDo+ly4h9DXaw2GCkzL9q2Ym2RvKr+7O5Su72RRbydvQ4cbYXD3GYX/BPy
         EctD3gZkqvxpR3orfl1QJiahcvg0N75urvg1itVO44H5BlubluyF6WaaGkMuQF/hMHbw
         P/BuwdBBbVReUkxXz1rrCnoNvkgsUPsCu6IiThJMxGboVcLevI8hk7c/XnZA/mjFvdcQ
         AfvqYAqqnOfFhHEH1OLSbIzynVuumnYXiZMFUNShFqPZCfzFNBKa25BDZO0od/BWY8yo
         OTRDBfDl/m+b+rA9/guWsAK2foXzKzQwT8vGy2OmOuhisrzeCu0eESoBScs0fVkVPypZ
         v73w==
X-Forwarded-Encrypted: i=1; AFNElJ9GWk5rIN0EWXGJibxlVo0rZHjRelve+Ml84SFKy9WL4xOEBTEaIa5K0m1GDbT9HCCTL4B6yfrBWY1FAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FxkF/dk21vPg/G/B9cNRa7aBr7QiDehTrjybdswvINooFrsl
	SJSh+IY0KA8dVeEfiLzZistDzdGMcaKxcKhsdHW0XlDKHw/LsME+W6xs
X-Gm-Gg: Acq92OE8qFBaupKXh2Qq1IkypAxSeETgS6Kaq42oh/XcOij09vswidbABNoplQoB8PL
	bs6ZoBkrlWgyck/0ZUuuwYDsJcvIg+fmVq/cg5EpwuwTNK9MOXT+kzleumUUYycPps+sFRw/bSo
	GNn9PTlfCy/nhdqMnuJZVeJEhtqRMCX1RC84mRxLUG7RzzIeM13jeqmAc7ES1cRzjDk4wU6kVmM
	Wp+PCtWnvPasIN4MVLCtq/GyMbbHIT82pXueeU/S9YAC7r0KEVZCuRP2OCu0HJxxsnw9oRiwKSc
	kaCS/rr/Ma7Rls73Ito1ftXsmgVv3wdn7Nm0zAEFZb2+RvpIc7LDvaVCXevX6voU61EsI5YcgfG
	Qyy7M5Lw72oNCnxLs1C4sf61D8RVplbnDvMouRbppBCO2cK+8mnFUAyPvcyLqDaGEF/Urn9OPSk
	B6fGQLCNUwMp0CJdZO74rrqGhpjw8S3c0iASI3Pd50D+xOOAffvzjWJBI5Q1oJ3Gm7ygVIcwOrD
	Rb19HqAiM8+Hg==
X-Received: by 2002:a05:600c:3e0c:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-49042489c30mr44798295e9.5.1779446305909;
        Fri, 22 May 2026 03:38:25 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d63f8sm13240135e9.18.2026.05.22.03.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:38:24 -0700 (PDT)
Date: Fri, 22 May 2026 12:38:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 09/10] dmaengine: tegra: Add Tegra264 support
Message-ID: <ahAyF4i51x5ldppq@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-10-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4oagdshx4rnxulqg"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-10-akhilrajeev@nvidia.com>


--4oagdshx4rnxulqg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/10] dmaengine: tegra: Add Tegra264 support
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:53:02PM +0530, Akhil R wrote:
> Add compatible and chip data to support GPCDMA in Tegra264, which has
> differences in register layout and address bits compared to previous
> versions.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/dma/tegra186-gpc-dma.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--4oagdshx4rnxulqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQMh4ACgkQ3SOs138+
s6FfphAAs+xOd5AbT8+y/eH+MoUKuhrW0ACB8ym66bqs+OCu+VVuM9p6LR7+6Mux
2+AFLpjeYRRdRYHjzoAsdnUo0VnC/+IFrrqOdoTD8npmeo2SveLrJx+f+BQJ4McM
aHS06cHVboDMya7H3UWHieyto9IZcEmAQjudHId+FPg6rYs3rjbDI2r71M2PM5Ns
nkjaOnkF9S/zPaUptXfdATyviC3yseTgJ36x6N0zKh9EKs1r+kcwlMchCu3k4M/e
uAOx0TEw1Jr12BwQRevhHWPn7JQAbq6a5aSsP4y6Ubvoe0JZIg28+FMFjLC0OvLp
3RMXYpH/0ovuRq3ruMN2NIdpAVZrAnd6OBCAb6c8bQ875+PrkCuQWNhzkV5GsqCN
XNTZRbHAXRfc6Oh/HkxR0rB/US58pr170vp06VeeKsPvpaZYaLT/a+gpVrhyytnZ
0fHu/2sGTgXGdgDdSK37XFlqgCtOMluSPDPrf+mNyDYWorMNK5zrHDIlbIDsZdyT
z4aCMtFdeZhIQSf0IZse1Yi6Kp4pCJEc6836c2FwSDm4iy1o0sH9g8qnvRC1jgej
3FxbqdYz6rvsT/Ri3MdhfZJC+J7vgpZvO5Fptkc9Y4b0OfeisLlRNxMJdIZqDoq2
BIo1f/fukHUAiDdo79dDfnLb/UViqXKst2JZCqdgOykedZy9E4M=
=Y6T/
-----END PGP SIGNATURE-----

--4oagdshx4rnxulqg--
