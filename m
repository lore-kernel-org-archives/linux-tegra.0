Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBE1B5824
	for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724954274; cv=none; b=DeBTbEXSNQPKtMPCif4WDe9qG93k8GUkpXoSTpLVxWw2Wko0rBFbtIkCN7ZonEQTUM+PZ+5bFTmRXPVCaWPePur4hlpBKVtj0THwpw/tMcpQa7mZw1o9iRYGp/yyMk9vij32EzgelD3H1DXvHY/kG5I6a5b57L2n7It/t0Sbeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724954274; c=relaxed/simple;
	bh=vuJfKnMKNH95vXSUv0Kf2jVwaZDOPAXjXo7qybtoDZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbYHK82XJBaQfU1jCG+hpBGXvrB7FP0suGOJ1CW9eunQAkxoRfwp8FxB/YLAbXawx+gBIPoi1Ea09Wa5DD/OkcfmBTHLiwic4mSMF/6CX+WOdAj3fZQk0dCjdZwzeG07ZObjHUs8MhyQX9PtYkWiTW9w9PsD84huK6/4444fytc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5G7gKXa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5G7gKXa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-371a9bea8d4so574124f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724954272; x=1725559072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZqjo9Grjt5HxfkIc3dPfj+rlfAsRG7Cshm4koXrbrE=;
        b=M5G7gKXaF2qgxOjIUjVAfg9l5f64zVFmNR3Jga3SiAkt1pzwWGI8HCV4Qf6NFWnPwM
         ILMMHRrEqfW89qPWU6mBRYfz1n3HeUf2QD7s0qEuOh/JVxSm9v960dvdZGICYsLQzSAi
         VNXcHuA4Q1O1rmzYPyhCtIxH7fMdT1eMxrp0ZQBFqVrKD6WUT+bi0rw1CiWbwBDmnS+X
         zcu2cYrCipfYWoqDjUTUYQzLP+/xQVx+4dhoiPSa3yJud4d1RQD+4wR8KhOC+w6dbxb8
         WAwmNTkGVzy/1zzp/YOe/fwbBT+SVQv83JhVOCHfQTAa4z8rsyjbq5uTiCsni7m80ajy
         9ZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724954272; x=1725559072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZqjo9Grjt5HxfkIc3dPfj+rlfAsRG7Cshm4koXrbrE=;
        b=xByPY/kr/t0Kg5WsO+gWkESFYZt/SkZMtk9vVdB+ea+FwD20+rHMzp/eTuu9u6OpTy
         BETJxRUGtejBH2QRFvK+k95ZjDRSzRRnCsP9a4GgXqMWj6paxyw2swnQ1cVaBT7lfmkD
         pwP+9ZcpTbJHRfFiwoS8473kZpDwuS8YbUluY+aGCSBDZM9UGNE/c4+255xsw2Q4swB+
         WbOFJ0KYBB5e2b4aQ30qtWC9bX1oaweeQuTlXEQuREzMY/9L2n0nf9KQ+f2WKdDgMtJA
         H/gQWsyHrCLbsehCw3viOlwcQE9uK8ys0xFa+45X7MGol6kXOPhaN57xdJf6zaSXfSSC
         Ns5A==
X-Forwarded-Encrypted: i=1; AJvYcCVF0qtC2RYkogjhs50N7npyiMWbZI2OUms4ziy6VbY+eZUFWABYWbLFuAdfSg3lObaJyc4jT3mfF4aUCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMHyGdp4/Il/KZ44Ffs27JncScO3o+1RWXtTXvB1PK/wfWR74
	EjoWj/sOf1Bs87SpR4ERORlEBKpAf/Nc1e6mjWK/y61l/88Ii4b4
X-Google-Smtp-Source: AGHT+IFDGSpnXkfBIf1LAhNqocK4+bPZg5jEZNP6ySq2F1l6hKD5sWKpcSfJBHbN91DvLwTeModl9w==
X-Received: by 2002:a5d:51c9:0:b0:368:4218:a3d with SMTP id ffacd0b85a97d-3749b54fe8bmr2503784f8f.37.1724954271025;
        Thu, 29 Aug 2024 10:57:51 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee71616sm1989214f8f.31.2024.08.29.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:57:50 -0700 (PDT)
Date: Thu, 29 Aug 2024 19:57:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] gpu: host1x: fence: Disable timeout on pre-silicon
Message-ID: <kzdgbgiawrnvpvls7fjxf4lxlqfxwaowjknyxnaxtazjcdfdce@ouizsxalzei5>
References: <20240425050238.2943404-1-cyndis@kapsi.fi>
 <20240425050238.2943404-5-cyndis@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6ueyqjiext4dlk4"
Content-Disposition: inline
In-Reply-To: <20240425050238.2943404-5-cyndis@kapsi.fi>


--e6ueyqjiext4dlk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 08:02:37AM GMT, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Timing can be wonky on pre-silicon platforms, so disable fence timeouts
> on pre-silicon platforms.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/fence.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

This fails to build if host1x is built as a module, so I've only applied
the first four patches for now. We'd first need a patch to export the
tegra_is_silicon() helper.

Thierry

--e6ueyqjiext4dlk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQtpoACgkQ3SOs138+
s6GTRA/9EU1tq0Dz2tJVYimupCNVu9+cyoGXAF1+mmlT9euQ6XmxnAEXmuUabx66
h65j4qFWx42g58LAEb1bnoFQMmifwbP5WmjBho31bn5zAHndFKab/ZcE3Lw3Vtir
aZgWyBCOtRTASXa42vaAyv9fWiGFg6MzvqTBZuiedCEABWBTP6O2Tu3k/UVLzUk0
Rlcj2PV5DnHCjwVvyY8eBJjII5LGUNNYXHfjg+df13jk3rV9xDjmKQ6xEcGtck1v
V5I71aJxbDCAsVDrPc95ad+ag35bahioRx3aG6OSxDIX59eQyljJ/zwIF+ELpcjf
xTUFWTzkGlcZSxyDWsB2OayHUIHMRq5dztEFdspuZmnUi/xqo7TJCwQuRWNb+T9N
gJXhTOPzzczd058UnulE3um5PdN2J2FxaZibXyLo0k2MHH+zHUStYD1Y8TiA6JUF
rorDDauOHyiIBYCeXudmsWfuiDsoe7V03zh56joyXdMQTeIPW2QucANaEsfp/BRv
v3LvMH3x/hEOjtLDZL0x0g8ILuf4zsSkBhbtGMOk3pTnYsvLZfpByo1eQeGKYDix
TeERmdRgDtTuuoTFJVIO99BrtWlFnGzB86QZ/togkE8NR9BPulbQDF9qkjiVUqFm
Njp2uXM/hd7yel9V4dK1umBtTqRnGlD6Y+rVfcVBXSZ2kUJYrdg=
=o7O/
-----END PGP SIGNATURE-----

--e6ueyqjiext4dlk4--
