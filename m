Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8D1ACED9
	for <linux-tegra@vger.kernel.org>; Wed,  7 May 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631890; cv=none; b=eZA5R9Isiji9YPM2gu5eJif8tOwSiFcq9FUzqoQZvRWWTGJWbwMOIAn8pJJKq6+MeJpGQRLGXH41c8YXJEx8ZZUJAEGbAgrY4QHTqnXj98XXk1ty1xRs1CsDe1ThXRbKs4V2hUUbtA5soWGdStJn6dtG3CADwfMr+uumATw0jSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631890; c=relaxed/simple;
	bh=axZl8dJgTkaddETz6TO/EpoUghSJ2/yjUoEFzWowu40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+Xb35N3pEowyc3XkLxF6Udh0NqcYm+Kv0V+d+S+eui5g7MKtnn19lUtS5gQ534YiQyYhjAXdLOpwAPpas96f7HwZzA1EpPmkYARavXZ1avrzhanPlyvuUDcefbU/0vFw0KcWv9z3uk8DLRexDQarRaAN92qEyzZpdchcVNmZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyCLaCzR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyCLaCzR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so6246f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 07 May 2025 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746631886; x=1747236686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0LSqgehAHh+JF1zAqeuuqzRF3zBOcqXSPgCyduzWmBw=;
        b=gyCLaCzR+hs9MWzigfa/4KB6MDQO3WSpY6gtgfdesz5YIcOQa3A1RRujZbXIH3t1Wv
         wnCATl9ZyYtoWjOG3ejHNOlFpk/GILKNLJT6nnUzoajLilqWu8KjRppbrHPQPUD/cj08
         4wafqs5RiMVxug7aSIR6MP9+uTapJ2yKfa5lO9iupVlqyqwqTJ+nkdK2B1nZa15yQsu0
         LEvM+2pUknCzRljc7zj6g1HxE1lisCDL31tUJjEKa+2wwMZz68175NJKgrBTChoSNIze
         KoMCT6cffIFsQv1bJK3rGwePO/jMnI9M6UcDNNcie3ym7sICZrYEPkalNxHjUd54A8BT
         5soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631886; x=1747236686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LSqgehAHh+JF1zAqeuuqzRF3zBOcqXSPgCyduzWmBw=;
        b=OGSprHZ5qqdcVtH2z2VNy6wpWLkmcSMBHouf1rfhKPEPDAOHK30i3D8rdEU4l8SBi5
         RBUtvLfaOV007rYnKecLGpm8MqVNhrOIE3Z1ZNhr4z73ZmJzC8XwJ1JEDNmD7V3cAzbg
         LtAMpFHDEJ/VYSUc22xi9hsZwzctI5Kj+eooV0XIhaTLF596If9pBETrlCoKIqiigOWX
         dNOsXyKSByQNBzkPBuiI4YKtsuyt4K3Zaxrly31FaFHkncgJNc3IXNO7ZVFRJN3BuPbe
         D7wRtrbC+r+dP/m5r8xSsTbsh1dLsWRy8IPu28BMl6Y/tWbEb6/cmL03h2bNriTU4q/9
         1zXw==
X-Forwarded-Encrypted: i=1; AJvYcCW3zoQHQ2q45fGzVZNhpRbrTBb8WbrkFTr8ewPqrsIIpZqrATbiN6uKVdeMDcoWYX4fmRWTzwFWwFqShQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJ4u1t5PQCtHEvcJkbikSjLA/R6YVr5fhOZ3a4hsH6s0ENoUn
	XzOcmi1DdTg5jfN/8CjV3IjPd8liiF8/7i2bOrQ3nv7M/nVh6q0r
X-Gm-Gg: ASbGncsAU4HlBQ964CCQg20fkkWzN5y8gL2vU2gBpx+0Cu/pYiUjcDxpPwDcrlfMuHF
	Vu2g7xyN7Fsalk8DbWA2ry6A1p6E+bmJEhPmXuYOskYiM111gsZj9jfPrBapXtktzj1HLE9xzCQ
	4aiRulheBKDmwkm1FNXTPDARoiICWwpIqqaqDMC4UmG79RLijgH6imCQ0M+Z/5Hsh4yfN7UpyO/
	hCh6Yme4W4DgUPeVO+tE9QPaUFtwitqXYAubXmwFz0NgR+jOQsMlAaBauNX45m84P773dwunSIx
	WK+45b1SpHlvs4Mtq08w7LkYLXJpbqfB1H/pUGbZCpgM6lwGlgwZXRTJWX7/ZaIY9L5UziEZXEh
	OO9LSn8mZiwvbgs4V+SSfftdPE4M=
X-Google-Smtp-Source: AGHT+IGc2KC7sLmOFv/xbHi+s6fMy0YISnDNcrSDbaVyUGPBE/I2B1P01JRPVbGQdHZVFeRriGjuDg==
X-Received: by 2002:a5d:5c84:0:b0:3a0:880f:1a87 with SMTP id ffacd0b85a97d-3a0b4a18043mr3369455f8f.51.1746631886486;
        Wed, 07 May 2025 08:31:26 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm17441656f8f.90.2025.05.07.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:31:25 -0700 (PDT)
Date: Wed, 7 May 2025 17:31:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Remove unneeded include
Message-ID: <yguq45oauqb43snpxg4yyldpwuqt3pz6abl2nwyb4hqmizukex@ecnoqfxpgd63>
References: <20250428153435.1013101-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="grb6ujg4rywgdmoe"
Content-Disposition: inline
In-Reply-To: <20250428153435.1013101-1-jonathanh@nvidia.com>


--grb6ujg4rywgdmoe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: Remove unneeded include
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 04:34:35PM +0100, Jon Hunter wrote:
> The header file 'tegra_drm.h' is included in gem.c, but this file is
> already include 'drm.h'. Although there is no harm in including this
> file again, it is also not necessary. Furthermore, the header file is
> located under 'include/uapi/drm' so ideally the full path would be
> used to be explicit. For now, just remove from gem.c.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--grb6ujg4rywgdmoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbfMYACgkQ3SOs138+
s6Hr5xAApRyArP5LkUAmRBwdE2IvtzFCUSQk47khrfXsQmXH2YETuF7/dxPPNt1Y
oZNPvbRtZhv6xJVJTs/Gj6KqFer2US3cKGsElXEH1YDBr87LD8ZDnZazP05nXR3d
QAteKKaKKvkBe90BSeNeaMa6m0VyR6GW2f4aeHrKsMP4viSEws5dhbX4NBS8s6YM
NMYix7hjwa3yfZC3FDDVV0LaGIIc6m6KHFj2WoX9BdLzIdOeUq2v2zgApQGNNoFt
f41E/Lt+nn7vcVAfFKofESnofBLGXoqfhsujeM+fJWRaTzJvvuKt3QREi2i/I175
KhT5TVodYxSrQIP6xnnSbkb7nRhBOYlajfdOuaP0na76WpAlUrxUYtLjY65twD2X
avP1EISGTcpx5q22wywamLig+S6Bg3H0MBTzPsyQh9sLbnO3YDZEeRhQIgCmp7oZ
5+zgoYr3CeaZYcr7FlAHFvPtisSg9d6OBxrG6YpMUQSqKcbIatD+jbKn1TiilZuo
/XH9oF0EH9YL5LNXHyeaWtNg59opx9dMmq6Ui/ADFuWm7mmin4214wIHxCLAnUrk
mnpfoSGaQzOOBZEMArnKA4z1UZYWn8tRlC7x/lhjVnBhznMRJDwMru7NjXRFP1YV
opsIpV0qW7atVBBv9KiJaNiVi20vK//S42wRxovEtkrkA0a08/c=
=p923
-----END PGP SIGNATURE-----

--grb6ujg4rywgdmoe--
