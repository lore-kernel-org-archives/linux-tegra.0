Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318F3491D6
	for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218829; cv=none; b=nFqJorSA475hC/mOlkCoRnFa2Gf7T0hkMByW4YsGVlD6OvTZ6XP+dc7ISGHtFjGq0bQ/E2UWNaknwEdErmaU71oFHllFSfbG5sp12ZkFv/FHt93cN8RPUi9k4qW9Qb4x7nealjUj4k97w0f2yrCVxoCmdoNYA4lMjSGTnBGbM8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218829; c=relaxed/simple;
	bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoxHWhnjIjMxQrPGv8/5kQ3rnZ0sMZcwCUy3Oy6CWi0neJAiHdFDRs+VlWfLzjs5Wvt6vi3PGN8XrdSuphw7Pd2G+tmbfrC4Eo+GyhTcR9skY5F4zqhG9IWjs1MX2Z8U/073j/ix5qwSLSuRgGS0KsT6VzXSp6+qabYE7SvgVO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dvhz3h48; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dvhz3h48"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so44229285e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768218825; x=1768823625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
        b=dvhz3h48rSihr+heN2pL6rYoGdQRt2dmHZF1ED8M+d+xB/IWxP5HWUK2mAc1yls2bF
         k1WwHwk4tqj2tQ7Wik3/ruZvc32KplY4Mi/rWz8FUNXoMKJeUl6xfIy4Gg6vZIHJvmKo
         utM1H9gZDQGJtUDQBgkS3HEB6OmMbVHy9RWkJvah/lgiKJz7TmXaZp6R0bU2f9IwdtUf
         +XJG1rdF+lfYl+GDO2RhrdigWg//eDWQLg856HntCoYxEm9Pa6F1zlZltCz+u2fN18Iy
         /RiXuEg7rmj60wZg/7xLckQSSTrAU2xauQfd+n5XAc9b8S15Zd5AjYwSUaYYpKlKKV9L
         YcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218825; x=1768823625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
        b=vctMTgjbUxKklueZJYWNaZD5k21noHjGggm4Xi9BNw80MYjm+7+zwzY91gyN77gqQo
         25pHSmQX0VzBfI0lf+Z21fZMq7alxwaq03bA7AB8GkDLth/eBDw2tc03sdlR4Rm6og6K
         ZsQvrK9JdXMnH+58lEzWrMXe0tb69J1GTUDNu2dUIZDmYXD5k0ZLvKyJ6Me8/G+FWM/t
         MKVGS+V8XOvsbx92mE/EfFs345l2s4vqWfa/d9ckmxyFpVxL53ybf5HzC7TuXoUNcwjS
         lIm6O9lQhxkgV/bfb33RXAzceMAI38kq2jAqP6qihIajAeUGzqIFLeRRtcX9gWy3RFxm
         qtWw==
X-Forwarded-Encrypted: i=1; AJvYcCUORIV9F/Wt9Qy7OjqSu8XLFfTrThW6NwoJr02yiG9imhnvjanXfOGanT57Y9hMn2YJ6nphc9DSNP8O5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8D8hJqdsve8ozJKMrS5RIwp/6W1br63OlYS1TnvgUgaqlvIQ
	JQ5/X2LbwRIVLJt/rCQMxqopoE19dk+vPOQ31wLUSk3BSqxIp0qM3XdtuluDJv79rXE=
X-Gm-Gg: AY/fxX5GhMYjgIBZTckC8SLqFt73Yfux9H3KxwFJh8rg/377Ekw4OldebicgZANdJQm
	AGp21YGENGaUMiMZ9l2ENn/Fi7EToAfurnP8Nbjjy+M+f5ju4IQ8bZLC9q+cbUadO2+2Kkd4nUn
	n5B+d9U0tvwRzoGvu6IQMDJfVllV1VDDg6OFYyiZDXZyVVLMXXScZrgWbAIi3i32W37FeUFVN/Q
	lj2AuVSyy8VFpPAg5K9h7cf2zfkwvn7iVuN/00THCORMGYJ2qDethZJPgBAj2VVC8qrc9AlTzs2
	27KUDjV2wEEHdQMl1sAyhTx1Abs6se8fiQ1heyoS1FiecsMlqpdrp5aLR3CbCyb4ghp98f8CgKr
	IjpxYrOwejd6uYW5jjJh3n7D14Es1tyP9oPuWXLk7bSQ2ZCui2Hyrz2aGx8mBBamBnziPQdi3mt
	VCt1UnjuB9FKNLPFAiugsBQAydNonPg8giJVw4oZ4AQRHlr4Q1NO6Y3jIyNmhNTLGZhjGzRJcs4
	g==
X-Google-Smtp-Source: AGHT+IHS+X3LSDt5qzxc7wN+ZiHbRa7V37jnrS+IUFcr2yrSlHBW3u8uORHbJtAGSuAyEXEXsweZBQ==
X-Received: by 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d84b54031mr204347325e9.33.1768218825500;
        Mon, 12 Jan 2026 03:53:45 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d8660be14sm134733965e9.1.2026.01.12.03.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:53:44 -0800 (PST)
Date: Mon, 12 Jan 2026 12:53:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
Message-ID: <qqdjk5wi5xlily3cfa74lrepglo42ibnpoyam76vwkymju3hkh@b5dc4yg64mhs>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="atue6rojhx5cbpx3"
Content-Disposition: inline
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>


--atue6rojhx5cbpx3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
MIME-Version: 1.0

Hello,

On Wed, Dec 10, 2025 at 09:31:36AM +0100, Uwe Kleine-K=F6nig wrote:
> with the eventual goal to get rid of the callbacks .probe(), .remove()
> and .shutdown() in struct device_driver, migrate host1x to use bus
> callbacks instead.

This series got some positive feedback but nobody picked it up yet. Is
this still on someone's radar? The last patches to drivers/gpu/host1x
where picked up by Thierry.

Best regards
Uwe

--atue6rojhx5cbpx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlk4MUACgkQj4D7WH0S
/k5w/QgAhE2EAWGMq3JkMD2P64EjS1rMwsjti9FFnLXqoSgWOD1/HpSebIxgHVUH
9SjJD/+aDtRXdiEaEM0CWYWAcTk673HShaX+R5uJ+NUSegWvD1bO8RXbwYW2lW0l
5XEoBJro1TsCECL4gBAlxENblu01RKLwAnTAcCHRjTFEgjM833wJgTFdHrtUAZxZ
uiEOWaOT1mxK+8rPLf3lPzeu/3NAhDsUGyqIMDA1IQ4PUkSxBwR1A6CZPsL916r1
+Rr9xh8Jo7dY4QKqb7SseBTkAoqcbozDpROJPfpUmUbHCPld8WkAx7mt8I/DTJ+M
+lGuvDBluoPISCAslcMNqdQ44lcyOQ==
=kDAI
-----END PGP SIGNATURE-----

--atue6rojhx5cbpx3--
