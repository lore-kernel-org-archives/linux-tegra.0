Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE24334A5;
	Mon, 21 Sep 2026 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022024; cv=none; b=cmC9xtedv6SkaVfy8pBeDNqHZxaOT9NIuD5RS7A1d1376CAlfS2UbEITvKQU5P2zVUun4bOJlBy4MKeUX6k4CK9ruh6/YZqyvH1YEfUA0wLej8aR0I0PyjkC+Dt/Maji+uwFM/VkWyzdIkgBNEPDbcM9OEZlwuXx9nzqfs/brZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022024; c=relaxed/simple;
	bh=t56rUUwRmXd5Bwozpjc5KFkjkkSuskX8gA5Flws04pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxnxFy8H08R5hJPQ/cPrUiQLBV3zMER48tb7H3VlSFjJP66GtHAzijnqTzt+UZTBAgWaw+L1pbDHu+N/jq7KfwfnaKHjk9WpS9seQC2SBSEYn1tBe9NLfenpfCqYIewNY/AJwC0OzIi87Cfo0QlLADfF5rKvdyN9rCznxiuLwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0YgOTHuR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0YgOTHuR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=t56rUUwRmXd5Bwozpjc5KFkjkkSuskX8gA5Flws04pw=; b=0YgOTHuRfrXx1uFY1wMgE/U3e0
	+dw/SC2Xa43f3HhGb4BANiW7jobFbsqgyg+H+OHB+9velcZTPQP3OLgQRcZfL3ZuFMhwbsfoU5LpQ
	KscCXVeHleND2dk4DeIMrIyRmDqEd8x0S2W14yqzbij1R0tY0zrPzqENhXhxgQ/oBN/6abHZa0jsm
	5xtYyleOrUyi4tvI1qjEATxfxEhUWURulNBpTFmXcQNpeI6XMz77ZsMBHl59H4Fe1nSDbBEACMs0s
	R9vl+SbDHSNLxIZbf9boY17c+SpCWINR8BSudWHYfoTZz/fQGUOw/ergGpgsnhGaGG8tvgzRk6wau
	8gIKa2bg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, David Heidelberg <david@ixit.cz>
Subject:
 Re: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media orientation
 definitions
Date: Mon, 21 Sep 2026 22:19:14 +0200
Message-ID: <4535025.ejJDZkT8p0@phil>
In-Reply-To:
 <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
References:
 <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 18. September 2026, 12:44:16 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Kieran Bingham:
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Same thing Thierry said, applies for the Rockchip change, if someone
wants to apply (parts of) the series to the media tree, that is fine
with me.

Otherwise I'll just pick "mine" after the next merge-window.


Heiko


