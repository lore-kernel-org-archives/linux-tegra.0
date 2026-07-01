Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A19379973;
	Wed,  1 Jul 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925143; cv=none; b=qK4MD7aZ6zOA5jrqpp5StoL2bRvifvSrnPDqVpdYg2naD44EFNppIBPzOGOaTpMxK3srWiaciSHFtV858J5OY2IB9rxwOjW/OTYr5WFdAYbL1Ojb/jmAwvon3crQyKAubsCvQMgu3lMw4FjgcRg4cZX7jiDcfahIF9H7kbOBGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925143; c=relaxed/simple;
	bh=sNfs+r3mGXCxNKcrz9Bz8i2bMU7tp4eprDqgvBk6tWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGjEg+x66lXiHN65Ibu6bDz4IG0ex/lt6FVBy1NSxBD7lF4EoN34bHP/Q1fKb/81aGNxDac6Hbrk+VTdiZI5MZW3fk6q1SDvwHqUd6qUUJqhdvKnv56Uj97G4Xq2noy1NqAU8mls3/qoprgLi0HqF13ky2JDVbacXgHFRsCT4bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu7X1u0N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu7X1u0N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2E11F000E9;
	Wed,  1 Jul 2026 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925142;
	bh=sNfs+r3mGXCxNKcrz9Bz8i2bMU7tp4eprDqgvBk6tWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eu7X1u0NY58H/eEk2EZdSCM04IZYHGSrD0Mm6aGoYG/LfULu1CVbp0XtOoLxxV1RA
	 7JLIDXV6oDOANCtlVsLE74wN1ejb7XWEX0d/ouHyCVsNEuglGoBKou8/VLdMljGILe
	 m+88k86MK5J+k/q0jFYnKIUb5fr1sqxxkrP/Bz8oBpBGNGzqzl27pM9lOvmmEq5Jvm
	 WRtkRVTiFVJ+h1YMnqnvAUEiw10UeQ4E55K7Yc/k0UbdtHrAhR6EgM5OXhUSbF1sjG
	 WK4mYi770fiuT6EikrNDbLBqzi3sAsAIEknjjzXTKpIZxpP6vZ7CTscKjKchIic2rv
	 MPy60NGrE968A==
Date: Wed, 1 Jul 2026 17:58:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: host1x: Fix email address
Message-ID: <20260701-prolonged-banknote-35f4d4b7ab7e@spud>
References: <20260701160655.725111-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YFyC9i6Hf+SPbcoG"
Content-Disposition: inline
In-Reply-To: <20260701160655.725111-1-thierry.reding@kernel.org>

--YFyC9i6Hf+SPbcoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

prob not needed, but
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YFyC9i6Hf+SPbcoG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHUgAKCRB4tDGHoIJi
0tNKAQClH1QBTUn7HapHVDyBr8qG/fXejVU+Jj4rWD7A1b90eQEA3Upqx8wXhJ7u
cI544GzJn1gjEHDT5Zi6VQDsGRrkZgc=
=pees
-----END PGP SIGNATURE-----

--YFyC9i6Hf+SPbcoG--
