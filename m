Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E23101D4
	for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763380582; cv=none; b=EMVHZNpaYhPzZKqXTfeAPvFCZJ2Wq4rHP0m6Eu7V/robATpgEutxyaQXpjHa+6X91OIXhEeBBu5PxKbEuIKrWIp1f5DOd1Zg9j0wGBYx+7nw1+5HkD9JGL/3Ejbi68Utw/3210GjddluyAWbB/QtDHyLhjdV+RNttj8LVcuD0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763380582; c=relaxed/simple;
	bh=IoPbm27xlqMQUcqxETSpkG+UYV649jqk6iAorfC4n8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFOUzFN4cAsIQ4rL+T784kBtEwg8SU0eA9rg6iyb5gazMDN3vqPvvA06GkprmOL6mlGbh2IG74/b4y8pLFG4QTiJdVEFQCDRPaA8zhChauKR6YYUIm6vRhws1nIZOFk4s88m4jUz1kfHJtdlL8Q1/JZfY2UrPVjCqWo4ZDjSOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZHMEM3G; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZHMEM3G"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32900c8bso2365650f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763380579; x=1763985379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWXDrHTHFq+LoH950osN3acgfrZIVN9A2hnRrxaWjK8=;
        b=PZHMEM3GXiPrSq34Q0BdUk84t7c/SHM+UBapc6416nGFGKlqNWd2MM0Eu/gc8s82X/
         dxWgyT0ibcTO6pHO9YNbCZDykre1fuq/0U6nL54EqnXzWcHx2WHVRcHUTupRCSq9nEvl
         pBzUNGr/KufNFzIg7CXz5oEa+IDMPQScb6wdBGovRbGwaFQA2qmRth08N244Ip1sUb6f
         BKLuqd3Nik41AIArCo3WnBaHEnarTJ4kGJTraO85xhivjOMOe6a7CIi451XWhn2DB3WC
         G8HcyumIdJJr3abQREgF02P2q3odn13xca+R3RpnsVtUbkXX+s7soltQEB7kxCWAZWYr
         lWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763380579; x=1763985379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWXDrHTHFq+LoH950osN3acgfrZIVN9A2hnRrxaWjK8=;
        b=Gze/uqLAAA9p/ELG8XHsCEAOoVnLmvWfrXypu5WaybRMdnk9Mx80PRAq+gm8h/sLTL
         OwJJgnnqxQU96Z973sAyNkhn5nmuEB59I0rEnFONXRBTMoDYYheEtJNFlD0E7Y+I00m8
         BInSuoR3044CES2QORFEKo8v5bKDBWJlMmhjzNGpvTTLnUODvZiFhBSPsSD63oSVURbp
         YI/uKu74iwKKBx2gZaXUczDuzI/Aj1nrL1wgWvG+Yfyln8Yibc3+ogw6llavdb1wPjOb
         YlU+I0PN1R4coos8dAx5luhh2rD6DbjBThuR/dJuBFX46BTEzEJPzvxsqEY/u9w3B+Ws
         nYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhxQ8lhSuNc98CBrQNXRZEqpdu9urCw/muU5KxXB10IMUYb0OBUrwRpe68ioDNP7tDzLN9J+OJqW5gtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAktsijHUC/nDtZj63rTozCpH2PctSlomuIttaH5iFREUl4RZg
	/aGaPtHXxHmOnMjUbqkT2sl0oFiUw0Ycw3K5xp98KcCHymlobeIQQYm1
X-Gm-Gg: ASbGnctonFTkw4LVxwzSVvQpA3KvTxKRc8gtSyVqWQeAsxqzBaeJC7zkjetC/PwFoXJ
	vbCZog1AfG/QG/tS5FDk9Lv+TS7wlYp7YY8oIdt3v3k8QdHYq3vIMV61x+w1CgZ9m4oMXbEeHiY
	PpFGnZRXxfYfwMZ2GI1Y3mTdfhfswb8rJKz0KGWFAmQ/DyoGrJp9CYJeRSZ7XFSL8MYormH1noM
	AqqUYj0NnA1v2J0rqHHV/vkmdsEbVgPeJmqCCNdS5UeCMEnbwfWvVDRC423ScM9HM6QI7bbE9Qq
	/UpVuf0P9PPP0my7KsI3E/kGo54UmR7MMLJOY9T4vfmjunsCB6IDkGy2GRtDx5eZcVy4yLqj+i4
	1P3sxEFgc4WwRhCDvasOOxQqX06Fb5wS2j+9EE/Yl2lanlnPi7rIhAri/eVajp6BxVBqCLgzy0B
	LymYV0ZmVCmkOIYI16TWBGMp95zc/u514AO1KlRs56VBETnpqxMZdCboTHuozjmCJ7Wp8+4L+EX
	w==
X-Google-Smtp-Source: AGHT+IGyc0tqDOwSpepSxf6zhqj7TmN9ClebDcKhn8W2nmVRELCNueCBZL+FZrHTRO+B3NHj6nEyNg==
X-Received: by 2002:a05:6000:4029:b0:42b:4177:7139 with SMTP id ffacd0b85a97d-42b59374d6emr11588070f8f.46.1763380578949;
        Mon, 17 Nov 2025 03:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm26367014f8f.19.2025.11.17.03.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 03:56:16 -0800 (PST)
Date: Mon, 17 Nov 2025 12:56:14 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="chm563f4rduz3hg6"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-3-clamor95@gmail.com>


--chm563f4rduz3hg6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:30PM +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 and
> Tegra30 SoC.
>=20
> To get CSI operational, an additional syncpoint was allocated to serve as
> the CSI frame counter. Both VIP and CSI use an existing syncpoint for VI
> frame start events. That said, the frame capture function was refactored
> to reflect the addition of the CSI syncpoint, and the CSI-specific
> configuration is guarded by the presence of a passed CSI channel structure
> pointer.
>=20
> The camera capture setup's configuration was reconsidered: the first two
> writes must be done before tegra_channel_set_stream for MIPI calibration
> to work properly; the third write was moved to VIP/CSI-specific functions
> since it must be source-specific; the function was placed after
> tegra_channel_set_stream so the initial sequence is preserved and expande=
d.
>=20
> CSI configuration sequences were added based on downstream 3.1 kernel
> sources and adjusted to the existing video-tegra framework. Although
> Tegra20 and Tegra30 have the same set of configurations, they differ by
> the number of clocks used by CSI.
>=20
> Dropped the software syncpoint counters in favor of reading syncpoints
> directly and passing the incremented value to the polling function. If the
> syncpoint increase fails, the PP is reset. This change should prevent
> possible race conditions.
>=20
> MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> have no dedicated hardware block for these operations and use CSI. These
> calls are used for both CSI and DSI to work properly, which is why MIPI
> calibration cannot be contained within CSI. The pads passed to the
> calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) and
> DSI-B (4).
>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c     |  23 +
>  drivers/staging/media/tegra-video/csi.h     |   4 +
>  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 -
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  5 files changed, 608 insertions(+), 47 deletions(-)

Sorry, didn't realize that this was supposed to be part of the earlier
series that contains the opsification since it shows up as separate
patch series. Admittedly the numbering should've given it away... Thanks
Mikko for pointing that out.

Anyway, most of my objections remain. You can implement this here just
the same even without most of the extra churn in the prior patch. No
need for moving things to a different header, just keep adding the new
ops stuff to the existing one, which all drivers that need the
calibration functionality already include anyway (including this). Also
no need to split out the SoC specific bits from the mipi.c file since,
like I said, it's not going to grow anymore and can just remain as it
is.

Thierry

--chm563f4rduz3hg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkbDVsACgkQ3SOs138+
s6HaShAAl2Mt1kT8lpQi6WisXh3S3pWUZiGEd4h+Q4mM5o3CX5jGL3HRmrLuw3X9
E46M9ZXWcfbObqJtcXc+adkfJjRp0SZAVv4dOuHYewSpSxJJcqk7MvPaBHVIRQCW
DuNQF0xdh5X/H9aWmCEGuVPE11AOkU2hoT4jS2ovdRGzkV/bK581i7oFSbP8yp+8
x5Ah3mdv97Ffhtmfo6pXDQs6yUdK7NtTVUsUzLixcNMG+YsgzDW9E63xE1Z30ChA
h0E1wT1VhNRnt8xa9bEyfdCJqPdevYXaatR+pPlVkOR58kWKHFiOHNgEUaF8xerQ
BSzWTx3Kp9QLwamVDyGnw0EQ9FQdaOlQcuauh0hqum8RcrugB4VtlGfFw3FPa+3g
GgZAOQJ+0ZVGSB/hAEuNyr4wGu95OISvuXKIkqrdoHbYU+TASM0CxSNQtPPEzmZ2
diLGGMXsUorMYEbX9qBO8LtvanKOCXneaZsEsM8qWz9bVDhCMhQrgc9Pc+tsqCny
AIaDMNMyxijTd5v3gKBFW7zTwtd6lWas7lyUoZau+o1eSFfuB4e41PBmK/wVhMs7
gfpOhWIdHftMKP5vG8CqUAWanoe6uv+CeWrELFtrsmXB9l2aO50m+qOu/tK3IJGl
d2KOoBu0b3FYme9XArllewm8eUA56emOKuD9D5FkDvRinR3ljDY=
=co+3
-----END PGP SIGNATURE-----

--chm563f4rduz3hg6--
