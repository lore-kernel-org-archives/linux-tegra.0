Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF533D6D5;
	Wed, 25 Mar 2026 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456650; cv=none; b=FrP+zo9btBXe7v332UiBh2Iz70YY46Z43YOe8miSPu3KxPArd8TiNv9HgprVaHfXL8YR4fVZplKI6OlxlDtJJRYTdA1nUAyUa68wvY/g+7Kqok/+FeWm2VPNTNil3lJKCzIIkV3iyWUtOz4cX6A8e4NIgOTcBa2uTRSQlBuf+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456650; c=relaxed/simple;
	bh=TIVqJ/magIqW2AriXQPAaf863ehiNZa7AA4sr9WqXxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMUgeS43co+I/5roDthOFovlAbdfhY2TqhM3XHhoyg88ZxfH7jxQLucgmLHNTIIDWYUZMpdwrzb7aNz2jRlGzpjcJnFd93VX3lfIQ/ZK61sWzaMipct9fEJV8KTymo3C/rOqVtDZiGJXG5L/EaRePX5tl2zq5svvVC825EBnxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZU/SpKE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZU/SpKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD71C4CEF7;
	Wed, 25 Mar 2026 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456650;
	bh=TIVqJ/magIqW2AriXQPAaf863ehiNZa7AA4sr9WqXxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZU/SpKEZxm1X+i7BkR/WwmF7hhzSyUNiPMQ3eXlQr4ButFfonyHAfAgwo3PcFPpI
	 gwhxo+Uh1zNUj781xinf1F3pMUpyCuW9B1LIH8sD5XCVOsvkqjUA8+sRkbVb3gAlrp
	 yAQYsQ9ZbMULVJWOCYKft6ZEF7UV0XRMA3TXXFvPdtCNV7zpwnxT57MvJak5X+qNTw
	 ilsFTmOCLMJ09O7QnsjdC807cv6lT0q3drPxavkkhTeoOMivvBnLxw9OyWhDzw1Jh8
	 LEwos9EVFYfk7DkVPVLZVZvC8iJifwXdnDyxA6K3Nu/kzuuwqfnEIRJdRLN4iTqGQx
	 fZYuZFu0MvWUg==
Date: Wed, 25 Mar 2026 11:37:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Li <Frank.Li@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make
 reset optional
Message-ID: <177445664819.3770754.8129051164742800541.robh@kernel.org>
References: <20260316171823.61800-1-akhilrajeev@nvidia.com>
 <20260316171823.61800-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316171823.61800-3-akhilrajeev@nvidia.com>


On Mon, 16 Mar 2026 22:48:16 +0530, Akhil R wrote:
> On Tegra264, GPCDMA reset control is not exposed to Linux and is handled
> by the boot firmware.
> 
> Although the reset was not exposed in Tegra234 as well, the firmware
> supported a dummy reset which just returns success on reset without doing
> an actual reset. This is also not supported in Tegra264. Therefore mark
> 'reset' and 'reset-names' properties as required only for devices prior
> to Tegra264.
> 
> This also necessitates that the Tegra264 compatible be standalone and
> cannot have the fallback compatible of Tegra186. Since there is no
> functional impact, we keep reset as required for Tegra234 to avoid
> breaking the ABI.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../bindings/dma/nvidia,tegra186-gpc-dma.yaml | 25 +++++++++++++------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

