Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3356D32039E;
	Fri, 29 Aug 2025 17:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490074; cv=none; b=pK8d3hhN2oOzbAox/SpR0398stCgPLDX6eeFgCEJfCblFTOmuUgGFpW3oexoOocL/nMHEYEHEUXTWVnt+2dY8MYFcERqJp7ttl0cVjtJhXEXIEcAIMCR5Vq3+vdCzfa2mXzhkhG6owCBAkH6xz7CM3bLFs7GjB+JHzvvbiTjca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490074; c=relaxed/simple;
	bh=6AMtLeSzxZjLb9taqmNr9VlQdnGb/3gKOTYQN+BTxC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOLe+ioBTKa5liseFwxEX+fi5PXbrvVpwDBCQZ39Ln77AjE9V7GujP1Vm8/CUITkyrnRe5b0Jl4fJGEL9fKV+GCRNyHDouXzmAo2aal18R3L6yzchv4ECGsp+OmY1+eiLnIF+VBBC55M8zWupsipp/cJJrDKRW0Kt1+7+82jz9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj8/F44e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj8/F44e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76920C4CEF0;
	Fri, 29 Aug 2025 17:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756490073;
	bh=6AMtLeSzxZjLb9taqmNr9VlQdnGb/3gKOTYQN+BTxC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fj8/F44ePwOiEpzX7wGdjY+fbZOuwlTOudyHkofUMW0EPLkZJUKsZ+fz0I2K+Ueoq
	 qevMt+rnf4GBgiv3Nsy+TuP3MYurq8OlHFkqgKbfy0SVC2CLCyvt2y+G46SI7ldys4
	 ldc8QLTdNkKjSP2KtA9gS5M5CI2zeC8j3ZF2iDS+uEZZSP/HCqdTXP8UaPLYRZvVqL
	 5bQbkzgw/pWnrsOSG9CiWwI+ks3kvjFDClOkp3JZw5cGJMSXHme9TlqL6ME0OBmFO0
	 H7UlK5eDdNVl9VtuAtr8LKY+hOFnWboWBH8oK8Cj3SnThk0Rn4doYIuzXZiu0RdxAB
	 Vb3tgTwuCynIg==
Date: Fri, 29 Aug 2025 12:54:32 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: power: Add power domain IDs for Tegra264
Message-ID: <20250829175432.GA1070947-robh@kernel.org>
References: <20250828112924.3773782-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828112924.3773782-1-thierry.reding@gmail.com>

On Thu, Aug 28, 2025 at 01:29:24PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the set of power domain IDs available on the Tegra264 SoC so that
> they can be used in device tree files.

What binding is this part of? 'git grep nvidia,tegra264-powergate' gives 
nothing.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - remove _MAX definition since it isn't needed
> 
>  .../power/nvidia,tegra264-powergate.h         | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/power/nvidia,tegra264-powergate.h
> 
> diff --git a/include/dt-bindings/power/nvidia,tegra264-powergate.h b/include/dt-bindings/power/nvidia,tegra264-powergate.h
> new file mode 100644
> index 000000000000..1e2acd50c099
> --- /dev/null
> +++ b/include/dt-bindings/power/nvidia,tegra264-powergate.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)  */
> +/* Copyright (c) 2022-2024, NVIDIA CORPORATION.  All rights reserved. */
> +
> +#ifndef DT_BINDINGS_POWER_NVIDIA_TEGRA264_H
> +#define DT_BINDINGS_POWER_NVIDIA_TEGRA264_H
> +
> +#define TEGRA264_POWER_DOMAIN_DISP	1
> +#define TEGRA264_POWER_DOMAIN_AUD	2
> +/* reserved 3:9 */
> +#define TEGRA264_POWER_DOMAIN_XUSB_SS	10
> +#define TEGRA264_POWER_DOMAIN_XUSB_DEV	11
> +#define TEGRA264_POWER_DOMAIN_XUSB_HOST	12
> +#define TEGRA264_POWER_DOMAIN_MGBE0	13
> +#define TEGRA264_POWER_DOMAIN_MGBE1	14
> +#define TEGRA264_POWER_DOMAIN_MGBE2	15
> +#define TEGRA264_POWER_DOMAIN_MGBE3	16
> +#define TEGRA264_POWER_DOMAIN_VI	17
> +#define TEGRA264_POWER_DOMAIN_VIC	18
> +#define TEGRA264_POWER_DOMAIN_ISP0	19
> +#define TEGRA264_POWER_DOMAIN_ISP1	20
> +#define TEGRA264_POWER_DOMAIN_PVA0	21
> +#define TEGRA264_POWER_DOMAIN_GPU	22
> +
> +#endif /* DT_BINDINGS_POWER_NVIDIA_TEGRA264_H */
> -- 
> 2.50.0
> 
