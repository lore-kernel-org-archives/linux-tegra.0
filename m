Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4319F12D;
	Tue, 10 Jun 2025 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545920; cv=none; b=SWDNCcbpagTCxr0VkkSE5uNaVdlwFo+9IdrUjjZYg1wsDx1eygEx/hKXbWgaQwWP2tqsEtR0Rm88tki/O/qjDjEj+FVClDzBhLXmB/ruvYYgKeulNaCNmK/iIZx42Jdal4S540j0QXsRXewSirrZt3tJOTUSFRat+5qyjjSY4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545920; c=relaxed/simple;
	bh=c36DuMc83AVOnhqeN6b3+cmZHTuPxXfhTO8yY7xbqj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0dhaGFzDyCpICBn4IVLwCzSdIXMoG+c+J/jrr7H+2+TiEhnWDGQksm4X9ffqI/7TMVcm4Mi0ekxtyTiSBjDBAzv6VwRf1iROLUnd+G4rNzBbguYAtz31fn0na62FTlx9nI2y+ULgabVEe/v+sHMw6f+eMfoVdFMXhlo1yhHLjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqNKDF9n; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqNKDF9n"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so61848445e9.1;
        Tue, 10 Jun 2025 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749545915; x=1750150715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c36DuMc83AVOnhqeN6b3+cmZHTuPxXfhTO8yY7xbqj0=;
        b=FqNKDF9ni7y83jTrOLL+9oaZyXoBXRgcSIdO5a9+wXO5PmZm44j8DTuBXJ2kYOukWj
         1x/8qnlDv4zckEOGbmo8tysLFHpVzMB0ijZ/0o4z/qc7rgv0iXm+kVoqUTcaf7uyzcRH
         TI/qNaB4qWOHm0/ta5ba6ne+ljVZiGwz+NB+2ClUAfjnb4zlWDg/rv17s2Qdr7/T2xzf
         hHLi/bg+Sl4wolyulfmOC4alaF6UffvyEFcgX9lbeFKszNnh3j2roYvStQK8L5OD4TiX
         v8we/bkrCGuX9WWLYdMATZcMDWfSdHSw96qQznfjWr2cE+kUVZVES7eyaB4jrSyFHs4m
         2s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545915; x=1750150715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c36DuMc83AVOnhqeN6b3+cmZHTuPxXfhTO8yY7xbqj0=;
        b=wEt1FFwIgYmijQtXaEBIsMNN4aL2F5wjCyFAbpIFrawi8vC+jjl3QgQoGn27vEEpIr
         O0Gq38442WF+gBjw4ZE8QBulZsYIG7gjcDtOR2mB6UwakipdhfkoRk96l+0cS5j/tFlF
         OWX3gke4az41/IC3GDsdqxFmHc4SxsjetnhMEjY90QVy1oPFYjB4BbkI7f9atjvEV2R2
         CzcJJEWXk3EgfIgfeq6TvysKS6i5LX67Tzbl/bHcLd+tJ7KbpsEiCXF2pSk3BW5uh72o
         s0qygzdFRRlph7mivomcIi5ZilvpltVXxGG4UwWlA3B/UAR3Lug5CpCWK5Qhx+ZRjVHk
         KZEA==
X-Forwarded-Encrypted: i=1; AJvYcCU/nzq2akf3uxWb8zcfbc8PxdsWmc7EZ++tHDM8VtIHH/z3p37lKwlToCqOOgh1bIOZkc4ShdErVvGkrGeG@vger.kernel.org, AJvYcCVa408qcJ15uniYFLfmBmmOFWbm6lCkThnvKTbwfwtrdZT0zrTlU8naIPQWdKHI/BallVN1DnCuZDwh@vger.kernel.org, AJvYcCX6Bn0MyaeFNU9fHw9HXZ6Ur+r3XuF/8lYrsEBZZu8A59M7UmOacQJNuxjeTTqPBV9M/Xq4VEumMq5HE98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4ixNTOjS9/tC+E911Sz2zIyMFWMt8reHfLJhZ5siZ3Be87E4
	pSUdoC26FWxY0M3XmcEFyDmcg2fq1chxOy5OBwA/8QuDOzGCf6ZIaD2D
X-Gm-Gg: ASbGncs+ZTbVh0RXPisr2Y3Cv/6mtzxzLhjeB2QFSRWxyxoEcTcAAUU07gVLIZjtRqN
	YJwSC30a0h3URj49/9BoDmSJdC4sELGl3dOCg8iUEFhIdU1toDKGmn/KMpJApO851WAxAzIUTuk
	RZ+emyLDYzqe/N6UAa7zsdCAzXvdMS++yAtBGNRMe9D1B6fdfopUWfZxFVIvYzwYJ3XiC74lEL/
	gH+Mk1zgeL0BPmV5jwoDJotupNJvArB6Y6YEVfWaOMaRp5GVQ/HfbCLwN9D+eCa62x40nAkwhDT
	XAVfbm1r1CBNw+Xwj9oajinCeo72k6ucm060GBSdDwOdbElkCwheh2/QqgPhEFkI9pJvh3KXuv9
	BUtRCvl+L1PgF21RPC8lyYTvoPiABZKuyr4Xswo064q18X4IN
X-Google-Smtp-Source: AGHT+IE1/l/BHFvm2kuDy24IpYdRMXIUpOH1axcX1ng7Cfy61VsEvmnvDVUtQx7F+RDB1XpaMvWHLA==
X-Received: by 2002:a05:600c:37c9:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-452013d7e24mr136087495e9.23.1749545914323;
        Tue, 10 Jun 2025 01:58:34 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c7756sm132335935e9.33.2025.06.10.01.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:58:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:58:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <lxgh2rtt2fqbmom64vbmtkly2dqcnivwvlhxt6zscwskhzsrne@kd66mumdaukf>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3lv7qylzds7dx5y5"
Content-Disposition: inline
In-Reply-To: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>


--3lv7qylzds7dx5y5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> Hello,
>=20
> This series adds support for the NVJPG hardware accelerator found in the
> Tegra210 SoC.
>=20
> The kernel driver is essentially a copy of the NVDEC driver as both
> engines are Falcon-based.
>=20
> For the userspace part I have written a Mesa Gallium backend [1] that,
> while still very much experimental, works in decoding images with VA-API.

Nice. It's good to see that there's some use in this after all. I
haven't taken an in-depth look yet, but from a high-level point of view
this looks like what I had imagined back when I started out with this
driver.

This made my day, thank you!

Thierry

--3lv7qylzds7dx5y5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH87IACgkQ3SOs138+
s6HLMg//bv8OnrB5czvRgzKb2t59uKLvAvodsTpKUTy5YXB2PLldaCpE1l2oHkAn
eIois2Zr9hMylXWqBKUGLETNcOtWej6AWR0oMLhkoIH8KDNvNE1YW4JO7POoM6OA
dEWYwpChmWXtOF3hCyvmdJm98ZSQ5mwgrNi+wXT41nNakrL9JIxAcudGzvyWwpAn
bj1cr4m5B24HBvC7ypiPuY/h+I0X92Dki94ohrfKL9Yxd5Vuh9MGlS6PgAcBeyhN
1m1BAt/Zu7na+o9DUBDuMATP20l0ihdG5igGOexNPukHPxJnoKVLGa5prTQFKIYQ
zvQqltXKCKI+b7LX0brONmPUXlofvze8yEAcvgWTnZXwDNJ7wuN0QLGN436BUCg7
4qd2nK9GzmpzWUeIMwKYhPbi4wTxJesVExq3YV0Uoa7plRtDNmsgMs00c4oHiz6K
yTF39A8KNfMYrpPbKyr7D87kDvs9wcNXHjZ28K+UlTcaoSWFrEqF2RczZIsactAR
kOHRfH6yoZeWdCu+2rJf1PE7uK5LQ19jhJbQ1vPTZEvxliltJwCRrIxu0IywIPAO
5xMWS6Wp0diivI1/MsPtVETrmYIJRzh/eCCK5hEgv+T3Gpkm8+n+NBV3sKGAZlBI
6jRhggMjO/AqskjEZzpPT5I2tZoCnOFT5SaeKfz5bXAygyWB6UE=
=INjt
-----END PGP SIGNATURE-----

--3lv7qylzds7dx5y5--
