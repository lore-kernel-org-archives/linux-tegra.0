Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F72FFFA3;
	Fri, 10 Oct 2025 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121165; cv=none; b=BsYtstiNHkI68fU9Sk7i3zdx2j6aWWESSCcBwlAYv7JiPN6mwmxqtlKO+2/jmQmqd8ZxkCKCwIhLnP+JpMMKaZAFTiHiJZgvL1PjN8N48oni9/Zbf9oPr+dAaXLA5ruZ5UaywWVg0+36woxBwUHhDgwepGk7f4dfLhPe/BbGX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121165; c=relaxed/simple;
	bh=LpXP+Phqn+cdhbm8Evf3IC0jNAyxZ576hkSjJWxjMQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTUOEYah648yAGwK6mLwOzi3dXdSp1LVNLRQFvoe11nBf5b3N3+4BteYrdI8uEDhoHyeTi4noytWBdcLUVGVaYBbtsllpW9wGGlawtFFGCVP9Tw+TFcBAIuG9oeMHl+QxdBxiTpBMg2oknX5OB03uUg7S2zriby6pGn9VKI8Lp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ls+4Sxfg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls+4Sxfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DE2C4CEF1;
	Fri, 10 Oct 2025 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760121165;
	bh=LpXP+Phqn+cdhbm8Evf3IC0jNAyxZ576hkSjJWxjMQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls+4Sxfg13PEDbvr5g3nMNjsm2FimxBved8f8bhplOJ+s/k6U/CKP4LJvRrsDQfm3
	 gsJrT6TWk8bT56TogVCicKSiR9Ya18/DtPpoGEjwgTIkk44e2FB+ENCw5qNNL+v9vd
	 gqAZ7YxIjs+4AoNGAFpFN9RA5l6KTQXMz3HIZJeBSp9Z0aHJ+tC9RaSp9/vebsldiu
	 XsR6AGmkFaE+gQxb6gRMdyi419y/WjVhpkWH7c/dnCxN3xnsAMxDbCmPq6tIm/THae
	 i4WggD0yUFCeqDasxKqsuHrWnP2Ss1SzR/gfKvV1kiT7ZJQCvNxI3sc0pmpfvzOf22
	 4TF/POphD2xAA==
Date: Fri, 10 Oct 2025 13:32:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sheetal <sheetal@nvidia.com>
Subject: Re: [PATCH v3] dt-bindings: power: Add power domain IDs for Tegra264
Message-ID: <176012116255.674236.9766301601538041646.robh@kernel.org>
References: <20251009161039.1766845-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009161039.1766845-1-thierry.reding@gmail.com>


On Thu, 09 Oct 2025 18:10:39 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the set of power domain IDs available on the Tegra264 SoC so that
> they can be used in device tree files.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - rename to match the nvidia,tegra264-bpmp compatible string
> 
> Changes in v2:
> - remove _MAX definition since it isn't needed
> 
>  .../dt-bindings/power/nvidia,tegra264-bpmp.h  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

