Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304B629D0B;
	Thu, 10 Apr 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280186; cv=none; b=P1b9qAlaeMAgWkYsSw5o0LbEqpS6DahQSqGyNt0mlfk3KbBgio2GDuqQJ8NW98jt5Bc8XhPd4XAhn/B96DZXpuwsHJHogNqJeX7L0VnqlsWhgZl942mnA58a+ow0S32+Xr7XBPdzpVuVIU3SS2JWWKFYiNh3GaczNT/tPDoCh/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280186; c=relaxed/simple;
	bh=Qa3/Nm6a9c2z77HANGchdlbOFsuP9+6LKuALFear+I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFJtv8CY41K7nPibKPoZlx67UtMdJ7KzefetA2leUmuFs4kDe+Vy+oMUPOJUcgkgdks/frs6o/0jbuoSs3U4u9nyTkHHXswyENHnKTrEVbWefaD8ZCCuf6CSZxbXZ1sEkiWqxQ1+R5oYYaLmo2WQhGBI/9Jhc3XMVwXuypdJ0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAPxn2fL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAPxn2fL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso4147015e9.0;
        Thu, 10 Apr 2025 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744280183; x=1744884983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nKvyRjoe6XxKVsqrXIrUIMh/ebBL/o8yHKpbqDSGIyE=;
        b=fAPxn2fLjBBzjP3mHxkZURv7wkY3mwVmcEmjbqtxZs2vqvOLF6kawIqt42DmFLyWuW
         l7VKIiQchnPmHbUUWn3utxK+Z0Q8mMl0CfMBt2ntxi0ab4gPQ4skoW/N9mLpOifLDVFG
         7bthq2Yorg5IpmJJkLwNLPqvOVxTXUv0Fb7HV/jpx37oFr5Jjm4ILVrbZ7YLJ+ewHqGt
         7IuWy/VBCZH1FdtlKK/62bYwHMJoiPN5bxxqOTJ23S2kvTJVuR5ctK7Y5byQzyYjPNds
         R1twngikeZsXDx6I/0ErdiIVfEGr9EMtom8/ll1LjwjmK0gzwf+3ulRUS9EmWg2GETaT
         /h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280183; x=1744884983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKvyRjoe6XxKVsqrXIrUIMh/ebBL/o8yHKpbqDSGIyE=;
        b=aYmMAFcrdI8OD/Dgz3f/LvcvIhDNt7Z13rX0uAP4JPh3zx6uC9CYrkJHbWlJnzfz3D
         nNnb3gt1CLR9Xp1R/vqFMFWQovWBlKiQK7Df+j+qPGy8BSnk3WRoUlmYfv3u5zJeOShS
         IyvVtoC6jxUZ28JH+rasGUh3+dUvFYN82hKiVONUJgnQLip5fjD0z5C+1EQtF90vx1/y
         6XsCQGDhwNyh9IeT8YSvnsHHkvo6hNIo2M9qspbaC/SQjJjpM11xZbpjHsh8thMncbbg
         SEKxeoJtymXlMqzSBf4KL3P/R5qd/Z5olbNzU8Y1ygO4Dx5li1/lS5eBNJr6fFoVHqKW
         DTxg==
X-Forwarded-Encrypted: i=1; AJvYcCV4lWZWDYgrBWt0pcQ93GbAqatyMHi7NAD9nRjW4TdDYpRdU6lS7O5uUOjk+ZTNoq691vvD2ThiMycqhDM=@vger.kernel.org, AJvYcCVWhvfnU0XS0gsX7OlHaihvQCrx0asBepP4iZ1UW0VZ66329X7aDPDXkZHbutqhlackYUHBDJcTGD8oZCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGWAmuJ6DBk4eu35VgnaDBjIdoD3k2jKQdFZ7YekzTa7k5zfSo
	bUjwLZ2j7MrHhQ4DlGSIkubOvP7ZGh+nqg6yqymPyjpGIwzlisGH
X-Gm-Gg: ASbGnctWX/ejWGumMzfCaD7YNHumUaRdC/9bup+CmD2NHsiKbYPo2prea42999C1LlM
	ZfdA6W2UOh1noBe7DL/gVC7NRsqY7v926ifloMZHqgrBp6IGGx9LmfGYJ7WX1X9b2TCYePIRegg
	aMAF2Kb41pl7RL1mo+aYMnkYo1WYWxYtsCZIkze5xMDzC+UdMNJfg3ATbnwhZjokNJ3kzntcMML
	Fev49V2jsZ4w7TLC8N4/3FnOiaX4EicYwmXuMwnxY12si1jpa0K2dDoQnu5yxojBt559i8vK6eg
	4VZpyOuWGBNd4iEZa64dp9s/H8TE4JAtabQbjCz9QfoOlkaJhrxNxJ5G1wGXdL+F7VWcPiDzFD6
	RhqdIkQXlkD9fJDqpBKOWIgiW1A0=
X-Google-Smtp-Source: AGHT+IGbAQFz+e4mSyKw+ixwwV/Q8igI07b8shvKAc0Ssv5ykDB9RnZ1yWm5GLvlpk5kp62w2ArcOA==
X-Received: by 2002:a05:600c:4e0a:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43f2f0c349amr19659545e9.15.1744280183067;
        Thu, 10 Apr 2025 03:16:23 -0700 (PDT)
Received: from orome (p200300e41f1b5e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:5e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm50988945e9.9.2025.04.10.03.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:16:21 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:16:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robert Lin <robelin@nvidia.com>
Cc: daniel.lezcano@linaro.org, jonathanh@nvidia.com, tglx@linutronix.de, 
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	sumitg@nvidia.com
Subject: Re: [PATCH v3 3/3] clocksource/drivers/timer-tegra186: Remove unused
 bits
Message-ID: <pb44vnudiqltb2k47bd5o7dyko4cjrtcewyyaj6we4jwjaiu57@kxqyupgreczh>
References: <20250407102323.2690911-1-robelin@nvidia.com>
 <20250407102323.2690911-4-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z22ivcftzrjy3pfz"
Content-Disposition: inline
In-Reply-To: <20250407102323.2690911-4-robelin@nvidia.com>


--z22ivcftzrjy3pfz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] clocksource/drivers/timer-tegra186: Remove unused
 bits
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 06:23:23PM +0800, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
>=20
> The intention to keep the unsed if(0) block is gone now. Remove
> them for clean codes.
>=20
> Signed-off-by: robelin <robelin@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 9 ---------
>  1 file changed, 9 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--z22ivcftzrjy3pfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmf3mnQACgkQ3SOs138+
s6GI+A//cCkBLd2aXJA1ract6nWiUb+hBffcns0Ovk9LbV8aMtmfV+TS/H/eTqvn
2/k035KJqTxwXcEUGOAzUI9FLFhQCM+K3hejTpHbr9jR03O7JfLdLkYBj8K3IDbH
2zOJkwE3i55X29JCDPQcPqlT1F9MVuDn7sIE8bcjjCb0meV15J8YlIRv35pkOG/b
U4jlZkReG+JyCSPyjQFpZqHF8/Cctb4xdXecEEf4HieUYL5yT/GrApQJecZw9wQI
GYsGFazHJPrj8Ja5KP7WeK0+0mGZJajY+RolP0YE5lAvBXzlXfYe+LxszI1lDaVg
4Fc8Pw4tyfpdaTaxC0XlQ0tHe9nrU+hQHHuKjbBGigCfbLqQRAau/fPOz3NtP4xA
EWLmGvD/L9h09H51RMh0YuMp9rkZtwY5qMufomq3a0px6a7IOmh9b/x7Vr0fAZPn
PUzKrHj+WG6JPaaHZMVBoLutcAdVZqujSJKfBTaxaHyr/eI7+9VmNVOE5/O97EyJ
NhJdILlbPYgEPOwbw6JL8y9ElVW4lJILFas9pAx6181ijhvB+0GRjxhDGloZRPxh
Ok6w+NniRk72FOGX+zAlAbtKwV0UaKwFTYeWn9Zp6tyju0Lz+wAFGFmLZDfeCc04
Tv6nBp3ji0uYEed/XDTayzzZaDhfB5FJwmyEvB7jrfx0qkhGhjY=
=PAA8
-----END PGP SIGNATURE-----

--z22ivcftzrjy3pfz--
