Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924493DC856;
	Tue, 29 Sep 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682298; cv=none; b=ZDuA1/PNjb7KQY/KN8MJdH+5S9lq6njiTbaXhUQeorRwUuhEHcc9vliht/EJTe+piSnZaQObmBi3uloZV/KTy/ZrVJqc5YEFoHTHCUb3piP2q4ymGQJvfLAjv9Jas9mYtBv+1RPbmdDX6hymuYtou9NjUwTTJrorGLl5yY54IxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682298; c=relaxed/simple;
	bh=5BwuNLumvwnLJvANXEf0gbKEoPE/6sb4nYobupI5XrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQsJ0Z402gc0f6Kmu56Xnt9oeWLW2iVhfuCilHs7iJDuxnOy/8A2wEvuRZbFl3iC69tTv1u/cK+vP+//RJhngVQUA2puBBRpM2unlNlNzg6kK7H02nWCkT3BkHwIbVr/sijo1V9btgUMx+kBpD1isFaq9knXIoE6ioWkrEu186E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeO9+Qgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeO9+Qgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAF11F00893;
	Tue, 29 Sep 2026 11:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790682297;
	bh=RtJYB+Pl9ynxw35Fyg+zXtll53++J5Xy7Hr5WNfcZ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DeO9+Qgpo0OwN6Fqs0tWqwcMwVlsQkjfxWi8f/Oktstl3AZ9QFtGXpU7JW3toKHzB
	 gbHwJxVSrvJ+BiYpXFZedAhExwGqhIorXRQWhl99W17kXk+wd3Tg8Q59rIKT5Ah7iQ
	 ufoEfyQyF3m+ERKz6aEJVXOdRzKcI6sUzU6OKAhvLwCQmOKK13X7ftvWIbVxRtqyWN
	 uH0POFwTw+7XpHXj0yfhga6dXQ8FqYh5bjREGaDmxoGqJR+G0QeVV1vCk/sR0zMk84
	 oZXqRwkVjTdvefPC9zkqZ2MLzApoz/1fbSWcqgUIO4+hemz1WulcQ3mdXYDraQCXE7
	 TsgBORfJL1/8w==
Date: Tue, 29 Sep 2026 13:44:54 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <arugF4OhAMqzGith@orome>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
 <d5ebde9e-29be-47ab-b74e-63a6bda079a4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qgm63f4y6y5lsrev"
Content-Disposition: inline
In-Reply-To: <d5ebde9e-29be-47ab-b74e-63a6bda079a4@sirena.org.uk>


--qgm63f4y6y5lsrev
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
MIME-Version: 1.0

On Mon, Sep 28, 2026 at 08:23:45PM +0100, Mark Brown wrote:
> On Mon, Sep 28, 2026 at 06:24:41PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert Tegra AHUB bindings from the free-form text format to
> > json-schema.
>=20
> > -- compatible : For Tegra30, must contain "nvidia,tegra30-ahub".  For T=
egra114,
> > -  must contain "nvidia,tegra114-ahub".  For Tegra124, must contain
> > -  "nvidia,tegra124-ahub".  Otherwise, must contain "nvidia,<chip>-ahub=
",
> > -  plus at least one of the above, where <chip> is tegra132.
>=20
> This documents fallbacks...
>=20
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra30-ahub
> > +      - nvidia,tegra114-ahub
> > +      - nvidia,tegra124-ahub
>=20
> ...but this does not.

In device tree we never used nvidia,tegra132-ahub, but I guess it's
technically necessary, so I'll add that combination here, exactly as
described in the original bindings, and fix up the device tree to use
that instead.

>=20
> > +  resets:
> > +    minItems: 11
> > +    maxItems: 21
> > +
> > +  reset-names:
> > +    minItems: 11
> > +    maxItems: 21
>=20
> Ideally there'd be per-SoC constraints but meh.

They are there, further down below, though maybe somewhat hidden. The
per-SoC constraints define the exact items that need to go into each of
these. Though I guess I could expand a bit more and narrow down the
minItems and maxItems for each compatible.

Thierry

--qgm63f4y6y5lsrev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq7pLMACgkQ3SOs138+
s6F0IQ/9GBOhoiLn6+F/S0+LoMKX+d72dvzXdgEsQWHzfaZBgg6kPR38IuGkNI5+
jHJkfnf3nx0QFCzcDK34/RPlZZTwJsAhX5hNRjBoxG8mtPuPFzQxOSa0KidmNUE5
ojDY2PxYjMNTqnsz2FR14cfqKX79grRYW8xIXIHUtVhCkAlA3A2+HlPuq/bxCu9/
vFWT1J26YR2UG/761VWesNcu0LxWLPv4iZwJ4b6rZogO1CXnOIsD+mLnCqIkEuwj
HqgHn5dp+PrBCBdKDoVjg8KnMD/4b4HOrHmKuiXs3jsIvZPArSROYC9mrzvtCYjK
uyT8U/vJ6qnKJdUadqyFAtztDZ71VVozYMTCJRHafgJ/b3I3VJjYyot8jt9aUWGZ
9jWA4Ks4W2HQC+Jr36v145tVQn/UVFmzUqQatKJlJ+fjKNp2gLKkw6G3C2fEvpIM
Djo4Vtk7eecKihntpFmRxCEm/Qm7GuzYNp7MKzEDznezANZhiU/YOqV4diqiEkxA
xuZ5saOzyxjMttajnDl8zMqlz2//E68YIPv2eniNeZnHqJnIqLfO6RrufhW0XHdT
E2+jC+LxS53UCUU8i1t+OXcpzpZ6icFSKaie9pdpjQdHkMPFE1c2PPcHOC/Ii1Lw
IHiGpZ6r7j8ApGakw2nUv7qXs1u1GPn/pqBzOQHA9pAYxDTowB4=
=bNkn
-----END PGP SIGNATURE-----

--qgm63f4y6y5lsrev--
