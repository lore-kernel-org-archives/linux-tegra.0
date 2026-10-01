Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA243443C3B;
	Thu,  1 Oct 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878788; cv=none; b=j13s4LqtIlV2YyVXH9GwpRhgKfGJCyJ51T9k1vhO6oY2js++DB1d2rnQFeXHO21aNF4BAjcmXEM23HwLpXC8uAwKLz15EpXnxTe9TUPu6tmlo073bQ+2ga22BdIQ81gqQIWgTTEEwlqlweor+IT9VxZYK5fSP9fh+o4C6fZXoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878788; c=relaxed/simple;
	bh=GBQbR+R/+955LxdFaAVyP6WBQ4P39f0GwpBjz+Onw3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFyqjVS3y9OQGlX95yPTHid7MtJ+RhDSyeFERkL0g8JRurqCmvGtMipug0LTSOKdWF/d1WFmNS8KbeHU2YKuRlxTnZMwvWPmBaASt3fBtPwOjis2SclcIirmAqNla3rklZeTNAtEjE5KqZNJnWg8JiPtfUq13M4KdvqThKIkYSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/ApQKNW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/ApQKNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8F01F00898;
	Thu,  1 Oct 2026 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790878778;
	bh=GBQbR+R/+955LxdFaAVyP6WBQ4P39f0GwpBjz+Onw3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W/ApQKNW33/IhZUhLndAniQD4qxhIKD4ktBweRNMfieLXfZeMU+xNDxhskoLDt26S
	 JPW+07kFvqPRA2Nq/ECWS3UF+c28ewMXb+gB5mRhuN/lWlpoZcYyHSo4g7vBEXjKaN
	 z1VYpZnrRreqCZlxJONDIBoklUrqZsTf8myUObcSQRFz0H/41WZgT7L8M8N0gGXXuD
	 /HbSwsVVDW3FxvGbw5MzV3pfC+HdsHAb0Tl8DUzsm5aiPyZk8TnTIItO0E3g0RRj5S
	 CkfgIUiKbwhlvPT4U8nsWTnYo+oX1BYjDFTyI/sTQV4JwNLcG3lC9U7se+6LUlGHT/
	 EqOtDLtPIubNQ==
Date: Thu, 1 Oct 2026 19:19:33 +0100
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
Subject: Re: [PATCH v2 2/3] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <4906079e-bcb9-49b3-b926-a38e004f53f0@sirena.org.uk>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
 <20260930-as3722-bindings-v2-2-a3bba649ebf9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CiNrKFiNvWa0On5z"
Content-Disposition: inline
In-Reply-To: <20260930-as3722-bindings-v2-2-a3bba649ebf9@nvidia.com>
X-Cookie: Do not stamp.


--CiNrKFiNvWa0On5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 04:01:24PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--CiNrKFiNvWa0On5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+pDQACgkQJNaLcl1U
h9AntQf/RKWOAXgdfPdxxCh+VtG88guPxz38qY6yYHlXJFT9iflYamy1BuzOwe7d
zK6QWJ7RNhv829jG/OmL9lguYZMjXAee12pPSI+QZ+GFzL4gSJnyJ1YX8CRlIcux
+f5WnVx1jke3DNiNETuVeZ/WpoD7JC+k9DRXFDl2jGLhWZCwYlg90r42dICMGS2J
a//sCbxD+Jh1PjSyilyy2YQcv2h9bVqm3Q9vS6f9V5GSa04+fT7pPiF15ogRl96l
EWg93tZKRTZrKXAZwZ24j4FWcb5p94idVhUbeSkdvytzRBm4N55ZeF7RtVcRYIig
dsTEwc6vI24r9taZrlhWJ0DzYs37fg==
=DOPs
-----END PGP SIGNATURE-----

--CiNrKFiNvWa0On5z--
