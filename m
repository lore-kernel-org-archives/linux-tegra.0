Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C51132C329;
	Fri, 27 Feb 2026 11:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193316; cv=none; b=iXm375Wpc4TJE2SViiqZXEYNawZw3Cjm95aLuAdnERCLqy6y2TJOtIM0Wc/mFQSpnWBb9LPXv49+GV4w/Rwj6HTuP5RpGPahkAhKaz2AKcTDgSn2VIZ56KJcrSUwHg5UjVMZfvxmFiWRVAzyuojUYjXJxZT+ailCpidRfVPaOhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193316; c=relaxed/simple;
	bh=p98pBldJia0Em1Y3hZfuOhjPlWFEiiHFKdUDvyD31UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib0Le0b6v2KypEUFWN1O1tea8ECDl2YXmE33ihqkxizSck48ji1fYUJESnYPBQNT0nUpFymVfRlyVU3WPqruxfx8/H6JKx/V12zk+ph2weqXKlkk9rXt72VzLF7QSmcru/qy64wbIUoghQCgm1ozF0Yu5tcQbP8QQWE52H3cJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT2G5h1u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT2G5h1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2B9C19423;
	Fri, 27 Feb 2026 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772193315;
	bh=p98pBldJia0Em1Y3hZfuOhjPlWFEiiHFKdUDvyD31UE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NT2G5h1uMb7zTJKDwI92uFWUfKf0kQG+3sjmFWuXjcJORBQDSaWgN+BO3QQZNO/Lx
	 gfaDfbuZE7hELQNcNMbp/lhj8yeFaRfUWFR+wybhyn1iqtUrJs9JXf2AjiXj5N3ENa
	 EPZaKLrNVonjoCCaKqT3vDzKicomanw1Ndn2jS1OGs6LdqOrudfZ7o+eVvkS6cQw2Q
	 PGMK+xUfiTM3K2duv2gUmP4XfUtUMNz3DPi9iPpqB2SijFWITxD/MGv+b113BqNkG5
	 NURom20I5QSFsiHDj5tlWI3hNGHHeyIWkkhc2e84oowjA+8cq9KhAHUXV/+ZyC1dTW
	 Z8ElEjSnpSmmA==
Date: Fri, 27 Feb 2026 12:55:13 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] memory: tegra-mc: Drop
 tegra_mc_setup_latency_allowance() return value
Message-ID: <aaGGGTS7jKPl_LMb@orome>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
 <20260226-memory-simplify-v1-2-ccb94f378628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aguszmo6o676g4fy"
Content-Disposition: inline
In-Reply-To: <20260226-memory-simplify-v1-2-ccb94f378628@oss.qualcomm.com>


--aguszmo6o676g4fy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] memory: tegra-mc: Drop
 tegra_mc_setup_latency_allowance() return value
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 09:35:25PM +0100, Krzysztof Kozlowski wrote:
> tegra_mc_setup_latency_allowance() only succeeds, thus its return value
> can be dropped making code a bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/memory/tegra/mc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--aguszmo6o676g4fy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmhhiEACgkQ3SOs138+
s6HXHBAAufT1HtDhEKdEAgl8f+cZRKlXe+bDx1GdvgfcV9HJW2haehw78xGSD5AU
yK6+xtEzDSDjVGqZsTQdfgKZC7f7brUREOGLdcBzYMdFQHk/PSvnZhJE5OVjo0fx
CALQM3V9RklWlR35H94Q6WJwaYMIKxOuPPgzRc6Y+vknSfVM5Yo9ThlvpLjfNux+
YTlfjPwY2ReDVs09rOf2JOD2tg+ZZeC5mSYMbGYspJp/d6pB4kXf+3fI1VmEirus
NO32ta1VIKTF5Q87cf6EcttFhC7QYPNmPAENbVnxTIrtpSTMGFMY5qQn2LAeb/5S
U/xkFqpVRfqBO9O2drBt0mZfcmqiLZDMCjnwND+TUeLQnPS6HgPyj+DedZIlvL6t
jBDkCg0ts+C1NWtuF9EqIUTNUaHpvERAeH6om0MzXVaLrX13vO+KQ5A51oHZKoJR
/QH0VgAWINLFU2WYX2nvkxrsD1MI/SK3mn+7aicoIy/bmsWwa67bBACkuRBcX7nk
P4zlfR4aXHxDH1Kv1AUU4OzpJZfgo579cmrua+6iDfOSA/RqS/uZsXfCerDDMW70
azkMu8uVI97aIv8Ocnid5CN6i3QqjM3ev+RKq960Z6/+vWXBFMkzWoYQeo2fGHe3
2uH7XMQX82dNQE4CrU59rsVIS+jX/IUlciceLRyQtFsky8henV0=
=/UA0
-----END PGP SIGNATURE-----

--aguszmo6o676g4fy--
