Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F93C3C07;
	Mon, 21 Sep 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986252; cv=none; b=j9kq2Kplq2Nnw24jLpI7um17BBGBtQgnHNZJYaapdVTiM9R9qPSxvIqhebh6J73JM0oxeDHsPEva2o0bvsSk5n+1pY1ZPRJ/w6vY9iHr9NJJq1vFuBKppowNecPiQaIOsl/csiPXNwIi1xZcBNIbw3TBHsNDUWI07EYrXydKh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986252; c=relaxed/simple;
	bh=Ub/+kGpAAP6+lsoiaCw9Klc1Wvd0seH12psmBQ0pa4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO90f5cyGo3gmoXxucVU8yPXgm7PFGr1dB4VnWpj54DUUN61BV5itD/mNPWHLBjkN7iSGkuyt5IdVYeyV2KwQtWSEWLulXEz2mAtb5HP7pvMfahXn15OKR6uMNqoERw/hELCCl7lujMfBApOLFpVASq7qeoo/Ao4nedIvTLi3es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kkp/F6R7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kkp/F6R7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EE61F000FF;
	Mon, 21 Sep 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986250;
	bh=lwX4uKLsOTYT1SCuUhODQ6rGv8tZpp4S5pftAMN0UFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kkp/F6R7RcrV996+F2BmiS0mCBFkfoMw0mo2+WHNo8tu51/jvdlk4oaGmKZm/H+rq
	 Rfg9Oy3pOswCWSS2mFm2Ig9BkjTbwZVtieTQQC4948ZJ6m6bK03o6VM2QUbUC4vDej
	 eVr2+evJZqWtqkTAMcXNaAswZ6ZlmByPatJNMfpcIOFWlNukFZWINhDB9+JyWdRdYG
	 XQJhMSddxMNv1AOlhFYrs69jT7rJtWClnEnLG/dWR1NHJ2g0E7OEn6nIIE2TgkfuxQ
	 p+0XUC+PHM5DTUO5aZ44f8G9ueuQ16XCR8dyI1LKJvjs3ooZcMQm+1Zce+y2f6vfny
	 X0PG7re0U9OWg==
Date: Mon, 21 Sep 2026 12:24:07 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 0/3] soc/tegra: fuse: Add Tegra264 support
Message-ID: <arEFuSVya1BcQcrN@orome>
References: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c473hq6sfnp3kpw7"
Content-Disposition: inline
In-Reply-To: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>


--c473hq6sfnp3kpw7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] soc/tegra: fuse: Add Tegra264 support
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 10:16:00AM +0100, Jon Hunter wrote:
> This series adds support for the FUSE block found on Tegra264. The first
> two patches were originally posted by Thierry Reding and add the device
> tree binding and FUSE node. The third patch adds the Tegra264 FUSE SoC
> data, including the register range and keepouts.
>=20
> Changes in v2:
> - Reword the device tree binding commit message following review
>   feedback
> - Correct the register range for the efuse block to map the complete
>   address space.
> - Add Tegra264 FUSE driver support
>=20
> Link: https://lore.kernel.org/linux-tegra/20260320233822.2578569-1-thierr=
y.reding@kernel.org/
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Jon Hunter (1):
>       soc/tegra: fuse: Add Tegra264 support
>=20
> Thierry Reding (2):
>       dt-bindings: fuse: Document compatible string for Tegra264 FUSE
>       arm64: tegra: Add FUSE block on Tegra264
>=20
>  .../bindings/fuse/nvidia,tegra20-fuse.yaml         |   1 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi           |   7 +
>  drivers/soc/tegra/fuse/fuse-tegra.c                |  11 +-
>  drivers/soc/tegra/fuse/fuse-tegra30.c              | 168 +++++++++++++++=
+++++-
>  drivers/soc/tegra/fuse/fuse.h                      |   7 +-
>  5 files changed, 191 insertions(+), 3 deletions(-)

All there patches applied, thanks.

Thierry

--c473hq6sfnp3kpw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxBccACgkQ3SOs138+
s6G+mhAAmQERE+9oglvjMFq0bGHSrMhFsWXzwxwRfRHRzKRRRif+Vd5AS1hjELXh
18+jEiHRVDluV54BaO6hOFLL+CuIZv9Jy1UATKMYXooS6UwE3lCo2yP0TH8L6RHB
ni9wfveRpkkUEgHgelvaY2KaWUsw4sfoY8I4AzzUMfoymLOHjoUdWkx0h5C0uvAk
Onbn81XBcvUH48zlhF4wJbxQqZZzi3Q0QleTD8I8wv6YSC3IqZVZzpgtdxDFYYLP
msLHUKNNE0xcjJLvAJJqJHfvk7oNA0lae+pFqLn4MXWDe2BREkGr0Z91O31OsMZP
drAzzfU6YVW8sNix9W4zQinQgpZm2jXE4b7smp4XzxNxPt9yx/7FgsP609KVHZ4g
cOLaf4eOJ4Pn9tDQAAxc8FTuZErfSqC2Xww+44sJA9FDxeDHlIiN2LeiIcBlmH38
EWCvgHjxRXtazi2UVG8wHbLIPD4AG8p+Agz9lHr0LSlngt5Q3ohoR+deN0WR875l
eRVk8WfYGbgohxatiBGKI9CrvXukNewROrVTmzcXJGJucRM0BP7+LfJWEVOnLnsk
f8Bnytnz6TdLXsSrj7E4Qs0LpM3kQHhoOd1NzcPegNDZ+PCs/v0VTQk+JtByfVvW
ELiQn4jWlGF/BwX4c1gLPdgzWnnCO8dz2D/biz7aeIoUmvN05/M=
=K4L1
-----END PGP SIGNATURE-----

--c473hq6sfnp3kpw7--
