Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E645629C;
	Sat, 12 Sep 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789211146; cv=none; b=Xp4L/YRcPLg5pXGvwVjjR8m1w9hbqT6XTlYDQ+PXozgSg/MuSL5I/QBt8y2Y4nExeOA2xUhlPUhxwgIpaClkSi7YqVeNXBG+m5Gml6w1/goytXHibn7TJ2Tu3ctCY8a4GEmq0JvRO206ZYkb5arORkWQvyTZGqqQMt1FTd56zas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789211146; c=relaxed/simple;
	bh=EAbRSdXcg/S2Gd9ljR1ho5nMr6869TmN+678kggw2FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFedB0mlpMbD3gT5BYmCPznwdxRsVCAkuRjMCLXtIwkla6K3byXWoadso2tG9bG11CijnN+Idu5CeCqRVzuaIi7UDkU/Grj01ZwyrpHyMDZdt3Z9BJ8nEdOVA3AuoFdDdVKGmxIhDu2mQqi24tKonPHIdBR+CfyDkO40a0Qdm3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijT55XBO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijT55XBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5D91F00898;
	Sat, 12 Sep 2026 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789211145;
	bh=EAbRSdXcg/S2Gd9ljR1ho5nMr6869TmN+678kggw2FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijT55XBORg6IcAu8uA5SrrBO9H2IAr5Mi+f/7KGqEBE4vH1ow2utu9M+h6Itg4c90
	 YflEtHrnwzYXUBJdkoIgwtOKSqi7QRiBDiAb/48zBZhv0YSNU1LZNcMpjWC3eqx3jl
	 7sM9pqRR8VJgGBfl5HeZKC2vhPL1MhbQIu8oAgs8jeDIIk9VF/g8OZXOT9xMmBrVWo
	 n+JAdK+mDpRMna48QXXL7v0G8NW+pk3H2Mj8/mLdetCWS7U5oEFFUkn23LFwOZlKZN
	 iUAqzzGWz6OE7gvFyPhjKcUYPdEXUHpmUgDdP/cCbtyNTOtBRsQ0hnP9aHoGW0ZCLD
	 rsWomlqCc27Sg==
Date: Sat, 12 Sep 2026 12:05:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
	jic23@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] cache: add SMCCC-backed cache invalidate provider
Message-ID: <aqUx9NCdeEr0R86z@squawk>
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
 <20260910082142.1522865-3-smadhavan@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WLLAqGgGEJH6ceCY"
Content-Disposition: inline
In-Reply-To: <20260910082142.1522865-3-smadhavan@nvidia.com>

--WLLAqGgGEJH6ceCY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Will/Catalin,

On Thu, Sep 10, 2026 at 08:21:42AM +0000, Srirangan Madhavan wrote:
> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
>=20
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.
>=20
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>

If yous wanna take this,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--WLLAqGgGEJH6ceCY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqUx9AAKCRB4tDGHoIJi
0tWbAP9pKv18wzUDrEQgGGMSF90ZNqqaF5RwAsn6LafqkcXPPAEAtHRF8XU+X4LP
KmUhJnMv+MSySqjbU/zxJ/LhKruX2AA=
=xoxY
-----END PGP SIGNATURE-----

--WLLAqGgGEJH6ceCY--
