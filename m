Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B45412BFA;
	Thu,  3 Sep 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429444; cv=none; b=GeRsBusO4XsFguMFytHOyr9RWu/fPeEj1tnFUCq2J0z3+Cwm+yYjX3pp6XsKF/xWaokKZH66VTrvu8hdtSitM37fg0Y3ASF/BurpqyfMowRwEU7BAyPQ+tw2M+6sWpXnjptvRe4r0P2p4U00iaWZw0Ur9QtZXkVRHWMjeBslBXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429444; c=relaxed/simple;
	bh=0zJB0oT4kt0u1wn9CpgMQ95Xoqj+X+RrL5SxUzT7/cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq/ZOJWSURfvRZfhU77NxMUbFvtK4v9CSN6NOufmCnah9v5lcWRDy3Yzzm8AQuXO2G66gi//ghbD4TjFGXjTZ2GurXJXDeiHEOC3hpRYCgCVsSdKKulWdemC51+D2GS6lBAiIKg7yGGXXaQzfC9Wsl7bXU/dJoe+5bcqHlNXbPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDXQYljP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDXQYljP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC401F000E9;
	Thu,  3 Sep 2026 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429443;
	bh=bRNFYPRZsbDCetzN2gVQ/oeYpcjMrmA9gbbBr7n+CBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nDXQYljP4r81aMX8xh/VF0cxK3WLx+c+7gtolXArRiMdngqFgMTqYvJoluYF/7489
	 YD3hJ8r9CMfREGQZAz4zw3d8iq42hOBFREUFC+YhLiJ8uqihWylVYYZ5FBoav9O064
	 S7OHr2DLwAUwvQM/tIuMWygEh8BULHeGDdq9wedpn6TeLnwlpw5jAfLTfQ4pKXpSz1
	 EaikJV6Lw4NgVU22iChK/Qerc/AZyIs97hCNQVM8kNb6IBLXGFAlbhWDY79nwF0ZdL
	 mQy58TEVKMPiXlj8J1Ys/jdxr9nFnuEqh/v7cVWqwGOMuPjJQmwvGUYAx76oPRR5iB
	 OHpBcMaFp5Pig==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id D8092D89935; Thu, 03 Sep 2026 10:57:17 +0100 (BST)
Date: Thu, 3 Sep 2026 10:57:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Diogo Ivo <diogo.ivo@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5677: Add clock property
Message-ID: <aplEfd33wSz59iLS@sirena.org.uk>
References: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
 <20260903-rt5677-mclk-v1-1-b71a5a3533f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lk5moJp7C7aAQOiL"
Content-Disposition: inline
In-Reply-To: <20260903-rt5677-mclk-v1-1-b71a5a3533f9@bootlin.com>
X-Cookie: Orders subject to approval.


--Lk5moJp7C7aAQOiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 12:11:00AM +0200, Diogo Ivo wrote:
> Add a clock property as the RT5677 codec can be fed an
> external clock signal.

> +  clocks:
> +    items:
> +      - description: phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    items:
> +      - const: mclk

The driver code has a reference to MCLK1 which implies multiple MCLKs,
unfortunately no pinout seems to be available and other references in
the driver are just to MCLK so it could be cut'n'paste.

--Lk5moJp7C7aAQOiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZRHkACgkQJNaLcl1U
h9Acngf+Oxwzx8pflcjt6BCITldOMzGbYDTqvnQzzB5zpR7bp0RqxF+EtiOB9/DJ
0ZMHWdSp097jtVU83mdD4b3H+7g+c4tm4e/NCtODFjNBkPBMk98rJm4FlMdGRWDE
iiaaHWxusWm56M5XHS6KGhpxAx5GAXIxS9i95nfmztoO9hXNib+DNg88/mSRNfLl
DNtrtfIatp+z1fDgxZ/xzg9YIMUy4udD7jPxWvmRTOGG6KlGUuRSofk34u4jyrHj
wd9MrsD1XtWDORtidYcgcZ6cil+9LYlP/EjF2qZTa3iH9FKSdUOLF7tHSsG1U1sy
yuCQOpf+tvEHTJqgr/WrLl6CBnN2pQ==
=2vkM
-----END PGP SIGNATURE-----

--Lk5moJp7C7aAQOiL--
