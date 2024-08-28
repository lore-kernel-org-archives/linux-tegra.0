Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183AF381C2
	for <linux-tegra@vger.kernel.org>; Wed, 28 Aug 2024 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857836; cv=none; b=KonBZNk1h15PISYzNEDeKhKJ3Q0FXazBkkyS58WQHqooZ4BQ62KaskoOuhtYd457pR9AGa2snbpWKnw9uMFym4b50DQ8+QcyWHtN8bl8peHzVjQn9IDsGBJodGKAX7zuBK+/eOhXpAYJuwvGjgEYoBntR1cYjHCfVsBES0IXPqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857836; c=relaxed/simple;
	bh=ssWwumRAn3WNJDcxHrVpr6TuvpQCh5f83sOdzm76KsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpxTdfTJLYo9jXQSmjaALgid736eRozxfxLrHtYWLc3Jxq7fIBEZ2PQsNs+QCTbaAHj804DiKYNpHngDoxSXn/yCF/yiBbO1gK4Afma7c3DAm+2GmpXR86bYpZUrDS91nZSx2iiOuGnZ5dLHfxqYjaILhC+D0fosclguftt6wig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5U18IRY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5U18IRY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428243f928cso60280695e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 28 Aug 2024 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724857833; x=1725462633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hf+/pO9Jbr8XpYBQvk+Tih2tnZ7Dpxs2Y/EiTBdvHJI=;
        b=T5U18IRYn5xB4LLUaudULq4gG+7dT9/Vqg748pX7gu2vfBU6B11SHBrKgRbmNAoWh8
         UD7a5laoCwW8Y6caPRorAIf3livdzdCNb0vAkuk71gCDeHI9HZuBi//bmQPDqw/qjjKl
         BuWcF6Gl/HqBuhKugVTmY68hxywVM3qCeG7wfKwBVs180CQQOy5gokM95aTF644EQnFq
         NtymG+7uFsm3ALV7zb9Lvv9G13m1iz0kw+mI3zuBKfQZolm75diW/v7S193nODrhpW58
         qXIHbICRU40jjAyHLoipb8Mf+Lc8i49ihdkZS63NSdYGQwAHVY1Y8MlMlxYjTvWhFrKY
         blmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857833; x=1725462633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf+/pO9Jbr8XpYBQvk+Tih2tnZ7Dpxs2Y/EiTBdvHJI=;
        b=PYQGbWyxFpGkvVyEjhXluw3/RmJ1ATLjX8Ip9Ir/W42s88pj/+gjcA03AaibWJdLey
         2yxV+EDPv+rD9yF57j0J9c1ZiU1TzP8KK5BzWQ7vxrrd2WHpON0TE6//MU0Y3rZyC3K1
         7Xt5Tv/VyM7zNi582gPsQFjNTjxXsBof+4tFY0mlaH4nQ7BM+wCPenG7Czw0sSn4igfn
         NAxHVky6nUSKwjW0/N63bUnN5mihZVuMP8pThcu8V8MkIkDjhOAcIP5der19O7zW2XON
         dmeX8uo7q5YK0vyK4IZI47V+MzhDAbvonlMcvjcS9qBluc1WmkwmxibTAKwHhxkbD44H
         ueNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjOAVxRkknmcxdDJ8j6fE0fgRCvyhpXcV7xIpnv6YEmb6NNtC9wIKfT57a7faqM4XBSvLoub/7aGhHNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvAtLsyG7kbAfXhB2pwnupYU2IEsfcngV3TFb6zH7ZqRhF/VYX
	UU8H3If71ro9Ok6puATDyxLkQn0OSIaPOvpljl6iOMCt+Q+xM4/+
X-Google-Smtp-Source: AGHT+IF1msUZqCjsJwm9tof8rPh4adZ7QbALZK6GaW3ozxXnhRWKeALS9s/XD7RnAwvEXy+no7pX0w==
X-Received: by 2002:a05:600c:1d17:b0:426:64a2:5375 with SMTP id 5b1f17b1804b1-42acc8d5247mr123060045e9.1.1724857832639;
        Wed, 28 Aug 2024 08:10:32 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749b241923sm49086f8f.53.2024.08.28.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:10:32 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:10:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
Message-ID: <ub6oigutkk3uynribznlvcwumtwfb4rnmsuz4jbtu3b5xdhji2@prr6ymiljgkv>
References: <20240531070719.2138-1-cyndis@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i6r6vxewgn4idtec"
Content-Disposition: inline
In-Reply-To: <20240531070719.2138-1-cyndis@kapsi.fi>


--i6r6vxewgn4idtec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 10:07:18AM GMT, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Syncpoint IRQs are currently requested in a code path that runs
> during resume. Due to this, we get multiple overlapping registered
> interrupt handlers as host1x is suspended and resumed.
>=20
> Rearrange interrupt code to only request IRQs during initialization.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.h        |  2 ++
>  drivers/gpu/host1x/hw/intr_hw.c | 37 +++------------------------------
>  drivers/gpu/host1x/intr.c       | 21 ++++++++++++++++++-
>  drivers/gpu/host1x/intr.h       |  5 +++++
>  4 files changed, 30 insertions(+), 35 deletions(-)

Sorry, I only stumbled across this now. Applied, thanks.

Thierry

--i6r6vxewgn4idtec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPeYACgkQ3SOs138+
s6H7mg//ZQ/qgenzp2bB5wja1AwPgcvbNCMoGG9BUEmHpvLNS1FIp3KgTrSvhqLM
0D80ZW16r3UDhQNqR9Q/M0kgOYBmcOeUgwP2eKcPa3kdFc9bydP64acIGRNtff+5
THCQzaZUQcYmPfzIgzSljRTuH0+HAcnQyeI/ecNW93SyeKqNFKwAbfCInYoZH2R6
8Em4wZ6xDJZkv9rvgP856p2LkBS5AYvGcI3MjhMUDa6DRz7BFcrZ/ADbusDjvHtz
X3dLpg+LWs1ho2gjE0fO/jJ9fp7Qu3W/zrCgr7syHqaMytxAa2trR+J97BkZK5C6
SD2UydGnqMH400YXwq52EdCDsRBLLtA4YaIm2xb2M/YZu2O2PJ1tChnX0EUl6LNa
/K7zKIUHMrPz7I4y/kjwB8f7Y4BebGMpDuOx1PAzstOmXOrminOCsR/MLacx88mr
RtIHPIv89VsSs8GM3CRRF4b6RXulYY6Ri9Lx0Nhp7Qg6EHfgHCg/oThYcRQ9Vl/J
aHqrQyBPPsPDXdsqn4h6uwpF70AsXR+zoyKOj6LrW7sAj07pejtfCtIL2se4CVwf
t2tUnM6UqmrB1/ptJdREAfLxFQ5G39+Yab66n7esgABpdbHLbRKZW8XwTIhgn5KC
V97LOAwxmNEOfI+vqV2Gofb+26qVTLlqeY7ztRD1iW9FcdOq4Bw=
=1XOT
-----END PGP SIGNATURE-----

--i6r6vxewgn4idtec--
