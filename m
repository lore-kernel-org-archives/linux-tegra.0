Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D373CAA52
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445990; cv=none; b=FSSqaKViijd10t5Eoo9RaBoYZ3z+y+043+KS5MmbpUTBrcei5cYpsJRpNz2SV1asbSUFe1/a66+bYq41q+WyuShR34pY3bg6Gv7wjV+1hQgZYZPnM5/bABi2Rpc8AXMw1nDxTOo5k2byCM9yVPPeobrBfsTzTSTld6MR2P/wegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445990; c=relaxed/simple;
	bh=F5+bYp75dLwqsO8ATPAhZJ09tDeZlxwdzzmDbqqQhkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFACr4ccoEm8gdA4/RTmaIq5D72fRa/rv7jsntqOxpxFIkJJepfjCt4YIpFznm2k64xCV4ExvZeeqJ/hLRy9MaCQAwWDG5DTBNhhJUYR7DMfyDEIVRk+ZrasVfowF+l7PU9Q1RrTLOApB4NBvfXEZCqYJOOkXdyEAlTuHF3UWbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsGyobdb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsGyobdb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ee990e8597so17452122eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779445988; x=1780050788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbJ3W/Hs4fnZBWxpx6xx736nJ3SrWK5q7n6mrDaFR5Y=;
        b=QsGyobdbjXsAoOOfPiO8hdzvRmabwK9fAayAvKjuMXdLecjXjsnVQqZKuiU5r8khKx
         EXJgVVunBZistgHJ3Nxb3KAjajVzTBPSyZTszLIhICRvcroPHAaHf6ZJzEP8AiphVp1g
         5gkohB2FlkOlC4UWB5qIwU1Fp8J32Whdt1cG/n5VD8ZpD0KHJfWFxsp8UpOeSZePwO9s
         mQA9lHXqMPX3/vb1fE8AcYbXQFEJvZ7bx1Tp1/ZK6oaSoBgVY/G+/SXf03/16Bm970gj
         Q4KSTKJOEhBRxf4uBvh51BfmKCUlc6r6SwLK/hbdRaB+qyTN6gdr+fc9Qr4RPzTnqqJ7
         QkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779445988; x=1780050788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbJ3W/Hs4fnZBWxpx6xx736nJ3SrWK5q7n6mrDaFR5Y=;
        b=Kqx+T4BFw+gtDThH5ksIKitIH3Uvw5iK+yiolr5KQeVyEiOoQx9gbSqKUOC3alzqN7
         ev4uaoXNw4rq/T2QN6fgvfypTTh3umTQ2y7oBuo5AupxBkI+DFjhmI5K2V/w/OzmaQ7i
         CmWtwWCTpHfR4jtt+ps39rrtJJSKnpULpR0B1e+TjcC10VcfxZljF5NF4XachzbU4iWZ
         xVQ7HMKPHKm4N5T6d1shVbsGDqJoqzVMlIL7W1QILRp53MPRgma8q9QUWhx+ssPkx/1F
         b5hZ971KUtqAsHEzrOwoNqouh7M4h8lumc9xc+V/KbOEfqsigigyYT+QZEyS/AdwR21f
         Q9zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RcykqhCWCH4tPLOgxrzCPyLVN9I9S3aOGgfBtfHT/GY3WkYt6a+6uZhZkjnx2Wf9TaogaFVHdvNehkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxahayFIhlS0eR9f5aiwuUGWI0habP4067PXbPNzQRBFAdFJLf+
	chwIItZsRfhbewmiLQfnPS/JzEXVASHUlLaYAKpy6PZsmkntDl8chbLU
X-Gm-Gg: Acq92OFsBU7SJarGUijRq2Zv4BmzsA1eFT+a9cKfmIcrqQ4dEoCWIPKcYNudjxm0QBY
	qrFSsJjna5LOWS4mIDtSu/J7MTNcgl2/8TMl91eV7E2L3bzogOO6wWSFkD7/ojlNgfwfUNO/iEM
	lWzH20NFSS60abeiU8BCMR/Y+IcPolkJ0LccLZ4IJ3j+hdAChvjPTxpVhnb36y1I0Sxsk/BE06U
	L7/4g0DwjsUsNUD4Oj/rScbGVv77KKqAG+X9JlWtBUEMZreYWdQ4/K5V/76gM3gJPgpKTiLklsq
	j/h/nunT25orIjgE1BSPk7hVMrGkNO71VlHti6ghsNS3fNVzYbbEceWBiXx+0PUQebWCWkGxD8d
	qD0YGCexmCV+AQ2m5cDN8OKOCnryY0A2/zbUAkpnGs60Pk7nkDEbwNwmwaliMDUruz+2i4kk6fi
	KCxebj5CH8ME3Gk5L1LY1t83c6ji6F/TkZZQzraTEU36azg79UHEwhmne9JxFSo7zlPjzNsNuSv
	ty/+plJFaon+g==
X-Received: by 2002:a05:693c:2285:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30448fbf20cmr1670968eec.1.1779445987943;
        Fri, 22 May 2026 03:33:07 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230f1bsm682548eec.14.2026.05.22.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:33:06 -0700 (PDT)
Date: Fri, 22 May 2026 12:33:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v6 07/10] dmaengine: tegra: Use managed DMA controller
 registration
Message-ID: <ahAw1VCTJoaEmroM@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-8-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cj653ttobpimpez4"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-8-akhilrajeev@nvidia.com>


--cj653ttobpimpez4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 07/10] dmaengine: tegra: Use managed DMA controller
 registration
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:53:00PM +0530, Akhil R wrote:
> Switch to managed registration in probe. This simplifies the error
> paths in the probe and also removes the requirement of the driver
> remove function.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Suggested-by: Frank Li <frank.li@nxp.com>
> ---
>  drivers/dma/tegra186-gpc-dma.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--cj653ttobpimpez4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQMNwACgkQ3SOs138+
s6GQhBAAsvpZ/a4+gxBycPq7p8C/aXJliOUikyLpa248fU8368LVnJp+ZTQJjwHD
p55Iikt8GKfhaLT8AbR5sbfWvyWOfMyMw66iUWr5kGY+viIT0OMkzhGhWaL/jfT8
Ztm7MeUL9sP1/p1FZ+V2Uvp2KVsBfp/BeOqrvsT2lQa17bBtyNZ65oBoe+jTSSGK
frf+j0jf9Xv6GRlXq/o3OOnfAlrmkiouxT8zIJwul8Hbjmvz6dsskvGMdM0kP/EX
QzK6nZKTW+ZjIB2cRRqdUryNEXjhYc+Ulpb36X8eBp8xHqdPo8CkZA/lX+ZbKcGr
T+QSIDtFhNE+Mu3TxcBPyP7IZ9HxgzfAu69a+RZEa6/TC+SF1S9CsEW6VTYM+qO5
XSwrAGUtuRwTKasCZAUPGPANN+RD2e8v1A+OnD/Qua1xum0T3HLdbSvIXRZ4tYAR
w+bGxvFRjVO1jUaiOlo62wRIhJST7mPHz2z4/7/4bbYPdor+ElEKJQZ6MCR6HFFI
FVFETgwJFHGdGMHZyFp9Uj8rMS8paYBqDZAez5GPnqMsH37evT0W6js4/CpBuML/
wIAbfJdCPGWER+DRD5y6bGebt0Ad1GrMgRgvMYZoqVaDf7GV60CxANF70XnK8Bh6
J+wMpmxzXvXqiBr3idcQIn7E7dezARxPVGn+2yEypCaBM2T1US0=
=5ptg
-----END PGP SIGNATURE-----

--cj653ttobpimpez4--
