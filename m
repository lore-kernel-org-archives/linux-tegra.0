Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5D2ED84C
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852936; cv=none; b=eYdP1MdPHj1dsjp1aGsxgWEbd+pU7aUjolc7rAUPDMVjiEuKmxjbjE32M0NzArO1oy05XUXKLcn/bjG1tODCqmRkUeSRH2Fq9sesOAZuxnd0mA6EizSNAhI7VtkoSao1jkYwLK06dvLkvXGeuSwrRpGwDcLrSDj0xizfht5mT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852936; c=relaxed/simple;
	bh=eqmRamTbG4clj9Aep7Jsrzc0cVWRszDs05w8x0McFHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az3xrjK64hvlF0t1OzjpfMt+sTQRmJwnNI+9CNgzHxuFNwznKEM3i/gKL8J48vU+qbeRxhgd7a8ZjfJoRiNiLL1I8ASlZsRAUZEr6f/B4axgLhiLPY5fiBHCKqwwXpdijc9gsoDsA0AOHu+Ip/dTUweDbQyNsUuvV4jOBW58K7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fthhA40S; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fthhA40S"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so15907585e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 12:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852932; x=1762457732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EC6juY2xw4PiGI+9uqqaCXvPHetzGAwXkiLX/PSLR2g=;
        b=fthhA40Sep+O4oojZFnwil1z+pwFbm6zvlYKEi9oBJ6q4WJZiCDODvjOIhe9Uc6MyD
         pDzPXEktS0WJNcN9lxsvOu08aWgaY7rAwxWxlXqr9ssklMSf8pScJLG02B6tp5mzWF96
         Bn55UYICjmpKAdfKscsThC8KLi/SKw/hsNce4tLM2zuJfXKwXUApM+UCSMq/Ls30wsAm
         ToyVCpp1CfnYWqeKrb3/7ICN5CIO6o0zd7bH4ETmsxisy4ZLUMUzD6BWsWesfsyxAdlo
         AI/9sykG9aS1n5aqrxcfINkAtOVYVx9Nhmiu4rz/C14rC6EdOA55SCfARfqR2BDoF0kf
         /nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852932; x=1762457732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC6juY2xw4PiGI+9uqqaCXvPHetzGAwXkiLX/PSLR2g=;
        b=qWlFejNv9lHPaL7hJE5lD6fCHbfI5Afip4MIcr2UtpbFpxKsjHUla17WFKWEGyxd6R
         gPKkBFkBjjNhu0W4owtx3H6H2gKAEP8VGL8Iy+j115mcdNh93Q8vq7OLHrBzMisLVz5C
         8D5hKsBL6jlYLEOxYDlGHI7k0hSDHTWx0eAz9qK6/GSDnbt2Qt1MRxAg+8E0IUBajvTl
         NA4VdYmqaXcicnc7uzjehiqU79SW5my3n/Wuwu5Ttl7X+AYwl9AcFDvw3yEhEiusb2UV
         /BVW4nw3P6/8LrURH43jwjNyI3wfZULAqEXP3CxW6rigWkna3lAjFyIEg7klL6sb6L42
         mXSA==
X-Forwarded-Encrypted: i=1; AJvYcCUVApciVrIy4UXEH5lloInpIv8ooQ0bmVpw4EaWY1uJ2sWzmHr22+fo9BJG5GicyHt9hLwP/tsRG5RiXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlyvrqHNdgZHL7ff2A1wCOzYFprnCk6KJgMVezkK6iA/T9plT
	oAwvBdkZyb/CyPY8/fdy4xbdSkZtDVYRoQCpZrZHSrEcSCSlnJEREklW
X-Gm-Gg: ASbGnctNGe8EhsEEkH5Ajl9OXKeWGLDFdQaO1xcE8iaSsmwG5WjyFlz9BOJQW6wXuuo
	WNAGrTIdZU2nuAumCP53aYZsSFsgaDNuladSJCcYG7ztefvrPRTUrPwT7/Qr/irNS/SX3uUKF7G
	mLOs8cwUUfePFC3dVWbUx1gayKK1eBNRp/Qj2wBJ2TxYHuN+UANRpmKHs4n7WVpX9edpyUBbbfk
	kq/2Kg95ECYVxKJ/lWWz13jDnN0ulwcr0TGbPgooiw0V1nzI1sCHN8xp/64cD1DN1pblZTajgoL
	T6kIJZ4AN0x8q829Xh85mv8p5xNIV5Jmw0nHxuXtqUMSdPhg1WP1OxXve7Gze+H+X3jYdRP1KEG
	h+YwvGQq6aJQbhLhWKoG3ofhH4JSwxPd/G+5KmYV0inMixJM3AZomAkb3YXSxsQznTGwbJSO2CV
	SaqZ5v55U/6KZ6L8b9UwZapgvDvQlXtKEDohEoAyLqajUsR6FodblwUFrxQM71qdk=
X-Google-Smtp-Source: AGHT+IGFztItCHGY/qbdwBuHkfRV467cKKxUC0DGWgO8Y2TPr5ZY0z+xVGs6NBf6tqGX8bxV7Yrv3g==
X-Received: by 2002:a05:600c:3f1a:b0:475:de80:bb2a with SMTP id 5b1f17b1804b1-477308a7cbamr9844395e9.35.1761852931647;
        Thu, 30 Oct 2025 12:35:31 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm33074056f8f.40.2025.10.30.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:35:30 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:35:28 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
Message-ID: <rvzqaji7na2oipwcbw427aigjiu4qxwpmc7maaz3uluprmip3a@s4gslwmiuqxv>
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qccgnu2h7qzvmwyz"
Content-Disposition: inline
In-Reply-To: <20250611-p3452-v2-0-fd2679706c63@gmail.com>


--qccgnu2h7qzvmwyz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 01:53:36PM -0500, Aaron Kling via B4 Relay wrote:
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Fix usb power supply to align with downstream power tree
> - Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to avoid
>   conflicts
> - Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7e4310@=
gmail.com
>=20
> ---
> Aaron Kling (2):
>       dt-bindings: arm: tegra: Document Jetson Nano Devkits
>       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support

Both patches applied now, thanks.

Thierry

--qccgnu2h7qzvmwyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDvgAACgkQ3SOs138+
s6Hl1xAAjtuhL7toq4LSF9ZwClfCP2QV9wG87nvw1ztGXG3IWD4BzoVy8zBckjcS
KEsTwNkqZICEuh6tculbT+si4jibUr4jSYIBGExOBq0M00EUGTIbILvbKhH7hdBj
JUkLBJ1wDhLw5dT5rPqhSGMngTBTTY381iVnnpCCxQMeEm5lrFVGHg1nwM/LfIG0
rhTgoiSMdGpVQgAuYPngchyTisnpp/rhkvUNeRycskacHv75QgGyG0y27vfmk+jR
mA3ycvkXgZeCEp8BT4s9M/jATyopdHfSHF1MfXSOsn2zgKs60TxcJoBpVeR3NRcM
7T/HENMCJ+E4LZ21aOu0I6H1f3Xuasxk17o9V1mJybH0LE764+m86btELURrhtmh
kNkIkfyzyPrKItxFAHiNdrwTOW2Yu4BKvVm4a9X0m05PJnCqik0Oi4E9uf1MEgmI
luAk/yPCHRXlBOC+6a8m2goClQ9Pl1ciUSl0YeMSZtRbec7bnMpkFNpDV/v0mW+1
dur37Ry/6jP8gQxFqfPEMcZsIA/FKRG7jr3zowFtSCjj8VKAK8lfBbE/EmlXlGk4
cdSrjFJMAyxrL5nMB3EzQYSTT2+6zbMLuNbkGM2+Ae7bbS69C1o2XvmpYSM32l1G
JA9N24WvYN9497h2d/QEKtFAXvaRqFKks4VHYr7w7PmirXRtOK8=
=dlVD
-----END PGP SIGNATURE-----

--qccgnu2h7qzvmwyz--
