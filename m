Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A8D448D1B;
	Fri, 18 Sep 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735932; cv=none; b=hN1MOZc7UbwNZFVSBRJYGTNn+IiXYJOzl3H5W3SzQBTsuBItDL/YTBIZcrk9GstUcZ1oJfG9R6IuK585MDbbVM0frlyH3ZI6AOCuwEvlndhYo2J5vpTVj6p5vGFXBExAKsGmq4YKDAwwycZvERTLmUhQJcKbxzslyYIO7lV5bpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735932; c=relaxed/simple;
	bh=kCJR6l/sbNx2WjLu4ZwT/iT5KwvBUEtLRDSy4yGjSy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMngfc84w8Rgbr5SJ6uQUheSTBRaGcTjaw4VpYAuIhiCkCqAVRwF4tDr8YdBMrKInw9xaHEbaNaN/kuAyoJqSUgEVgFrC30HlOc4U4CFnjW23fRedCt/Sx+jgN7mFZJc+N5fkHyABBEQLTR15YpiUxHluNkvg+iJlSKeRUgrbWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dH/Sx2kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dH/Sx2kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C8A1F000FF;
	Fri, 18 Sep 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789735928;
	bh=blk1q2GPfCTIxVHkTJ0NRDYY8Gy1jFgpdBubElhEGHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dH/Sx2kfyzBCrftqMkkZn8gRJ4nzM0V+kHF42V1BsRK3M2Za/iOSts6OsbjuSGGcK
	 TvKEpC0SbbuY4nYXcWdGtLuywEsLElyQUYW2XGTn9yu7rZQzjGMQ/FPHb4WsSRu3ci
	 KL1j3X6QG2OGnsKy1C7IKb4YC/IVP6v4PGWvbTaIvJ6CicDYdqFiRuYErlHq49K6kw
	 fC5IJ51WZi70YmllP44DnsZ5+ZE2JXgD3uXs+0H11cIj7AaaCM68tQNrEO45kF6enD
	 SmFdlij59OncUJIFFC5oPHPUla6mHWtxnqmF5BbC7Ms/qcCx8ymmm05JP2bnSEjJLh
	 PecJxJ/QAm71A==
Date: Fri, 18 Sep 2026 14:52:06 +0200
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
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media
 orientation definitions
Message-ID: <aq0z7mX9D3hmsfX-@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzvwtw3fl3akyyhu"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>


--bzvwtw3fl3akyyhu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:16AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the rockchip device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> ---
> v5:
>  - Fix conflicts in rk3588-rock-5b-plus-radxa-cam4k
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

--bzvwtw3fl3akyyhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtM/YACgkQ3SOs138+
s6FTahAApCJJD8VZwlXZsthuYmsnMDU3gy+W6iHIuGHqx4nuO+B0Q/L12XsI8LNU
dcGvgin0x3NMcdpa4MnAvIjNt0q3xkeir4zlKIp1b0gs1O1ZklWbOAXWKTaC9hc5
UZmaEjFesI0gezcbogcSsmxwj+gHY7cFSI7kcuUlFguRPK3S7nKKfgdGZKBVoPo0
LBPPcWjQKh7TvsFIhz+xRft0PqHr18l//OY7tOk0vFbjEy7WmPuzyuDcwXatpbhV
WmL+5sirDq2mVBy1mG/gOVoX/q45xWONwqEUqC/M58BlP1zimXuILbHXCIYzwK3x
NccVFsp4MAhswEbaA3gKt+Vi9+Q90xN9uOapQW5W7HRISkQ4d9kwfAecwQuINd0R
YJjjkZubL8GLe8ZlGQAzA5bEK+VGADXvRxtoNim1kFRPN+c6p8jnHk2LCdKdRA+4
CmWzIxSe2nJ58bDd8UmbndptC8MVsGOOC/bT1zk8+SGCoUAN6qRwXs9hFq4bpDB4
w2O4nStGcko7rED/+Ud6FGHHrw7Lqsu0xqIVpF7lBcvA6CfD5dGdMjR1+4uf5DB9
mh3eAKL9kZ16rMwGZ9V28Jr0kvneYKZZk3rxxhcm6Ehl44FHNAynld8E/zVyz2F1
c1AShMJp8jS7FtKRtjLSPku2bRVAHGqG0vabNZUzuh7X/hCEEPk=
=AhHW
-----END PGP SIGNATURE-----

--bzvwtw3fl3akyyhu--
