Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FFA4ED1A4;
	Mon, 28 Sep 2026 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623433; cv=none; b=LD4E7KcUhLrHnYmX6F/iIu5XNy2SyjfKuqnkZh7jyIbJFX1UY4liXtaBiqIqvrqtumHbEKKkk1OGxUP5eRgUhTGtv93R3PTczGURiFWzwXRSxh45OJwt6r0HxCTM2wjB2T9bjJTzmwszC+PIsJmz1CDaLU8NVIqgo6mzmyyEoDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623433; c=relaxed/simple;
	bh=VVOtKwa1kDM3Rb1Ue/KB2Bbfk4hVDpH2ITeTMbbz2Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBVY33k1/2ugLgJ7diiM5kL+4uJ8K7/RNfbxgy+yjqCzsA43jdlY0L+0R8z7iT50tc9MBjtoTft3SVgTUwj7Xmzias0YWENqylzNWisjUBNohOtIFNjNo37casYn8SYcsCYPRRuKcT8I7EV7P6CdJBnfb0HXq42shZMCPXUHtDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2TQPMzn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2TQPMzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC2E1F000FF;
	Mon, 28 Sep 2026 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623431;
	bh=XC9uAI75CvKuRZPLoeoISogD4mGmbtSRDIY7qlsonpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S2TQPMzn/EllqP+M3Z0R2248/Bp3GONBRTCVVPf7zRlt4R+EN5892+TQtRlua6e3f
	 7jdXcOGHo2ck9hDViQaZ+47YsO0tNKMAeUB3dkfurdRLWNCqCKK5S2UEJZQMGc3TVA
	 og4ic4yzipJ9jkgPYuc7JSctTdvlis5wea2Cw8bD3l4zN/YVdSap0r/2Xcjo/ynYzO
	 V87mykkGwJkHbxFXOmWzJSz1La+uApwunG92J88izj0YMWHoJwkq1jcsw8lYw58a6c
	 3Npx8b33duhqTPDnSKBgAldlA1C2H+xxnjF67i+hrtPA7L8e6/H3zd7DRWufIpvFBa
	 bEzWK7qMMh0Ng==
Date: Mon, 28 Sep 2026 20:23:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <d5ebde9e-29be-47ab-b74e-63a6bda079a4@sirena.org.uk>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B/XKNQtA6qkUcNe4"
Content-Disposition: inline
In-Reply-To: <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
X-Cookie: All is fear in love and war.


--B/XKNQtA6qkUcNe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 06:24:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.

> -- compatible : For Tegra30, must contain "nvidia,tegra30-ahub".  For Teg=
ra114,
> -  must contain "nvidia,tegra114-ahub".  For Tegra124, must contain
> -  "nvidia,tegra124-ahub".  Otherwise, must contain "nvidia,<chip>-ahub",
> -  plus at least one of the above, where <chip> is tegra132.

This documents fallbacks...

> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra30-ahub
> +      - nvidia,tegra114-ahub
> +      - nvidia,tegra124-ahub

=2E..but this does not.

> +  resets:
> +    minItems: 11
> +    maxItems: 21
> +
> +  reset-names:
> +    minItems: 11
> +    maxItems: 21

Ideally there'd be per-SoC constraints but meh.

--B/XKNQtA6qkUcNe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6vsAACgkQJNaLcl1U
h9C8fQf/VYi7kxfm88EWJPHFuCQLtcS4CBbBCtFTcu+MKSeEUp3q3EdAwf00exOI
t3x1eSrRiQJRbXmFDbr177atlbD3i5TLtDsRDO4FCEbyzwH6OYWBS0RG08V9Ua0p
qTZ2E9NxOvbFxCLlUU1VIP2nozlGuR1HrfHfL0xSJwRUIZmZBIRG4Jr8OtNAeyo6
6HsjRRuen/SnPiPLgJgaBLuuhQwUsZU+GLIunGAn+6/1HK0eWhpLYTwaVwyg14uR
sS/RIv32ktYosHvh6KOB4ZxBO6OASqj9oIeyXDGbC9Vw1jlK8osOSqQm1GdZTYX7
IMiEnjyGjPLMJfyr3trqEMCkJYREIg==
=/iZ4
-----END PGP SIGNATURE-----

--B/XKNQtA6qkUcNe4--
