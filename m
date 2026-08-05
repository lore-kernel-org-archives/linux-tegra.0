Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F43DFC6A;
	Wed,  5 Aug 2026 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913520; cv=none; b=CQJHacc5x1YtzljAyfTb5EaoMUfrFlQS6WgTvwVEKzMDpIZQaZgB8/9ANxiP++VHez7Or8BzUhEwfupxuY5HBVmgYT1YgV1vCcv+qPuX1TjGqgydU87Ty7rQ6rXHyU8Xw1707ZSHMhfMCqP2AdGbdpHZGb3OUs5ley5eqMjtVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913520; c=relaxed/simple;
	bh=cZHgttMNvA1y2fj2Do64U3ZVIyenYk5QNX3QVFrcNpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP4R7Hsw1CIsouYe31wZKRPY2cwXNbsb8CQLh7qVQjORIDPdgismFdYpuz8GbIrLla96Zbeh0uyo8cl1JATwIvevFJ8MxwtXmciBK32rVdvNFVLXpQNqwcDMdYvG/KxpwY3GwnltKMOhnO2W2JpgIT3kJZvwm8mceFHZRmF3kAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1eDJqeC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1eDJqeC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8A61F00A3A;
	Wed,  5 Aug 2026 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913518;
	bh=DoXf7tbT+GijFUb8lgA9KilXjWzwUEA0M4rKTFmRF+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1eDJqeCdnafzhh5h3TF31h4Kx8ZVMOH4twLNGsfIT4KTU0H135BCRSBlXs6M5XFx
	 bojlJfWNyiX6mEQsdfHshfxYVzEpOR3ULPvmyg7DbQitGTL/pcctkL2CLaSW8qTS4Y
	 oRt85JYkTLtnVxo4LUQIvXqRFnnrn/o1hSRUnf91kuPGTRqR01FfubauOhniWOXthZ
	 BYZc67/ae9as8G46mp1iy78FvQI2LbidzPAb6Mm14sD3soAp1tgXbm/GxJxzr9eofk
	 q/ZGW9ZpAqZtTCA1fX12TVkixDwST8oEXozbT1rDYlExGuU8Ye8vPV+vG2rAMx44ln
	 WbabuA10U4W5A==
Date: Wed, 5 Aug 2026 09:05:15 +0200
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
	Conor Dooley <conor.dooley@microchip.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 1/7] dt-bindings: media: Add macros for video
 interface devices
Message-ID: <anLgoTtDZQ38QzWM@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-1-336998dd63b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3q7nwjwirtsmzgs"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-1-336998dd63b4@ideasonboard.com>


--j3q7nwjwirtsmzgs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/7] dt-bindings: media: Add macros for video
 interface devices
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:28PM +0100, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
>=20
> Expand the documentation of the video-interface-devices orientation to
> reference the new header which provides human readable defines for the
> orientation enum, to help avoid hardcoding values in dts.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Michael Riesch <michael.riesch@collabora.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++=
------
>  include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++=
++
>  2 files changed, 24 insertions(+), 6 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--j3q7nwjwirtsmzgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4KsACgkQ3SOs138+
s6FSixAAvF/nuWj8x0EsLtnIBtNApx4xw1S4zIAzPiQ7t5eq2zZYJWFAcZZJPLIJ
pXoirHiAJCM3MfbvDqNag7+P3Qg31O0jWacsvMhuQCv1sJlZG8MmVbXxkma2/asj
q1k0p5ODledgKBvIabnlCbEaomZUK+umsCNxBiabNCRuRbl3/Xkpd1+VdJW3cdML
X2Zs2KoULb13xnF2LXMtH8IlUpnUpUMCPX3hX6BCJAxCTnIUq2P+rYKZAszJ7R8o
ljbgmv/2odtHZ4o9LlrLUjAZqOJWZyZC+em9aYUu2ywfOHfYcq/gGebPo5yS9f5N
gNVywyLAPqloKHrsE4qjD6fctMByN+PzuUBKJ1Wlc3dYjBp/hnWcMlqISrB4GYuc
VAeUoX1A+aYK7/MHQsNOJ2EdkP/ROQkkySOazY2rRpGqkJ/P7PSSPQ1GhchzTun8
ce2e0+HUhKpEUa1+dPE6cyaSnMlZR2DMkzT1muQAoZlXKHotNbMgUy010SzbYBzE
Ejwg3UD4KM//QVHejyFg1TKolJyqEFIcyYtizWejLN2F4uyzY1MlA9768XrzuNNG
mDM/YSoNMVBTJVeYM9js/FSqOpgxrPw0D4fd9EBbCF6qxvkEfkguNSx9iZlahGKh
Q/N8W4rn+WXb+optFaVTZxwxtSD/7rIy3Iddo4ZCFdzO5gHirdQ=
=qQ7c
-----END PGP SIGNATURE-----

--j3q7nwjwirtsmzgs--
