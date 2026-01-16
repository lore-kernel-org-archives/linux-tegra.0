Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727E35FF77
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565668; cv=none; b=FtjtMWHDa3GtL+Jt78fl3LDVeMNB2AuIUIWtqQYZQ7/EqtM0FsA5Fatc+nH6L/DSK50egrZ0kFE6i6Fk0Z+Yx40wXGdSoSDYy0p5p6IgF1dcejcmiZqzJm3xWaj13bDj25NRfhXphf6pS1VwhPfAeDippDT2V1YtTZJoSc/lK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565668; c=relaxed/simple;
	bh=Uxqonx1XGSWgxig0BtGNWMI5iLc4WClMnDhq6CDU1vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR8Hy4+6yVY1Xp1HDEUWZy2IvjS9dXjwe42Rog7dl+4zPplEdbH4EvaMpEC5MGy4J7pUL4yCXGkDYPR2+u1puaRzja71cHzu9K4AJ0MH2vKxd+jH3A7fTP2evAMb/HlAY+B0xvQ59VM/3CVXXlbR1WsnRrNgTjDmNfmrBhSKwg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3aan1N9; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3aan1N9"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-123320591a4so1964078c88.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565666; x=1769170466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxbenU8ZSpGXilJflF1lFNLpWQ3tMY8MCLmXY1GJJ+Y=;
        b=T3aan1N9vZr+5T9Tod/449jAoOF/1REgnLQSFM/ZyejDx25IkkmskhkiH5jjPI2jDU
         Bwnv288phMFySTmEpL1W8popKOa4OYvoq7RWrcWM7b20OpPHGpvKoDQ3Wd9cd3H67gA4
         wqa64BcbI1CjsB/UyTNzFB61cerzZyWNRPske1QLnqJAobiwuBmJmHbjbmhtpb0TyrbJ
         af6JkrQWmuWQg0djBWeQmSWXm7qeiRmAHL5fSE9ueLnamhAT2NKDATGf8YlRAqmDfFgB
         mDY1QpFwRv1asQAEKkOc7dWd6BP5vxkjckuwTmXdjMNdT7NWj4IqCYNAsJAruM2io+E7
         YxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565666; x=1769170466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxbenU8ZSpGXilJflF1lFNLpWQ3tMY8MCLmXY1GJJ+Y=;
        b=WCuuY2Q66khSAp/Zf28YKYQVWA/ahmykj4MaHxM2T4q1K6KPHRDgjf3K1r19PT/Ifr
         utS+c0zfiLKW3k1mIADInNSsdL8YzgySnClIi10olc+rs60Kc8+D/lGoqeoffSxIlPyL
         rGKRx2PAFdqkKHVQLA2J3qFH3HAdRg7/vQ3ZXTGnpbFJQfbEvTvO4RXRT3ZaMgSqjYO2
         X+H8j0cD87L5DHtmzQNBow8iS8H34tVszF2bfV7TTQfrd15BpXKJpQKZvq1GNVM1NxFo
         qORWBYRVy3HIZtFSExYBtQF57e2r+Z3KJs4V7ntrmWfA1QkW+3xIyU3+v3Y+AKCL/HBk
         8adw==
X-Forwarded-Encrypted: i=1; AJvYcCUwuYGHmgx3fMkdsZIPuczFBNKiM6a+qlznPoHgYm2j+C1U7fEnEDlfyU5VqumebxN6jh1LiWBZF6lN6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhM64bMZoVxKE7SU9T4B96Xo/W/dhiuxhHX6jRtTqBsVcNH+EV
	SLqF3bq0iRulNgzp3g/maik2jE6GSFrdDBIXOud/0PzmNj6Q18jQ0dYu
X-Gm-Gg: AY/fxX6bK7fh23pliYzt7k2FZuFnlXaloUH5ng4v0u+OblO6sAHMeZOxfW6yTpp9luI
	sX8wLB0bCjhPnmOcC5t4h62O+3FlS9fBkaK9cFXZjjqz0q6lASa/fIjxXKrQ8abGl4MhbCuFl4/
	EWAQIR4/ak5rBrQgUEc8oFfZ5hF4GTmMKuRMfT9b2XnMejHJmKVNub2J1m15fjmSNQ1lwGI1n1O
	WpEG3Qj7FQaqUkbEj23xRZUDBSN+0wkoOXmEbxVtCigF5JaMLs/6x0VYUT4YXalfPAkRCAY6LlA
	olHaSQ0RBoHhvHJwmTxOrbwim5zJ/KJJTNDIgcZ0gq6nYesI8WVXVlaOx598586vFg2N2d4Yr7B
	ZJGq8+/w+X521QQsMGB7f9RAVJMono0g8FaremM28JEkpeM+LZusGjHiqMek4WAR/1Q2CI4uUse
	aj+pHa8/W43ePVzZ8RakQColIWzorjyQhRpguJ9djEOBnlEoUAAlB3GqAV+dx6kBZtIrzv4B9Th
	LzHq1fZPA0a
X-Received: by 2002:a05:7022:2484:b0:119:e56c:18a5 with SMTP id a92af1059eb24-1244a7257afmr2539382c88.13.1768565665644;
        Fri, 16 Jan 2026 04:14:25 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm2116504c88.7.2026.01.16.04.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:14:24 -0800 (PST)
Date: Fri, 16 Jan 2026 13:14:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/tegra: dsi: fix device leak on probe
Message-ID: <aWorgofgDfxprcPG@orome>
References: <20251121164201.13188-1-johan@kernel.org>
 <aWd3iFrujbRWyyyx@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzdfoibcbt5qb265"
Content-Disposition: inline
In-Reply-To: <aWd3iFrujbRWyyyx@hovoldconsulting.com>


--xzdfoibcbt5qb265
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: dsi: fix device leak on probe
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 12:01:28PM +0100, Johan Hovold wrote:
> On Fri, Nov 21, 2025 at 05:42:01PM +0100, Johan Hovold wrote:
> > Make sure to drop the reference taken when looking up the companion
> > (ganged) device and its driver data during probe().
> >=20
> > Note that holding a reference to a device does not prevent its driver
> > data from going away so there is no point in keeping the reference.
> >=20
> > Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
> > Fixes: 221e3638feb8 ("drm/tegra: Fix reference leak in tegra_dsi_ganged=
_probe")
> > Cc: stable@vger.kernel.org	# 3.19: 221e3638feb8
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
>=20
> Can this one be picked up now?

Sorry, forgot to notify you earlier that I've picked this up into
drm-misc-next.

Thierry

--xzdfoibcbt5qb265
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqK5sACgkQ3SOs138+
s6HMLg//aI6kPwRqWPyFQ4dxrRNAzkjky7szL1OQcea0JIHd4zW2vzOOL9qtmj3M
S9FW2T2r9mpNxR5MYMtu2F6HDhzBVvGQBgrTJ9H7JBz6zypyan0K2Iw5agjlb2I8
GnSMiAaBTH6Y9XhOW3gG6t7zF3NTemfhCfxX2y0wj5ZRa3NarOEGB+X1YByx0HKM
Jk6BQKGMXcWYRnb6Gxaa83FjC2kI5KkJymlubk+tlOgzcfWcywYXs1TOBbXt/OkP
BCVyhQ89sT0X7Lojl+UCcr7/6LrkPgLWz1bKInlzQ0mjHhuVjL4PBNBwSDuE591z
qiQHGhJGHlTXY+8Lp4ndQAMLp5FBBfKguR7Odxf+4+/VDaGnDvqhpNXU540tU/jP
E8u5pjviUIjSuhSYHTcggcqJ8m9WalGq5CcLXExIl1J66MrRgw1AqJB6nPF4gIPS
fCcMHGkua0XIGD9FoG5Ij+j80uq1cbyKITP0auDAKRgpiEC2nXLkCbl5YQEwcTYp
eUWMnu5tmloUmGc1dLrN39UsJBHzaPm/DFgU3uc938uF7Bc9NF49Hq4sADkwcD0R
+v1OcHotaFOkGqvcPKeNhfuoJ/2jMBs78geOGfJtYVlpGXWZ7T8tndAxGEb/HMmG
25DWp72ALnZJeClQZn5wi30wGTsyKNvyNm7343GAeLQrROXg9Bk=
=pibZ
-----END PGP SIGNATURE-----

--xzdfoibcbt5qb265--
