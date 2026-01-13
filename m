Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E32E2F1F
	for <linux-tegra@vger.kernel.org>; Tue, 13 Jan 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318942; cv=none; b=sc9G9hFRO/HvtIeCWDiNrDagZXfX1hTucjxyvlGBGkxRMDH3vM4AQns71Kxw4OELAxH48lvMVYz2nGHg03L0+dXSrfBdG90eSYXWAI73va18CQKH/RHX6I94G3g7JvQ0qjUoAwZJROd3n5H1iCtFRxm4puO7g9M8VJ7/md/HBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318942; c=relaxed/simple;
	bh=X7DY/nEeqG/9k5NELhF21T328YoValWPwnXbm+uPQzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjMePS3VO+P2bykN+RNsiLKmjETbHBs9wsoiiLoBerHRWuN6/3J8hZBYXGATvetb7M4B4gIl1bFpK4eXcZP3q4jWM6nvnlHBZpyollK6hwMehG+s18N/nt5jJgHGDvc5JWuyrNedRwhk/hyUUYeZBAcCxb5FbLHQaJ9j8MVZqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AaVsjfeZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AaVsjfeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=X7DY
	/nEeqG/9k5NELhF21T328YoValWPwnXbm+uPQzA=; b=AaVsjfeZ/XymKCGbqy4W
	gKYSVbPWGedpbV+h+19OZzkr22lw2RH4MRbEAcT5VVCVRl6rJhs1Zt/Kuf3FIQ1M
	JpOAHenLB5IWyoq90ady/3P+3e86JKg/cx7lSN4GKPVoA9ZpKaSYQMRMX0TZVcNK
	0uBZXm7OimCFkIlgBZjXQayFErUVs97Wu0ZFLFzJjbH5ziLmZzOE0+urt5InrP8I
	zdWjArMJMtLSVxvUzz6TYrEYHMrpFVUT5lTg53qLtfJQ0JsqPvHBiKRWzjqErajX
	Z1YWVcz5If47yB8b+2EAY2sxUpdbT64Dyyw9Ygy9Xse6+Pi5J+s9Hu3B7KPvI47l
	Iw==
Received: (qmail 1757615 invoked from network); 13 Jan 2026 16:42:17 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:42:17 +0100
X-UD-Smtp-Session: l3s3148p1@r9sY1kZIQKsujnvx
Date: Tue, 13 Jan 2026 16:42:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
	wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 1/6] i2c: tegra: Do not configure DMA if not supported
Message-ID: <aWZn2A4omyf3pXP9@ninjato>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FnNQzTDM3qJGrY1O"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-2-akhilrajeev@nvidia.com>


--FnNQzTDM3qJGrY1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 07:36:15PM +0530, Akhil R wrote:
> From: Kartik Rajput <kkartik@nvidia.com>
>=20
> On Tegra264, not all I2C controllers have the necessary interface to
> GPC DMA, this causes failures when function tegra_i2c_init_dma()
> is called.
>=20
> Ensure that "dmas" device-tree property is present before initializing
> DMA in function tegra_i2c_init_dma().
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--FnNQzTDM3qJGrY1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmZ9QACgkQFA3kzBSg
Kba2shAApR5qoGG1Ay04X3c8Cf9ZNcCFCZyqGD8MAB9SEvzNG80PiYbBGhUyDDNH
+h1089h4AW6jPFKjazHzHbUjb+Ij+PnfcmiucXUoJCQcRTl/3Gb5LelawXEUZUAi
PiNjdYgXZtMPwAKjAQZO9V5klPjX3qET/yvm+TdWOUJaPAP6oD1eNeNl935BdPua
qzOuBe8E/UuiPCQQjthXfFI9YjmvxyImomietWQqECnfpTxHGIzaGoYLwF6yffNs
0hN/LMJpYBrNeNW1EjL5ZeFh752BbgsR1uYpYWnmNn3mGvWz0FHdm3nIIHUS34kq
KvP7KiCXfMTYhSxvn5HISP/H0vZym9UP0KTFVrElRLyCO5MO2OK0SNxmf1YDuckD
B9mnqwigT/nys2k7LD+SJarVpGPp2Zoo44mt5q8X2p86SCrA+6qwraFf9clxlLPb
rCKIXkRfDi5r/+Nj3e2NCdlLb4Dw0Rz5xavvVkNwiczgkvp0n9biujW4WAp9zgAw
89T8bsNsjOk0IVLjCVvxbkHLnIcc3YrZ1uzAbxHL40o8RJGmf4PkRiBPzHfw/3AY
pEpRIplTrOo3QlbkorVnHQ8r//Pl9cyBlTVfdWYENMILPkreg0SULQXaMl5FEQSB
EDbBbyp3IG2t47QSeAtCpjc8PPZYk+BnoN9YPj5xgTd5QcZhVTU=
=C+Zc
-----END PGP SIGNATURE-----

--FnNQzTDM3qJGrY1O--
