Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808793E022D;
	Wed,  5 Aug 2026 07:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913652; cv=none; b=agNtk68bS7jtfG/gIoEOv3JERi9fPLR37dtkuH3BDToD+c7bb/iusDi5cPQ1OsV/CZYk42BlOOUkfN4uw8euKYJ6P26/MGbBXmdbGru0hf4R1xpBn24PlcgMblt/BZRmYMnJiPHfqcXxQf7lrmztxXRwXWh6J1Fuxvz65vj89+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913652; c=relaxed/simple;
	bh=+MJ5CpFv/kSDUpT6EgBwGjvKk80wTl32XrDkTFWEKgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLOEDsGjdsrnwjewHjM/eNOXXSL7PTEFR/BKkW+Yvm68hRM/pp1AlYxkan+uQpiK4Wz8uTJX75926q8G/akt+aNB2K7rF48TxAuAHI2xPfmZEREY1Y2VEx3aAVRIDeKUi/B7tJhsFH7noG6dyILBfOLVb5LwhrAchIkszXbCKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJpri3Yv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJpri3Yv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5956A1F000E9;
	Wed,  5 Aug 2026 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913651;
	bh=AQEkViaXZ5mc5evBn4xlg8YvCL2TGNW/en7op+TyPKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJpri3Yv0Tub5OsZjVMbhAeZE70pBERd/6OnSVOU3A9/Dn1G02+hPZ4gKNYTwHjxF
	 KHOhUmig9WOW+i/ulrb0MC+IFVINef1XXIsw95ns1lUtoS8a0qJaHzNYBx2aBaUlAn
	 1MUK3Xgc4xS6F6AAH7Uagsi3UA9oWTRTl+aTOszZ5Wjjo2PH5lUQVsCaaZU4CqAJJg
	 ae0H0d4OHkfQdBHg5wBKZ/1egy8MIV5RrTVQnz8unOtjxBH3PnEp4kyEg5nY5ngGpS
	 4GvleGQin+Jzd2joagN7iYv0rwA4+moV0fv2f7jL5sbAd47l4qkrk8/D9XpKPj25b0
	 39lXQx0BkuQDg==
Date: Wed, 5 Aug 2026 09:07:28 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 5/7] arm64: dts: renesas: Convert to new media
 orientation definitions
Message-ID: <anLhGvz915Ayvock@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-5-336998dd63b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7of5i7fzz2typs4"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-5-336998dd63b4@ideasonboard.com>


--h7of5i7fzz2typs4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/7] arm64: dts: renesas: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:32PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the renesas device trees to use the new
> definitions.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso |=
 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso |=
 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso |=
 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso |=
 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--h7of5i7fzz2typs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4TAACgkQ3SOs138+
s6GkrQ/+OhXaBICC+jLHWm91RNRD7nv9heOLFa+oTyhT+Mmvay9ZZew8cPyd1zz5
Pu+CwXhsIFQkImIrE5nlaQffppt/QpiglzsKTn3mGmrI4L1u2iWQPkEKMfAaXmOW
mQ2x2j7YRvHC1gWxKnjairIkEic+BkPzjH1rYNLmZmIVc19X6a1YKNStjFvThPXe
kOSPt9/mH3MB49k7EN6VTSMf3qCC0M1L9bVl3YabpOHENFKR3Tz2/Zx8wy2HmiFz
H1P5bE8r7zLvM290iCWbDg4w36262BDPRRsceZ7ULs84+C+diCOwlt2c3jWdROHT
YZLx4c0nHORztHaTDFxBz0bzfIzSZJ2AIH28V9bBB4CK+ghwW5TZmXk+9dEyeWhS
ZaUNwX7CFI2qDfSy9DTtGL87hIh7wvgfIO/qHrusuK2YPmN3EE4LoE+BxjqMn3IG
8ugbhVpsnZDg/7oC5Xk5XW0I3rJ0x4XVMHvZ5ybbRWUSaO2M8twQrSw1xkDVPCJA
x5REkBa+YvSYWpDB0K4WN+yWw+xAwdY9y9ORDmePqceXyIITEIGgvGhziKKO4b8Z
nOit024Ueo62Ntdn15DVNctLCNIt3TKWdPGcuvMXRUlET+DIiyrItDbqe+uks1Q3
PrOqa+YAOkoHrJ/r9G+CSY+W9WwCTBI9WzU2ELs4hEQwukU0mcs=
=sJ5K
-----END PGP SIGNATURE-----

--h7of5i7fzz2typs4--
