Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A373E63B0;
	Wed, 23 Sep 2026 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185488; cv=none; b=VY1T4c1gIidyR3ARza2Tj1X0AnjHJN1BU/qnqj9g4oimPRu9RWFjNVU3Ep7eq/kCmsxGr7gSksI+zI6qoVe/TFlbX+u5D8A1tFywri3BC5ZGsrHxbSFRCL8EBPUhLHnNELBQ+1tpjT5PRSR8jgbzRQRCyIBGRyikot+t2GgpRgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185488; c=relaxed/simple;
	bh=Jf8J2LoHC1NWfXfw+1GbvJyiZDPbgtqBHpqpN0+aNE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTR27oviCb7XdRHsefPOjytbsSLc1XN7JyJoY9vOgWNvcQY3Q56Q4lXni3ylwaE+6CPNWe0mBrm/6M+rzsntj+3fhtseOGNjsQvsGqi/kWFANSQNSowaJzvyj4TrpA9FBAhXuxNZH/nU4ECgl2KwEj1V2gznGwlOcviunPRXX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCbge/am; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCbge/am"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AE41F000FF;
	Wed, 23 Sep 2026 17:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185486;
	bh=Jf8J2LoHC1NWfXfw+1GbvJyiZDPbgtqBHpqpN0+aNE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cCbge/am5sVz/tGOgcSblRgqLhKxsq7FsyfcuQnw5VTXcfZMBcxapo8lpQGre3MGa
	 nYTJcqyPaS8/+/dYyYfmVnKO5IECrmIzSL0SwSNJRiA6h9GgSoy2hR80ALGFdnz3dZ
	 xIpmqLi+sV1LrH9D/KFi7ZAJ/0z67kB16X4p02YWX5Rdx31WjRIbyjhCM1hSDdg78c
	 jyien2Tmb/6jGS8ixwJPsq3OqkP8L7Fq8jEkL6VmLSuRmLITTop5AaDrAtinv+8+5j
	 V7ZiPO+ZE7NKmDL5reOHi4XbUxasdX7w6+t2/c0dZuQAnTpt9yjxwTE1ZDmUZg6ZKw
	 M3BFDdO9dOPcA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E17F71AC573C; Wed, 23 Sep 2026 18:44:42 +0100 (BST)
Date: Wed, 23 Sep 2026 19:44:42 +0200
From: Mark Brown <broonie@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, mfd@lists.linux.dev,
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Message-ID: <arQQCovjYH9Y1QIS@sirena.co.uk>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
 <20260919-ti-tps6586x-v3-2-63dd240f4684@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CEFCVUg3l04Mhh2b"
Content-Disposition: inline
In-Reply-To: <20260919-ti-tps6586x-v3-2-63dd240f4684@gmail.com>
X-Cookie: I've been there.


--CEFCVUg3l04Mhh2b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 19, 2026 at 02:31:23AM +0530, Bhargav Joshi wrote:
> Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
> Set additionalProperties true as this is shared schema.

This and patch 3 don't apply against current code, please check and
resend.

--CEFCVUg3l04Mhh2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq0EAoACgkQJNaLcl1U
h9BexQgAhWK8GVQrDthcMcEUnKph4BAuolarj5+hqLRX5o9hZ00HcfZnJquV/GtW
lnZnnDcfDuzoy17TRMlNzgTxIxh/c4l4VkczQS0DaQKApHOwGD1ZXFPPKP249Hie
b0K+cbwjUjYFCS/8wqY1JTiJLpcCEkXR5iQj2RcgpDA0PJ0S/ZvqzsMDdzk81Ig0
VRWippWxEi0a0aMSpzjaJG338Ls+wZshv78yxWv5QVxficl0gXZxu3huLrcy0gBI
ESiDadTZ7bFfOprf0I/0CnEYvn8ImBr4KO2EidtXXwKcq43SCm6mz4yCdzX+viLs
HhgwgtqE2rZaXSbv2ELfTEDUk71QgQ==
=JbS0
-----END PGP SIGNATURE-----

--CEFCVUg3l04Mhh2b--
