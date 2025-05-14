Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07481624DD;
	Wed, 14 May 2025 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747251131; cv=none; b=sVDTPPO8poehXuSeEHFu5OE70M7RUhDteo8wU/XknGNE9G+0nBRkEG0tiqXUnqKuBbQ++79V5pdIZBSCBLdbYa39Pp5G0jhlb6NOjFTIHq4coriOQaVEExMoiDRk6OR5AIKEnKaJgEldIPchSoxRfEVvqLQc51K4Lqs0grkTq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747251131; c=relaxed/simple;
	bh=XQmm91tOOOb6ELaFi19N2c7s4ctZ5809sg6+f0gqEzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU4a83VI+vnzduynuKGQylHmJccJv0bMqxIgyjkb0bja60zrW3L0ya7u7v9LSyYmvKx2sdNo7EPY5EF6JnsHinHpP65oxvBv1qp5q8MNNoiJlOwxaS3noVVnsV4Qe6CVhwGk1tm1hk0ZhENIW8RJ2+GEmudVwIuXSzbIJ76uSwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O22C4Xml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O22C4Xml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B462C4CEE3;
	Wed, 14 May 2025 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251131;
	bh=XQmm91tOOOb6ELaFi19N2c7s4ctZ5809sg6+f0gqEzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O22C4XmllEaIIwaJhatMl3lpHJ+8YEq1ZOgLY3zlXyjDhQqMc5TiQdrekB2LLtMCP
	 L0RSqrtcucZ4m2epJLnLgbUyO1M7v9fPruRCQUH1ux4DetAXN3RqH4GfST5BWVgLCy
	 cF/s1vfeC7a97UF7cAPdeazKgAx1R8IxDnGElxyOJ7LNjgZKQLIeI2AYYZ4zvuXw7z
	 kFiL/cyo8ub9oxXfd1Pf4WdxbjGoI5uuXl9ie7ydrTiPyW4FByscVsHDlUwlu4OE3V
	 ngDtNPGA367g8U4ZSTfYKpr8T0igWxt6CQD75LhwCYJ9IKkUreSm9JkhfbpV3sKPVM
	 NvDX+luGFHS+Q==
Date: Wed, 14 May 2025 14:32:09 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: dma: Add Tegra264 compatible string
Message-ID: <20250514193209.GA2869871-robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507143802.1230919-2-thierry.reding@gmail.com>

On Wed, May 07, 2025 at 04:37:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the compatible string used for the GPCDMA controller on
> Tegra264.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
