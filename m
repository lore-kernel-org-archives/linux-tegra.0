Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258451FF618;
	Fri, 17 Jan 2025 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737118395; cv=none; b=ct2WcK/zCt9pCX9aoEZG1HYjsOKFvdMve+W6soH/m/mMu8NCL04r2rIROkYaITeAFjoNBGyU1RyV+NYE8oxsJwxLNnhUWt4r0ZdxDhUYIakgncdZ/V36iJBVSt7dFEW4sg+I7ihGT3aNjZY7A6wn/lpMurNotkOqroowd6qmcbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737118395; c=relaxed/simple;
	bh=Oba9VdQ/ZnmwCSzX7nXHxQHmuL8VEKyixl6ULuYy0Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvteExeuJLyFIDU84pNiFqXJqvNaZp6rVUll6egvAWX06/KWuhs3jTBPSbE/iiRlgJbqjBrmnRxuxyU0QKZymhdvIDjlREJvT3/6cqtNTw21YDiwi236HiLePm+rryy9PrdUXbQS/ixJkx1twFN9VimOTuFL12NNzMyNQR08Vv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbuI4Loo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbuI4Loo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso13714725e9.1;
        Fri, 17 Jan 2025 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737118392; x=1737723192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AIlIdgFBqGtQOi5E/9RazlOvUdGstb4bLoGfp7PyMbw=;
        b=IbuI4LooQOyFGwNL/QB5sgo8X3cWAugY4ozWjQfgJgviztcGmUGk8p0jEVf+Q31RZS
         Mdp9jiXErrZZgl+WlwVL7vX5fnHPHeW1Uq8kujNiCKCldbNxEOIHoX0V09WhzUv82HQt
         5pYPZM2pKHdFG5fJotczpwEJr5nDyg/0Lddicx5ZK2BpQXHb2c+9jk6QJqqOb8vPCvTa
         Fl4rtGaDi/2achFoUudts0Bw5cdm3HjXiQmYVUMNFo8/VjojX3g0G87zPOxcaVZ6yRBX
         xu87j2A8MFDJjE2fkzD2FVvdqXSSD1xHMxtqXeWOulYunH4csFHv82Ji7Q73MltlaZqy
         8Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737118392; x=1737723192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIlIdgFBqGtQOi5E/9RazlOvUdGstb4bLoGfp7PyMbw=;
        b=SaLdiZIVxmPDZ8XOZnSNiV1Ugh8dGhYnj51LhMsckZVh8vR+OH+E16AyRGhPbMSoRb
         UwxgJbOs/fExo6BAmkx6oTT4KF+LpcqrvF+47u6N5lGriGw+4x1N3j1dmTBDzLfZfHVa
         Ot85SFkfvBnvZ9IuVb6X/4Kwdfkkvi/jTZVBrAjGMX19mHNBl/VsOh5v7dp0+sLb56gB
         EBgnBP5tuIYUqymA8hNiui7PlzECAyYLEZfGJMxB9bTOILB5HTR/2SKO9TAV/iprn5Tv
         sX7UJHHnbt6aKOMHyHRr2ZLYhAseU8CsAdYO/1OxYIgqbY1OyDOiDYvVSnqnojZqMxbj
         0vcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd5TJfSwVoK3cSfbFQXhwhPt5q9oddp5OBWTI5mD276N+icdHLeNVnHZaMaUe7Fx5kkM05NqMZaiyU@vger.kernel.org, AJvYcCVWIlBgRBDSqNC+qdTxnVMhZPvULv3Vc+vL+Rx9EEpGxeHUzhJ35CiI5Bzo5fgyJXppztjB4t/bYwqb4fA=@vger.kernel.org, AJvYcCXw6ro7RF6xt4DubGRGydwWgG1lVuzyJpmz9hAonFbJrBOoVMvkghILVqoVTKhJj/d5v6SQ4wFwDl5R@vger.kernel.org
X-Gm-Message-State: AOJu0YxRuCK8g2NuczxO3U7RlqvFA5aqy6jVlsJHP/zIxZWbSiZdoAYp
	k/+X790HFQV5jiIVLestUNDKyVBg7DIlrPk/8WKSuylQBkZ2WkpR
X-Gm-Gg: ASbGncsgdHkpTySHEcDyLwNyslm7R/dBVKBbpGpYAPK2npRzPQk4dxPiSf1ZygioleS
	4uPXGGcl/gPYI60gIDr6Df9L6TnridQole2AjiLZUDiOwFC6pkjUt5muKD+GFDRMROsj1zotxOA
	ILgvJHo2DtAyY8cYDGTAz9CJjSNCENq58Q+oIsBVPZyBEddpzYIv1TEZ+DQEzeKVyWvejt2XD0C
	M5gYJoLpAlojs1kTop7yGc7PPRAXeGqSSh+5r0GzxtsqrPz4GkoDEQO1TyQMoXWykvgHUXPyMaP
	Nz/wTYVfEDuL0CV2GVOFsbiz8t1FIMCSAauSGAMc9Gw=
X-Google-Smtp-Source: AGHT+IEjw9V0vzYzkNNGLmcSqBYGXejmIsuBQT2aArS3ZhfKc2Ox5e2Qp6VaD3trZxwfn84a28r/OQ==
X-Received: by 2002:adf:fbc3:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38bf56634f6mr2223337f8f.21.1737118392149;
        Fri, 17 Jan 2025 04:53:12 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a73bsm2414721f8f.46.2025.01.17.04.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 04:53:10 -0800 (PST)
Date: Fri, 17 Jan 2025 13:53:08 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] usb: xhci: tegra: Fix OF boolean read warning
Message-ID: <nlp2oye4mywrxnv2zebxz2mwd4ulcfifxnkhf52lmpn5fioag4@2j6362nkytcu>
References: <20250116153829.477360-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24lpel3oy4tro7gy"
Content-Disposition: inline
In-Reply-To: <20250116153829.477360-1-jonathanh@nvidia.com>


--24lpel3oy4tro7gy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: xhci: tegra: Fix OF boolean read warning
MIME-Version: 1.0

On Thu, Jan 16, 2025 at 03:38:29PM +0000, Jon Hunter wrote:
> After commit c141ecc3cecd ("of: Warn when of_property_read_bool() is
> used on non-boolean properties") was added, the following warning is
> observed for the Tegra XHCI driver ...
>=20
>  OF: /bus@0/usb@3610000: Read of boolean property 'power-domains' with
>      a value.
>=20
> Previously, of_property_read_bool() was used to determine if a property
> was present but has now been replaced by of_property_present(). The
> warning is meant to prevent new users but this user existed before the
> change was made. Fix this by updating the Tegra XHCI driver to use
> of_property_present() function to determine if the 'power-domains'
> property is present.
>=20
> Fixes: c141ecc3cecd ("of: Warn when of_property_read_bool() is used on no=
n-boolean properties")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--24lpel3oy4tro7gy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeKUrQACgkQ3SOs138+
s6F3Rg/8DhMPweEMhVLN8/BlW2VbO/nMouVh5OUH0oNSiHKic2RM3wcWcDnIeQde
2Up7tU3gA0Kqr//XsYk2aPMXNqrI9IyqTfvjQY8wvKU+54Q0lbKH6av8HY/Io+vR
NLnrttCSEXpr389wkT36TBzbEhxSef+Xsrf91eVGbWOFfa0UYenQ5NikQ+yqaC4B
ufn1bbSjzKkz40n9z3GtI4nldDMHIz78TGmfiile9GTdQ+6+AkVaK7ra+5mid8ob
SUZ5MBEwJK/mSHfaWlA/EEdXMADe8mY4vGIlobOe/Y1frMF1yptOy/774u8eYKW5
l4bmp6dlM9HnR94zDMt0v4l2xlGmouVMFvK7OQLKWEK5rM0zTuXZiKy6p86wXE7s
gY7eIqVG9avn5dMsJYxSZ0EYU3el9jFGddEYFMOXYNpnrrwfIVRlDwYTFbq1n29Z
KBTnJ+2eUGc4iTA2tW0a027aV4r7/jv2jCj7VPu/W3smpv/hCd71jg3QDYvZmKqE
kPIHazzjDY7LTMJlILk4kbtA6QVZ2waVThVnU/qnaiNwbcyS/kCozc/0WitFphXg
eE0Hs94vgg09qpF9uDmXOEFqccRiVH6HspRr3xWuf59Ps8oqSKqTTh987wAxXgta
OJoBM7piw3vXk4hGaVFQ+1tTSjwrOic28VrLl0i+qhYMoVFu6NM=
=v1bG
-----END PGP SIGNATURE-----

--24lpel3oy4tro7gy--
