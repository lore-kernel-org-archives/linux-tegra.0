Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CFD306B12;
	Wed,  7 Jan 2026 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784833; cv=none; b=thSniVpTCpJ3Nd0KyTaeAb5I25nGbkUDCqlsPiG57xsIwrNt+/Ji5e39RuPg+LAKSYgMsPyD6AuRoT2MUw4Eb6j7efpJqoTl8r5PBZJaynpWyaHHyPPSE35Sa4eHzz0TFruXqUOXUzNDpMhOUEr8jaJchPnZd1ItyQPFmh4hKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784833; c=relaxed/simple;
	bh=6k8C8yI5WkA7y91OjqXKV/JNd5xATCrdAT88kc+n41o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihwNMfBgAPy56q4mb9FNxRyCBl7IwLKxF/noy6qIYpOhOQkmBIT/V40CXN3XyvS2CXWPwjRh383qG/MXAdjby+HIcmHCGq6qBkm6VCFD7m2jECf+PWQc0DfDt79L9rYNxJAWGTwZgFRcdVqV6o8VsfTE3lNFZQnYw0WHfb9mar4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m57v/CzX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m57v/CzX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999E2C4CEF7;
	Wed,  7 Jan 2026 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767784832;
	bh=6k8C8yI5WkA7y91OjqXKV/JNd5xATCrdAT88kc+n41o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m57v/CzXudJeWWfRk4SJ+wY+IBxkvzJW79HM/DuE1qHQ1DzZwLhCovQ14H3wRPyh2
	 /mj72vWezqkYVvp61lHUYSWrcBwWtw237sgh2x1Bi/zhwKkEbdfwNikX9G3PQvAVih
	 t7v3eawfS2iaJw/cfTDiIB5jP4f3XrAVeoOc6GfM21wmLC//0nOSEcTfkD5k4AH+BK
	 DiBFwmo94aoj/8Bb+8iHi6Ku7cTk8HlH5Ovh2Z1I/Sf4Mud0kOz59SQahPmDLaHyE6
	 4pXhDMdeSqRnLW43dvXE9BDXARWy+AyvxFFdD8rcnbBRne3zOlA4cNtH+7toVP000U
	 znytBGJb9KGVg==
Date: Wed, 7 Jan 2026 11:20:26 +0000
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Sander Vanheule <sander@svanheule.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] regmap: Add cache_default_is_zero flag for flat
 cache
Message-ID: <0ece3e08-3ffc-418c-9e7b-eaf098fb49bc@sirena.org.uk>
References: <20260106140827.3771375-1-sheetal@nvidia.com>
 <20260106140827.3771375-2-sheetal@nvidia.com>
 <b5f70864-baf9-4590-880d-96727b7b80cb@sirena.org.uk>
 <b0032054-4eea-44f4-bf70-204fa414f297@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uvdXBJvVo8ErMtAg"
Content-Disposition: inline
In-Reply-To: <b0032054-4eea-44f4-bf70-204fa414f297@nvidia.com>
X-Cookie: Is there life before breakfast?


--uvdXBJvVo8ErMtAg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 07, 2026 at 12:25:01PM +0530, Sheetal . wrote:
> On 06-01-2026 20:42, Mark Brown wrote:

> > Why do this on first read rather than than just fill the valid flags
> > during initialisation?

> Setting valid bits on first read rather than bitmap_fill() at init ensures:
> - Only accessed registers are marked valid
> - regcache_sync() only syncs registers that were actually used
> - Avoids writes to holes or unused registers during sync
> - Safer for drivers without writeable_reg callback

Seems reasonable, put that in the changelog please.

BTW I forgot in my initial review but please add KUnit coverage for
this, we've got good coverage of the cache code.

--uvdXBJvVo8ErMtAg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmleQXkACgkQJNaLcl1U
h9CHkwf8CNTTkQeUt6Sxa8SmwHkh5gaWf+7tcTQug4yQQw7v190U/ecqE89p582g
uE+8lSTLJHfE27lTN5JCNd80yPs2bW23rJOoM9pehhszV2+m13qLRcuZSOudonrO
PX+cMdt5S1A+imKbD+OsvVIT1XxBPUCu6FjKPLLRrPA4SwWC8g/QneIR689nj8ou
seVy9Hpvv7CA2990yFtXf28XC0TZ4X6KJwi480mT5hGAGFhebu9L56xsueiLEPHG
5RBHaWb61HQmpcvesAq9Mldk80bN4/ReOcrKfTUduMNhzshk+GvZpxANkQA25SZu
Op8umCgR4+W5zSvRD6nqg3ORga1BPg==
=uFXo
-----END PGP SIGNATURE-----

--uvdXBJvVo8ErMtAg--
