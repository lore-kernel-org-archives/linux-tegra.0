Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027A2F90C4
	for <linux-tegra@vger.kernel.org>; Tue,  4 Nov 2025 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762263890; cv=none; b=rpHxG0FyJs9obqMh4KoLot44QTkSVDdjmMx2OvShdZrjFx2XIB5YtkGeFotwC5ywXv4mbRyUtvElHJg+QedKccGKwF999eOg1BhaN2d0psrUApuGxONgd3KGGf41Vq8ZgAAH2cbV/xCgrjwm1qY2iBG0t/rn+Ot2sOR1Zt6dHEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762263890; c=relaxed/simple;
	bh=NoSi6iOfzaON3sc/Q6+rRroyXBxwW1wxinuB0tRAopU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5pER+a3GRtXMqSAMMYG15NaJGFxb24bbOzgL7XoLQ1t0RUEn1Kai9D8kHeOGK9XWZQQ/WFFxXdRVQi0enTmsbVzmA8rivEmVDp7u1uNXeDZtez2kHbPUy7BkQ/SlH2VjwLbckNrYJ8W8jD3T72hxcgZXpplIyuk9yDi3MNiwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnlA2/VB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnlA2/VB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2885372f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 04 Nov 2025 05:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762263885; x=1762868685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoSi6iOfzaON3sc/Q6+rRroyXBxwW1wxinuB0tRAopU=;
        b=fnlA2/VBIxZLyyxJS8m4t1KZ1kPa5DFHPARe8NY7JQCa8lGVnNTv0DCh8NxBfQLUg5
         ydXwJOoFhJAmmiKlCGVV2Urnf5wFIYDvTimLzdVzjpXDoHggYzA50qFSeWN8SiPvZvO3
         +xGnnmUlXeLywWygDxZlRvArJX21bG7hQtLiIwvEQXt8klKWvScyA7Ze2+bKdv9/lpLs
         Eo6D+O+ox2rd6GOVfbzfhFEgu5rLRgUzSKV8OmMjkvAmuX9ePlKeFqfJAb3nMDGaq665
         QhKfUI78sWTi1c+kRhZuGpM3oNvRWr/AqKpbzaxq3k4KYA0zYbD3WLEzGirG/m3GvQpK
         vF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762263885; x=1762868685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoSi6iOfzaON3sc/Q6+rRroyXBxwW1wxinuB0tRAopU=;
        b=cnw1z8J7gYr8jJ6lhzWFaSwCAHbBdv5SvWzcF5I9jXZVvHlfzSI46ls7FGz3pYOtmX
         AF+4/Ip3vAWGXGCVoYmnLGO/EKlppod94gF8RqZ1+YpdsaMWCavBYD7/+REV37f/XiDp
         0AhCdk0I5AqZoBnIaCQ9jmywlcdcUNrC8PfjP4AjnJDbPvWZ32WDaSt3xz5NZgN9MhrO
         Q/5wsEFnE1QTYw2AV8Wpn5Z6NyZw1aIDEGhYZqPlyhLxEw5209k3gKxWsnGfrJlqeawl
         sdGhXOG3OoWFrR8j4evEgU+MhjdImqf3HiS0baBrz8h4uZf2QUzyAIRB4fGNsjjNqcOe
         Pw4w==
X-Forwarded-Encrypted: i=1; AJvYcCXH92MaiCmOXw6JT852/C32gzYNmIB/PbQml5b5NXOaN/dPsN1fTj109u2X7UpSWO2EzR9TYdR8WG7y5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgHlVLJog1aMlom6LdHWAj151dtkkF9m5KOkRK2rMN+hjNLO3P
	Vftc7CZnkuXLjXnKtAH8d17vBI5058MDlin9Tiddzg1mplCpyFRGu0z9
X-Gm-Gg: ASbGncvidjIcUJH7fBShpcEde7gmcpmWRYNTs8/tsTRrGxsXk35SmiHIR9/Hl0gSHEI
	/PfVtTtoM4HsnRFkJUP6aAjej/psYxk7qksDsvQlqHcmSnMALBV0luyqm8pWpNn8xuANzU9evIP
	glybWMewZ3ITEdQEwcgMWXNXfCjSAxg6O58cPtzxZ+7/kdmyeApBWUZ1XgQrE94AanoewD22bFv
	1kIL46BE/739lZ9d8SO6tlHZWN7TnE7sYmox4pbef3dE+LUwg4TSHEzWPujVQ6hRPrSUKFu7WmY
	YZWtQfro6bhyFnwdvjGB91YxzWxm0QYUgKribxqUNJw9LqNPwuhppGTBBzypwJaRURwN9m0JBrY
	s4PsS6iMMyA4uvvmCBc2n2iIXuu1y8zW2PhpkdXj6pm4c70ydbzPKVLT9O+eJRBx85a8/MQavlW
	QA9jPAMK/2z2y2lTHsrtGahRf0mLu+EZKUIw/yKm3ahaBAU6IEJVnyZBRXTPS96Ug=
X-Google-Smtp-Source: AGHT+IE40ncyRjddun4Krk4OBXuvcLs9vqcTDdhkIY8sG+y6VrKBm9KiaNqp9neP64JnMKFrQjGqDw==
X-Received: by 2002:a05:6000:2c11:b0:429:d11b:9ecd with SMTP id ffacd0b85a97d-429d11ba1e6mr7263509f8f.57.1762263885453;
        Tue, 04 Nov 2025 05:44:45 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efb3sm5150885f8f.3.2025.11.04.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:44:44 -0800 (PST)
Date: Tue, 4 Nov 2025 14:44:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: sheetal <sheetal@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Move HDA into the correct bus
Message-ID: <7mi7ubuwiwrdiuazqyu3gwg7oy5mcd7osafxvl3iloy3cgw3xz@zctn3djwf7lp>
References: <20251104132345.1689397-1-thierry.reding@gmail.com>
 <bb48fea6-de95-46d4-890c-acaabb1d588c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64evo6whbm4otjdc"
Content-Disposition: inline
In-Reply-To: <bb48fea6-de95-46d4-890c-acaabb1d588c@nvidia.com>


--64evo6whbm4otjdc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Move HDA into the correct bus
MIME-Version: 1.0

On Tue, Nov 04, 2025 at 01:34:38PM +0000, Jon Hunter wrote:
>=20
>=20
> On 04/11/2025 13:23, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > HDA is part of the DISP_USB bus, so move it into that and drop the
> > address prefix accordingly.
> >=20
>=20
> Is there a fixes-tag we need for this?
>=20
> Otherwise ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

I think it'd be good if Sheetal could review and test it, at which point
I could equally well merge it into her initial patch that added this,
which is still very close to the top of the arm64/dt branch. Even if it
remains a standalone patch, no need for a Fixes: tag since it'll all go
into the same version anyway and doesn't need to be backported.

Thierry

--64evo6whbm4otjdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkKA0YACgkQ3SOs138+
s6G5hBAArog50SI9L0nI+M+/xiSp39TJju7tJzuaNv8mW5/C6OUX32nJoVahEuCF
ea6xkMaod7Je/1FmtlRTMjGugPRRWFUeg4+wcmeZbYzX1X4J40WyW+HuYngH77Qy
QquBt1W5fLd33sbffJb9DeROLfZbj8I/HVubMPNwvYdJm01wIfxe+Ljr9J6qzNcG
IG8yb6rFfZAupN73w7xoXeco2sQPwWpLDhXtJ7GsKF+xtJqEknttXei4GCETY0tI
dRueeg3Rl3rW2uEJderqkvU019r9eitiCuBah88fLDuc4KbdgKWSVmcvJqVwA2PV
s2j87u3XgkL86+zwdkXXX90ChKW8s/vqX1gVtIY89tQ2c4geKhnmpKrjmaPEXHGP
1KJi4JbvcxLqPVLN2veffE8SbkNPz9aj2BRPgEAfCgqnmTtIUJQcMU1DK/9i31A5
NWYZ2b6YSD6/9Om3ILjJpmNbsFhb8+WygfRxvR6DrRjZ7FQmjLLD5FxcQIn+XCTP
LZl/7hD4ju/ENPt15HDkFTVfQgf3qP6kXrPqVsWB++QQYVA/WFQZpWFh39nfpRU4
+BnGY+3z3iBfvjxgTpEnHVmWFz7UuvbriVqeJKYAhJ0N4v5K6tXKA6E5Y0zAkN2O
wlSi47P4lJ4L3ehNPfYszoklUWFva6pjqerXjJ3lU96yj4Y2xrQ=
=NISw
-----END PGP SIGNATURE-----

--64evo6whbm4otjdc--
