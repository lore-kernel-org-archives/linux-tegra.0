Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE735A2B9;
	Mon, 18 Aug 2025 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536452; cv=none; b=SlYhPc6SBfuPe+nGRomNrMzzi+wyQlXytfQqA0Ifat6NBeUw2HsLiUeIbKe+Upyr62A4kmiJ1bqHWIFpLrAxKm28r5OmplgeuNbaskHfGHzycUn5ngwlChbvnBTKIH7QUAMibVtPV1694+aoKCQVL+tdJl+9Q+eb+uoDXOyfl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536452; c=relaxed/simple;
	bh=FnEIBDDE8n0PsWTHyu7mM01/bgnMCKkNcQpwfrnPb1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjEZq978nv9EAVznTG86CPjalERDypLkQ+phVwHgjgwEqjBMjHLzfUTvJvU0NA/gwBAe0Jei7pMKLwNboGlK4W5hfdfOI6zkXuJjQmCkKG+7YdaHnR2ZXwVEzR2Aw6v0UwghW0G4k2LFi6Apszi6YZqrfsvdraBoU0CtfyMuZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWLuNN6m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWLuNN6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A46EC4CEEB;
	Mon, 18 Aug 2025 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536451;
	bh=FnEIBDDE8n0PsWTHyu7mM01/bgnMCKkNcQpwfrnPb1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWLuNN6mPszrPCinR0csQZqdoCEnEH1zON0lv62oTm33yiHDoLTpVZu/iOj7bN3Ql
	 JqFRdjcti4mi4KvFcNoL2LLKoNm+fvfdBMHPtAkeUisc9c1cKpCKqFgaIT0WCZhiL5
	 rbh9JpOu+stEXvz6jZacF4+4dwi2iR3JGW6zonuMqZfxvwi2XQW7BuOG+mNBUinf9L
	 mqPmzLTQ3/1dbZiIyKacSzrBFOSU4lp2+0nXKsyZYql+DT8hbIC9XPR9dFBK/R9yDT
	 6fZhtDSBx8iDO0c5BNyAS5F3HyHFOm9iZqbNla7UlR/KvufjOJXcw9JwZ91u71se0p
	 cUXShKn7kXPRw==
Date: Mon, 18 Aug 2025 18:00:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: Add power domain IDs for Tegra264
Message-ID: <20250818-citizen-doornail-324327bc3942@spud>
References: <20250818135241.3407180-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DLKZrvpokEs9J5w9"
Content-Disposition: inline
In-Reply-To: <20250818135241.3407180-1-thierry.reding@gmail.com>


--DLKZrvpokEs9J5w9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 03:52:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Add the set of power domain IDs available on the Tegra264 SoC so that
> they can be used in device tree files.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../power/nvidia,tegra264-powergate.h         | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 include/dt-bindings/power/nvidia,tegra264-powergate.h
>=20
> diff --git a/include/dt-bindings/power/nvidia,tegra264-powergate.h b/incl=
ude/dt-bindings/power/nvidia,tegra264-powergate.h
> new file mode 100644
> index 000000000000..344c669e4a52
> --- /dev/null
> +++ b/include/dt-bindings/power/nvidia,tegra264-powergate.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)  */
> +/* Copyright (c) 2022-2024, NVIDIA CORPORATION.  All rights reserved. */
> +
> +#ifndef DT_BINDINGS_POWER_NVIDIA_TEGRA264_H
> +#define DT_BINDINGS_POWER_NVIDIA_TEGRA264_H
> +
> +#define TEGRA264_POWER_DOMAIN_DISP	1
> +#define TEGRA264_POWER_DOMAIN_AUD	2
> +/* reserved 3:9 */
> +#define TEGRA264_POWER_DOMAIN_XUSB_SS	10
> +#define TEGRA264_POWER_DOMAIN_XUSB_DEV	11
> +#define TEGRA264_POWER_DOMAIN_XUSB_HOST	12
> +#define TEGRA264_POWER_DOMAIN_MGBE0	13
> +#define TEGRA264_POWER_DOMAIN_MGBE1	14
> +#define TEGRA264_POWER_DOMAIN_MGBE2	15
> +#define TEGRA264_POWER_DOMAIN_MGBE3	16
> +#define TEGRA264_POWER_DOMAIN_VI	17
> +#define TEGRA264_POWER_DOMAIN_VIC	18
> +#define TEGRA264_POWER_DOMAIN_ISP0	19
> +#define TEGRA264_POWER_DOMAIN_ISP1	20
> +#define TEGRA264_POWER_DOMAIN_PVA0	21
> +#define TEGRA264_POWER_DOMAIN_GPU	22
> +

> +#define TEGRA264_POWER_DOMAIN_MAX	22

This shouldn't be here, if you need it put it in the driver.

> +
> +#endif /* DT_BINDINGS_POWER_NVIDIA_TEGRA264_H */
> --=20
> 2.50.0
>=20

--DLKZrvpokEs9J5w9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNcPwAKCRB4tDGHoIJi
0lpmAQC5KSH2O8yF/DfXzw4MFm9Zt9tTCv1qQb0isRxXv1CfugEA98+zHqY8Uvk6
Q0lKLlNKSjtOReo4gqG3yUde16xWgAc=
=kJ+7
-----END PGP SIGNATURE-----

--DLKZrvpokEs9J5w9--
