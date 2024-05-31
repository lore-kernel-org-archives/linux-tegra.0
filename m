Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061D1C680;
	Fri, 31 May 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165659; cv=none; b=R21cYDAAV3MTFRumpY26alROHuXIkv8UgBoVXaYxS8B0jE5X2TMODTz4M+mY2YHGwiXNDE2raO81PCExjWlpRs7cv0XsKBjzuhM9wVDqpuH0A0ZHu1AUnFWvIU+Ijzj25vmIjQOs0v5CAewYlxMQFtnx1OlzK/alxowZocS1AvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165659; c=relaxed/simple;
	bh=lkb/Rx4zrkLYhHxsdd/vLu9gytYG5lviQ2YKGRXvvxE=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RxN9XZSb9JVJX+6Cklkx2mwQfYEFsdyoP1JSU1Y7s6l1Yqhzq05YbDAJZ9eK9eXl5PezcBkXgU7Km/2mhdme+rJFIJPza3eIVhcfo30+NxpliWuehgQ2dx944JkXiF9TB0D50dt6ULrmHGlKbAv35K/2+nTr8twqLyKWCcLUt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si7aWWYu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si7aWWYu"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b8d483a08so344015e87.1;
        Fri, 31 May 2024 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717165656; x=1717770456; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vyw0QqWPLXQsbnv/eRXn+8SY3S8vBVQpvW4XtA6GV3o=;
        b=Si7aWWYuDXVKKwro365NU/uRdPefukAnbs7Qki5z0DK7Nli7aUeE63cbE/0+L3x84w
         Eck0iirv7auDCpgoctEBCi2mX9fA4BIHZEDBgeZUPKcgdtBk3YVj2hChXRLWiXNQbayu
         PtTevYiq4lWoblJlKSg4GQRJI+hEjHJoFGOF8gNzZXlt6h1Mty+6jVXl+VeKo8OcX0hK
         NoEHWSehWZA4me3nUJjRveRFeSXAFRPOdBAHcYUppjZSoW/zx3zdXkrOQmCPXKEnW6iF
         dVwV0ASdOrfB4n/XsjcMVRyodZDOeb3eOWQq8rZEyRwW90lqJDONpKg/gbYSHMiv3joe
         vsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165656; x=1717770456;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vyw0QqWPLXQsbnv/eRXn+8SY3S8vBVQpvW4XtA6GV3o=;
        b=nWk3I/W87Ycdm8UvT3hwEh+MJaPV5fxqdrqAR/wKsn6au4TC4OlMD7sk+loDlge6wG
         bw+dfHj0w8mfZPXDsQWmZw0cxSNu8E/9bJd1WLcZ0L/jiJ2Upkg6yye1xTsND0JxXCoc
         4R/g/U1VbhXP5UcBEk/S8jfSEzkKfSAmtVxgZ+dOwOwO9xHRHThS3087qdpcVchEczQm
         rp748sRByPnK4DjrWipHfzfW1k7DXLalJIaxjor0igCu5OIiGPC3YLS2wH/1yEzgRrZH
         R8L1JlO3LyURGm0nTbVnYOznOaMlEsFzQ+LEhM2eMDyiiLlriqsxc9VCM7LjjDId61Sd
         UHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyAC3HBMUJHRWBrkxCY4Pcgz2SHwcIWFDGFvT37aCrF8OpW/ya8ePxEi5f3h8rJetOXTVzozpXcqvHceZPVAO68rLderOJ+mWbB8bdENDqrhyJbmjR2JUBwPUJ9nIfyzXMaBS26DpgMTc=
X-Gm-Message-State: AOJu0YyMwFiiWhYDsF9JelK6hogpeui2tpCtK41+A9EiSmyF02ekQ1HP
	x9+E2KK+ZYyvlsIapD8lyTxDb65dcg5sggfBnzJWJ3bio6WiBvd9
X-Google-Smtp-Source: AGHT+IH0zYSB5eJp8kFtTsToiVflMdLkT85rkgoYUXCZj948c7VhsWgNQtDpuKO99TnvhDuMSxwjWw==
X-Received: by 2002:a05:6512:45b:b0:52a:daba:f7f0 with SMTP id 2adb3069b0e04-52b896dc4abmr1244621e87.62.1717165655678;
        Fri, 31 May 2024 07:27:35 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c10dsm1081440a12.87.2024.05.31.07.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:27:35 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 31 May 2024 16:27:34 +0200
Message-Id: <D1NWF7ESKQ0X.25OZ9MTC2DSBS@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>
Subject: Re: [PATCH] drm/tegra: fix a possible null pointer dereference
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Huai-Yuan Liu" <qq810974084@gmail.com>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <jonathanh@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240531135608.194168-1-qq810974084@gmail.com>
In-Reply-To: <20240531135608.194168-1-qq810974084@gmail.com>

--9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 31, 2024 at 3:56 PM CEST, Huai-Yuan Liu wrote:
> In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but=20
> no check is performed. Before calling __drm_atomic_helper_crtc_reset,=20
> mw_state should be checked to prevent possible null pointer dereferene.

Please check that all these variable name references actually are valid.

Also, "dereference".

> Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crt=
c_reset() for reset.")
> Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index be61c9d1a4f0..7648e129c212 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1388,7 +1388,8 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
>  	if (crtc->state)
>  		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> =20
> -	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +	if (state)
> +		__drm_atomic_helper_crtc_reset(crtc, &state->base);

Looking at how other drivers do this, they call

	__drm_atomic_helper_crtc_reset(crtc, NULL);

if they fail to allocate a new state. Any reason why we wouldn't want to
do the same thing here?

Thierry

--9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZZ3lcACgkQ3SOs138+
s6H03Q//UuqlLodE4/rgaDezJNJcSpL48fqNEFNjdpOEm5Z5qwZUUojcBJj0GNaz
QFYs6+i4594xyoSHq9zAsH/ytcMGRr59aFI/YZt0+RLs0gcJKshIRHgUaESdVXD6
q8ZWe+X0C4YyHZDt7rx8JDtllCOQCqMrDLOaIWETAN5u1gJ23gFfgaU1GGnjgoQY
eAvvPRLVpLDNZv6jgV8a2flO4UinNHbB0X+tYlA5LFPnz3vEyBQVEhpt722cCFVQ
CQWYuUIz9pdelRSgDNJ/Fs8z1Nz8o7CAvVHZykFOY3jfgh9O78QKwM0phhTmB9gn
TwaiFlHHf8vwI4JGEnUphoZhZIEi3Qy2C6W8R1ruGjyYZk4mm17vxBVCOsgmrgAN
ptVh9hKMFfR1ke3tj8wZR3zfr+8aQw5IjxkeHjTI8LIlfWEaOL2rE+bjSfcCkh5L
QVvvvbaCtgeXJ7SAPXIeH6LvRbzU49E8POvHyanYm5v4xDRXnt8ZVdh2luV4jxUN
FdjMtQiTu8rFIOtuj85mjD3gwghaPimrC7w/cb4d2fX03R29psvr0Elsx36PJP8y
LXZo9EhHJLixgHQj7fOT5hYTVDDhGbEuKdrTEfOH0se/HiVizeDP4PnkyzjoLRrh
qGQb3mftwXpoyl+hN6iRNNmDh7dcPj9nuK99RTQQ0xNj9zJ3fWI=
=JUB1
-----END PGP SIGNATURE-----

--9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a--
