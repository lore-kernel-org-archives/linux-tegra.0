Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC843CEFC;
	Wed,  6 May 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070097; cv=none; b=lNRtETWDo4Y7+5wP3YfOIhNx0oinM/KaJLt8d3ENnWjoQFsRprlm4rseqzbW8NksKUaRNgBwCSuekLag6La0ecjtWMxwEaU8QER1RGPRFcQ+zxJJkpy6fRSGaulPxii/j3rCmVILA38nerd7Ztofb9dzZFFfDsZrs4569USus7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070097; c=relaxed/simple;
	bh=t3hbP7AubYp2C3nJfkuMIJM/a1DKJTDOt/tBbj3XISQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ2j7WibK9XE0kkKedXx7SLJH2+ZamL0ZjCOokjX2XASz/yZVHpQT9yyWJSVQbBM+sDuVNJ24kr6Du6WkJ0XphYQ43BhWJxjy/aZ1UC4HcUQFX4FMQZLVgNjXc7nRXSXGDG3ZAVI0i1zkRQ4QrVDh0spx1TTNgWUbPWifzYPw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTUibB+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTUibB+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3ACAC2BCB8;
	Wed,  6 May 2026 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778070096;
	bh=t3hbP7AubYp2C3nJfkuMIJM/a1DKJTDOt/tBbj3XISQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTUibB+y8GyqoowmuKM8+ovNKS77fRx8/vjuE6rgloJBlMrA8gRRLKFLK4IU939MH
	 Cu2zMUhNbemjCYlUHyHvTR0u8fUz5nNyFVFXRY7nVTxT9h+MWpv8pUW0Y7qmIgcTdE
	 FF/0DtbB+awOVVIQ6n4lFrhulvhvWMQa1lZDgbP98g6uGMGBIZQ2fYPLl6PVSHRs8/
	 nizGoOrmlFu4AHpU9zPdPOh/g19viA8oy36W0W+QDOJ7jpBXRetnYDBeDzgWoKBYOR
	 q62oroFPZLBrKk/oA4kq96bJJ8yCM+yNS3zZzXE4NUlCtBkFtY1raNaCcw7YvhhjVI
	 /upQhf1T5NchQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 21D9E1AC587D; Wed, 06 May 2026 13:21:34 +0100 (BST)
Date: Wed, 6 May 2026 21:21:33 +0900
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: tegra: Add per-stream Mixer Fade controls
Message-ID: <afsyTS8XL3HuXIRI@sirena.co.uk>
References: <20260506102032.1644851-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dy75Tbp2warPCQ8+"
Content-Disposition: inline
In-Reply-To: <20260506102032.1644851-1-sheetal@nvidia.com>
X-Cookie: Alex Haley was adopted!


--dy75Tbp2warPCQ8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 10:20:32AM +0000, Sheetal wrote:
> Add per-stream fade controls for the Tegra mixer to allow
> independently configuring target gain and fade duration for each of
> the 10 input streams (RX1 through RX10).

> +			else if (i == DURATION_INV_N3_ID)
> +				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
> +					    mixer->duration[id]);
> +			else

I'll apply this but there's one small issue which can be addressed
incrementally: if the duration is very small (32 or less) then we'll
overflow the u32 and generate nonsense values.  Either constraining the
minimum or doing the maths with a 64 bit value would avoid the issue.

--dy75Tbp2warPCQ8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn7MkkACgkQJNaLcl1U
h9Ai0Qf/cPNIwpqGXVY2FnIqmaX+Ns9G9ioqwgdLQzB5EolNGkz6McWFNoc6L+Nj
WoNxnp/g/lJ/+6DTdWoaUgRNFswvzSiyNMOm4VG2pqojhu4CdTknTz/B3X1FNDaE
rI+oFomiVV6D/9gM9q2IJK/lHe09v9HNLMQVfpns4bydROD+aTjYiMQy/oX9hGwH
v4XZE3E8bYeaBqiWsxW7tPAooHF9YJK3Qu1jXFNHRuzIwFkR/NnTxN5o4hBUm9Ln
wBSr3P5twPXevbamfavAO/RthseRqVEl01uaDJtWjyFlxwCXEvq9ihmHqW5WOlBT
lu09CUSrQNtdKXBg9e9DmdtejF1BkQ==
=OIxD
-----END PGP SIGNATURE-----

--dy75Tbp2warPCQ8+--
