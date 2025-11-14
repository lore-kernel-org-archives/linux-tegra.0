Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658526E703
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131509; cv=none; b=UATv0wpq/HxcglHlMG8YsD+42JuwPBbVQPGypNLllcF5g4YLeCiOWFjlKAtEWrehIEUxOv8moFhDEvqqEJHXMLqE+tNIH51ATvqQOPo+zG8wQnyUE+Rq0vusMiNvELeyajGCFPd7n2tGN/WoxtGDCqUI6O5vQTIA588Sg6Pi958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131509; c=relaxed/simple;
	bh=scs02jbzUUK5MYCuVGXVgJ037lLxK1ex3dOIb++3rEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqY1cffJJ34abFFiu9h4tCSin+2kmLfV2fGOPRFqUlQ+083ROESGOOZr2Es60lciGofn/b5ZJo/gaOiIoz83eybv+w3CR8rq0gqMec4YIoX5yGPudFD7m7IIsslpCXNOubvZ7krGn/DsqxvSjHvcz08jZq2btU/ubGmAwCEkoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7YqAPKp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7YqAPKp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710022571cso19796765e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 06:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131506; x=1763736306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Ybyyj+kFTd6FCwlnA1T6++3p3ZYy9IHGTYfoCqMXs=;
        b=K7YqAPKpsBA0XOqjPSxANndWUeWqaRLlK4UnBZ1YplH4aNVLwmoy1kjAyr/Ic8niOe
         M11GS0E55PqLS/59bwftORFIEqlxMSG1O7uWFrCpjNiLgco3b5iASvzKPq7f+JV7OwcJ
         449N4Xt5O0tQ4mddW2w46pknB5F0FnRPwDg5l/wd7Bm34JlGk6Prti0JPVuDfafKpc+C
         5Lj3oOJDLbQiohCw4HhH29XrYmaS7Xd6ajTQGgFs4evaRA0qSk+JLV8K4Czyo223SdYT
         4hav+5vQO1CLn3sW6BkPiW+EQih84KE9fAl9bomoYmfdKFj6GhHuTFWywmjsTCmefj+v
         Gw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131506; x=1763736306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9Ybyyj+kFTd6FCwlnA1T6++3p3ZYy9IHGTYfoCqMXs=;
        b=HmOGH5YulJwBuzSKDzSkJ7gaEF9/1ef/bHsO013EqRAc9oaUHYGSCs9DBh1Nihp0SD
         ITRaHiLexUxtB2aCRFnnK0/yRvV2tDkggDFTVDV1CZGcO+7ME/EfuFBb6UZAJcDtxrV8
         684rkqO4F4kVJneT2ZFbwdAhir3qYxx3ZyDBmFER6Lr3MhUxjN3/3t+NxvgITfd0M5N9
         as+emxMWuacUnlPwDqF8TjwR/GVQzuruVljO37Ds9DOZvbIpyIPdn4uAfywcCc4d+d4C
         oqKIbsALwkMe9fSZy6l7RlS/d9VFDQtYBac3Yb/w+rJknBl1QhVXir7ofuQoA7OIb6kY
         /+gg==
X-Forwarded-Encrypted: i=1; AJvYcCXnHIqpN/s9rkv02qpqUO94eswJQrh7+1dIS98yrDUsD+EfqRyYEOIbpbHj0yvimLuU0j6wCuJfqUpX2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLNGsKxawxqy0Dghcg8d7oHWe1+/fxIMJrC6XenbClg/tgGeK
	eEYbopyuKtoII23meBYF4kNqIC8KRJLIWQagzPloUFfaHBnvWDJm9GlE
X-Gm-Gg: ASbGncsLJ65HTI0gdsMKP/ZXsFtV9Kpd6+30v0x5SMLBKFlNXpvt/VOvzmwNXD1W7da
	+Dx8lhGx4HrO/AdgVsgL5X+Wm8j1vv1kvNHny3hdB96bOVBITLNMB45Ow+zTdBwFOEDFMG09+ED
	fLA/33+1Rp7pQuecIkDF3osVLR5U4uZePpzVjwPdnoxjunihLv/aUie3y4rb9ApZwc6Vvufi7vQ
	SpD1B1w0wn+h1lKyAw3b3INB7WvrouwYjU+IdUwbXIH88Kl6Ly3+beQ4fhVmItPKosjl9WcAxCD
	nyd+1skJgXqJp5F4TwMkKQ0tRE9m6AZ9RnnC8D9WbdQBEWcojTNhKCixK41Ns0kL0/bl8XfscmC
	XkV3c3ry4XmVn4BGkPbUPqoTQ7Uyjesb1+3h5GE0nNx1lMos7z68P9QK0XJM2vSQ3Vys4Xsr7NH
	370f72750JHK/gp6mbk5sI3wfB26ha+afMFiS8qDSbk8hLa6W8Olvy+mRt7fkVf7bpQp9s9eid8
	Q==
X-Google-Smtp-Source: AGHT+IF8RfeGPT/xDN51L06SoeBJUH89RQTSdNzCsTHFgENOPsN3MHVpSEVSUnaLsvgo3iPGAK9slQ==
X-Received: by 2002:a05:600c:c4a3:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4778fe6094cmr32151805e9.17.1763131505992;
        Fri, 14 Nov 2025 06:45:05 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17291sm10242664f8f.32.2025.11.14.06.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:45:05 -0800 (PST)
Date: Fri, 14 Nov 2025 15:45:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4 RESEND] ARM: tegra114: add missing HOST1X device
 nodes
Message-ID: <lqyhuizpaaz6ltbxxq2dt3njmtnzdi5jllos22ome4fz6wmrhs@irfuylndk5yx>
References: <20251016074152.8759-1-clamor95@gmail.com>
 <20251016074152.8759-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfyhnwazp5pss532"
Content-Disposition: inline
In-Reply-To: <20251016074152.8759-3-clamor95@gmail.com>


--bfyhnwazp5pss532
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4 RESEND] ARM: tegra114: add missing HOST1X device
 nodes
MIME-Version: 1.0

On Thu, Oct 16, 2025 at 10:41:50AM +0300, Svyatoslav Ryhel wrote:
> Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114.dtsi | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)

Applied (with slightly modified subject), thanks.

Thierry

--bfyhnwazp5pss532
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQG8ACgkQ3SOs138+
s6FwcQ/5Ack/UYsnMFcgaOiFU5wt01fDcDESAIBwjPpzj4UkCdLdtBSGNagyjcbd
2c7C8Wb9Y9L9cOA7PcGPI+pPhuRszg61h1oTa8IDE16iNDGztIMCUwdV7tAia11j
b8UMQRMyuqJSiBLSfz2H9CwvqFzKF4D3pkDaGyH3fPWrl+1WJOi+KZCPq1NjYqge
OEaLDPIQOVOJCK9Ft7/s3VM57snl/Lyg1M9p0YmiqrwEQS3EoX4cI0uZBgCEwgS0
WqnPy4ZuGzfhtiI01dwqmopZH33Ral6jEDdLUtw7DPHrNZEZKA3+dY4ZEOJcKQAs
n+C6jrz76WWMezdHhfv2PMrobk4awg4KrkeJNmProOmEOm7OYoNQFFvsWuM7rLnD
KJ9OYcFTmzhpV9iaii+wBgBa55bUUdLFabJiIwC9UvInLwZox0xT6MpqFR8AUfqM
8tsKd+vvvaIil6Ur0L9KMyEY80JOZpxnznqcsLR8atF422JVNEaefihfKgor77Rd
YGKzMtLZ8ftsvp5GP1qes+wsjUF31cJv35PYSL/iC0kyOerGKG6nH4xshko5x03n
tnnRREQKzrqBL7iUPcmbZ3GPaUC/PNnbcH7QIjxf04egAkz2kMkZGZ6BLcHJ6z5b
Btabbfcssh2uP5TxCSiiZmGPZpsAVw+hwm4NvPsGzu9oKi4UwSo=
=N0s7
-----END PGP SIGNATURE-----

--bfyhnwazp5pss532--
