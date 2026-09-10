Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0A749891A
	for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2026 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048342; cv=none; b=Fk75ysnh6O5CygjXxDX8s1boICHxC6nyFBjVq9NAOVj0e6bwhvfEIQ2zHO6rzVbuoaPB8fDk5lsk80K57pRB5pgG52xcOGelFxyoD9C/Tx2kP8dAq1xV6pwjO/bgsIElzu9UAMqKGCKEGm6TXfy4LDieQSu+R5w/hlxgt5z0xmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048342; c=relaxed/simple;
	bh=glsruDap4efIY2dKE3ki0Euixx2B7cLyCTxErdzSxI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh79Qd+j9K9sU4RolAQ9FlaW5efj094K14PY1obYby4JDI1rJk4ozQ42oz7UUIuvoZwcARWHo+Q8bgg6cbM2Iuu1VAvGLLLNwMggwMTosorjkb7iBACWHefEbaGkfu7vWJQu1P8ehZDawDWd7osSj7dabjbeYiqZ51ZvIhne3fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NDMqxUVL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NDMqxUVL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0e19300cso7496185e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2026 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789048338; x=1789653138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaJKu3mrYn3envHbI/vmepj+qnfThCeH0Vyq7uWpNSA=;
        b=NDMqxUVLUHJb8Lye3dmWVksdoPNt0ID7VxzNFEd6Aol5P6+pTclxMXy5GPAeH5h2S2
         ErpkUUXeObyrA9VzAQx1xOrYyjqsK02uGB051BDsFcO1sE1/cS4aq//nIJnCmw4xgAft
         Ao9mmKTlHYBFyUx2Js4+0slzf0VWoYcLdGUybireXLKdv/ehBwbLXPsfGKLWC+Kt2Z2W
         F5FwQRWD9K80kguULQN0yXujnYcqqPMs5w6D0N+OOlSC/HpkSL6GPn9Yyqe/jTUWOmUq
         z3R3hv07OGd6p/m9nibMsOZ9OmpS1RNcKfJ2KN4vwryeuh9zLE/G+KMvZjd8TF5siwvu
         TLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048338; x=1789653138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaJKu3mrYn3envHbI/vmepj+qnfThCeH0Vyq7uWpNSA=;
        b=KN85t/aqRsl6iS8CuSgVs4lUrPTvqjf5vZJzWCe+ncF0UJpLiNepACtkBN58xw7h3T
         LPBwuIhOy3Tk2yopxLWu5QSEMHhP4NGj1r/nEzPCr4jIBCAxQPaOrzJNVExPbaVvlMIg
         wA82SDIVUHZwGG0RUxj2IvQpIVBB5CZ/L9zgSXYhXYWlSSQLlzKfRT4WrRZ+Yn6/cBqm
         ph1e3k4AsEN6wwkINwl3AcRtU9EglpTNRkKM31nTpZ89y3ZUiO+CVIjWK6FaX7XCv0YC
         uamkDl1hDIo93udpj1zCoZz60/oZgAvd8MuJjzgrUqlxPV4ueOvYiCwiYZX/yYD8OnpO
         Kpyw==
X-Forwarded-Encrypted: i=1; AKwUvByIVxolqZM5R+CYSHSjtnP2qxfBV4y9glp4Df1fbJV62pzIHPKu0IC2ulJGtS4nfqPYivBd3nvqTg5umw==@vger.kernel.org
X-Gm-Message-State: AFuF++kpv3XfDyEO6L2XFYJS0VTU4olXrliUvOV3MeXzXwxzAEUmlhOI
	j3FDjcVJaSVNGcJyPDQ893ygAT8xfR7KAfPeHg93pdhVLs7azaClyy09ENH/WuKExRw=
X-Gm-Gg: AYBFou3W/gxvSQYBEiHMcIX/DogDW5jQOL6EI3hQt3bKaS8ju0e6vVIiVP9m95Cq+Bu
	+qMfAmsFhW4ZyOX950I8Hc4rYAj2zPIZxR8tJHVopFdp3j2XN/ODFK4KcTxtO94xH/kFgGNbsC/
	MpyKi+SXTz1NAdnoxOJ+DpxKqFbqUGyJDs1N3h9II4p97armkoGTc2DotaymmPG8G37S9GmH0o1
	IpP7gkXnXJeWDpIJuY/RHh19wUhHSjOni9OEd0uKxL7LJPWCeBZ01sczck7uYHgJjXFeGKNrgpo
	fAxlKa063V7j6FpPyXUrxRF6HdwGecDV0aU8AA64QC51pLdLqtn3hCxZKwBBkvAjxTUn0qvckZP
	EurK/SgJeKWDBpS1m6PG3ZJd6T08yD2/bP73oKjUAL2lnNfrwzlPQ9UI9fO8hUyeDllE3kfwIc/
	5Ytgmnytf9/gvl85g5Mx/zm9jcgHqUI47MbsjEyrPEOirrpENExqb/XOdHv2PCPH/7F9diR6pWb
	jzt6FD4XTwFTKTx5G34dNWQ7v9pvtuL2Z0Kay5RscKd5FUctGkfzjmS7MUG
X-Received: by 2002:a05:600c:68d4:b0:49c:fa21:e747 with SMTP id 5b1f17b1804b1-49d259174d7mr55588115e9.29.1789048338028;
        Thu, 10 Sep 2026 06:52:18 -0700 (PDT)
Received: from localhost (p200300f65f19a90462cfe0cd06b88b27.dip0.t-ipconnect.de. [2003:f6:5f19:a904:62cf:e0cd:6b8:8b27])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49d26bc08edsm47086665e9.3.2026.09.10.06.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:52:17 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:52:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Kartik Rajput <kkartik@nvidia.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <treding@nvidia.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] scsi: ufs: tegra: Add Tegra264 UFS host controller
 driver
Message-ID: <aqKus9TnDNm3Yt8Q@monoceros>
References: <20260909-tegra264-ufs-v1-0-e4a9831702a0@nvidia.com>
 <20260909-tegra264-ufs-v1-4-e4a9831702a0@nvidia.com>
 <aqFqhNA50674GtPo@monoceros>
 <45a04396-c6c1-41f4-ace8-0ee0ccbc50ad@acm.org>
 <aqKOipmg5V4oqZlB@monoceros>
 <63f41284-a9ca-4d0e-ba34-096712f27b59@acm.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yq5mv4s7mho6e3h"
Content-Disposition: inline
In-Reply-To: <63f41284-a9ca-4d0e-ba34-096712f27b59@acm.org>


--4yq5mv4s7mho6e3h
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] scsi: ufs: tegra: Add Tegra264 UFS host controller
 driver
MIME-Version: 1.0

Hello Bart,

On Thu, Sep 10, 2026 at 06:09:30AM -0700, Bart Van Assche wrote:
> On 9/10/26 4:21 AM, Uwe Kleine-K=F6nig wrote:
> > What makes you claim that {} is preferred?
>=20
> There are many more occurrences of " =3D {};" (about 7000) in the Linux
> kernel than of " =3D { };" (about 1500). Additionally, clang-format
> changes any occurrence of " =3D { };" into " =3D {};".

clang-format does this due to

	SpaceInEmptyParentheses: false

in .clang-format which I claim we have due to prefering no space between
() for function calls. It seems only newer clang-format (starting with
version 22) can configure that individually using SpaceInEmptyBraces.

And IMHO my statistic is more relevant because we're not talking about
`=3D {};` or `=3D { };`.

But I guess this is all subjective. Having said that I feel offended
when seeing "=3D {};" and would ask to add a space there, too, when
spotting that during a review.

Best regards
Uwe

--4yq5mv4s7mho6e3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqitgMACgkQj4D7WH0S
/k5c1AgAhP3OT2P76z2Ij4muECOIAs0athRcUAms+cyF+w8uuehKZcqDgOD2PR6o
YQfhjqkPJRbVqyvyyhfsOe2hVvJ8iRZR3SeSvLXuv39US2h2d1mJAnU5aMzM819w
x2eIN3LdJV3ev/8d2cTQkXcTW+rtsl8d8zKnFkU6UbGzS4ltgn9sbU8M4Jybp62f
ZEv3P431ilAA4Z80om0L5gJnMBTK1WoskWrIThKaVeDzoKGCsccSzB+snXLbOyz9
jvCZHXz9DyQM+tbEIBI1zrAclO4Ghh06cxfIRkuBWTkqtQxWt/lhGp8OaTIdJlLG
M8Niol0XhEcUL+wLnJCBWNywm/axDQ==
=unfT
-----END PGP SIGNATURE-----

--4yq5mv4s7mho6e3h--
