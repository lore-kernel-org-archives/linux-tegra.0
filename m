Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E333446A7;
	Mon, 12 Jan 2026 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254309; cv=none; b=AibVeNRcfd1BUP0WoKTnOg7CE1hBwHl+6gAVEJzmkFJpVzE8FeqEdCLzyj9F5XO3BLl0/UgU9eeOgra2NFNdDi9sIFTvWKciKHNfd40OzoXG3h6aeDWtIql4eKVKiQWqyjcPC5Yk7hCfutslGeR66jtjyvtw+Ub9aM6gjs15S8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254309; c=relaxed/simple;
	bh=mrGcDyUK9doAX9FUlvNym9EL4/mrU3GoiyVRWgCG2EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIJwgAlpMQBdYQzEutH6nyF91Q0EakS3J+HlKHo4JTL7zdotoMhf6aIDVOqAZQgsy7qVJU+Rm1Yrs7IjyUNKlNiuQYiVrnPoFog9iqHOSJ5p4XDKGqNz72A5FzigJW+kvqd9v72/T7M/dvQ9MIMETvSqrkcaGZqMSeqcITLsQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAQBt2S0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAQBt2S0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5EEC116D0;
	Mon, 12 Jan 2026 21:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768254308;
	bh=mrGcDyUK9doAX9FUlvNym9EL4/mrU3GoiyVRWgCG2EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAQBt2S0bsybsx7phHoGzY+nxBphe+Jsx/qq8kS0BG3GLP8++WaEnyA9tK9RkwED6
	 TYmzfUCvUIao/zCtmI6f/dwgxP4MJSDK9VlyTNwPfvVwhB0V+zey6titnHBaz1hc8O
	 wcm7VIC0tUPmfLA38a/LsUr69+/79cz5MyuHoIElrsFhOl6EgBjsiawsofleeaXMPM
	 16uXs9Kj3iLtMYnzJTl6WnHI5NWwL5l5CJXSckhimCPGbvxUpwARkj3bwBu0SIG4fx
	 QA7Evu1fXVBnO0QhzWB7lBi2AG+Gd9taxoZLbG9l8GqExepG8mqI4hBctRenL8aB3a
	 N4jlemzJKp6tQ==
Date: Mon, 12 Jan 2026 21:45:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: "Sheetal ." <sheetal@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/3] regmap: Add flat_cache_default_is_zero flag
 for flat cache
Message-ID: <4ec3c16c-f1a3-4272-a639-747a5c1ec265@sirena.org.uk>
References: <20260112042841.51799-1-sheetal@nvidia.com>
 <20260112042841.51799-2-sheetal@nvidia.com>
 <c477be44febb94b8c81f522c4d86971417740e6d.camel@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FhHgTtjOkdeE+yfD"
Content-Disposition: inline
In-Reply-To: <c477be44febb94b8c81f522c4d86971417740e6d.camel@svanheule.net>
X-Cookie: Surprise due today.  Also the rent.


--FhHgTtjOkdeE+yfD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 08:09:33PM +0100, Sander Vanheule wrote:
> On Mon, 2026-01-12 at 09:58 +0530, Sheetal . wrote:

> > 1. Maintenance burden: Drivers must list every readable register
> > =A0=A0 regardless of its reset value.

> If you would extend regmap_config to accept a callback for defaults, this=
 burden
> could be reduced to near-zero if it was a simple wrapper for the writeabl=
e_regs
> and/or readable_regs callbacks. I.e. "return 0x0 if readable or writable".

That does seem like a good idea.

--FhHgTtjOkdeE+yfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlla14ACgkQJNaLcl1U
h9BX+Qf+IsdI+up/LJh5396Lq9mdNHXUzVFaTpy7+L5uSmju8bPbvKrAEaTfOIaz
NX3O01oTi259xvS6/0rBfZPnZJuLJlGNPd7i2l9cbZpzQXdYw21nejW+bgSh3Kj4
dziWuZqQelH7V6YQRyMbbtfnPFqExHFXuDX1fU+ayqjUa58K72HfI1SseoOVtQCh
ny2sm1C6J9+a2/45d5QbEm7fa3Jhos2FYB51h8COgF7sRcTMmSlV3LcbmwgOERAd
S1q/zppxivp/ZzlxsohalvSM5BrKoRqOzN3eGI9ja1Iyl+XAdPOm2uRFo8mo62tN
tGxe31OSGVgYZTMsv62VlCWkRx+sQA==
=9of8
-----END PGP SIGNATURE-----

--FhHgTtjOkdeE+yfD--
