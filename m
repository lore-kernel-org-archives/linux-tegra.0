Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127963DFC6A;
	Wed,  5 Aug 2026 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913701; cv=none; b=qQxrzOoUt7C3hY169Y8vxsx7WbvQ4S0bob6dRGxbhecYaSZQw2ldZPLClNWbBzrHO0csiPVUetMgEMMFO56WTtLnCBlu3WIO0MoQMe1vm/DggnlUuB2sf70g8WkjjODK9t5lqkc+r2yuHKnJogLHGh2TD7IYwCW8prOICdDJpVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913701; c=relaxed/simple;
	bh=K9GfkCTXD8XSuemBfIcnchG6lahO+230vFMxAcyEWbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqbF1N2Yfuy+S3HBaGoHiSMrPcHL3ZgPUqKhre8D0K5ABz6UNj7qmi3DAXRxJ4JlOW1hzuYbqyQPma051isExhk3gRl27tBbBMRgvr34mzcLS86Qh/IdtvClu2BLBqu8edMe1c2TNGKETURlDZNO7ZB+v9uLztfYP0bZTEX1AWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3mCOyRJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3mCOyRJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5631F000E9;
	Wed,  5 Aug 2026 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913699;
	bh=vNEcH5eiRUh8NICgduYDaOl24IADYP9UbXI26pv5SRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c3mCOyRJupjeALk951K9k9qrCVAMZ1QRwiaQgQlnLHQDEOH3pMfR5xqhYUeTrO8WV
	 /uPS14bgTrexVmJZ2lLL91OeyEwvaEHZ0tEl2a4xByGlqC+dmoiH/5JJ8orkfm0Gl8
	 puMUKpkpygQTin0GNRnBDSNKkZVAvuHMEOoUzkQvl+VISDrwmKDO7bXVI5yj7dydXT
	 YjRsEA1O/5ofG1nkNZi9s9qo4s9i53HHBTt7RrC0UY1pKMTg+t/QMxYAEgoHMyfTMJ
	 1LstaBccT9LgPW3XsWLE23Iz0e/pAvf0niG2dD3BaW2jiv7XvUzaTvhnTh8Gtz/X+h
	 2fsTYNjabDTZA==
Date: Wed, 5 Aug 2026 09:08:17 +0200
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
	Quentin Schulz <quentin.schulz@cherry.de>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 6/7] arm64: dts: rockchip: Convert to new media
 orientation definitions
Message-ID: <anLhT24qvnEA4Hts@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-6-336998dd63b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgh3aexbzhxkl2gy"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-6-336998dd63b4@ideasonboard.com>


--fgh3aexbzhxkl2gy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 6/7] arm64: dts: rockchip: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:33PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the rockchip device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3=
 ++-
>  arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3=
 ++-
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5=
 +++--
>  .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3=
 ++-
>  .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3=
 ++-
>  5 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--fgh3aexbzhxkl2gy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4WEACgkQ3SOs138+
s6FxpQ//ccqIThK+LrLFr51FSei9dZNGzceLGFOXJBDVy7F9Wor8MoXR9+T5Nicv
DFoLV/3A36SIHJDDr4kAe2A/RQxRdJ1P4XT8xX3m4rAbrKbpA7slVletVDznuOL3
NqFcdqOCuGAVzHn36GKzVG7psqDZekFMGFQZZV9ytFjeACObSYy+rnENLJT8ZFIt
1vjuc5XQhD++Z+Qt14/wt/O+nBFzw6Cwkbv09QqXraCTG9BebWWJoQPOzE9TPRnE
A2I2uHlZC0RAFY5WfYTFrsMpOvJprE5dKc64tFfwwIYOgZFRfGTT5r3FnshLdkcS
cZouRDlEqHeMOWtG57WSsl8UPvV8GzUZZoK0wGeG9WO6iWF3yECeB4y2gSdRnWFS
r7CRFXrWLCvp7CX/9VZ54ixtzttjI27BkqnbYafol41icUNqWCaHy1Ewi102tK2l
u95l9hxc9lmtvgWsvZKA5dhLpG4Cp2oH5LqNFT5CbV+bPgqHiIOMbiSxEqe00aP2
CogK/9GsG+264IfGiYc5cb6zI0C0x3POihUky1oMjRe8gDtsQ0g2L31kpPI6yg8k
uecCcyUs4KKcWR5q6ZN8UiXVf3qZ53lfQmreM7+b8Ud2/amKJvii1p8s+3q3AmSE
ZggvZyddTpgOudbYr5x0j5VAPTTaOhf/FCb7Ph8XB3cgSKdHcjE=
=q+Bc
-----END PGP SIGNATURE-----

--fgh3aexbzhxkl2gy--
