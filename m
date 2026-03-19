Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5D2EDD45
	for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936595; cv=none; b=I8rqeVCPzt07oZLtM9FySUc0VFMXG51wtYcDX4Qeu7rihubrNL1NL89UajPLaEc5TS0q4GE39OzKGDpxeEuoRSodHXhiqDD0uS+eXJRYjJjPvrs3uftL/8ILkE3qvMZ8d4tdkvwvqavyFr2N15V/3yR2d8EH6jsTDZ323vhzP3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936595; c=relaxed/simple;
	bh=Vm2RXvDdQvy8W+GSK8JzkxylVhZ9BxfcKJfddBrAzd0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWqARwYnGthbISQf3ejtBxD6JAiiv1dWPwVvz6Endjd9iYZz9/SnaeoniX0WtnmWyVu6EanREQ0UoAcksSMSUz+3Kgzs4ze8fTAS4IaU3rcnQGaQv11WnLKU6Z2TN3VvQ73v9J2GaI5UPtXnJ2o25Y0vqOKEk+7p6HcBWwz9A+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbJBCvyz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbJBCvyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C87C19424;
	Thu, 19 Mar 2026 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773936595;
	bh=Vm2RXvDdQvy8W+GSK8JzkxylVhZ9BxfcKJfddBrAzd0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cbJBCvyzcCEJovPDR66IWn0++v3e8jW5tk6B65tsLEQop/ICx15fABemTFkaLeICG
	 RWb/ymxDdT0bIxO/i4t0F0uBr1tVDS6u7RSxtZHvsDqaUZWufmWPuyH1u+Jo3MfHGv
	 lOkGIQqW/SRqRjRerum+17dSakQ7eRUhn0+v2n87XR2840EVAxGUEubXk3LBKHBiad
	 nZmFtvkn2Ufdi6Wb4u97OetE8KMiPb3eC7a4qCwSA+gZBlYnu4UXF7wKw0ts74+aH4
	 e+EpDylXakXGFpzDKRhg/pgaqpwFPZg9WGGUpWvayWy0yRclOZ5BxlMIFywfn0Xg7G
	 tt01XcPFl9J3A==
Date: Thu, 19 Mar 2026 17:09:52 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
Message-ID: <abwfvqfw4CYIUAoX@orome>
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggvqexil74n6ufhr"
Content-Disposition: inline
In-Reply-To: <20260226150933.4067324-1-thierry.reding@kernel.org>


--ggvqexil74n6ufhr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 04:09:32PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The NVIDIA Tegra238 SoC is an upcoming new chip. Add a Kconfig symbol to
> allow fine-grained selection of support code for this chip.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)

Both patches applied, thanks.

Thierry

--ggvqexil74n6ufhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmm8H9AACgkQ3SOs138+
s6GLZg//QL1EF61CA85bLrtZfmGSU/eUqsHpHelresQYGH7LFwk0nc7PNgUxfGCT
z7f9XtWa9dtsdDDeo+RZjnEYMGJ3UdFY7rguPgnL6VolWt22MFNAIrYBsl/d6kMK
zbaDF4xsX7BYPYN7IXbW1Wk1ZMb4wWDgWcC2udCqohdtpyhooCVED7XO3qLCCV9Z
Q96LBTF2GQrkUeo4jy07RIfEuqyYIW6hffrJT9qJGnpY4Qxd+RD5J272cCixpPfo
1U8uS4TZyQBwPfaGudduOg6Aqnjzd0XPJ5lcIJJCtuZdDwkMD5Il0jEEKdGrLqks
0SmxbnC164wd5PVmi6bcY08GclmNAHiuWl+UwMTQinALG/HChgJZ7aT7H7i0US9M
gIqSi3bcXO1I0wGWfKOvQCCU2U/mUcvUqpltMpF+0dUqw61OuozyDdOyhpfBMRea
1gPQ/i+XJMJ05ubWIhqqAUqohEaRCr67mGEVdyMh6gJbL9AADRY8Cu+nQ8jAkJn3
oW/UDvpAdlCGPGFAJXLwoeYtMNbL5TNVJJCFY9DREv6jecp4jlMYS9Hk7vDloqhT
7yg0cF/no8pTKRKHhEfzO6wHjV2vDDC5kHsNULnDgKRadGgMDHqU4qErwFwWM/K8
XdsQ3mzUGjcJnn+Lwq5Ao1N1dIoKWws8/sYTLBEm6Y6BL/x3Uow=
=mboK
-----END PGP SIGNATURE-----

--ggvqexil74n6ufhr--
