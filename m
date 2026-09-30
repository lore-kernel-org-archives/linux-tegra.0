Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDF38C2A0;
	Wed, 30 Sep 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754055; cv=none; b=O0/FKGUiDzvA+YgbQTtTY3e4vIaF6vTZxFy+11arwbB8CfHmv/3zbwrrUlMLbjmE3Qb+0aXCvEAbUEOtnXYpSSWQIhQZNcL6YQQCE8TGwDH1KGWaLg+b0fsHDg+h69p/4qLptnt1v0wwwYakDvyE3V3S0bte6Nxft03iONdibmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754055; c=relaxed/simple;
	bh=B4AtKkIc05Ww+ASuXgI/2gLWEVeT0HzPUFs3gF2J52w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlV/3Xs+4xIofb+SPSGFOlUFqwixPorzOdsfpuw5jgClTW3KuYhEY4rhpIHq3+jYo67sUfXj7XrztIkn8zUMsNQpF3v97N7rQdCJV1EpOhYXzQvlR2bilQjUnz2q/EvL6VmiLVJyJvgJ3cJqs/bODfIQI/qCTG3tIQYnygHFZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGapFXny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGapFXny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145B01F000FF;
	Wed, 30 Sep 2026 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754053;
	bh=B4AtKkIc05Ww+ASuXgI/2gLWEVeT0HzPUFs3gF2J52w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGapFXnyPQIyt/CzNo5tzdLuwmntlIQP6zAF1SQvsTDVkEHvHJnsGMlcUsn9wj4rm
	 PeII+TSoBabiw9OfgFMWD/+matVrhOThQJgQRSOKI2zU/m3hS5WsAMjiQfs66IdiHQ
	 /3+fqIMLVmcrAMNv9GTNDZdOVxBmK8rTJVcL6zA/zYryKHhPhlNQmdcRLTeXmLPJEB
	 5NwKZKbQGZbkBdW+Xo1Adv4qUIQrVVKB5EVPi0UAE5+MSKk9CgRKJKT9GDkes0gADr
	 QIfcr2a+C/X99VjersGXWsJ2JDz23x6Es7IM4pWVsfMFaNAvD6bo6VG7XEI7scudpG
	 Cc61SZzXHxYZg==
Date: Wed, 30 Sep 2026 09:40:51 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: dsi: Unconditionally manage reset line
Message-ID: <ary71zC1e-bySLFW@orome>
References: <20260930-dalmore-fixes-dsi-reset-v1-1-58c9d12f5ebd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hjctq36rj64msexj"
Content-Disposition: inline
In-Reply-To: <20260930-dalmore-fixes-dsi-reset-v1-1-58c9d12f5ebd@nvidia.com>


--hjctq36rj64msexj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: dsi: Unconditionally manage reset line
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 01:54:55PM +0900, Mikko Perttunen wrote:
> The DSI driver ignores the reset line if a power domain is configured.
> This was originally added to support Tegra210, where the power domain
> provider has to control the reset line -- at that time, older SoCs
> didn't have a power domain for DSI. Now, however, they do with the core
> power domain.
>=20
> This happens to work on most systems due to DSI already being out of
> reset when booting the kernel, but on Tegra114 Dalmore, this is not the
> case and causes the system to hang during boot.
>=20
> Ownership of the reset line is no longer a problem with reset
> acquire/release semantics, so control the DSI reset unconditionally
> from the DSI driver (possibly in addition to the power domain driver).
> The device tree bindings already require the reset and it is present
> on all platforms, so this is safe to do.

That seems backwards to me. The whole point of doing this via power
domains was because it's explicitly not safe to toggle that reset line
outside of the powergate switching sequence.

Also, the power domain code paths are supposed to work regardless of
whether the DSI was already out of reset or not. If that's not working
right now, I think that would qualify as a bug in the power domain code
rather than the DSI driver.

Shouldn't this be fixed at the powergate level? My recollection is that
DSI is tightly coupled to the display powergates, though it's been a
long time. Do we maybe need to reflect that in DT? There's a TODO in
tegra114.dtsi that seems to indicate that we're missing DIS and DISB
powergate implementations, so maybe that's where we should start to try
and resolve this.

Thierry

--hjctq36rj64msexj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq8vQMACgkQ3SOs138+
s6Hytw//RAQCgUFcgePzgSQiJkY2Q4//OYubpMTfdBZi6y4iNI2KUXVXbjgVxux2
0H2Vrvs/+WhIZQovHTR+HxyfUk/hTuSzTYhvK/wSOa7PWVMkhqCK7rIlpQvJGncx
U9NEH6nwx5waayDjGXIkEkqsyYkjeRl+OYcod65TzWTC1x7J8U8ZBT6scH9HOS1W
0Fc3OiaHT9RjHiKRgLjRd0Vx+lJWm0fiPDF4K/wFOf9H+hjaj3PnatzAKZ9oQBC7
luQwY+2MeIEhTHkgBUkcg+sv1ooRPMb1mdLUIhYvSDcLA7woOf9Wru+1S9S710Ke
MAPERehibPQCHmSM2oah2TZ8Av+N9hfKqRIhO/XTwqydPoHpERZ8V+ioMQ8POxiN
Lb4Mcq5wd+MGGwaKKuYoLsghSk+IAAx0L8Sc36kvvRsw06DOrOqX8X4culvByRff
yBJd5Os8imMQs/rRjwGsGJnuj0Hd2McV8q2KE3SZ2nN4mZMChGYkvutuYqr6AcXu
ORKzWQXvvsO7VnQ4ZlY5PgfCuzoVpp1yBHZrlCNnHlaIUAg2FzZ+zC7aSMwG+HUP
tCjOlYkFQLmO+B9QYmFMrn3cg7/sOmEHMjDNJvHV8xYs1RGrA4dFro3lnRCGDjec
e0TQP4YIahagZIHfF4oyiUFH/H/JEykDk8onjTEWc51CwS4BRw8=
=9FPw
-----END PGP SIGNATURE-----

--hjctq36rj64msexj--
