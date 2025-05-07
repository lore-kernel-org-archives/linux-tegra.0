Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA4289376;
	Wed,  7 May 2025 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628370; cv=none; b=AYCvulA5kFabcMqhxnb7e3kSmnqe9TkZZZpkmrYLDRlMEv4P6WdMVoaS/jJOOynyFDgmgFRZeNFG+zW9nGJNCDDxy2rqIACfs9EoZfNjpj6E2ZM83AwHQ11kkhBUUdF5GsPAY1VxXctG0dO4/962Kr1a0acuEHBQAMKn6OT7GSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628370; c=relaxed/simple;
	bh=vMCsAoGOR/jE9JYpIk0OdcLmxBTPV6g7aYkv5FPcsSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbkQ2pk2xY7caScBdpLZMQecrsfyfbSqLln08BxmwfhVI7kGHv5q5wy4hjoVG6qz79fZPbhrLBgI8kHddAde/GogCu/9GcvRnx4LJw+dMij3HiOY7rhxhbwOotBUemCMa1hhjGAqXNACf9xILWZIpKC2jYGZkEayV7gEXi0WV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBE/PAt0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBE/PAt0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso16227525e9.0;
        Wed, 07 May 2025 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628367; x=1747233167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4cK2GR+MTIxCdrAVL3u30qal7MJPY3+v+RkxSo+dm/A=;
        b=JBE/PAt0KddAsUNH/Q/kX0qpc7CJQHUvtSBqqP3io+8HpkEg8J+MjC0ynOUK/ojRrs
         hj0QFft0MJI2iWVfhl6ap2zisAQPOki6jBK9Wrl1tC+aoNZi6ybjedURX1QfBeOKz2KJ
         7cLWY88ri0nRmhtGJ31lfaoLpOAhkr8zUj6N7yVI0ze9b18n3SCkcTOYsdrXduQCnIg6
         2R9mjhSaBtCVDxh3mIBnuGt8PGG3qEITs9zJpzmfqmNqW6BsQOt3UALjApITaDoSYCQ6
         8wJUdeNBjUaDgnxG/S8VcpZ5JtzE+XqQ82Qs/C9k0tn+L04Y1KR8BjLX8WsnZatYhGfd
         Mmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628367; x=1747233167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cK2GR+MTIxCdrAVL3u30qal7MJPY3+v+RkxSo+dm/A=;
        b=j3TuZNgRN8/8rJIOpRdco+0gregtHeDnb2aIX3cln8fZzotG9MJvMOD75vmIVPyVtA
         8nWjgyL1SPhzlbzD4gsosRkxjHCObAiundvqGgQo0+XyT4qtbsc4DjByuUzECYYFGnWl
         YucgQUDdtn3NBidDMq05Vcd/hgQoayWV/Aaoz9/q0OZuOhgCf5oGOdhwqDMJ7ZZcJoNp
         Imm4PT1uW9/ej6H9Wrrtb5YMj4iCx7AUZITS0Gi2+zzaI5FwLg1f2hmCRcFCeZFXM2Lb
         IB97+9vajKeeFTXtbQypRjvW+tDg72TMzCNEhb6e9lJKycSFE4BdV/I9K7V1w7qCZaGl
         Y0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXirXhFFERgLNwTZf6gEvZE3TzMJyKatV+Da6GBa3v/slNapq04BXsTbHnqVJXN0cuVBLUNJl2cU4if@vger.kernel.org
X-Gm-Message-State: AOJu0Yw66prL5sS0EkMb7a9pDWyGEmAxEdWDqEvsVbli+2E0PEECRVWb
	25G5THcXB+65s/3y7OYywylwi+4qDGs6sXd+BAHuw52+huunCWu70GAoxQ==
X-Gm-Gg: ASbGncsKcnVvvLDa0OG9bqSgnaQ9erTqzJtXCIMSrRHnNTE2zaYESUG36AgBWhKh+Re
	wwZhOcI47VNbyOZ8++xY14KZqhOig+WimA6yapMz+/tyGiwhebvwAI450ie40C1P60/EihCGr9h
	s1/eVejW6LgHTu6G6hw0EdJ/vN/BONtt5kJ9irOnVeGntoEesbuGppYRd+D8zCoPTLD9lnYaVmo
	bMppRJYuAsFUH7ret2LXogbVgcvosR2TaQA2drBvuIe20UTTU2WqKNrE0s2HvO+pey+ARhlhIaA
	C+gB+cld+eptc+of+MW+9Eor6OJDcR6lH+0yRcAnhVEUMvg2Fr92Z/ujw2xEs4u3oyDff4UGzjc
	6HnN8HLMplQtOsKJpA01ivpCm1mE=
X-Google-Smtp-Source: AGHT+IEd1QJ3UGhkjXTiuM6IWrT+bURzxPWFWLEi/P7RC8gos+sLg4dyG+3f7M+cmEZydt7eQ6bD3A==
X-Received: by 2002:a05:600c:528c:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441d44e32cfmr34862855e9.31.1746628366474;
        Wed, 07 May 2025 07:32:46 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3af15bsm2800915e9.30.2025.05.07.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:32:45 -0700 (PDT)
Date: Wed, 7 May 2025 16:32:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
Message-ID: <fknux7o27tbcykml6ze4rcuwkkfxuiv7uvbdkejf5ikermr6h7@57jse3b45wsz>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-8-thierry.reding@gmail.com>
 <964d8b07-aeb1-437b-ac8e-c129c49b2a78@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmguxf7cc2ndw7cd"
Content-Disposition: inline
In-Reply-To: <964d8b07-aeb1-437b-ac8e-c129c49b2a78@nvidia.com>


--wmguxf7cc2ndw7cd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
MIME-Version: 1.0

On Wed, May 07, 2025 at 12:03:39PM +0100, Jon Hunter wrote:
>=20
> On 06/05/2025 14:31, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The PMC block on Tegra264 has undergone a few small changes since it's
> > Tegra234 predecessor. Match on the new compatible string to select the
> > updated SoC-specific data.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/soc/tegra/pmc.c | 132 +++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 129 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 51b9d852bb6a..6f1ea5b6b9db 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -2892,9 +2892,14 @@ static int tegra_pmc_probe(struct platform_devic=
e *pdev)
> >   		if (IS_ERR(pmc->wake))
> >   			return PTR_ERR(pmc->wake);
> > -		pmc->aotag =3D devm_platform_ioremap_resource_byname(pdev, "aotag");
> > -		if (IS_ERR(pmc->aotag))
> > -			return PTR_ERR(pmc->aotag);
> > +		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "aotag");
> > +		if (res) {
> > +			pmc->aotag =3D devm_ioremap_resource(&pdev->dev, res);
> > +			if (IS_ERR(pmc->aotag))
> > +				return PTR_ERR(pmc->aotag);
> > +		} else {
> > +			pmc->aotag =3D NULL;
> > +		}
>=20
> This part make aotag optional, if I understand this correctly. This is not
> mentioned above and probably should be. Also, I believe that currently
> dt-binding has this as required and so we should update the dt-binding doc
> to make this optional too.

Good catch. I actually noticed earlier, as I was going over the next set
of patches once more, that there's actually an AOTAG region in the PMC's
address space, so I'm leaning towards dropping the above hunk and leave
the DT bindings as they are.

When it comes to these AOTAG registers, it's a bit difficult to tell
because we don't ever use them after mapping them, even on older Tegra
generations. Keeping it for now should be fine, and we can subsequently
drop them (and the driver could always just continue ignoring them) if
there's a good reason.

Thierry

--wmguxf7cc2ndw7cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbbwsACgkQ3SOs138+
s6GdBQ/+PXZtw/PwLe1C1WBwkC4dYdLtKOFbwk1qXEFlf+QhwRhwz1DHrNmutqFS
Hc11IeCLgNnUdawS7IvX8PJWvw4voRcT6YHKgjyV1hHcGitARgYnVGEJ4nLyXjj0
ThGzWWDpMhgoivYAuQxyfbAkTCYv8ef96LhdigB7v6xsvTYsWCago/S4miXVxQGd
8FR6GXgckq1WLGoOh+scMF0TOoXDF3XRtX/A+okCt2+9MDwhhg6dKwaQXOn6fH0P
eDOdholwnsNdji0oXviRybo8Beiku5YLX4/NBU51l+OZqWBhkb4GQIdEQBTzzTsz
qLkbr/nsOvyALrS4gtGQQeatGx7Q9709OO2huURY8bk5EyNNfjFvH1YTDjSqdVJQ
6jkipWcafg2JwlmtmMduR/c1mGVLyypK/9Vb6cFCOGyXHAi8YPtCrygT3jCpD+H+
+WGoBAENxSeqk4BhlEcTwlgqAqMgNJCzEx/3UZMjA9YO7wBxFjymtRwwpmQ7mYKO
gMamMUL34Geyt08WEzZHuEIME1v4IL7W7t42D4/eBXp29ugxoUKXMJ7uKmzNCdRl
ZDLc0BmTVujtP40ywIbN1EMwsWwbJXggovmxcEoYJyqBm9zUb9QP35yZba7+AbIj
Ctno5Cfm3923b7Xsr7x9UwHD1rZy5EV3ksPO9bZrxSuUQDJBxdQ=
=r/81
-----END PGP SIGNATURE-----

--wmguxf7cc2ndw7cd--
