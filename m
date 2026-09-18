Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE03E5EC6;
	Fri, 18 Sep 2026 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758428; cv=none; b=Ug/9IuXH/FX51alNPayn3vBrgk4d07pldMV9PejXV0/icIv/1ToKcCaWfcqKaeTp+v90l2ihLQceMyvQn/bGIk2XMLOIj/35srNLz1v2a0zv8cnz/YvXqmnirtzP+YlSLJess1glg42rAX3mTXj4qlprAlizD82FGGES7ZyqJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758428; c=relaxed/simple;
	bh=nmBrAk2np5GoI3sJtrEpyM1co07LQXkjXcmn1QcUvFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQl4wOCBbUYur8Gk7g1QcDNER1w9vmzjRcKPb+Z07EkmnMdgzi1oOb7wYScazouxlNJ6vFlyKeijgpCiKzqRJlP1XQTSKL5p3O8R8oCcm/6e6KhfOiVBDJXH5LUVdrq2tWPusVauhEdvXBPT/MPoMxFqLRC/OQwoTsnlF2HR8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODTBatoE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODTBatoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878EE1F000FF;
	Fri, 18 Sep 2026 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758419;
	bh=uFZ900qTgVxFOe9pUi4nHRz0fpi8qpGS361sszzh/Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ODTBatoEZrOELXFOqOTuo0sTeBau8flMjrJ86Id/zuOkmF9KFQJ/mBvYH9NxkD0FR
	 JT2Slc9GMTtX6Pt1bjAJK9ATSpyQ3/7sCm91e03zt6UyVIMA8QXZc9e+xSWW4WqyLM
	 rR2usTFFpzSebVWQyVqRBaYFmfx1p0BHq6ID9K0aU03TbV03pRFwjKv2eDX1sVpSaZ
	 zZjYz69uELlrlbjNctKbzxCBICsMAr+thFPlGqByc89GFyjWNOW8ucf7xwnytcg8pt
	 j3k+y1aEUXQ5/m9mnvMKnuwdYCwb6KB2Qknr6TmXZdsNlF0RVwwwJEENSE13FVIW5w
	 qbmc7lvEfwKvg==
Date: Fri, 18 Sep 2026 14:06:57 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, mfd@lists.linux.dev,
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 3/4] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Message-ID: <20260918190657.GB1426069-robh@kernel.org>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-3-f12cfdfb446c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-ti-tps6586x-v2-3-f12cfdfb446c@gmail.com>

On Wed, Sep 16, 2026 at 06:41:28PM +0530, Bhargav Joshi wrote:
> Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
> Tegra-specific regulator coupling properties. Update their dt bindings
> to reference the shared nvidia,tegra-regulators-coupling.yaml schema.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
>  .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
>  Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
>  3 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
