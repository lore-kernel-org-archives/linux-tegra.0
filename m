Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A83D3CEA
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131363; cv=none; b=OcfdnXJX8cndvQO8Ab9n/36jUQ8qY+fl8Mpn+XjzKW39S0F7hE0fpgVtozQhIYbouqUsXf2qKxmoHS/ata/dYaosJgvld/cqb1AmvWxWxMFYBZEJ9/hL30kGzRWXUc30LQwUS33o/A1QQMwrS00gajI467R4BY8VtVUwN4UwCac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131363; c=relaxed/simple;
	bh=VtSexpkAeTcEr816mi3bsaOoish9Xihb19NxtfkqEIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LG42Ci08CQxPNCiJn0/IKpeE6DRcyfpzxsc7Jci8mLEVXtTwQDquMf9OVfcEqMZzC8GyBVF4+fhzxo+pzdNNAtxY1kXPo/ALYblXtQO2fUXlhLkcSbgHoKLcqltG0XpwPxRo2uWBccmcH0cPItWhWg94Wh/7rVliajM23+jg2Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXFVmZN9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXFVmZN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F056C19423;
	Thu,  2 Apr 2026 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775131362;
	bh=VtSexpkAeTcEr816mi3bsaOoish9Xihb19NxtfkqEIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXFVmZN9njolG5Q04B9Dt3MGpPNu0B2m9h+frpYlQok9ue0qz5Q4DqpOwK7tETDKA
	 K39eq56Zs9O28oZCoQ+G6aWNaD7B63a3/iHNWkD56riFQD2A+1tavWOsWSyH3dhL0Z
	 kAucddrfTLhGxPRsAe8PGDgpnGafBib81DFL2sxGc1F+qf3UsDWt7MfSdzw0kgxJDy
	 VipNSzmt4IrGkY7Z/Dk6dXlt4yLxDG5XWW8MoA4jcC1WXwZaw98ZRp+IYIJ+kGhgJQ
	 KQnO6r3mZF88sAdJG/bjekFu9DDUNpAynZ50qoicexzwcjvnLm3SILCdSeKZP0dmQ8
	 xrFmLHW7usyuA==
Date: Thu, 2 Apr 2026 14:02:40 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Message-ID: <ac5ahWb1I-qnaK_Y@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvqhrzlj2b7g3m5j"
Content-Disposition: inline
In-Reply-To: <20260329151045.1443133-6-thierry.reding@kernel.org>


--kvqhrzlj2b7g3m5j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Sun, Mar 29, 2026 at 05:10:43PM +0200, Thierry Reding wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
>=20
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-7.1-arm64-dt
>=20
> for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:
>=20
>   arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v7.1-rc1
>=20
> Various fixes and new additions across a number of devices. GPIO and PCI
> are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
> it to boot via network and mass storage.
>=20
> ----------------------------------------------------------------
> Diogo Ivo (1):
>       arm64: tegra: smaug: Enable SPI-NOR flash
>=20
> Jon Hunter (1):
>       arm64: tegra: Fix RTC aliases
>=20
> Prathamesh Shete (1):
>       arm64: tegra: Add Tegra264 GPIO controllers
>=20
> Thierry Reding (6):
>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>       Merge branch for-7.1/dt-bindings into for-7.1/pci
>       arm64: tegra: Fix snps,blen properties
>       arm64: tegra: Drop redundant clock and reset names for TSEC
>       arm64: tegra: Add PCI controllers on Tegra264
>       arm64: tegra: Add Jetson AGX Thor Developer Kit support
>=20
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++
>  arch/arm64/boot/dts/nvidia/Makefile                |   2 +
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  12 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 -
>  arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   1 +
>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   1 +
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   6 +-
>  .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |  11 +
>  .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  12 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 336 +++++++++++++++=
++++--
>  10 files changed, 500 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264=
-pcie.yaml
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-=
0008.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.=
dtsi

Hi ARM SoC maintainers,

DT maintainers objected to the way I wanted to handle the DT bindings
dependency here, so I'll drop the whole PCI stuff from this and redo the
PR.

Thierry

--kvqhrzlj2b7g3m5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnOWuAACgkQ3SOs138+
s6EWdBAAu9sQun8NBxkNHrqi1zIzoZakofv0v3tzIIayEiLRmYnGFuf5ycVobK0T
X/jraQ0uvtVcUQkbMNOrth/PeZS+8//deSJJUQBAH8+x+fNWm/JH3/si+dQRREaL
btyUJhLsdFn4WoimJa05q/lvl0lbnFWcYkiuGSHt14l3GW3huxrcqguqbkfMXP1D
/RTOWdJViVMpBonIBkQllaoiSqACVsGVoip/enn4lquI6z0nFDemBT7DPd3J//CV
T+ftdUQKZ7EKA+w3HOeWCgzYMGidzV/+EZY7LrpjiUmZNT6ffM9Ycws0l4u0Lyds
K+UUV3hxqD7F8IONqdByjwN5+vSVVD24LiiT78P9MXUvAcM3zAEqKMnkCL8Nu05V
0bZ6mteFNxe4WedQ8pyfNYihwhFmTSqR76g4Mv70DH4/5voAW0o0IPxp8MCbvges
6ccM8lz7jsGNY2K0YqjJt9M3aeg7KMycKvo4W6GQLzIcb/UmMxncleXWoR6NHT9s
/+YQMZEekNguCmEKx/RpBtOgpshfp56t6ecAALRXSn9fyoP8ffpYeuQ429/0rnWM
kfGrwRzgS3UaXSSRgb6kI2a9vkxiXEwcy94KDBFUhLsWQoY3uYlTyl8HwcEQJ8lX
V5ulj4q13qnBBBtd2CHrC/FR9mSJ/4bYOUfi5sLqPNQR3/9E9kw=
=qAuN
-----END PGP SIGNATURE-----

--kvqhrzlj2b7g3m5j--
