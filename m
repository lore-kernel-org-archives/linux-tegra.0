Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2537B3EEAD2;
	Fri, 18 Sep 2026 19:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758588; cv=none; b=PxYIeUtQEfrbSbb15uylx0FDxhD+m2Vr8qdhsVhmQIFF84KRDnciQS+yiIPql2jZ2zUD2T5U8oFbzTgg1BomswOoLpO/R5U53ZaT+xWC895JIGIpgBV1OWL20cdNs1HP5nO+Pq46lFkkcy5spF3yk7t6TwYFOqOdpbqCRN0W6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758588; c=relaxed/simple;
	bh=JeWw4ljWH6RYMRbF1Cwhvb8RQP01ze/vWkoN7/R5uHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djlTuZacPRjNpKuU6usgvegFlzJ1ln1XBXeEtOm1BRxM9dbZnH9A65WaZ1o5HEwcoDvm9Eo1mTfYwEUwPaz8LEWBRGEknOc23XX1yfztq9BwkDOo8MyUZOuS0fXUhdmnsQPILlS8lFhJturDghqAEUcpXQmd2/KpFa9ec7m3LdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ych81UVS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ych81UVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3371F000FF;
	Fri, 18 Sep 2026 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758576;
	bh=6+b3vy/zVDJuPQul7HVU+SkEXIlPQl6HcBnbqlQGAlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ych81UVScQe1j+47qrtvRnRz2YOGdDsqmn8FiOhKtJFS61yzwEj6N170Pu02ORAZm
	 pBW4S7fIribGtdXPzqPazCI34j+xPGmR+vGdX5+RmTWmY2WNQwo8FqmB8j+MOMWgV9
	 cl9ISdo8cOspVJ2EgJgwR4ba9Fc24ucMSmv116pire8sapCdz02s/tHw2fDfbS9E0G
	 yYFF0PAKSkN0vic6dY2pE+eGrsxVqOHwcS+Xfzk1a8vU4eQrKjXBt+Xfc2GydiL3xL
	 z0K3AB/PUfNcgHBOacWG/MSvP6K+Rs7BRjG9nzC/g/lnw9tru/494iazRBVvl7VUh3
	 xTjb9EL2L6hPg==
Date: Fri, 18 Sep 2026 14:09:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <treding@nvidia.com>, mfd@lists.linux.dev,
	goledhruva@gmail.com, m-chawdhry@ti.com, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Laxman Dewangan <ldewangan@nvidia.com>, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	linux-tegra@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Message-ID: <178975857424.1447860.2533900267657270977.robh@kernel.org>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>


On Wed, 16 Sep 2026 18:41:26 +0530, Bhargav Joshi wrote:
> Device tree validation throws warnings for the TPS65911 PMIC on Tegra
> boards because wakeup-source and GPIO hog nodes are not documented in
> the schema, even though the hardware supports them.
> 
> Add wakeup-source property and allow child nodes that match the "-hog"
> pattern.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

