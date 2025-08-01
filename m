Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0091917D0
	for <linux-tegra@vger.kernel.org>; Fri,  1 Aug 2025 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042169; cv=none; b=rRsstp7tnC8GSS6YxfFoO/Qf+AecMnGPJgIKiAv3i22Rh7Fs5rjyGgYdE3vlnkQvKlBSaRBkHfCFqtx9sC8MV4m7M2lhdd3+H/Ol/Cl1BXcnQPyHAuzVVm1CMTM+HBtlo28U313+XovRsLLSL9LRYaGnymNXvtjUSgfc+eeOUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042169; c=relaxed/simple;
	bh=2N4MghImP63kJG3AYZ0iFt3q/vrTrw1QatrAObmdhR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mr1kBURRpSz6/EOANaL7rCFOB9nJyRT5eYiPh1LnKDLH/9QRV3ENe5Vzan20Dr0K0BcBOJOwu/iPgyezuyI3kC2OFzwKExvKY+0rJ4kDiIdNQEyTHatdyc13kci3TGVBIhEPOPi6YopO/H/M6Ls6RmkktMl+MA6CqHAhp7brDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kmu8NsMn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kmu8NsMn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45896cf24ebso6778105e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 01 Aug 2025 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754042166; x=1754646966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2N4MghImP63kJG3AYZ0iFt3q/vrTrw1QatrAObmdhR4=;
        b=Kmu8NsMn0busLWFIU75l5THsoOiQQbXqA7jZCWx4QpYKGv7dLpSnIvmRiklHe8LfLz
         P9OcSe+1sQuqnXuf+RHSpalgngHgyfmA6+mJQK9Qe8CSIYDf+d9BJaWUeMG0BlfC7XZY
         k5vrVQre88gSwLk38J92+rjl73xDpJpW8cBJWIT6cKP0QvZ/+FN12EYx17dijHBfLnvM
         LPtGrniyNXItl59xxE5+KWdOFKdAlXuJ2HWqSu6S2FtfgdNvAP05cs4QYzf6uynkEkM4
         hVolwBdpUg1FT4214nhtVqGZ8egzUd6WwYOAsGpwVb4gxYgi4L5bHJtUlPKorBTGp1oa
         szwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042166; x=1754646966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N4MghImP63kJG3AYZ0iFt3q/vrTrw1QatrAObmdhR4=;
        b=RcwYB72CuKs2CB1YCVx3wOPvIAUuFdH7Ni+jTuQseYlZmYDiO/g1iEnmGk0nk3dDSl
         /hPGihZUbVqMQYGTowTiBFCkiibEN09qPbIs9Ci+eiSgaJ4pSz6mt5pQZX3rMqy6FAna
         OPGbPIE/HLWYsB7rRNH0vjR8poyMgz/wr/NQT0/NL8JTaxtz5StKh9qQsYCKKLCHMJzU
         cfrFlK8wF2i2Fk0F/7Rbp2xid59f6ovON/5c8QuIM/SxFyjIfJHKs5lTTj2uNJu7Qn8K
         jJFHqj2Mn6wuPgRRQRqZTNlUa0YVpv01CP9pfXzRRwTFFjQ7EN50zmZR7mH1/YbnQOwL
         rdyQ==
X-Gm-Message-State: AOJu0Yx9bTlCs+ET4T/2r6hLKTS64cNv/ebI8gXe63MLFWzrJH1P9lo7
	tyq3r3IsFz8fv6FDIa8e25lzfVeXIlebB3nCA1Gkimu99AZEdclwkLKRmCFG0w==
X-Gm-Gg: ASbGnctKDrQjtz3txMrU4Ilo4FAgrf6p+fO93ArSg6MjOXwGnyOyqKgd5nsayOh7WX+
	CMpmNQSbqZqInHxS4QM+U2Gz8Gf3FKB/Jlad4PPFnxJFrAsnAj6e0jYpMl+87RBG5dOSvEyQaya
	aHnNV9NGE09EMupRHg0NNK6vnyWT/h5/tkYu+DO7NQqVGma19pAIrrdKwtLoVhWw26xJg2BD80H
	CzlQ7UVbmXqlM40uQRCUpM4p1wNCS52z77jLEP3pq1I1aKxtPdinLX5qyAn6eTAhRRN8Cgic/us
	4TKdPAFKEe4DV9nZ77I7P1v4FHVQ7WE0yEuxLPVPfzGNZUAMw8cgy+q2vVzAf7oS1YDJvQSjHrT
	h3J2HnTt/0OqXXLB0BE69RL/UGDSrRCgANRc4ZpevFN79nd7aXAiYCD56uOpefIXOXWOjfQ1dED
	gWz9ba6VgG
X-Google-Smtp-Source: AGHT+IG9UzKHdYYLkDhnp0NGGhXk4ot/1Cn1TkOPL7zAuieewSW1z4C7TNFp1WpT7vHGbxO7GL9zHw==
X-Received: by 2002:a05:600c:810a:b0:456:d1c:ef38 with SMTP id 5b1f17b1804b1-45892bcfb0fmr97918705e9.24.1754042165917;
        Fri, 01 Aug 2025 02:56:05 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abe18sm5313010f8f.2.2025.08.01.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:56:04 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:56:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Message-ID: <4vpqn2iv23pejsx4uxt7p2ojwy67pdzy5bihce7zpnp766f56j@2sr3d4fw4qwp>
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vlfsfd44axgboum5"
Content-Disposition: inline
In-Reply-To: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>


--vlfsfd44axgboum5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> This was originally discussed on the freedesktop issue tracker [0],
> but there hasn't been a response there in 6 months. So I'm reopening
> the discussion here.
>=20
> * Nvdec firmware. The driver has been in the kernel for over three
> years and there's still no available freely licensed firmware to use
> with it.
> * T234 vic firmware. The driver has supported the arch for almost
> three years and freely licensed firmware still isn't available.
> * Nvjpg firmware. The driver is awaiting final approval, probably
> worth it to release the firmware with everything else.
>=20
> * T194 nouveau firmware. This does not have driver support, but there
> has been some interest in working on it. Making the firmware
> available, even if it isn't merged to linux-firmware, would be one
> less blocker for someone that doesn't work at Nvidia to work on
> support.
>=20
> Aaron Kling
>=20
> [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4

I will continue to look into this, but it'll not be high priority. Too
many other things going on.

Thierry

--vlfsfd44axgboum5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMjzIACgkQ3SOs138+
s6FEgxAAvkvwgsHX5l3cO+2rIhmom6ekBp42IgcJkTbTecA71u6Z2ubDlsoEfcOM
UgC+Sx3gSP98C8xN2pKJxxYRH6tOKNdp1gXjehSRc6R5ZFw1wpbocdS01UugoGBc
KSa/+iA6jBSda7rRMR6UqV/9CRFbGRsGwVBNbyK4uv7EIEIj5biUTU7nn0tLOcLK
fgZgRyo+CjmRExhogYEOFtWmQi8cpPvhaYIzb2NiGvYbi09wfEOUra3DjxBQoe3j
rCDWAKRVXqfz0IpFcLXhAe4qi2ZZrhEwk+o9c1P/qHaBVO6vTFBvgG6z/6nI9aI8
N668iOizUE5MGDEepkPq3vo1YtsYUbfNHYqjTzyGbO5ZIJ48EYZ9DjTB7zU06MlA
57nU7TfYv/Ox+ZuiuwH+PgX9fox1/t6zO+FAw5xR8evSC8C6DXZKhcE9ALkUI2fr
H47kpBSmexklIIrFxGtuCDk/gUjo8aHe4/ND0MWKoy7kfhuKi4IkvUfJaOkr2uGa
7qURVLlJKp1T5u5aPOUZZG+QoWL8iSNbq2BYM5y9Sk7Nd9SbutNpxWMaXig2tZ+D
lspW+2vja6djQdfAgPRF/FngnmuLmxI6Niq0QSvZKdydlJIuyeG6t1n+lGxtQBnS
Vzxq6D4q01zVUZh9Lsgn+x5iqQ3B9jfM1nXuomfa9+fjSklSSuA=
=HsSE
-----END PGP SIGNATURE-----

--vlfsfd44axgboum5--
