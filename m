Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1153F2A1BF;
	Sun, 14 Jun 2026 00:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781395451; cv=none; b=WvFruYmYogA6WZmjB/E9zQR203Py07vEwKzqmXD5mUOrlWaJ9lEx02ZfG5XEUo/wWwoz4AS6WDe5FAiB941A420bxyzYRchtvhqCRpNTL/H6edfsr4ohfAs/RTRZSr00Hz2+s6s1xKIMctlVGAI9TbV4lEhUZr6CugW5s4WwldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781395451; c=relaxed/simple;
	bh=7e3nVX9ngABwBCdt6PzAXwlFn5kI5ZQrj0wkL59qbv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rblSP62SDIxrfROd1t33vXOBFouJClXZJhJOwBeB1yIznnSUmnXtda8UoJxoVCIlmRK7CXqacQUDcS4Dfo2eJGdvXVxPpa08AS/25JbFmXVSATV+nwzmfie81g98wsGFolC6EDSrqxhua3arSlDD8MCDZf04aNrvQB93of1jbsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5S8lJLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5S8lJLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DB81F000E9;
	Sun, 14 Jun 2026 00:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781395450;
	bh=7e3nVX9ngABwBCdt6PzAXwlFn5kI5ZQrj0wkL59qbv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5S8lJLBHC4WECWsDA6BBAWk05pfVMpIhYlhGY34nMvWQcfz6eFJyIm1DGrGCZTZ2
	 aN88Tz0c2fQI5IPUvN6s6vLkv76wISAUKsTRh3C9Ah0etCiFKzIS0ZbX5pv5povtEe
	 lYuWwvdtrA0Qwxc2DxlcOe/i+RNSIN9ewhHnGSV2yLP8PvKG2ZDENxm1yqBSIObp5F
	 MADmTlpV7zAPXZu59wB4kojVS7k883sJsYoA9DUVTGVcyGNVF1V3OtafZFK8tgF64O
	 58AdRFvBxdSaMvYOmxjs7j0GsjxWArsniPaEd7cA4ZHcdL/KuTL/tlGJ80phC/gPgc
	 NzFbJNLoe4SwQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7CDD01AC5AC5; Sun, 14 Jun 2026 01:04:08 +0100 (BST)
Date: Sun, 14 Jun 2026 01:04:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra30-ahub: Convert to DT
 schema
Message-ID: <ai3v-ALvCm7aAHdc@sirena.co.uk>
References: <20260613-nvidia-ahub-v1-1-5b7e85301736@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f/CcKpSk8DSkcH0u"
Content-Disposition: inline
In-Reply-To: <20260613-nvidia-ahub-v1-1-5b7e85301736@gmail.com>
X-Cookie: Price does not include taxes.


--f/CcKpSk8DSkcH0u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 08:24:47AM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra Audio Hub (AHUB) binding to DT schema.
>=20
> The per-SoC differences in reset-names, dma-names, and reg entry
> counts described in the text binding are now enforced via allOf
> conditionals, making previously prose-only constraints machine
> validatable.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--f/CcKpSk8DSkcH0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmot7/cACgkQJNaLcl1U
h9Dodwf7BytyQpAOfq8DOTTSK2vt0+C4xM8obr7AHOzIOSisGtiXqZIN4sgZvMJL
LfGFO320wCoN5AAB+bPGFXPBRLbAjznp/FOnXoA1QdsyD+dFAKgoTB7vWP6U9mMJ
Kti08n8+NGKTf7Avm3TJ+OpBmaHmFuLGTOTVIZ3arOGnENABOBhaHeiT4ka+lAMr
P8gZI1GmdoS3aAuyO6d+E0nn6sJuBlQMMqKb1MC2a6CPYZ1eRIDDQBH/NNNn4Qyr
Pi9tXAZgyg2GvkO7AHYj/NZSYzZlpyiMWWyH63lGZA87UnUjC/iPtyuPaZdB5SeT
7mFMr/T7ZDopyYX9lxCa1qkkAqI9hw==
=/Wdu
-----END PGP SIGNATURE-----

--f/CcKpSk8DSkcH0u--
