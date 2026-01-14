Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A638944E;
	Wed, 14 Jan 2026 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768392198; cv=none; b=JOok4iJcPq6UsXu01K5ayVM/CyeP8R/ipr5dfRT3rvP9ifndV6+A+52hHFr4TmtA3Qvj8XEa7WKsDpPNcsNK3J1mtByh6rQKbmLuVh95l6yD4+522iKIYAAQEcJ4EOo5/2lSLguhyOLpAaJGHNiNuxL2AaNuieEzM0xoz9JwUZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768392198; c=relaxed/simple;
	bh=qywVRcGaD2KqxuM4DBT4NMc3DkW9DNr6HABcIy2FPJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpBQBKg4F4Uiw/Glh0DGeORJKWKA5vRQfAnrS/84koM1em/uzvR9vbMMOz3E06J/XOXM+OuRcoTE/uxV593S0ks+kNVscbT/sjNzKrivXE9j/K685jjlAjqAisY+G4zeLi+YFELq1dcAwLkX1IHeiWuVX6bpjsta7cfez2xydD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlRW9ckv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlRW9ckv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8FAC4CEF7;
	Wed, 14 Jan 2026 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768392198;
	bh=qywVRcGaD2KqxuM4DBT4NMc3DkW9DNr6HABcIy2FPJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlRW9ckvmOlYA/cT6xwBWJu5PhfbyeuG0GutR9V9ylFonqWkgo6h3mXmkYyVUCwcX
	 4qEK3JYvQFYJG6T7siYkVUTHmE4K79KiQNvaZR7kFlYv6xNTMDmG8RDyAnng8eJ7Yj
	 xrHhmXe4/LziG3aQ/CFrnHu+hv10idfda83w9tBOBZjDLQxNkKExzhk0clKVtWk9xv
	 NOfp76jDL/0tLLM8CGjBG8bu+AJZkpDw7zqYRRiXu10P+mSdz/jYLEW7CYPPiw0B9o
	 7WfsU4hkvbgeVINN9G7nOl0WABTFeosq5WgYU9yD1JpuGzCXjEPEykQ/m2PvHo7fOt
	 kUlnjUVMUn/+A==
Date: Wed, 14 Jan 2026 12:03:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
Message-ID: <829bbb9e-70e7-43cf-ad93-373e4c8da55e@sirena.org.uk>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
 <176832669841.1106728.13139168898095349975.b4-ty@kernel.org>
 <0e68c5f4-f68d-4544-bc7a-40694829db75@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CWBaJgro0LDfWvsn"
Content-Disposition: inline
In-Reply-To: <0e68c5f4-f68d-4544-bc7a-40694829db75@nvidia.com>
X-Cookie: Absence makes the heart grow frantic.


--CWBaJgro0LDfWvsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 11:27:12AM +0000, Jon Hunter wrote:

> I noticed on today's -next I am getting the following error when running
> the dtbs_check ...
>=20
>  Documentation/devicetree/bindings/sound/realtek,rt5640.yaml: ignoring, e=
rror parsing file

> It appears that Rob also has merged similar fixes to the above and now
> we have two lots of fixes merged and duplicated properties ...

> So we need to drop one set of fixes from one of the trees.

Can you send a patch that puts everything into a good state please?

--CWBaJgro0LDfWvsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlnhgAACgkQJNaLcl1U
h9Brmgf9HzDN6jYvPAqjB3Tgpf3cE4cmQg5AQcCZQmV2E59BMAio+j1Z847Pqb3/
EOJlfYwaxOf5U6QInUyGGpARjQMvebjDdsyxGW7QqwyVVWI4sgMAooF8GvPdagv4
5ByMevgC0VPsp2mxSGZzdIjlixWGp5w/xv1aZONziAwOqus4Zsuk5OPyU+aAuJGo
ZVwMwj6sDqbKPUCEsOOWkwv4rwIkIUMgOsg7Zl5+30/VUstqevSyGKnAISSKd7MB
q4vbMNOQ9Z3IQ+h+8CJkpZG0gui878erUUsXyTL1uBm1s5h5m/tR27+sB8ex8S2U
bY+pSFZUHIrMmnAemjiiBT+iHTGr1Q==
=KWSa
-----END PGP SIGNATURE-----

--CWBaJgro0LDfWvsn--
