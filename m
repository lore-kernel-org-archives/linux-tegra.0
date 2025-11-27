Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D1239594
	for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235847; cv=none; b=H+t02dtCJqb02L0+qXoKW8ek3sP0HYWObjbh+BaVNbo34AmcRFI1NhsKs8CR7CI9XBsPNdBpCRdDkouBf5FD9owqxRnbmdVcmPkyeGpvFSQ97srVnJNsEw4JDUiI7WOw7c/OYr0GCeQDAD5sbVXL/Ng4cGPeYRFzwuMWeVRzH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235847; c=relaxed/simple;
	bh=spSmCKtlFmblh3YTGsQTjmqMV2aD2KZPtJTd3tmXQmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKQ+ifEsIBLS0v6W+4taNwqXi9/FU7/MNk8AHywgPYKSomkiA+9I1W/Vj8EiATUYpf/lurCl1zjby1v3iYypvYyWDiwioNkjl2MaizG5rU9zOpqQ1RXU3urYQ+84pD+eWpb06ZKGHcMHotH+5RKup0CyXXNKsGkTQ+MOXr/1czY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzCfYd7w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzCfYd7w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so2922185e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764235844; x=1764840644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ4PYLxJ2erplB7TcyLC850CpB7n84JAFETV9m1Ihb0=;
        b=YzCfYd7wF9Y9/f3st6V8KaeM6zdguW2ii+PGb9D4dLm9c3giHE1vXZ7ZH6St25N8wJ
         R67HHjCeU1UIgNK4EHruY/0P8RmVy6DM8aUmH8eDsT2Ti9oa6/Kx1s4fXUxe+I/hUY0o
         LuPLknKgAWWUdQE2mmYA1IzS9wunJCyeo5HuRClii/d+tVlC6JGqq425PfAVEt0zZ7m2
         35agcABKutMtphtZKuxN7sENLer/wrVITkVuUtgP1lNRDMlNNypjd0BMcxSlvxYkeDIS
         /1d0YDde9LqnYV3EOw+uVyWtR+8YfEs0GeUPOIliqqK9AaJchOnUenOm6csiZPaoNzzF
         kKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235844; x=1764840644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ4PYLxJ2erplB7TcyLC850CpB7n84JAFETV9m1Ihb0=;
        b=pyWDCeQjaCqBuQOr3EOKvM/Mo7xSZqRSzlM9Bvj0WqKo2otUSVvhyaqB7gCltwxA1I
         Wdsutix5oGA9zTN9oT3PvQNS2pq/4b2fsUoM8lqe6/yz6UiOxj1pbSG4yaJI+XYahVYw
         BEi8Uw+AtjGqoTZUwTNi3MOECXUKUisCEIBui6aE7VTCSGld+c/ZVF4oAInXorec8hWk
         NvMDIDQbIJUanCNc9hSEDYLjsp36R9/Vqixp562Dc+HJEJGbbqh+KCTmLKOno4WEyuen
         Ww5jxJG+YlEPuSEqTpmkWaxz47CdMySzkn7Mw2ZdU0EnyGFUr+fuZmhpMPVcOAs8S6IC
         yATQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6xm5iNTID0gyrsUtj6YJmIJag99kWCcicexz9lw+I/6WxX2VoQWDZNyx3DLB0fA08lgVYgTHTzCyc4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32nJYKfpv+qN5PyiBTpYDhKxaxaIPuuIarJonSlDDiMLugqRU
	dm3Cz/Wv23exMPMdgWhYzGeTBAxg9k76XviGXrY4BLU/2QUGtGJGu+jg
X-Gm-Gg: ASbGncs+3CqLTrqKCzMeuuBIuK8HVxSl3Rq0jkvoHummI7nTRi5oDSSDOPFo29+A8G8
	Olle3W39xIMB6yyMg0p2Pcp9cJi8o5STwOtZyixxdb6uwsjFg9ec3YSDyyosQAi2cC+HX5Kxb5a
	9Yq9s8cXRyg9MpZzAYbPD13cmGgwukoBodkVcdiYM/amvlc9nx0r/oYA7LLaU7MmL/5PIvU0Lov
	ZoXUsopDyr+5EGaSP4SyuMETSTlbLXGsVvwP2xs6XsAAcq50r+UMoe+g4X8hy4nkHJFROB2Ocj5
	5jKVuC8VXVBKJK1xYP7oSDusNS6Fsvz1+0VJzaGLY9u52vUXG/D6icT/nLoxZwnPLHWL8ctdgvP
	frmEAGqcgUkOd8Yu5vTE3aakn75MPErfqU7BMVMMZFBuiU3cWPbrPi8Q6VOTOhAocbiwDyIRmTu
	A1qB3qbmpp2tJwtiQpiY9FYdlwa3L04Wm/LP/T8Y1nho0+y4pBYq3crG4+sfquHczKsmyFP6Ttx
	y4y6w==
X-Google-Smtp-Source: AGHT+IF3nKt904Se8/WqPz9d/UCigz+46+wqHvckBtV3krmOyMb9KB+V/5ibRAtW+U7hqls76pn3sw==
X-Received: by 2002:a05:600c:3b05:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-477c00e7900mr252183205e9.0.1764235843615;
        Thu, 27 Nov 2025 01:30:43 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm84863095e9.12.2025.11.27.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:30:42 -0800 (PST)
Date: Thu, 27 Nov 2025 10:30:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 2/6] i2c: tegra: Use separate variables for fast and
 fastplus
Message-ID: <gvrbeiwc56ng2rmbcz3zye35k5jtafsvrjfc7i5cf5wqar2kqc@h5clfpllhk5c>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kh3kx25vzxovgxee"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-3-akhilrajeev@nvidia.com>


--kh3kx25vzxovgxee
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 2/6] i2c: tegra: Use separate variables for fast and
 fastplus
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:16PM +0530, Akhil R wrote:
> The current implementation uses a single value of THIGH, TLOW and setup
> hold time for both fast and fastplus. But these values can be different
> for each speed mode and should be using separate variables. Split the
> variables used for fast and fast plus mode.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 119 ++++++++++++++++++++-------------
>  1 file changed, 73 insertions(+), 46 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--kh3kx25vzxovgxee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGkAACgkQ3SOs138+
s6EPuA//WOAZGzOMGif+R5tep3JqJnWwVq1frPfLsUmOJoGVW2/AIDLfNvogcARS
8X3gOQiv5R2lB7EKaDPet9z9bWVcZlpq02oDhjKtC3uFZKwC2fGv2S9fehKiAft8
N2DiI6Meupn9qQUccIGV1Bbm7uza0k+RrztnZHojVnfVxkdp65mc2HJsropbGxJ5
+Wp9dYJH98ed6fxvAOurH7vyLUX6XYEFzimPqkL/EMmmvge+K3X+eyrqQEeL3j+l
PXaS/5qD9aD8N+cZs3IHJ/0OGd4ypC7F1nAJrhkz92W6AhmrZc4cFEVhVXdcVFLf
3OfT7mc+p3VpzWLsFU9/S4NtFzgeCjWuyPHwqge1J1C3IoH+FWobBt+HYrTzki8x
Cz/gIlPes49Mj5dQpGXvoHTTvuUxwSMwT/KQvKtNjMO5Nmxy40PrITRoKw1ThVXE
qAtc4e/1Q2GkfpMuIL0pehaaj9OoLBt8a74RDh+Ll6+ZULrkAp4R42G5T9/oSy32
QBqM4ur1iNpjB9yK3NrcBn3aIsQ1tyAZktLpY6ag5ITNyQPTN8wN2Fn7XYD5fNXe
+/h6mb3QLOOW4Zj7Q+U1ojdZilQmhsO4O7LSELfOgs6Zqtn/pxzJlOi82Qrh4WoN
KsxQxitVsCC2inF2YqEbRgBydHPVhNF8YO43oQSvL3PUgI2rkI4=
=gXUJ
-----END PGP SIGNATURE-----

--kh3kx25vzxovgxee--
