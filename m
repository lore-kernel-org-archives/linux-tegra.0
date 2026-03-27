Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790C3F23C9;
	Fri, 27 Mar 2026 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621631; cv=none; b=uWccN80FjaSl+ZRMEcl4iT9CIbSKYFmLb3KAC8oGv7L6j0PzOKO68PxFm9dkBm9Z1ZVKLF7NhnbVNVYPteZmw2Jd74zXWn7BKCmGbFM1UtU2+n0gUdgZXrmD2xtwHgFoB97vz+t0H5EXAnE3L5cChsbZXvoi6xN5sCzob4mt5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621631; c=relaxed/simple;
	bh=/QeOB+Z7W09aV1b0ziQv/YIh9g569a7nv45izCn4ZV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bejOcK5/K10GLoP7EOYarLyHJRzJIJl3PnsNr3E7rFOZV82i/lyKZYvzybz9qEh1EFeVqtn0BO8BLalw8kOhnctbOEvXP3f3PaYYgOF+ZAea3NuOnSHyOQA49O9+X4laG5GLmdlJwWsuoWZYc1VKor1YTX96Au0b0j2eSc/0ii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWfVpPlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWfVpPlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012E4C19423;
	Fri, 27 Mar 2026 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774621631;
	bh=/QeOB+Z7W09aV1b0ziQv/YIh9g569a7nv45izCn4ZV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWfVpPlhSxyNfQsi+TL0X7lQRFB6Uf4vvmwHhR0ZDmvhd5uC9LIQMnCF1BS51S5cX
	 yc3VYGwLA0gsvToug3oKHBB1XmK4gKEIFsD2l+HlFOT7T5zKCrYJCPz7izJx6KrSdr
	 6LQzDDVshzIdaXX/D6x8nAPjK0HOvjDft71KkZfvnMU3hcfeOdM0qta3cCjk8JYirf
	 nYFvNvwt2ano7MfHThAhczs0Xq0w5CBxXaoVumJ9uE08X//JrLBYPnSkyVykKijw5a
	 8V1tMw1agddcMteZJjLrBCkcWAWWaXd47dPQDqLHuBQ2lOEx2i4aNbg7YKKrN5IcSc
	 hsb/qhtp7OG0A==
Date: Fri, 27 Mar 2026 15:27:08 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v2 0/2] soc/tegra: cbb: Add Tegra238 support
Message-ID: <acaTo8UpTACvjO-3@orome>
References: <20260325125726.2694144-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oejbgn3l2na3dgct"
Content-Disposition: inline
In-Reply-To: <20260325125726.2694144-1-sumitg@nvidia.com>


--oejbgn3l2na3dgct
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] soc/tegra: cbb: Add Tegra238 support
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 06:27:24PM +0530, Sumit Gupta wrote:
> Add support for Control Backbone (CBB) 2.0 based fabrics in Tegra238 SoC.
>=20
> The series includes:
> - DT binding updates for Tegra238 CBB compatible strings
> - Driver support for Tegra238 AON, APE, BPMP, and CBB fabrics
>=20
> v1[1] -> v2:
> - Add DT maintainers for review. Forgot to add earlier.
>=20
> Sumit Gupta (2):
>   dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
>   soc/tegra: cbb: Add support for CBB fabrics in Tegra238
>=20
>  .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
>  drivers/soc/tegra/cbb/tegra234-cbb.c          | 134 ++++++++++++++++++
>  2 files changed, 138 insertions(+)
>=20
> [1] https://lore.kernel.org/lkml/20260303155927.1885297-1-sumitg@nvidia.c=
om/

Applied after adjusting the commit message as suggested by Krzysztof.

Thanks,
Thierry

--oejbgn3l2na3dgct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGk7wACgkQ3SOs138+
s6G/ZQ/7BwaUApwCYPzpAw1MzCOBKNAzVyLcuyL3QAvp9CzvS0VmfcdqeORpQS0D
lYbk9bPbVXNKpyIYnB3Yhu+2KKBG5WJP+gdUVc1LRHgWpTbU5CjQNB6n+hG16G1S
S0IjenIoRPj+IZFrnzn2HiAwwDbP/mzWX0HVTe9vrM+/hmT/CFXxWh8qGNdr1JBB
yJDWg+u9A7xQMl80pAIVRFsq6o5ptsClFHeB74CCQtXeazPJw46H9639BG4Eb6Gb
TshhBNCeo/1rbP2O1h05uMxmKoDirvaE6G8mTLDty7XweYeMBF8d6+PONG25XM10
Jk89cnX8Ewiy99ag63xSMU9+q5U8b9UEmc/Ux99KONWHASON+zfGvVYEROspGe4o
ies+hGBUYL9GcWKwLRtRu04AtVr2sg33nySzkpQQFiOHzcdi24I19dxNaY7fblPe
D700tQJx7XWHQws64vB6I5cgST+/5sDOKx0qfSHQUTFB/U9honK3QFnsDggSPJVD
iVdOdo7zUm/o5If1wY/MSjftAF/w8FLVudRT0kbno5VsKorGfS5k2VImTx1R45WA
oFfEE5GLa0PHPspts/xNjQXOOCFvULuhHCY1dru74FxBwkkwviXlo3/NdQMI3U/V
Qif5oxgDc+XykaR7LuKfbNP4S3SyFqDnjiVlAwDxYqQuG2Pux+A=
=rIbU
-----END PGP SIGNATURE-----

--oejbgn3l2na3dgct--
