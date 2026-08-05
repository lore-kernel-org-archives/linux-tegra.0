Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD12222C5;
	Wed,  5 Aug 2026 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913623; cv=none; b=bjD5vZu/6X1RFRYlHOHXtRnlf9qVf3KI0HWk2+a7qwOv8mdNNsFRLkS5ESwCcNuiML59OWGFKjaABHoWGRWALEYSO62lpbdWdzAtiI4gOcHO6ot+Y5F+pp3/7u3AnJs2bxlGkMdbhtKZzkQH3ck4QglhYDk8B7BlsIJrY/zN6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913623; c=relaxed/simple;
	bh=llH9K3cIlJ+hYgEpwmID2PecOX0v+yC+qm52F8SXwr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfC2DkCC8u7WWh3PPyLyNQAV+wYaNeQJS6Bgz8Fn/Zcd53hOZdDaahFNNsrsWwD+rgL5l77EaTCsqHIbOzRJuQrSI0ElC3bG/ZBvKgJlX12MXVBaQ1QT0rneAl2GY02hXjXWXpbBPEXJu+F+vEuWdiouJlfUVxDjs4HUfkq0XAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tk0zMQEU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tk0zMQEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4861F000E9;
	Wed,  5 Aug 2026 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913621;
	bh=tS6NjXEVKtxBst96HqE4fntx+yWFySZYd3aiI8XBsL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tk0zMQEUFu1Xz7OZbp5Zx6JwVdRLaBUl6JrEM/vYFoKF04vuLWjv++PlaXP6ZAVN0
	 UNGJ5luFojZ15VReaOL8Xy/tp93BU3P+jo7cTgv1Oa95AiQfuPbUGxKdzdB+HPkrq9
	 syP1jvv2ZeKp1zfvrHABJVRkEZHDexvW18fZAP7MYxFNOSMy42u+z/84GNEI8KIQKZ
	 Y8/DSnFd2uW9FIxxb0jI+P5C+2lN7+vzrJ98MZtsPaU/QPNTUVYmG/kBYVDzphNcrE
	 0PuHTwfQRNU0kuk7mbmmlms/mRkl3hYkHoAQyYELHfPiyjwk//WM7eue91OGfPIPCj
	 DQfC9dyG9Kiag==
Date: Wed, 5 Aug 2026 09:06:58 +0200
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
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 4/7] arm64: dts: qcom: Convert to new media
 orientation definitions
Message-ID: <anLhCwq6Ld66ALju@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-4-336998dd63b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wwdigum7ze7yrqxg"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-4-336998dd63b4@ideasonboard.com>


--wwdigum7ze7yrqxg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/7] arm64: dts: qcom: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:31PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the qualcomm device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--wwdigum7ze7yrqxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4RIACgkQ3SOs138+
s6FQxw//UIxNO6FsXtg0iI8D8zLnXImlpyEkm/YyWvM9jztxEst67VCywfpqhUcj
3oK1hbnEKbKs/18ROJct6QzRne4ME866W9kneJ1caPFzWrcSjKtgjn9Rrp3D6azZ
Wxo0l704aLxTEL8LZk3pMBmihQ9Y4msFCGu/8lqkqnzuK4eIrqsQQ2etP8nNsQhw
Bb6JmEWG6VxVOb58p0T2ue2Lf+pUyZHMVXQURC0065LMQadPL/Qnhl9TkIVr1lax
RyGVw/MZLbwAiUFc076ftZZbiX0+tybne2Qz7BYhaZKWYWh6bLmlu0PgcXV3/8P4
zlG75hH+5/f1Htl6+rkUekhjxchpGAG4eeiBzx1kDRJX9tmktN0/+7gcjK5Db28Y
SIK/DnSG87aJWUvVRRrGza5LW8TgJYK90uGEd5ig22HYiYVIpAFLjpKD0z+4r1o6
WB9pE2AHwl5IhBX2qIGc8ijSZhuGtod96WcAbI4tdjERkTQQK2zBYpjTf1dV4Ysd
0va/XRPSyOMp9zt8XDXkkKQFO0NnN6NbXI5byUCNEgewVssfdarTru5jYOJyKefh
MKheuXcclE3OZUKHz5wouBOLRj/6SDhR/byELoCrt3wCKURKcNsOJRbGhT3nkU+S
wH4Z9tCE9hmeztksxR8lWRTsgYqGnpuTTyqaLfcOs2OdcImbn9c=
=nnEL
-----END PGP SIGNATURE-----

--wwdigum7ze7yrqxg--
