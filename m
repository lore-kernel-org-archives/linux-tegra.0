Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2F3845C9;
	Thu, 26 Mar 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523010; cv=none; b=rOzVCQAEKAHW0uydwfzh63vepsrdLhK9AdTsl0F0z1oduh25rN6JJMXBF7oNY9sYmQ9nYwoQj/SdwbIP4WWs1G+vhmcM0stOgX8LtpUZ1mQgZTtOBiHeumN7l3G1onmivVdnG/FUNXJyhRvIoF8rtA5qzn0DJUSsFtIfA9rGNrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523010; c=relaxed/simple;
	bh=enWWOHgo6xY4oSckq4fSt/3V6ILppOAOlBWBTMp/XRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulxMVwU6Qe8tU7fKukGcGcvSb9l+s8IuO9C50cFxJwFubThCWqYr2mfUso6qxEiEcNpTdTrxklMCr4vfGXvVQJEy4ocLB/5vGnwF73MTb+AR/xvRHRDRppZocMQa7RuZjb0wk+FsZOu2443126Y9FcuClz5yV5jSS03g19WIEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACqXHXtd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACqXHXtd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599CFC116C6;
	Thu, 26 Mar 2026 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774523009;
	bh=enWWOHgo6xY4oSckq4fSt/3V6ILppOAOlBWBTMp/XRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACqXHXtdgRCIVbr1z+TKgik2DJvFyv/yUK1IxzyKcNWFpOq8NWJY+XaBR/lsv2oVC
	 kS9w0kWaQAwRwHpcKW50ZJedzlMjdvbp8Cg2hPx9aHLXeJaryANnhBJy6jdNc2m85b
	 hjltH+IZmJfx2uHJtZ2zsNswL3MCXfyd/UtENRqovtx+FSGiVPAswYtaxVqTQpKyKC
	 JnpCVgFsnXqtUTQBg5mJuhJP+kbW/fgb2KDXVJPi1a6d2uUhIVdGlsMtfrYXIVTp85
	 iyMqUXCaHYVcqx+Obe7gU0fFxr2IUfW8xrwHU5n+9KK3/H0gyzQxtXmqxnLfvx7MK7
	 dEG5umlaCoXiw==
Date: Thu, 26 Mar 2026 12:03:27 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chun Ng <chunn@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, ankitag@nvidia.com
Subject: Re: [PATCH 4/4] arm64: tegra: add e2426-1099+e2423-1099 support
Message-ID: <acUQ1mOQ2ajrnUC9@orome>
References: <20260325212628.1234082-1-chunn@nvidia.com>
 <20260325212628.1234082-5-chunn@nvidia.com>
 <20260326-valiant-marmot-of-variation-9df0be@quoll>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdeoinhtsefdqaur"
Content-Disposition: inline
In-Reply-To: <20260326-valiant-marmot-of-variation-9df0be@quoll>


--sdeoinhtsefdqaur
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] arm64: tegra: add e2426-1099+e2423-1099 support
MIME-Version: 1.0

On Thu, Mar 26, 2026 at 11:18:17AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 25, 2026 at 09:26:28PM +0000, Chun Ng wrote:
> > Add the Tegra238 SoC device tree (tegra238.dtsi) and a minimal device
> > tree for the Tegra238 E2426-1099+E2423-1099 engineering reference
> > platform. The device-tree is not yet bootable and further enablement
>=20
> Then drop it. If this cannot be booted then it is pointless in the
> kernel, no benefit, no one can ever use it.

The purpose of this series is to establish a common baseline that people
can use to work on top off. We expect the non-bootable state to be very
temporary, but for practical reasons I want to get this merged so we can
make quicker progress.

[...]
> > +		hsp_top0: tegra-hsp@3c00000 {
> > +			compatible =3D "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";
>=20
> DTSI says 238, compatible says 234.

Tegra238 is a derivative of Tegra234, so there's even more similarities
than we typically have across generational gaps. Your recent comments
suggested that you'd like to see new compatible strings no matter how
minimal (or even non-existent) the differences might be, so I suppose we
could prepend a Tegra238-specific compatible to this.

Thierry

--sdeoinhtsefdqaur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnFEnsACgkQ3SOs138+
s6EUUxAAvyrXZ3GyM6LjtSf3cTRQwqoUCHPDaHIBG46UfczInOAJmnMHrREcxG4y
ekB+/30JQDlH/uxMA00BR+BBZuhP89WfP/qGO1KeuE4iTp5QI30f8RV/ECexLOs8
Nj31/WPewrTM1JqG+CMkTKnR0rw9RJeew1hh0MjaNzm6m1Vtw8F9Mk8huE0oZQq3
kZr3bVQFxi3Wlow1T6RI+PU0p+EhJ1T0kFAojCtR0jXPrJTbocvQDSOGxdVHwW5e
wP7JeFlqjU4s3Gt1h82Cw6NfDrGEMmcjCmKUvNiWn53Amln489vP2zrHCHbvkMIJ
QEBt2piFsZwZ+oiIQ9d+6d6NeCy0OhmKqsTN0evsmuFWsbm2Knv6x6thkcy900pA
9SKvm1KCCnvY7OS61VdpLRQFTqp+QGlysaAl0E1Jy4I+t3USevZvf+xwipWPYyWx
5nyVAO3kU3uOJBo4YvZoudhYBAU9QxVRkxHL7dxcKA2LZcVeF2AbeAzagWnxsSqN
FDeAaBOd2YAfgpNvASUfKkuGGdeT9TCkrzzvsSVTjU+meWLsAk7XvH6W/CtoL43e
QJ/FnEJizTWQ5uMq6AbYBcUCsvmkut8sK7LJ0y5S3A1+PFGhFh1BUzz3hxZk3hd+
K5UH5Q96XpzWkQFbcXj0DZwfONino9SqOI9N+KqWrqRT3d7gmsU=
=46Ah
-----END PGP SIGNATURE-----

--sdeoinhtsefdqaur--
