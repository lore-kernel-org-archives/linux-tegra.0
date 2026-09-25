Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F84A2A46;
	Fri, 25 Sep 2026 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343073; cv=none; b=EtRuXmaitVC+eiJBuVzNszRuHxI60P9WY3tMCM23mE633ls+HmVobJQMgd5Jh+pnfYLD+UDGbr2jKXhmk/kkvvD34cMeYA2OmTaMmWQl4GmZe5ZbKDFUV6yznnVEbSf9dkywKDTx0lrzX6I4M/1sPQdfKAWPD6E8IQoDzCyqHSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343073; c=relaxed/simple;
	bh=H24PrnjCeVpTI9NBLJCidy7NUXecZInfYG2E5uHVJ0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdRBfP3rx+WFanxqp39z0/nWiWYGHdm8a9ajy4B7I+/0oToyMz9Y03TSekj1UmX4AbRea6XJw1mQjJDE1Ou8raT/y47a27SFe+29f/IdAt3mkYZnKm0360oa4F4tlRSjnJ+yxnQqKjV7/U2WBjiwMGO5sBQt4awoNIqv6EvUeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btZN1r5W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btZN1r5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2A21F00893;
	Fri, 25 Sep 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343071;
	bh=/BWoJjOrHMAdBeXgBB8M/kgJ5cTz5y5hKqJZbYXGsGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=btZN1r5WoiqMAlMgzyXg4HEJ3VOeY8Uk1UVfp8e7cjwcPzUE9b6MyMdbQ4RtP/UJW
	 X+rjjFCog0/USMjb1VRmYBNTRETy/Yy7k+2o5xedWFP3u3SIlZtfew9olb9qFQNWl4
	 dyMKfni48Zstr54gpzmaVzdd/OgAGods9ZBJWHu7oEQyZ1RKANM0388msUVw8Rf+TV
	 o8eppLOaL3x9JYEsH8fX9JiuWeS9HX0EPrmvDi3wA5CwBYHld3g+wiwk07zPNBeYc2
	 CkLujpayJPSTvPWhfmOPLFUXSNFdJOp4xPQ8w8QHWOH5SALGOlwEryt6gTCqfFAHp5
	 0Px5S+VyLgrmA==
Date: Fri, 25 Sep 2026 15:31:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: tegra194: Add compatible for
 Tegra238
Message-ID: <20260925-new-academic-lyrebird-ce1a52@quoll>
References: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
 <20260921-tegra-phy-v1-1-83466bf9a7cd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-tegra-phy-v1-1-83466bf9a7cd@nvidia.com>

On Mon, Sep 21, 2026 at 01:14:45PM +0100, Jon Hunter wrote:
> The Tegra238 XUSB pad controller is similar to that found on the
> Tegra194 and Tegra234, but only has three USB2 ports and three USB3
> ports.
> 
> Add the Tegra238 compatible string for the XUSB pad controller and
> constrain the binding so that a Tegra238 device tree can only have three
> USB2 and three USB3 ports.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

