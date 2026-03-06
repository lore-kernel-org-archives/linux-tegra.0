Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABE12FF69;
	Fri,  6 Mar 2026 00:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755367; cv=none; b=Nd/X/C/+kR2Ntr/KajY0eblmG8grEUcfa8WspLn/PBwuGKHhC9ptgI/i1LERaU7gp1RtcdClHzPUWzdKtLwHX1stIYSTyQ2ecqLkMF1zj6EKQELtEAxxhDR5kZcQvPBYi3+HgKr4psG8YzMdfy05jLdFFP4DbyRI5TSQFQUbIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755367; c=relaxed/simple;
	bh=EhfHXHxDfxR/qaV5FxkQiDzYCsLKWMDgc1aNFHRMSiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQB+r8A1OgC7i1oaBsTwmQaeRn3LLtKfdU46AUh5c72HRLXtG6tkHqKALwA2QUuplY5dxRDDfGHEGUzfRamzMkfyTk95StMxmuEeA0pDTtE3DBuYvJsatr0kyyeNNd+2n+4iRhcPfceVr2lnJGXjlxlbNQQ8qXQ5hspMplRE3iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1/vLycs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1/vLycs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AA2C116C6;
	Fri,  6 Mar 2026 00:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772755367;
	bh=EhfHXHxDfxR/qaV5FxkQiDzYCsLKWMDgc1aNFHRMSiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1/vLycsCOTERpw3hwSwSJHPg5K21Du+QMVVwR8CL/wYCOGw2Z4oJkCfblJtqqndS
	 MBvqz8asmSO2w7MmOXn+iXcAEzj6iQ3WR1PhqB989UklWaRKrZ3e9HbFRBF2QiHPO7
	 RLhreFWAcG8o1MvICSlrgGdwiQs1/Rt+XQAWzeC9+1VIbcFrBtliejQoCxHvZeOyfZ
	 E+42VqzuKebbG8pvyLYYT+upxphw/mUEVwso5aB47GRSuLFeMSQO1Af0DrIkixBXCw
	 2bR1NrurtzcO3Ge6J4ITtzgoxlubaliHa7bdq8s1o3I/yBAZqFZYx6XXRgoi90ymUV
	 7jgrG+cgPn6fA==
Date: Thu, 5 Mar 2026 18:02:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: phy: tegra-xusb: Document Type C
 support
Message-ID: <177275536541.818159.7267619787621636242.robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-2-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-2-thierry.reding@kernel.org>


On Mon, 23 Feb 2026 15:32:56 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Each XUSB PHY can be hooked up to a Type C controller via a port
> property, so document this in the bindings accordingly.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - make one of port or connector a dependency of usb-role-switch
> 
>  .../phy/nvidia,tegra194-xusb-padctl.yaml      | 39 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

