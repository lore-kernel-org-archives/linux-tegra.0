Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C029AB15;
	Fri, 27 Mar 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624358; cv=none; b=NZCheeqjEOCtdYEyFBQaTUkHonK5KBKHOVRh+gCppBOjSaos2Pmcf5Scl3w2RNVkkf3UsejrEEtVCLeKM16l9k3fijjYUoU8AjeJNPFa48yvqHLNXRQ7InZ5Qnkck8LX6m+YzikQbO7yr1J37gvfobiIF202Au9ss8faUVN2RE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624358; c=relaxed/simple;
	bh=jfeJ3Y3gkkXCXieGf2pOIvfxZL6ystrE6iBpfbmS4KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXi8temrhbEnPkvgwbAiEqyFen3h6XxrCrLv38ZishAF4aW8oiTROCkPGDcfcHjE51wRiBQOFDbyDh3N1GJPG30gX95I6UsSzJYz/FMJRjgsSiottc7JYGecYkT2ZOYksEkEN1ROQILUwJzh0l1+EcVewFkLp5fFmapU490hCt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPsV+VfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPsV+VfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403ACC19423;
	Fri, 27 Mar 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774624357;
	bh=jfeJ3Y3gkkXCXieGf2pOIvfxZL6ystrE6iBpfbmS4KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPsV+VfDkhdwYDThVm6Nl1BprR1T2ws/2gscovP/IMa7CqtDzGGl3Gc/0sfhgofWQ
	 wRJkN+lu7SuI2/vUtfcJlLGw6nY34/Iq6C4NQZS/iONpN/2aCScuiAi1Jwc1fnIWIv
	 TCQOWZNRXE5QYCwewJUpCWmvnQJCz7n0cBMxgNQzkoIcGv/H9Ye/ldYH+cdevI1HUW
	 yxKh1TKmGcwYVHUnmyZeJXR9ljjg2sk5jW4BsIx/t/37+LmpbGi9bp4qy52KczW/pA
	 B59H9v+QcZ8zoJaK6xjxoXFN8wFaUUbLA9eaJkFkOwihoErqZCYRVT6IN3JE8TXS0d
	 hrlEqcM8Dx9aQ==
Date: Fri, 27 Mar 2026 16:12:35 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] soc: tegra: common: add Tegra114 support to
 devm_tegra_core_dev_init_opp_table
Message-ID: <acaeMgK8YRdqxWQJ@orome>
References: <20260126190206.78270-1-clamor95@gmail.com>
 <20260126190206.78270-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53yjsj3vnumqxqu3"
Content-Disposition: inline
In-Reply-To: <20260126190206.78270-2-clamor95@gmail.com>


--53yjsj3vnumqxqu3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/1] soc: tegra: common: add Tegra114 support to
 devm_tegra_core_dev_init_opp_table
MIME-Version: 1.0

On Mon, Jan 26, 2026 at 09:02:06PM +0200, Svyatoslav Ryhel wrote:
> Determine the Tegra114 hardware version using the SoC Speedo ID bit macro,
> mirroring the approach already used for Tegra30 and Tegra124.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/soc/tegra/common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

It's a little weird to see v1 with a Reviewed-by from Mikko. I see a v4
of this on the list, though, so I guess this is really v5. Anyway,
applied now, thanks.

Thierry

--53yjsj3vnumqxqu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGnmMACgkQ3SOs138+
s6HDPA/+P6JtgsJo5xWnX4Wt74g47lHv1sPx7l0JJ0nDcpDkZ9OOSrZ2EHwKY2oG
/OF35xTVWxk2yj4xJmkkEoco1gcIiuzA2yiN9F/rjENFsLv1y+c+501S3ICHwBYB
VzPC+XvwgIkY8YgZtNwgrLDwXBi1TiFjqm3chW1zgpBPHbXbaw9NpZWth7L/BNyA
CqMYPKIrAOAmIMHYDMQMzny1Avr5umLQ5tjTjnQXcrI8wAe34vi2Fu64JWkKYybp
r0LqX7mYTrc3GcAEjdoKGaICPIHuyQBhfshpwmLjV/ws9CSQon1HtXz3bhdTYstn
VO1cDzfH9gtICWNY2YFx5H+Kuzl/hyBl0VBwjZUJVbxOfe15WKKmDDGxFyWDP2c5
1H/wHWXTfse77nzJ5pJHyMwdF7MdMJUgJzaPavqJuVVIUEED508vMgG67blFzeSg
Y/ygCBHxXAVZ0hsmw8pr8tDDPMMSWul+g95SWu4y9p/+wkvypK/veh4J65WqmU+O
MOFiygfRgGB4/j6H3cL1XpIpP0uzj1lwnBjzPn1Bt/b8EEqOUuFCYj3lTOIMpkHF
I6nh2PsE6c639Re573vHd5yGqW7RK0Xk8g0kpXZbkKkTanB0TQrwASujRvIJ+T5L
Z9e0LJHeshcZJXz4XL3gayylyiwxicspqcz8QIsbX7SM9EgOgiU=
=v2pv
-----END PGP SIGNATURE-----

--53yjsj3vnumqxqu3--
