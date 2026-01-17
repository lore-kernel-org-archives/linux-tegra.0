Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84990770FE
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609209; cv=none; b=IEevs/aAHwSGjvZryogmbZ61h9kIxo8QIfYdA5iIHRLHLcpdqh0lej9IyLzwNtqWg4R82tLBvBX5y1453oiOGg+b1yAbd8+GCcoX7BsaypT2/YUTGVDjKadj6cNbHf8Ol6HHla7eDgcAcVEvq9ePUkdTBN4HTz0ImxbTT5ruLWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609209; c=relaxed/simple;
	bh=8VsYUdV+ZGtwBbWIdtRn602J4qIYJ25Ps5b08wwWbxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyQlZQAioTNOcPPX5+1+PN5oADLvsBLggUybiS67eFy1V0o+4pE3hKS4S7CvF7g2DKpGoiBdnhXfzcdAqgfO1FjqcIA7JAlRhckPARWbOREZouHRYSsS4EU51CwVesPicsAx8UOV1BbA4vHh1IsfrS1cK8iodxY8LN8Lqemtnjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTV7uoRk; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTV7uoRk"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ae38f81be1so3364958eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609208; x=1769214008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cczEx05352KICGWcEnd+Dlv+PGQV2cIqtx8pi5Cp/Qo=;
        b=kTV7uoRkUfwbHSU2NeGpYt0A2DjQKyjCQ3XpjeK6jFdONDRZdzMhKMVjK//zUmPX8L
         AU51m0k3FxyqKhbBs1APeNKMDnznrvId6mQ52FvKSmVyWWZkGm3eORhjTMHAiOdbp3eC
         Af5wugvuDxomYGT1E4BrM4QnFQrEEwNrztdPo7fXSFUCMDfVwl92BjpM4W8N2mA2/cXh
         UahDc0VjojNV4c0hgp5h++Emy0cidn6aZCrSNjrxGWkkJTm9o0wCoiIyRD72VDhk9W9U
         Nt/m8auvr1LO8QE0DOhr1J6rzVtGOcM+uTj+GvIH6O5ZWDGSNRT5Ay8b4dAMJikmIB48
         m7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609208; x=1769214008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cczEx05352KICGWcEnd+Dlv+PGQV2cIqtx8pi5Cp/Qo=;
        b=VKHJ1bDErbxzFo5H79gAUoUcPQqwO1qq6EHcyrIJ3uJVh0BlBj7xQ30zEw1etXtEpX
         OXbYDY37SApab2Zfe88r35xMUehjrQWffaI5ZMGarpm8WKRrAuetE4Iz8lWz5IiAS/OW
         FBFO7bps0eKYY7QonOVw2f9QhZF8lSpeDDqxT+df5kPbo09Z8qQWHnhO1gjuXfW3XCGu
         ZQxfLnj+eA5hOyq65pE1JXLg7rDMIvUIP05xPvWd1/UoqFnO6Ge5LgbLURI5rA/gZLLT
         09nsLTtWmH56PfIFIUulooxgqsXEOJbR8ztxmxTRAh9qt2zfUeKbgpNW7NQMozBPs19M
         fQAw==
X-Forwarded-Encrypted: i=1; AJvYcCV/XES7uYetV/hzZUb9zmRCpIOI/4tDbYVbZdKKjL7xKUFj0Wec5vOR6NflN55fiTTK9NYfVxIW+fblaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8ZaHiEDprg+I4v7ePjun8intgteHFsWeqUTpW/n/KJsQAsRr
	lrl3hLz4vAqtcDx7s7/gwV9l53bxkpe+AP2psgm2mHDdVOn4C+5La1ZQ
X-Gm-Gg: AY/fxX6lZYhiOT6/82KiloxULrYCH7gkgrBO0Br75eMPI19+o/qEFTFg8J7hkC2oy/u
	7jZpYN67CRGp7O1AOx8bxedE+/xgvScsolZMsE3SnF4bGoMC3sjSEHRM8G96MKHyeqSLlMDlvME
	gJbhmADKmjKoH/b0bp7WKcv5dKGZ5tkmfFxyO/AsRI9KugFaGtr7fOerVhnYX4fLMDhnUXwW3Q/
	sCaP7gu8G8H80JxAvIr7ilZw95r0vwvxWsw9EAWWsOX5v0MgFjby7X4tnmj6RUWN1xo3Q1VbQfl
	Ba4/cBXiLz8wEyduATa8Wrq+hy0j+SlxAU6rareV+/dmSkXl3mXMAQe5pcaHlEHIjz6b6X0Ns3p
	LUXD2x2H5S1fbi7ojfeYRtXldam8dcVfoGscovvcKSWzyDdcVKM/S9hL4ZDun2ZonIVxIVaaNnM
	BEK55t8iMZ9MoJmVke5KDykHS0VFeY26x7IZwvzPMoxCPZbzVEV68RcbQrhzJAWGjOUY0zUBuUr
	A==
X-Received: by 2002:a05:7301:1e85:b0:2ae:546a:f2c3 with SMTP id 5a478bee46e88-2b6b46d2dd9mr3435395eec.3.1768609207520;
        Fri, 16 Jan 2026 16:20:07 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm3932999eec.25.2026.01.16.16.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:20:06 -0800 (PST)
Date: Sat, 17 Jan 2026 01:19:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
Message-ID: <aWrVplD0jfx-JM1v@orome>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaydkfl2lwerisz4"
Content-Disposition: inline
In-Reply-To: <20251204061703.5579-2-clamor95@gmail.com>


--jaydkfl2lwerisz4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
MIME-Version: 1.0

On Thu, Dec 04, 2025 at 08:17:00AM +0200, Svyatoslav Ryhel wrote:
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--jaydkfl2lwerisz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlq1a8ACgkQ3SOs138+
s6G7cg/+Nqq8drdePQg7ZDPcGam2jT1OJFozjkQqShUwbw65NT30Ld24jWkBEDET
V66VMxWnuD+FqJUtmYFgBgP+09riMOIn1kjUwq48fs2/gTigorAcdLx60a80NuP3
uBece6NnnstpG/euRgY5blBwruOhTSyLnu9JPOVnnRSAoRncMndRKLWRykAn201U
ikxuUD7pdh2KLMbPDdqQaTgE/IyyEqjmtt8N50vHBLOZZAvgxaG7UwQsf5RH/KUh
GbB1fyfApGFoCvVJJT+Y3RIH1R0UA7Cz2iQ9BpnWq0qKZbRdx2aD3YoEhsAXT+qu
U/bY+kcvYwshKoxl1KQoM3jkk0k4V7QoN03fnjyR21ZsXjnQzf0RKu/0UzC1BK5y
vLBkf9olK7gFjgLDjrXEzKQUB3sIY/YGWig21onNSMU69zB+JOB6Y8ClDIOoyyJY
HtzjYhTgsuwPMi1vocOk2HrDTlWl7KYZOOi2y00YGp8/bOhWoOvP9z7D4AcbR3zW
kV248pj2Mzd/4/k0H2k69lMZeoBlXZnxAtK07aADqo7eRqYEFUjaESqAPSn7y1OL
5wSs+0gnrfv7vEAC5r1wJ5e+VEXk20ErPvTfzrbQtmo98iyWuRLvR1e7t5X9vuAj
BP+2EYu0xjdpPW9R9wuZG04CSNWKx4490GPl+9UTm8BmHsO5kPk=
=bC1o
-----END PGP SIGNATURE-----

--jaydkfl2lwerisz4--
