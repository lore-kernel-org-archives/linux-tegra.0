Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457C1A2C29;
	Wed, 28 Aug 2024 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857966; cv=none; b=neHG3nW9qOXToHgPURQBp7m/NZrElbZ0mBf73j7xwRjjhCSAm7JyQfUkeI0J7NE10WaveJ+sMt+AAmiVpTlltjN4Ij7r6gau08Stl2rb93mXrRLgIuq7+/wv+lcMPN/HbWJLMfZmpzcSDAb92W2NIHVCs06OgiFTZ1tVG6K9/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857966; c=relaxed/simple;
	bh=/IyRKuOeEvyqdB4QfYijTcKAfdptVOGW+q1DNzAAB5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJaP8C5JFLlZgL8yM5ZJdpAX4tOF+OdtFxWDcoUyFUTOrQnJVYK6Ay3y9PaKCayDy+wPGE4pp46kg2ngXVSE91f5gPzJSdPS3GR5NOSkrk2AQmYEb20JoVCr55NKZeXfER+4YxpK8Eamxg740iEBhq/vMPhtPM2/ENo4qEay29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg/e+0jO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg/e+0jO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so57788975e9.2;
        Wed, 28 Aug 2024 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724857963; x=1725462763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbaH3V7Lk+uax03Oqau7bBE1nBYKOYJZ2EVryMzrRy4=;
        b=Vg/e+0jO4UDhGCehuMjbQuXLnnb+7WsW7TXvkZ9X3hihMUCCxJsvg2SKOEiIs2HhUV
         rFi+UOY9RJGZVmnEJd2937GPkmsozNqZWn2t4QHgGRJkdpI7bpUHnar2Jz8aSRQ2kiQQ
         geQhdYyM71iY+3OXurPXut8KNZAIHKN01ggrEpgqpKFhBWHJxrfEey0Tse9HoP3YyAsI
         bVrsl1bK46tUjXu1JTPLGQerH2r0K2Y8VC24r03fDBn6Am93DcC46QmuRg0Xft0s1AF+
         LHXqn9IUH4S8aRyEemAWhr/o39DHX3oXq80cLICITJGVefYI4Ju4DnZqzLLp8z9YakkN
         GvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857963; x=1725462763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbaH3V7Lk+uax03Oqau7bBE1nBYKOYJZ2EVryMzrRy4=;
        b=E9TCahAfZlC7bNwUj9kcei3tR/WOoAGpq8Do0oC2UKpFmjqfq7GkqM7myTR7cJLYVr
         m4VeqgyZPhU8HsHclie9kqT4cQy+4VgPl2pGfjHjpdxSHD+9pTJ1nUmuPThJRRjbSwmb
         I5yWFieE6nIXECETqHRKowwEJ6/RdX/3cE1Z2RicLbBJ1DEPrbirJ2kibQjUYimDkDVV
         tQh9YUTQCNLcuFajKcK2gvE+/p3GD2ym+zoplzta8lqqoQMtRMuaFB2LyLunZvfriHo3
         WZsuYygwjbDE93exKN8gKF0SDTDu630pwPYjo+tEyqDQDBOE9i2naOsoHh5ymaR2VSsg
         WM2A==
X-Forwarded-Encrypted: i=1; AJvYcCXVFlQCj8tgTrvEsnZ4zPG09NlqsUMWvle095vKW/A47aBO+P0aXdZ7oEYOZJPVNZ5epscSv4QG5FH/AgU=@vger.kernel.org, AJvYcCXVfluInBh7nNqQQkIVwwcUvTiq6ggq8RRn6WH1zFDjU+/9WJy7JT5MLu3By2s5zsijfl5wriTXUcV7CL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBTvdpfvLJbba1g+VkMjTKUZ5gJzyFDskrxELG50nVtMXfWnO
	WchgtOK7NAnBOaCi1tgId4Sv3Y3lBe7QBFmMxnTtPMLu/axm4FZ2
X-Google-Smtp-Source: AGHT+IGQW0+v8moibSdO2Q/RDfDjaFv/WD0sbqLqA5iBEEKPuRh2zkLaDWQrYYlWkKTTw2QwiUONiA==
X-Received: by 2002:a05:600c:310f:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-42acd5d79b1mr105634055e9.30.1724857962403;
        Wed, 28 Aug 2024 08:12:42 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63965dbsm24684245e9.6.2024.08.28.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:12:42 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:12:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/1] gpu: host1x: Use iommu_paging_domain_alloc()
Message-ID: <5bckndhbbvbvkt2bqxseyeo43qzvy6h2oykqbkhnfrpw7zjwu4@ziztccfxccv6>
References: <20240812071605.9513-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7mk5vwuaumccccci"
Content-Disposition: inline
In-Reply-To: <20240812071605.9513-1-baolu.lu@linux.intel.com>


--7mk5vwuaumccccci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 03:16:05PM GMT, Lu Baolu wrote:
> An iommu domain is allocated in host1x_iommu_attach() and is attached to
> host->dev. Use iommu_paging_domain_alloc() to make it explicit.
>=20
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-8-baolu.lu@linux.int=
el.com
> ---
>  drivers/gpu/host1x/dev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--7mk5vwuaumccccci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPmgACgkQ3SOs138+
s6ErLBAArXWV8KB6676S4Mww6EFpvjmqtdeUPZADFF5+D4qAXK+eqPe/rprOAwCd
6+tCPTAkEGrym0m4qeV44txjQOtxEM4a+YWx6WxQfCYg+oprDa/jtEF+ysICSiwe
3fJRnrb16N/fFTaEHub+y+gAtr1BlhHmRt+zZKyNv7eCfM3tk5sMd6WcR8UCp/Ey
zBFXXmcC5ugNsZtxITQWGcHaY6dotmlkqQpRq41NMRr4tSnJgmR3z0PwCVftt23x
B+agCPY9txwY+vSCIwrQ/zQwP924utFtkf2avxSLhU8E/RabXCJFUtbKhe017SJC
mNw7Ahz2a5QHaXKTjNCrO/xczR2i9RK9VOsJUgOl85zQEVE66XoFzMlkpKNZZKze
B5jMd5Lm19Cqpl2wTRgqK5B4oulDKgwkusWOXuPTFZjocpKOzW6SsKzrmy/+/Ie+
ICZNIv3Op1m6Bc8rK5WWHFYsY7584/3yDqmpI9pb3JeB9+VMU0UCEz7bNBHTZCAK
kcj4LAOzk9oSvlN2h1oUBQzM+3tqh4v7Y++VVJxPi8ecNbgXekw8V76uKW0iKz9O
uzq198fgfG0P1TvN15AtUueY3d6J8lGZuVH8FEphvkNagj6+x/dx/dJW9tu//poK
Y8pQfxFEVSY4oC8gRlgIPwCEgFCSWKRatLXAokmYvhy3IRNc6Dc=
=cWHB
-----END PGP SIGNATURE-----

--7mk5vwuaumccccci--
