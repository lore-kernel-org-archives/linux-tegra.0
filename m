Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3834F24E;
	Wed, 15 Jul 2026 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116121; cv=none; b=cJNEa8O/TCmiaPTnJnwUyPXKQM9iR0O+jndTvGUHmFO2YCejW5VQ2COrj+Z4q/Cd+C8ujyEdEy9egbw5bvgrZF0YCC6F4xa0+0LnudR1YDf39CiQbhNdCVxyvztKLRBIRHYRd/ynntdxO/r9JHpAANCcHR8VZqU1Ni8RJ8j0/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116121; c=relaxed/simple;
	bh=EjvRMWtMEdOp6qSbiy8cSdsXRcqig0UwrL9zMDRxAkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcnGW5iPlQB8hi3stYi/vFn+L/2UpDcJdUPEkFiGUxYGJrIDanymmOk6p2gpnSFcmVKdgN5FOy9fluYwezaBhZB63Jb6JE1SdFWd4c4Kc666S577lgQNHWw01WYEVwM4RbWshyw+ADrRq+u4qd4GiqZtGKg8/5r047TW0iNfIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiTiiKwA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiTiiKwA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EA11F000E9;
	Wed, 15 Jul 2026 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116120;
	bh=YC/HsXY5K20pYG907g5a83yxYgSzfx/HMxYCIAhl7f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CiTiiKwAmujqVzdfLsq2EclX58dajFE5vvGLXFj28kxlIaE9aVrKrVDlZwBoqKB4P
	 3Ub3i/KaLsgXm8JfR4akpwmiAoVApKw3qWlwf9Rff9xfQJKLoOiFnVqPHwWilwyzWy
	 vPSLDQIugGDIt8Ue1g179MD6J2NIRWdL+i8lhmZucWnb7DF0Dchs6gcLmRqfd7bNw/
	 eITzfLs50KeVrVfgNlERsWn/Qenuis2XP9P3layp5OTytexgNE8lPQiCDchemfUl2E
	 9d2yZDYQzFh7w7+y6demm10IuaE0wAAINEvnd+P6+IJJzs9Mnih7+WLm92t20hc+aD
	 pwYdyB+9alvzw==
Date: Wed, 15 Jul 2026 13:48:38 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sheetal <sheetal@nvidia.com>, u.kleine-koenig@baylibre.com, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rosen Penev <rosenp@gmail.com>, 
	Piyush Patle <piyushpatle228@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: tegra: tegra210_amx: Return the original error
 directly
Message-ID: <aldzeLFDeu_tEszA@orome>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
 <20260715051115.17385-4-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybxkziq6bavfdqs5"
Content-Disposition: inline
In-Reply-To: <20260715051115.17385-4-phucduc.bui@gmail.com>


--ybxkziq6bavfdqs5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] ASoC: tegra: tegra210_amx: Return the original error
 directly
MIME-Version: 1.0

On Wed, Jul 15, 2026 at 12:11:14PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> snd_soc_add_component_controls() already reports failures internally.
> Return its error code directly instead of logging the error again in the
> component probe callback. Also remove the now unnecessary local error
> variable.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/tegra/tegra210_amx.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

I suppose this could've been merged with the prior patch since it does
effectively the same thing. In either case:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ybxkziq6bavfdqs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpXc5YACgkQ3SOs138+
s6EQGxAAwCnglsQ265MBp60O9zYxIXFCFowDZ4MQnyx+iie3AlPP2gFpaj/EgJF+
Cx7rzxGczXULoFsbequZzXH378Pklf0H6n4MoTgcMif5SwpFQE+X6YPOUQA7ZnhM
c/e8Xsygc/HSOHBN9DPydKOfIe6QD1RODvJOLDiJeqNC+Zb4oqNhN07ro+uPOp0P
KnGDqlQC3jxCU6UKGHTxk8Bjyi5T28HADshnfp6wDOfDD9UCslcpMAn+oJT1F/kd
I6ZCFO4LAY7VBUMjXnZSjNmH8PAEDS2fjdqXL/OBvt1CQG6o5RDpe1Y20oERWsVt
6AwnQQ58NUcvW5Z0FWnYOgSc+rfOzirKqjMTN9Hy0HqccFGDMNj1Gfq1nzZbUZV5
4hOPuLRcKbpw8Vt1vdpT/eZpWgpZWvW7Ya34vRHdZisuayVRo8O6weICA5cw1BJU
pDPwwFzURAeaOnSP4QhpDRkwsDtWpimJY+8I+9QYO8+7/gF06OygzVGEEaudtcps
LucnjrG51ouQC3psH4FHo8BXnrYA90J2tKrvMtX1oCQZzU9UL/+bL6pQAVtYhZlP
o2RTbGk2si5C8yY0j3RqNdjK7zkHSz82fB5rzQFo0T+NKLOJ7HeBUzRGBiHuE+kH
B9bxtEHn3hmNAID6bKwehnWFGFhbp2AYqQKgl1E3KdJmILH8DBU=
=pMtL
-----END PGP SIGNATURE-----

--ybxkziq6bavfdqs5--
