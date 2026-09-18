Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCD25392A;
	Fri, 18 Sep 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735971; cv=none; b=CgHhVfXBTVjKN/LPPKgc6SBJQ5vTGjyP7bPIJaoO1uX9S0piqqakr2xb73uEuqG2vpwiQf6whULCA1sdzbjnEq+gWW2VtgBr806pzgBW5PWB1qHL5HX6MNnQJ/8QRlGcwO+obUPLLqL5oDuVzA9vJgfygA/oKuJfYB62jNNvFs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735971; c=relaxed/simple;
	bh=aWzv3eh+04CJKzGZDAa91b2pKE/CSgoIBPYidAhwkXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5tKZP85qo/1nEkGkjggN5XoYngLOeY2jiZ0z5aUSDPdkSw1/SCjvdGfzMXlu5fXMfW4X6/4YUSTvZYiUxeDgVD31oBhw+eOf1gsOnbgXmUP8Ho1y8xKkA/V6vWKbmCwmlS9yx0f9i6G1bR+WFSPhnh3UDCswUM9TUHKvBtbtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4YZmGGU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4YZmGGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4059B1F00898;
	Fri, 18 Sep 2026 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789735966;
	bh=eMAwhSecBguKf9zhurlsrZP8cYpXwkSpQjLdVVJV5HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q4YZmGGUKOOgjMDW4kZn/DRIguizmWMGSlikhzsVOysbSclX10LO/cqU4V7w262Wd
	 +AvCSBBE85Dp/qlZVO67f6CuqVbupJd09GON2TdcrNKgrO9G75aT2W7LXxP0BmVnJG
	 StH+A6GKuxAayksF+AKk/wa6C873VQatOnhg8Yu1PkRwfdUlJna97XsAoy8L7pjEjV
	 14AbaYc9uP/NfBvc8ShAq49F/NP+1scPBg5N591LDlunca78B83mLv6N2fPHKMqhaX
	 XONfmsNc+1DSnmkPYmx8cAcFCPX6gDLel7ZWAx9lq8L+gtbMHfbBsAnERZd5F9qE/g
	 q2a96c8TncK7g==
Date: Fri, 18 Sep 2026 14:52:43 +0200
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
Subject: Re: [PATCH v6 3/6] arm64: dts: renesas: Convert to new media
 orientation definitions
Message-ID: <aq00E7Q9Cn1STzno@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-3-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pagjwrvwvtq5khva"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-3-5e8b1f01be29@ideasonboard.com>


--pagjwrvwvtq5khva
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 3/6] arm64: dts: renesas: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:15AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the renesas device trees to use the new
> definitions.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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

--pagjwrvwvtq5khva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtNBsACgkQ3SOs138+
s6HqZBAAuYLmqszpeh7QKsoe5huf9UuCFpD60w1v/Ps2GNLGGvRvAYaPAo4GYyW+
SMADqajKXEQoVuuPbQB/9M4ZoVKcAI5sL8s88Uny2kA0lcIP2S8WgnE8IuxzXGW0
KUY9vCjd3Frq189kpzyexc+uUjeAfo4AMKdB6h3wpOUY0NSysXE4JXk/x8b5CU8i
vV68xLnE0V4ccmnsUqbvsEFyWJon4a6J0k8Ofv+jqd22pnNHhi8+9QYLCSHRj4Yp
CKk8rXvXXLijmBjYf/rvRd+vJ/OviDYjqtH2J0Plsd4XX5ZEjQZFWydFsiMh7WVN
aaLsMyOzp7wNAz8vE/YvMmAPh6KG7rgQyyviDutPi8LrQmDLnGioPX6+pa3Oi2+6
Px743Ejcp/7DZIUGujzlbvI+Lb/ZWWP9XhorqEnSJQBVkTuhasYJthnksBXcf2yF
aFBcYR8ceazaSLGuFC9aemZ3oZShRHLRswRyRS0beeRwcJk4H3m44/dXRkb9RvUX
ZVZH6kfKrn+UPLgiQ4XKhSpYlFQ1nMaaoIhQPZyC8RsFox3QnDzEif5zOPEx/4bK
fK1FTh5aFA7rj1D/5wMV7Jrybnkm2bTkbq4c6imUG76ggvph0I2ME5znDJM6T2i+
z3GFWsiRM/BXkrTQgGDv3KcCQO4cUpnwQSPri4Y5OHdC4Zt742I=
=3UN0
-----END PGP SIGNATURE-----

--pagjwrvwvtq5khva--
