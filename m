Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D036F901;
	Fri, 28 Aug 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934137; cv=none; b=Jx2HccqEiHnJDLHU4daQ379X546Oo3v0DCWzFhAzOqc0/OsUgaS6nvVXVki3BswZI6+vnbpmVlVKvaAaWd4bVCKVt8ItAjZLsCr6UDHeQ5GK2ivrJjZ/kxywbN89uhWslV824dKCWrRbO6Kp81f8SW9ATwA8E7ebnn9P/RQYl/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934137; c=relaxed/simple;
	bh=o7ckGB59Dcxqsu2pQpv3vY70XiyUyJQ4qF3O9e4wZeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQNXeq3siVjsDY+Udv/+GlbdfZD31drE2+SNXhTBkeAp6jE8DtzZ6TVY6qC/dTE4osczcRO2nNbyP6ZfeXTS+9cB6q/FUvggwYfEkTsjS28AzIEujWaYz0Fwx3SelTix6gRsOp2MK58oUj+e0VYX7S6kCr/K0HMqQJruMF35NgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLwCFJeO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLwCFJeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8921F000E9;
	Fri, 28 Aug 2026 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934136;
	bh=o7ckGB59Dcxqsu2pQpv3vY70XiyUyJQ4qF3O9e4wZeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YLwCFJeOsaH3JXq78IJ7o5U0+tDaUDiHenNf5csw6ezuhViHYji5ZSRxfVZjJ3O8z
	 vdySHAatdTB9xgoXKoY0HvlsVYg7j9s+Ux+69t5VJBJGCTypaRnfcOex3KlvrJD34p
	 82EXVZj8Xr5il93WnkMQFO9B68ZjKe0sjPnew5YE6GlGSgl4TPnKUt1Qdbgr0APuPr
	 J0VrEWQf4P5FVKvJngHTBzcRoXmGqGqowhVQdn6hxb8bXSy+I/aeB/umpeyGuldw7E
	 KGqxIhWhV6xXp2E2eBZ8L8+F9PZ0QpM9t+YsgQyl2Y6iwkQQ3vJwGuc0z8eec2BGfi
	 LojW5Q7ufBgDg==
Date: Fri, 28 Aug 2026 17:22:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add compatible string for Tegra268
Message-ID: <20260828-freeway-confused-e633d0aca4ef@spud>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
 <20260828-tegra-tegra268-gpio-v1-1-317bd91295e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2RsOgTuudIa4qFl/"
Content-Disposition: inline
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-1-317bd91295e2@nvidia.com>

--2RsOgTuudIa4qFl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2RsOgTuudIa4qFl/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG1swAKCRB4tDGHoIJi
0uOBAP0Rsuwe+oadnhVSbzKV9NoTq9b2DuozrTchN1eVIy5XvwD/fVATyPwZFegb
6DRfRlTI0cQbOCMMJ2usOhocnG6SUwk=
=vCKg
-----END PGP SIGNATURE-----

--2RsOgTuudIa4qFl/--
