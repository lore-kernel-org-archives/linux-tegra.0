Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664413290A6;
	Fri, 18 Sep 2026 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736174; cv=none; b=Jf4HnWEwOc+kSkhA7cUAnjHOQIX/CfR2ZWJmF6Ju+eaPXUpmu1ZS77fkPXvd0naouHRuRsmaEWnS3qlB+8Iiit05AZQs7/KZuFGT7x8CpLSaEZRhnM4cCDAcrZAVIdcUJKwRBzcqUlyOtrYX5Z+w/HX2BlfTp2j0rRye8s8jEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736174; c=relaxed/simple;
	bh=RBXYEjHF/EWP9iukfkuHgom2R/J9ihTDzvMV0PEXWn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0kgFfCf59ce06YQYe8IqVfB82RZZlkRmcTZ89hxp8ziYZk1u8NMF4gL/UXPPjVPbIllyE/+2P4kLj7IvNVjrQ67W8S0AojbypY9cqJKCCYqmRv+09AgjS/kRB0IiH85gy6fKk4p8FwYbQkMG9QYhtljj6jYf3ePbogZPnAKexI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im6zGlq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im6zGlq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1841F000FF;
	Fri, 18 Sep 2026 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789736173;
	bh=J/k/w1B8of/PqrcuFgrWv1Alar7pC652sY+HmgTQ7ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=im6zGlq1sW0eexQqwTbDpMfwxn/B6XmuCoktMjwlDeHct1/HEwclInfWXA2kAg9Xq
	 U1HLJ2FMWXsDx5M9wXzpgohBUOcF8FL1PK11XFGYGSpfhECuIEZLYu+gBKZzRjtyOE
	 b8aPExCBpmLUG4BkchoXW/uunWzcRXwPUcyHRRb7stjjIctjrwVUKDT0rdq0Wi3lWA
	 H8b+MzBx0Jjc5MLtIf+fT88GFafz0soIczuGUEEe3FH69abNSFWkF50CL6fDmb88WZ
	 PMzxdaOGZMpdWmSk2lsxRotrrxEHVwHJvzlnmPqki22X5fbTQzzPwliEX6wdwOdFli
	 Ju4s+d5bgAwJQ==
Date: Fri, 18 Sep 2026 14:56:10 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 5/5] arm64: tegra: Add thermal senser for Jetson AGX Thor
Message-ID: <aq00xANbqBoo-PrG@orome>
References: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
 <20260918-tegra264-i2c-v1-5-3adac7aae717@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="exzpwnb5s2wwqjns"
Content-Disposition: inline
In-Reply-To: <20260918-tegra264-i2c-v1-5-3adac7aae717@nvidia.com>


--exzpwnb5s2wwqjns
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] arm64: tegra: Add thermal senser for Jetson AGX Thor
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:06:57AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The Jetson AGX Thor module contains a thermal sensor that can be used to
> read out the local temperature. Add a device tree node describing this
> sensor.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

FWIW, I fixed up the stupid typo in the subject. For some reason it only
stood out at me when looking at the patchwork listing.

Thierry

--exzpwnb5s2wwqjns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtNOoACgkQ3SOs138+
s6EUxw/+MwOQuWdUCVkR+SPKW8jPXk6hRuQXGyXpNSV0y0IVpmTrDDuMY98wsTAK
L/crMDZNdf2Q1uN/fvgQP9a190AXGmUFkUu8UkbTHDV7MP46XdNL07/EIrhFxDZc
3+y9s9QMMCmdtpiXWd9u1quegzxOdiUxZtM2ZDAh74FGE526Wtprvj/N/WaLLx6I
K1J+kJNhQVWLsRVV+97kQ6YmHcjqYo/Bfi89HGqHjv/ST3rynr9FYDe36lNNeMgJ
xBQ+dkrjWFklBYnsqU0JPfEpbLuDuLhxPbhIMAEujWdrpsnPOGs56ElspxDW4meJ
eetVna5gMSvizncRHdrQHdpUq9Q6c3CS61OdFoabU+7N7CUNiDDpXQFzgypgsRWQ
gLTWo8mSYh7ddpCarz0waNYovnY6lQBtpXrRDnHLP109P0oPmvYbTh2SU2dOkjoy
Fj/krG6GKk16QxzNRNmwwRnWqkAZGfLnK+yyBfLIelbezFuMp3eOmyy+2PL03z4p
zPTtlEN7M+XixUi1D2nfkBDGRkRKxOLZmLvhh7XlhYuJSJNSuZW0ddqeFHLOtrLw
znqYEnNWFGdSqHgZARkPtNYDMhu93FFwdZIJTKXeKb6MXU2DJSMhy9PVtjAVH3vB
gNNUMRNA+9eIJ36YyU4cLPJ+WiqVz584L8VSBbSJOhag7cu3P4k=
=vIr1
-----END PGP SIGNATURE-----

--exzpwnb5s2wwqjns--
