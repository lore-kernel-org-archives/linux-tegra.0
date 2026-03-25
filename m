Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B613DB64C;
	Wed, 25 Mar 2026 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444320; cv=none; b=SEhgQqqyFU2F4RChqjKRWnra04Xr21SH2U6eT8SUhAWFDEJCDA/gWvqveoS9IVhRr0C2k8F3VePHUL4K78jfesQoRncc6RBETbi9B6L79pHg6sxaOBEBxPfRL8KX/b0BgHDP89woXkUtI9iFL7J3Nb1OpQnI1AihN+jWA1O9r/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444320; c=relaxed/simple;
	bh=qE0XXikMbPb1RT4nsfUvKm1jpTjok6ZFpypqIfW+tYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDCAxPoQ8hu4UcSdmU/6VcHuODChb9oLk5JhgzLwr1N3PsiEMtIpLuOqdNkoDHcJBUrYz7XveYJQlIhZk6SzJS412u8KX0+PP3aHC8+GGwH1eogP8qomO7Ek+5hIzU/0pslYTQmzZN8/ArAtfNVQ++mAKKzjdoBCv5rOqdW4oFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF3hvy8+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF3hvy8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5184C2BCB0;
	Wed, 25 Mar 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774444320;
	bh=qE0XXikMbPb1RT4nsfUvKm1jpTjok6ZFpypqIfW+tYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dF3hvy8+azCuFrhKrTTwRhQ9bzu0yBD3Ldu74+8aKuIHx2aYqvvQ3PXUBzFDbWCts
	 wFrQjoXoatsXmk5Of8bg+PiiUn9DVZwllUm/RpyaPmWSLcuM5zipoOi8inAY3L5Wzg
	 +d7WDzKGkklasOZdVP6idQ2CRjForBMwbgZ/yVrpN8ATiFprndRXsFQfj3GFTwDZTs
	 ZGEqN6db8UsBhlRDCniMoTWqXthpoE+pp8pBdBTKNy/VC0SwcrnSI930X/DroKoFP2
	 GQf4iobGzF09fLG+O+aRl4HTAIhc7/QR6SgXh444lasOJSnHUZlweaZbcL5WmAGW/6
	 xd8bawVwtbx3Q==
Date: Wed, 25 Mar 2026 13:11:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/14] ASoC: tegra: Use dev_err_probe() in
 tegra210_sfc probe
Message-ID: <ab0a1cde-06f4-4d92-b312-3c77d59940de@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-13-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVkdVWGBJf75V1wT"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-13-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.


--wVkdVWGBJf75V1wT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 10:14:35AM +0000, Sheetal wrote:
> Log errors in the Tegra210 SFC probe path using dev_err_probe().

Another one with a regmap error log not converted.

--wVkdVWGBJf75V1wT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3xoACgkQJNaLcl1U
h9DQeQf/bI+s5cms0N4sd2UkgSVxqYZ97Rguh4/9kyXW2ap7z1pvUHQQGzd1I/D2
DfABIg1Wq6p51X5wTYibLg2SHh3Lcabv6WTXrzKwUT7uqoS31XB66/LimWCr1Hjz
Hwf+O9C54zzpIZYumVvUQhdbGzV7pdQGQBeB98BdjiVSHrPX73wSEHdygU4RGxW3
9qLnZbQv05qaV10WRhh0ICGoLoI3KE03Q4P8TlWGDbsLGoTcupWpJ7T3GdgswPky
MkxxQS8LL956nkLf0PA5rMYZsqWfmrShnv0efCVtQX4NHODkp4i8fFWkSW752vQd
ROEJUfko27DPyUEjWvpVDkr+T+Ppsw==
=qMsr
-----END PGP SIGNATURE-----

--wVkdVWGBJf75V1wT--
