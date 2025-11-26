Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7D720DD51;
	Wed, 26 Nov 2025 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160651; cv=none; b=YTc6/q4dxRiQEDdQRPdwVmzPg3ABCGBSTBXaIxJtCj7kfUGBSKCXEElAosxndqfPt7eXqID41CFGaA15RNTKLgujVHXQjNdvthB5wwFBz0D/zSyYmTD9KxUb5+W+7FewE1XTtDRvac/e9aYURooNU3wjwTL6/qHkkbywtp4beMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160651; c=relaxed/simple;
	bh=mV3LbmL7ug9K2opXJUjRaL9cqQc/FE80OH9k0pDfb6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b77EiGQ+MyL5lfzfsgXQrlcXBTv4G51Pp5wiEgBId0IXlfvenGzkrC3D8Gvr4xbEDHB0V4hCvxiA+ppMyIgZfvgf3iq2iAB7bEVLWeXZb3teOCNcwD0d8ChMwXjShEQKJevElBuIcuXiUrgxllfwinlxSqMCOiMIcUeiImTvvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n89wBBof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n89wBBof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24BBC113D0;
	Wed, 26 Nov 2025 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764160651;
	bh=mV3LbmL7ug9K2opXJUjRaL9cqQc/FE80OH9k0pDfb6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n89wBBofq2QSp+Y41sUIX2ZbRUoa1dp23KhzSPK+Z0Fdnr8s4GyMb1LOgBq6pKqPO
	 qL2uMAhHn51IbaCUSXoyeG/M3cWcKK8Jd8/AeoZ8AUPR3MEbV3P5H94ilpk8mIOAf4
	 Oh7RWNOXpuQ85EV0k2JZ01aetpGloWdom5PExUhnexkwouf0Xw4Ha0nWZFTCx5m2Yy
	 B3EMzJPMxH1LcuVPGk6qrWmwV4Pta8L29xFbP51esjjvcrfqSD8y5U+FMOSHqUDx60
	 3+yn8rOJ44E60xJ/707Tbu4gX+Q+/WFsx5io3w0JwKtizwaGqrwOZGP1iKS88CVBTf
	 p3bvK2oKHYqmg==
Date: Wed, 26 Nov 2025 12:37:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sameer Pujar <spujar@nvidia.com>, linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: soc: tegra: remove Kconfig dependency on
 TEGRA20_APB_DMA
Message-ID: <a5fae640-3efb-4d09-b6ae-cccdb686b9da@sirena.org.uk>
References: <20251126112926.4126757-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2YXczgUNQsiXysC9"
Content-Disposition: inline
In-Reply-To: <20251126112926.4126757-1-flavra@baylibre.com>
X-Cookie: Murphy was an optimist.


--2YXczgUNQsiXysC9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2025 at 12:29:26PM +0100, Francesco Lavra wrote:
> The ALSA SoC driver for Tegra runs also on SoCs without the Tegra20 APB DMA
> controller (e.g. Tegra234).

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> Fixes: 09614acd87e6 ("arm64: tegra: APE sound card for Jetson AGX Orin")

This is adding support for extra platforms, it's not a fix.

--2YXczgUNQsiXysC9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkm9IUACgkQJNaLcl1U
h9CwHgf9FK8AmHTWA9v2xTGZsVVhjbddOjfcobhO9UktzT9dxQoloHfHYZxT7Yb7
rLMrEx7vXyWR43IqoZRABa+Ck6mhqOhtS2+a2GGKg8Zxp3m41YpVWgwW3uR5rV8g
FwHSt76AtOJaY7LSoDda2H/0olrGU7wB0vI6/sPuBWeuTUHwB2BWeg1QfYR/xk/3
gsidpXg2bi51S3MwJNoI+a259XlBBQOrVRXucyxSVSkqj/mTMtKiKl+ka9kh2c8y
aM4Zbhs+HbO86V2DQomb2tPKTZeA27s+WNmwoje8qwO091jtdxK+D2svOWvI8lZV
jrGNYvoy9x+GEGmwkrwA1N9blDK4Rg==
=z+if
-----END PGP SIGNATURE-----

--2YXczgUNQsiXysC9--
