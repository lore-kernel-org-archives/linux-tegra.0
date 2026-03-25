Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8123EBF10;
	Wed, 25 Mar 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456554; cv=none; b=uCbO67iTkzC/EU5283BNAT3qlwjFlYKnYecohe9j2gyDXGjX3RL+vNMVWzinegpaH+r/nnnLqEUo94YxlAvuGSyNtkwwn30hRXsrj/uZO/YrbSm1szIcR8Jkp8DXpMylif3Ri9GTzC06NOybP+B3pqgKknJP7LpZ5bU4uS+j7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456554; c=relaxed/simple;
	bh=LI4mvefpBAMZIzsTwcvsnXi2GtLLuZy+1O0BlNBcIec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqcI9KF1cbBDFRH92VBHUGt95qxZmKHQNmdGzpyTxftYcLjzd8nqT1H3uHiIegxcTZ021nt186GKjo2NuYlgrizFnNwB1IJU/9SppOVWzNfHu/B2Qh2zvjgd5wJRnT6qqqHYuwt6XInflKioU91AaxBSuv4huG7KAkqGnD/WYSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbK0bPQS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbK0bPQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C3BC19423;
	Wed, 25 Mar 2026 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456554;
	bh=LI4mvefpBAMZIzsTwcvsnXi2GtLLuZy+1O0BlNBcIec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbK0bPQS648nWoXO8iqU14ctH0BEet3og0P9tVx//wSK4CeDY9CXr42K+MzHbWV/G
	 x/4E5egrpg3bl/1gPZ7Vj+vxzy1f76MI5bH3wgPPnBhyl1KRwarpxuFTIeOKAKcOpk
	 lfGCpIUHzVdXSSK28XNPE7danREVQ246i4kWvoQuZZxerrLUxYEJBx9dFzgUz9ZRpp
	 K9bbZhAMPCXf1oyCqy50gMO/yvpCHdB5R7PiFBvfDu6AW5Ch7neKAver3UhDIlx6GX
	 PDkN0dyobMXfr74AYc8GGNL9fiTIVJUl81NMuQ2m1uuRp8xb4cIo23tOn7uB4heHQx
	 qYUCn2kxOCXGg==
Date: Wed, 25 Mar 2026 11:35:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>, dmaengine@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
Message-ID: <177445655239.3768983.8317731580595020400.robh@kernel.org>
References: <20260316171823.61800-1-akhilrajeev@nvidia.com>
 <20260316171823.61800-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316171823.61800-2-akhilrajeev@nvidia.com>


On Mon, 16 Mar 2026 22:48:15 +0530, Akhil R wrote:
> Add iommu-map property to specify separate stream IDs for each DMA
> channel. This enables each channel to be in its own IOMMU domain,
> keeping memory isolated from other devices sharing the same DMA
> controller.
> 
> Define the constraints such that if the channel and stream IDs are
> contiguous, a single entry can map all the channels. If the channels
> or stream IDs are non-contiguous, support multiple entries.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

