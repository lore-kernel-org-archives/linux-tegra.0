Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB83C4B93
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444557; cv=none; b=TPwa30LPL7Zds8wjZ59yTOOHQMYCa3hMw3uyBWyt8qm4Ze5V+GL+F271jRMqRSUWcBCJTyBpNaNpJSxo/CJ6CotIzxbYEOuQ8jGYwPpImASHbpY3JIZGW2s+Ew9jvIzVQ9LhgLhnDy0otu2LRIqzPG09jQha9Y69ZChSL+q+Nxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444557; c=relaxed/simple;
	bh=tXc0GLTLQkLv5ed8xLAOzgZ/WOFmTaW0lEw88YWLwMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcAb4/5Sx2XFI1hhbOrBjJXfwvL0bqNXGM6t6cdkAZKJ2IyIyxZEGZNS0+NRzg4clGALNU9eUXIrFt4oREhOe6SjoQ+1ctIMIEwKs8ARKTvp6NH2RZTncWnNLQFh4W3Q/Waftm2yLVbunawXClwPePHhBGjJ+A3lGlqy1S5fG2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+I5Ehaq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+I5Ehaq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49041e84237so5671135e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444554; x=1780049354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zz81ZxdfpEspL0BWo4PKiQavHk71+JXORK+v8WVheM=;
        b=j+I5EhaqgmEyqiI/EWYUdEL4+5FRAESVrhF3MHjlg1PkuuQwj08RNRYqcOcj6kteQX
         n0Cd3nkamEak0C0cUuAqpxvlS6HEfl5aStC0Uoup/5pR2bMdTMlQm7PDDy4SF7I9UhBg
         LTAymzVm9JOXSD1PuPa5glyAZR9xAFiLEg0/S4Uy/aXQjHnslt1PC6ZD90V/E3aMlb9h
         8CLmwSeH+htPuG9i0aentvC2V3nWkotVEiXXMj0P361pkZA4iKsyQ8DSAEyrThtk2AR1
         pCvLdsePPNaBDpfdX1GufcJlD9D03cdA5dwpaYF1iF2UmBJ3Z0w5/Osu9TIS1ES8Id4a
         lGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444554; x=1780049354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zz81ZxdfpEspL0BWo4PKiQavHk71+JXORK+v8WVheM=;
        b=Ew3uzq+W6ubCkMk0HFR8gevgWHMc6SDX4/4URelEi8OvJWTVtFGsZvfXek1KwAztDK
         rKo9XZdVlQgqCTNd7JyUVWWCkByyChcAxqKF/YqpHQGkxk+IEXLyIvK5bxFW/T9qcwMk
         rvSYbXAYi+OW7htTfTN/1En45cmXvagcNHrfUqI+U8TcCvryCCa0FAOMjeB/t+c7ZzJZ
         gRwID5h81AUhdsQfX3PV8kydP5Vo4Vy9guWyU5Xp0535dJLkIdGNTHdY/WMfrOwYOlAj
         EDHylB3t9UtJh7eZ/Jc0qEJNze1HElRDHfxxEmLSbCht5FlYaPmK6jsMtmzs1TZRvAbg
         ToXA==
X-Forwarded-Encrypted: i=1; AFNElJ89sx05fRtjX3z6Y2ZYP+nAMsA5a0euNi6Wr08nhyz9IXxGnu8ZHc/fbuMvYmVF26Iu0Rke1Sry2Rh/Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+octXII/Ec0OtrzHTKgxJXNPvVLjKnBdXPa5hj92VIjmze/y
	BEY4sjhFv/rBbgnxX0QkRWIbwIgT4TTVdEHJVRcf8xn4FTwsx/UmOFcc
X-Gm-Gg: Acq92OEioUNENRNQEQtI7TvzjeM2e2tQODrxSJ810oebOt5Kqlts4o+vctd+ApaA9VR
	SFDSy+uPBP0OSWtv26Lh3qBHzYiAk/+SImNFfFByynl4ZwYGeWsxtaSegfDs0LxO+SjmFMFdc7P
	8aU5s0/tTjlLLwe+swR03cOpJDsVtz4tUnKFNenvCM8ObwDliK+WRUEx41qlclVu/vMVeBJL+AF
	GrpqCXFJ83h3OR45W9MIDnP14jCInpXtmKOXNfdAwSjCq1gH3ZW4de3aGsrnZpbbfbFah23CEzN
	VYP7isDa6VlqVF3ANhzdRQzbBA8fS0cLcpPGCKw8lnoUr/CUlcBhRXJlwPKp+qFaEr6XUDD1+2u
	GH27iSWeDmh/udHXpJpRZoUeLw+ZNAy8GS3F9Q59InzS3WvjYFEzV3Vf+nfYL78BOEbQ2QuvFYH
	CaO40bq5rkUCXtuETViE5XZoZCf3URe+BGet0XzlYCER7YzLI/mOjj7nOw+sN+n69pAn8p4/KlQ
	Ey3MmuQrE5k9w==
X-Received: by 2002:a05:600c:1992:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-4904245f54cmr27207905e9.7.1779444553576;
        Fri, 22 May 2026 03:09:13 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e03d4sm16430345e9.9.2026.05.22.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:09:11 -0700 (PDT)
Date: Fri, 22 May 2026 12:09:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/10] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make
 reset optional
Message-ID: <ahArPRE7rddUDQxm@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cba7btxxm4dnjqoy"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-2-akhilrajeev@nvidia.com>


--cba7btxxm4dnjqoy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 01/10] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make
 reset optional
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:52:54PM +0530, Akhil R wrote:
> On Tegra264, GPCDMA reset control is not exposed to Linux and is handled
> by the boot firmware.
>=20
> Although reset was not exposed in Tegra234 as well, the firmware supported
> a dummy reset which just returns success on reset without doing an actual
> reset. This is also not supported in Tegra264 BPMP. Therefore mark 'reset'
> and 'reset-names' properties as required only for devices prior to
> Tegra264.
>=20
> This also necessitates that the Tegra264 compatible be standalone and
> cannot have the fallback compatible of Tegra186. Since there is no
> functional impact, we keep reset as required for Tegra234 to avoid
> breaking the ABI.
>=20
> Fixes: bb8c97571db5 ("dt-bindings: dma: Add Tegra264 compatible string")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/dma/nvidia,tegra186-gpc-dma.yaml | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--cba7btxxm4dnjqoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQK0UACgkQ3SOs138+
s6EvWw//RWCFZQ9T5C4dp8mVROoGcJewvvJHj46nkOp0utsLoYqLxlyBAndZ4kjp
EXuaATKAZbfG2HAMtwunnvWgwGfFYzQzNqfO4bqXAKGltGU8X5NPai06UZ4ljxYR
WTsV0ZexSKoOXL4jaKU/ZRabzsXm63ldoMpfJv4ahxyoWH6Y2kOqILa7FLlb7GHS
FvCyV9lb6CWA+QA5opFdz3qqC+WxhYaKET1F4q5xbFD5PagVYShaEaYt8MRv0iil
AMyn/NwaX6lOjGTL1CpvJ/jnmlf2Gu7temInUkZANF8wJzYY0xVU4J00bzryvsXO
eSzZwAemjwGTyLF1hsMbmSyqjLLHe7eDq/Y4DEKX3xFGVSd8zKy/vN+zUhFp+9HQ
oxRLORiWrIC8nCgMC7weCZ3ufNIf9Oh+IMxcx9bYghGkOFcwPw/mQB29LmZ7zuyi
IqY9bdEILNNqnTXrULGByqQ2ywvZkZItadnWV1WgXeHRHdLNLzgy7ZfaQsdnBG+w
6WrRkzN8o26x3rtL8umBdxgUrjPomamGU0F97/zy8+aHzrT8/AvL03008euSMliV
sF5OyIHPVRCgyKhe1nuOWXX56BT9+R66zECG68/tWN9OBU25SNy5Q8pYH7x577Xf
IxAPlE5nxcOYxP4CAZfTCnEoq7uYRM/zhhLM/ocmPMkvwZchP7g=
=T5zQ
-----END PGP SIGNATURE-----

--cba7btxxm4dnjqoy--
