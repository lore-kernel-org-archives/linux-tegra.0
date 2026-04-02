Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507C33263A
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131241; cv=none; b=Eh6PBAn/kdgn1Lox/5fp8j+sIfheUzAuK637bxxzWwZZaXzwNMJtofsahVtF7lc/JhIie9dq7m4/eStfKGU2NETQoayqBwI6qhJLU9StrnG7EfVCsnesmR++Mixo6l8x+VuymwXHLZZ9HTKbGm4NjLr6vTw2K4e9LuX5idCVl/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131241; c=relaxed/simple;
	bh=ierkfmJympD62JiwLSPMCTfDznTkU9sslkcFOZra98c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQczmR8DXwV3tkI8n+2+SO33xpgKSScwEpOl/dVSp/NxyO8/6S+44lX5UGSkNfFln0RN4s/LkDtRJXA7NCDx5U3nJaajAKvaF4ZWqV9tf3rasBBXaD9frsm6AQ/HAYKsWhzqZXBL5uq7xrspYZUKwfSw1Ygu986uadw6z0QyQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ/aLQnd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ/aLQnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B17C116C6;
	Thu,  2 Apr 2026 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775131240;
	bh=ierkfmJympD62JiwLSPMCTfDznTkU9sslkcFOZra98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJ/aLQndMAr/mh4Fzg3UMjzw+xcA+nRmdm58VaAr8hFyuR0z3GOmprTideMyEHRy6
	 5x6bjRVmZK2FVPAM7sgcqVGXJwgShwBabqSJbvi0aEzKqJanT8QQRG00wxHltInbEj
	 dLke3PC7B6ZoSkG9d5zReUMJ/o/JxHafJ1/t4zwBkF3htWk7EpcWz2y49QUmgjDyKQ
	 x94hGWiswsRXPt3bfxwDOO5KJ9uCNd6HPjENtuM73r8uCp6vlhqRdq5fSnjziskMcB
	 8DlQMFIsXrhvGdiQKP3IQ1q7VbjWBlUgbVAKNcvixgUUYIQv//zmfo9XMNSxGyOIYX
	 oYePVPdNTH8UQ==
Date: Thu, 2 Apr 2026 14:00:37 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
Message-ID: <ac5aLzMyfnxa-LLi@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73fopvxzga67awj4"
Content-Disposition: inline
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>


--73fopvxzga67awj4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
MIME-Version: 1.0

On Sun, Mar 29, 2026 at 05:10:38PM +0200, Thierry Reding wrote:
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
a-for-7.1-dt-bindings
>=20
> for you to fetch changes up to bed2f5b4de6c6fd8f8928f6373ad92e8795c370f:
>=20
>   dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit (2026-03-28 01=
:05:24 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> dt-bindings: Changes for v7.1-rc1
>=20
> This contains a few conversions to DT schema along with various
> additions and fixes to reduce the amount of validation warnings.
>=20
> Included are also a new binding for the PCIe controller found on
> Tegra264 as well as compatible strings for the Jetson AGX Thor
> Developer Kit.
>=20
> ----------------------------------------------------------------
> Sumit Gupta (1):
>       dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
>=20
> Svyatoslav Ryhel (1):
>       dt-bindings: display: tegra: Document Tegra20 HDMI port
>=20
> Thierry Reding (9):
>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>       dt-bindings: phy: tegra-xusb: Document Type C support
>       dt-bindings: clock: tegra124-dfll: Convert to json-schema
>       dt-bindings: interrupt-controller: tegra: Fix reg entries
>       dt-bindings: arm: tegra: Add missing compatible strings
>       dt-bindings: phy: tegra: Document Tegra210 USB PHY
>       dt-bindings: memory: Add Tegra210 memory controller bindings
>       dt-bindings: memory: tegra210: Mark EMC as cooling device
>       dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit
>=20
>  Documentation/devicetree/bindings/arm/tegra.yaml   |  56 +++-
>  .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
>  .../bindings/clock/nvidia,tegra124-dfll.txt        | 155 -----------
>  .../bindings/clock/nvidia,tegra124-dfll.yaml       | 290 +++++++++++++++=
++++++
>  .../display/tegra/nvidia,tegra20-hdmi.yaml         |  13 +-
>  .../interrupt-controller/nvidia,tegra20-ictlr.yaml |  23 +-
>  .../memory-controllers/nvidia,tegra210-emc.yaml    |   6 +-
>  .../memory-controllers/nvidia,tegra210-mc.yaml     |  77 ++++++
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++++
>  .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  |  39 ++-
>  .../bindings/phy/nvidia,tegra20-usb-phy.yaml       |   1 +
>  11 files changed, 649 insertions(+), 164 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra1=
24-dfll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra1=
24-dfll.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/=
nvidia,tegra210-mc.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264=
-pcie.yaml

Hi ARM SoC maintainers,

Please ignore this for now. I'm dropping my set of patches from this
because they upset the DT maintainers. I'll send another version with
only Sumit and Svyatoslav's patches.

Thierry


--73fopvxzga67awj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnOWmUACgkQ3SOs138+
s6HY9w//U1wmg6pZhB3XeSjKp1fsxhWV7HXitwfDidINbkUf6yxfXkBbk0VNz9C6
Dnp7Gzo8Z6DV5+QNN16Bo1KBZ4qzAZhC6tWWiflp3DgXOk1kGKTlKjdLRQ+EP94Z
P2vhYhySfu7JhPYmTisbUSe0cIRFTMpEm/r4acKKcBulXbwN82jNc+vfbFINMoR2
pNWIkLFKYAvE5g4PKX5SO/XDml8OfH+rMc916W+aCX7XewdVIrelrclRMomxn9J7
7J3AbuokctTHMUs2QI8j+R/2a9HY5bRuMZP2f2thsvXLc9Fb4Ew2hF505X1/Ua2/
TCrF80KB74JW9LfZKoBxbs1MNRvDWYVZbxZmAd8CulHkhkbfRVjZs8c++fzhXK+r
NtnifB7OHi+zerqpPgAQCGRze5Ju+inIwzHQBAGjP87LPN9e8PTAgrc1A8E48HBY
HkfVe6NhJxwJHKMLYW9JI9ZHKOqEjI+eALVBj5DHMM+euWGgfV3bJsAYPp/VJtuI
b9Q9N4HwLQ/RC3lEuGmBAdYYLCRkDuMeC62U4CMdVu5yIKrMeR+iln+ziMB9yv2j
15eftq4chM3B7snbM1KpYZsvoMMINlN4uASrHe7BWerXm2focWfx9Cpm++bZ5yab
W9E6cQA4sYZ28EFv/piLhxlO8P1AOH5be1lxQrjCkcILSEkBtgA=
=MTeZ
-----END PGP SIGNATURE-----

--73fopvxzga67awj4--
