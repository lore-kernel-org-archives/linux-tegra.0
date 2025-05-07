Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E528BAB8
	for <linux-tegra@vger.kernel.org>; Wed,  7 May 2025 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632986; cv=none; b=ll77rQCewZvxVPpVjzQeiguufW9y947rCGL7+QJ8+tyR/r08AfXgbl5mEFwrsdOMK5P9unYWktXhr4467ks1q2my+xlf79KxS7H1IkCZRAoS8u60FYMALrVXC9RTXw2J4sWZJFm1nLiMvdHWY66HqIXGOlfx93806pt3mZJElo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632986; c=relaxed/simple;
	bh=RjdE99qGxSkCwK7nrxumplHXMYGQb7RdGVDlPZLkvV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjPhuK+G1LCjKidF+gCB+lUwdyu2FuUUBed6CJuoCvwL9eenaqVB2feGeIpAN6QfB/O9IOuzgY+42wECAntsiErWgplwvgkV8041B0OTuuqETAK3h0wo4p0oV/kF00DxOBKcD9y7NwQJYlSQ2uaYjI2PPPWqc8rUzs4QBm0HGnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sh9bH+wH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sh9bH+wH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so140135e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 07 May 2025 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632982; x=1747237782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9hjok4wS7/jyfDA7YpA23jhzWzR1hZPY1B70z6QI6o=;
        b=Sh9bH+wHL7/cQfcaHCZDNAnVGAsLinZYfFCVKraoCbQx//Yp8uEd51e7BbZH0sOIyq
         pX1ezbiJDSdAwdLUbiKpLjfIl9fB1RHHzlEoWulM0SwAQ6ybGEQDYW0BRovPJouE+bVk
         z1jdWCCIjux+xelSneRwlp66X+ugqKq97ICcMD8I4ECggIhSMYJSQ9lDFfRAxmWn3wBr
         2rbiNE0hitDU/sRSw2G4NBtuZoY+8loYh66QzzNa/ouSGpsBby+GKRM1HbB9oeUqLXFI
         gskVuz+4aaFGMxLP2ocPNKOSkUJDti+UGFM9tEXn02jf4jOOjaEi7gstSLcmivjv7gIl
         y2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632982; x=1747237782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9hjok4wS7/jyfDA7YpA23jhzWzR1hZPY1B70z6QI6o=;
        b=YY3CxV6haW9DWPyPSh0zprjDOU5xwKRL/VIXCeOneT2YqymuadziduapfDWkaqRiQA
         XHPWRFgZSj+Obti4Bu64h8yqy+0sb+d5gB7+3RfpD0JPO4LB4SEzG5JXHMC6JBsAbmV3
         10I5HElpthi1iXsMS69j5z0beGdWYfRPa00ND5SS7QK0T/q8VVxxbbfu+GEjU6sKvePq
         FSWBuqRXrc9YsymUOWK4x/IVV7XmcMPS7wX2Sg3ZbhU+BaAK/wfq02sbffj9OG+8ZLZk
         Wls1A2Qg+R7ubjMVYZJHHb9Lh66mo0zSYQBQ89XpYWDQALXdHqq2Ej6TKJVbmlDvNWI2
         D03g==
X-Forwarded-Encrypted: i=1; AJvYcCWVoAYXCgfBmJpPb+9Kqme13FQrlnrvg6fSDas1FRva7lGKz+xAlIMs+Mw/YuQciprjjaL5/T9ScQ/mBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2UvdOqW5GMoDcuJDQZrpsnj0XFxacB5jAA+mZs57LMaWy6OCI
	hwLAozL2dXkd9qVPnjEYXt28drefjbczTxYuDqRsduOZyo+3cGXQf8tZMQ==
X-Gm-Gg: ASbGncvRy920TAPLrpSrx0tEhVASYfosaDUPVUspmuV4qeV2DahPMYIjV8x20/Js3vL
	24cX/8ktpNMpPbIeLsZ2oZK0GE0IRz07Miv4W8ivwKVbloElsn0xI4f+doc29m9IsF+MmYuFx5g
	gaq1RZVhXFSHSEiXc/qJAGhCuhXlAh3DrXvZQgoDcngxxhJXYPZVpQjajLJsELMlNvZAuSPP/Ou
	X06jK1jCsRSkMeq0UgGR3TzB34fxN+vPmPO4fPT5JbhEKD/zEHlBruvjejlf2uqBXL9CLcWoNct
	Sjp/afV4snhNqBFzSxim7oglC+eZYcsHehFgHNQQemBw23QdLeWftesPjl03v17qIFV2B/UEx/f
	FLEpm+LNF9HqYpI0pr7N5QWSFRZ8=
X-Google-Smtp-Source: AGHT+IEfBBX9lZi7CDSSTeq7Jp+h4dZpWsYn/tcSZZkhDjNw1bK5CzzUt6YmE5gfCvZKeo/kHS7hjg==
X-Received: by 2002:a5d:59a8:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3a0b4a0fc47mr3451624f8f.47.1746632982533;
        Wed, 07 May 2025 08:49:42 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3b57sm17644687f8f.36.2025.05.07.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:49:41 -0700 (PDT)
Date: Wed, 7 May 2025 17:49:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	Ivan Raul Guadarrama <iguadarrama@nvidia.com>
Subject: Re: [PATCH] drm/tegra: falcon: Pipeline firmware copy
Message-ID: <zr5xiqfla3hkzsqcrsgitbi4acwuiw434bj6fsez6mzpsj6qlj@t2mi3np5e6o4>
References: <20250205061027.1205748-1-mperttunen@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tcwdze7jyxpqlqww"
Content-Disposition: inline
In-Reply-To: <20250205061027.1205748-1-mperttunen@nvidia.com>


--tcwdze7jyxpqlqww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: falcon: Pipeline firmware copy
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 06:10:27AM +0000, Mikko Perttunen wrote:
> The Falcon DMA engine allows queueing multiple operations for
> improved performance. Do this to optimize firmware loading.
> A performance improvement of 4x to 6x is observed.
>=20
> Co-developed-by: Ivan Raul Guadarrama <iguadarrama@nvidia.com>
> Signed-off-by: Ivan Raul Guadarrama <iguadarrama@nvidia.com>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/falcon.c | 20 +++++++++++++++++++-
>  drivers/gpu/drm/tegra/falcon.h |  1 +
>  2 files changed, 20 insertions(+), 1 deletion(-)

Sorry, missed this the last time. Applied now, thanks.

There was a warning from checkpatch about the (1 << 0) that's added here
for FALCON_DMATRFCMD_FULL, but I ignored it since using BIT() would look
odd among all the other definitions.

Thierry

--tcwdze7jyxpqlqww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbgRMACgkQ3SOs138+
s6EFSg//f/Sh6cYqCMaOysBS3w2h4w+wYug+gGPh5dlkrAW+zhJwlM8MvTi1oWn1
oYCCKX7G2ilgnVXLY/dV0XNE9NMQ+mh1XpreojFllACpOuX7Gj9K09ZMm+RoUSfw
ufoDlsNgsfAuqzWdONQ2tqCKR0WNzp9/Vs0224UvSbBJ2A1UKJeTYZmyaWH2hPpk
TfE9TjqJSc4sB1E8YPZpisSXWRldDYu8EhMcr9eZZUV9MyOs1E1eZS0lViijqQ22
qvfXcJ3SZN9GbdhahPTkqEwyuRreQlXoHrsVc5PLcsdVhgeoERpRHrq5J/biuBrO
cy9votexuZTDRLiOEVR5S+s1YibZt3ALak9alJJEJa+FLf4eYsb+meYQBv/Dtwh2
HkfPjIapS+aCS6DxDs4Q7WS1THPIN+sSmkiFQ2oga60C0YieKGq74Lah8E3MlZJu
NFYNNi0w/hgeKXVDD0jC0XMjHdN+tuahru460VSR42tP1fJlYaeQL6j0bzDbtMCl
KBBvHHqdpBUgTtzgkx9sx4xoEfdoPljoo00bowawWzlhiX6tB0t7MIMrdWrGRIr1
WGlVsdskW2O8qcF6rHmdEC6CBPt9xCqKuc01q9ZSU4znA6XBgWnbMfYwjVLlOVPE
qO06/tRGGLBND9OXuuJWkyGT6Hpy73jgp+V7YmzmHtQQ2kCvY9c=
=Em07
-----END PGP SIGNATURE-----

--tcwdze7jyxpqlqww--
