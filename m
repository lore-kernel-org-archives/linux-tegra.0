Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32F26AA8F;
	Thu,  6 Mar 2025 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283700; cv=none; b=Io1vSOQgNUE6xmdAra0YvOrEwde+2ydBoWLrBOM5fcqgTdS1ZMQBHZSGxJH29WvA+Gu4ON085NqkTZrJ1NhdQlVZEVVJhIPbucmepS3HG7h3Nh+7Ejaft1hTw+vluX4c886SmYIBs6ZIGgWtLO7/Swb30b0UC6PmSbohXIi5m/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283700; c=relaxed/simple;
	bh=REhyb4FccbElGzNm3frZmucwXlYEVynpDuu3Lg4UsRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rz8kK/LXJUZnGrTgc22CnghbS7aK4lqmeeFY9xA2URnCy+1vv6aZpBQfGn6/B47ih56p36geEgfOkTOOncJli75oF4QCTSW5LHNEvOwKWttDGHwovuFc5aNjEuruuNVdMDOo6TcsnNDq3APeAAZvlp80hyzZnqkt10RCbbjxE+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+DP9tdh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+DP9tdh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390f69e71c8so674391f8f.0;
        Thu, 06 Mar 2025 09:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283697; x=1741888497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TaWoW54M35Iuu4F4hS04rQT24OaUpRD6n4HLK9B7axI=;
        b=g+DP9tdhg3UNQrskiuecVkDEUy7XhVP62Cs0vjGJwRYshcsVbSVXPw2ro/Dd+TpvfV
         HK901MTrM94CSER8NVtYvViMvQjk+b9/eu3Czuvs8a/F0X4dMmRlhmSl9IYR1AI85n/8
         u+te2qc27iDOLqwJ0/UzO0yVhCaaQT97iL80MJ04JjC/AR5bFQxYCFu2G/mevtdBXAlv
         p43CoR4mlg1sg/O8uuBdI9PzFgvlEkIK4y1TtnkikFWuRKI7SugtSdpQ+N2pCPMSx3x4
         krv42c3lot4hg1UxYynWpJWF1avcWyaJgmK1cdaAaSK4fGNBkNGcvrnGX2mdlzBM40BS
         4o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283697; x=1741888497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaWoW54M35Iuu4F4hS04rQT24OaUpRD6n4HLK9B7axI=;
        b=YL+dJz2V8XG5fGHSU+IuwnaGUi6N2NgTbDwcBapyDA5AucGqcNKdv/3FdWmUCFzPra
         EWBTI0dUCpCk65ws0qXsJzsgKvBbj22pJe5ite5JGsml5sQyrSIhXAdPd6h4Y3DCm3d/
         qWc07i/2NDXWUfCZBJ0oRc7Lo0eo3vsrvMcN4cMzmCjdBRlRnqLmT/Vu6blj8YM06+zm
         3tgqlPcsfcR8l3uqqWve02KkB75CVU4rx0fHrV6Fxnys6NEy2OOX1wI36hP4bfwV/fXY
         44rgRkNunnpCvjrCfIgonHXAcY8cVZSjKVM9stlBxop3rHTyfd2HEhD/ZjuVokztnoea
         kVTw==
X-Forwarded-Encrypted: i=1; AJvYcCUoz/S/CBrcXkA5AenZJTo5gk2tBu42jUZPSEtxwswWH1iFUGHrM9C/jQsBGstWUCxWWhpburG1Sa1k7AY=@vger.kernel.org, AJvYcCVXGrLRes8s+m+OgXUwk9wx4Zo/4q3Z3QP8l13ZAPrgvxq43zJO2bAoWe1ipa1FD+33me12hgaJXgCupNB5@vger.kernel.org, AJvYcCWJA2ZhjmU6LAm9zLZrRx/nRix5e7hFEKpDNUjg3Kzmy0IcOEeeXcQQOazESHp2u3Hn64Bys2J8F7w0@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPkwo+bpAWg8tcNVYIPuXeVT/Jk5ywDohyBKIilSi79JCKTRO
	jwrQRMVoMbsGZw6Nm5pH2HTxIbMh5nmVyzhMN4FK01xSDS1hCiAi
X-Gm-Gg: ASbGnctHXLro3iJnCe/gS/XOa9W1p5pJR0K6TrTAPN1M2MZiu3W/pQDVy7k1tkRAAW+
	mXLgvc3qF3LQ24FaLfY7lmOX83o2J1+QMsmSd5nnyt+sezqrcpABQxlFVfEzV7am1n2tb2JPYZE
	B3wvO0WBikhHENwJpKe3dsofU8/umPB9LJCR4smQJO8t16q9TAKqyVsO/qtN1PNaSsADcGt9KDC
	iwjjrpk4ITlySEV1CsdLTdGPUXWyzp+vejbnjm174E46jfTRXnM6AQJ1GvcrBJBNnseYfCFdxdh
	0S5T+S2kINlkXoVwJkTn1CB2c9sh5TBB+HpFIZi22jF/cmJaPUW2PwCO4aPgttc28SoK/zMqkSn
	zcVVGv2DvNNfbNlD1lHC7VFsf/qU8nSs=
X-Google-Smtp-Source: AGHT+IH9p/W9GdaI6nC625sBnKSWjEo/TKOBD9q53UObDWG/ywsJAcwTGyrJkWGcy4ltiMJnKyzJ/A==
X-Received: by 2002:a05:6000:18a3:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-391320682b9mr376713f8f.12.1741283697434;
        Thu, 06 Mar 2025 09:54:57 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c11e9desm2656419f8f.101.2025.03.06.09.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:54:56 -0800 (PST)
Date: Thu, 6 Mar 2025 18:54:54 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] ARM: tegra124: Add DSI-A and DSI-B nodes
Message-ID: <y5ascyylqj7xboddxssqf26bsfqipu67ahzbywsuz2nkvjhx5z@qnyovpqfxu3x>
References: <20250226105615.61087-1-clamor95@gmail.com>
 <20250226105615.61087-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lyyhayophj3cktpk"
Content-Disposition: inline
In-Reply-To: <20250226105615.61087-6-clamor95@gmail.com>


--lyyhayophj3cktpk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 5/6] ARM: tegra124: Add DSI-A and DSI-B nodes
MIME-Version: 1.0

On Wed, Feb 26, 2025 at 12:56:14PM +0200, Svyatoslav Ryhel wrote:
> Bind DSI devices and MIPI calibration.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra124.dtsi | 40 ++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

I've added a patch to add the nvidia,tegra124-mipi compatible string and
applied this patch.

Thanks,
Thierry

--lyyhayophj3cktpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ4W4ACgkQ3SOs138+
s6GbrxAArXB/xRUKe+jEXnfUxoVkf3HgHgPq6TRfu4Em39fgxr6XBs4I81N8cMOz
7w5BMHj1obErX0ziyGznmhP6oGb0cAaJU8W9cCwEzgvqKG0s9STe/v3HHsWcwbfm
pLM2MNrtP7gtF+x20AGBGFrBNXnh6SjQQtFq/8Lw+kRk7O5a8BOiZ8QOpIrOJKst
TkyUxEdC8U0n32ZCK80JHUVnOlkyRvNfWzOJB3VNnO2Yulnfu0I7ZuPM49zhnbbO
AxEneN3CRyxNNi0hHZ5mG278sr1GjUUH9TwhJ1crHTrA/6O6aCJb2qrKfi5jai5t
DXWf11zmucxtTqJGhH5Ai3kC+Hqei5Po3qpvbgdT4knATJKHgOxh6vLlByoeCUEj
mq7svM/ak61IJ0jL+5UcZNdYxyP490vFzYTSwMEzTd74T9DrL75W6jmZaS+hr8gh
wrW+/d4sFT0b5Aeg3P9D2Hf+Hbw/GILre/pjY3kfRH1W41pTuMKmg+ZI0KjcYWAp
KWh+bo0OnXqxa8KSujOEq1IGhmZ9TjLxcBdL0/vg+1J1moyDhS9vhtsMreh3V2BZ
FFO/gv7xTI5F+MuWgwkb9pU/3ZS7nbL+MGNybwFvCiDtwcpNsBEqt0/jvBXv1gwk
ggDQfLcL56KNNNqgyXjxELzjeeJpCGSleK82HtK+7S6oKACqE6w=
=v8FW
-----END PGP SIGNATURE-----

--lyyhayophj3cktpk--
