Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136C3AE6E2;
	Wed, 14 Jan 2026 22:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428370; cv=none; b=ImY8/WRX8j/CY/MBtIWeHgj3pvoQjgXGKkPSkRuVUTAGSioOq5ewSlcnvpjSYR5KmYF+DBKL0bIWcVKRIrlkLuxi9WpIri01dWIRJNOQiSSuVtsasPyqP3zlfrwak9Z6+1da0jOfx+I1IyPsHof2uDIaxza3raMmel4IKjPb7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428370; c=relaxed/simple;
	bh=n05io87oGtlyB5NMdWFRT6Fs3b8ujs35Z4GpqeORnZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+TGNFMXjyQrHWSz5j8rMlJsvuV8BzOl2ewb4tox3eHlYAXObmm3oSJPJ+HM/1jxmXkY9h8Goo/y8A0kN1QrQwrJ6Y7lEpCq6OPbPzkPyTjUDPgU5wxw/qWNjxN32N93mpqV911oF4s/f7pUHB9/2YM+KfLpzikPgQJ1ttPfSuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWhOit0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWhOit0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDD9C4CEF7;
	Wed, 14 Jan 2026 22:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768428369;
	bh=n05io87oGtlyB5NMdWFRT6Fs3b8ujs35Z4GpqeORnZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWhOit0YnJ0aPmjP5qWAafgk+adQjVvLY1bC5R/k5H/4Ap3g0w3RRCatAozJfHjuk
	 bNcwXI8UZDenR5Xcvc7QhMVfklWtGSfv23mFagAp2NMo25ISVxQg7hj7SmMXdAHGHb
	 l/xuiZsjl7r5LP6VtqkuyY83ZYFNvQRCWX8bTiRl8nAP9qIvdEzQ5E6sLSSDN5seOP
	 fXKPg8qhv6OWkVzWHMf9wm/tK8idw+BEwd6u4zJ4ziwkTjZUudUPbzzNAKr1DQsLvh
	 rYTJyF6PAckW8UdleEbe7pLuzod8voXhcKbMptifRR0K8nHao30vRuzmuMC0lcsMPL
	 RoqsiIQ5bgigw==
Date: Wed, 14 Jan 2026 22:06:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
Message-ID: <ae789c57-bc9a-471b-9168-748a2e8400a1@sirena.org.uk>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
 <176832669841.1106728.13139168898095349975.b4-ty@kernel.org>
 <0e68c5f4-f68d-4544-bc7a-40694829db75@nvidia.com>
 <829bbb9e-70e7-43cf-ad93-373e4c8da55e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WK/Nq6V2nZplmgjc"
Content-Disposition: inline
In-Reply-To: <829bbb9e-70e7-43cf-ad93-373e4c8da55e@sirena.org.uk>
X-Cookie: Absence makes the heart grow frantic.


--WK/Nq6V2nZplmgjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 14, 2026 at 12:03:18PM +0000, Mark Brown wrote:
> On Wed, Jan 14, 2026 at 11:27:12AM +0000, Jon Hunter wrote:

> > It appears that Rob also has merged similar fixes to the above and now
> > we have two lots of fixes merged and duplicated properties ...

> > So we need to drop one set of fixes from one of the trees.

> Can you send a patch that puts everything into a good state please?

I think I've got it sorted, you'd added the clock properties in
different places so git merge didn't tell me about it like for the other
ones.

--WK/Nq6V2nZplmgjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmloE0wACgkQJNaLcl1U
h9AcHgf/SC/pZmKwZNftTQBlEybp8Y+DXghf01Bxkk4n+ajMmIUiBeSBsjA6jJvP
Yfyq4hJXuY4XPUVP5N+LE71SQjf0yB+RBHOUo5yAGYtMfsyXSJtppp1aVzNNoeY8
Ug0KeUtqI13cGQkaxBpO/Hv7qxrbI+2AWVMxjpPUvtnS+1BilhraUjGMt+4sl30Q
mzJu1TnR0oTiz01TnjWkgVSlM1YzOYViDFocZ9cXpJm7r1n6QoTOzJQ0YVFEEEeR
IJ/4P9xnxGSeUhO10SWYau0mv1XmFQLvr0mZQ/ysyawfVn6vEUgiA2BSx8xMFQp9
ijzWLQPHiNrRCUsBipFrpRe6T4i5ZQ==
=kV/O
-----END PGP SIGNATURE-----

--WK/Nq6V2nZplmgjc--
