Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED0BA4A;
	Thu,  4 Sep 2025 21:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757022550; cv=none; b=plkj1VTARpBbN1d4nXVXCCqaZB6ZwyMuZ5jJQP0R6Q0Qhae803op1cWWgynaszntBj3TAJHabZuA0QMMOB5rpa4T3EAelYiB86+xU6Ef07XGU5M8ryfoLOv+bT+44LY16FEcCmkafYVnRNlGiXKD/i/G8i01Wovo/ruQIVAi+I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757022550; c=relaxed/simple;
	bh=TMssmfr6Ux793m0iP09iig4VNiue9TXEr6uOT9wRYhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF3Sh2Iefy6pg/cV29qctxbH4BJyaR6tBGB0Wep1Wm/vOk/DwK9eVzzU7SakPKkKL4qFweydGYms+R1fMr23D1IwGjI+3HWGOjd9TaUAZAFqqd66dVFRKPOn+w1iz2a1Gis0nlEw09BTK1AI/ROVOvNGqJJb1G5jap2fWMAApK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRz18qze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRz18qze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2941C4CEF0;
	Thu,  4 Sep 2025 21:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757022550;
	bh=TMssmfr6Ux793m0iP09iig4VNiue9TXEr6uOT9wRYhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRz18qzeLCcAzy4y8bhCvYXUvjJcV7sRjsZXK+MxYDMucIr1ggqDgC85YWNAemAWc
	 rx5aIlmDWeB759ZUHkcYPTg+vfq7ZcQmG7toKdl0qWjgN3c+SpwEttVX7i13x0UMBY
	 lge1x451WwrZgHE/3V6kbw3D0er6au0pfSYeM7CuCeh2hnG0paZg7c+HLAhKyNs6WE
	 yUP42sNN4uyXVM1MOuTkosbdI2R+irloN/wbrQoQjSWpIYeE3+96eqvo625lztVLMV
	 rAQWGjAKmm/XBCoqUSjIev582Me209rBfKN/QpfYXHO4EUC3wCFSgwBqJDr6RUHcWq
	 8MONyy47FZRbw==
Date: Thu, 4 Sep 2025 16:49:09 -0500
From: Rob Herring <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joseph Lo <josephl@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: tegra124-dfll: Add property
 to limit frequency
Message-ID: <20250904214909.GA69864-robh@kernel.org>
References: <20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com>
 <20250903-tegra210-speedo-v2-1-89e6f86b8942@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-tegra210-speedo-v2-1-89e6f86b8942@gmail.com>

On Wed, Sep 03, 2025 at 02:30:16PM -0500, Aaron Kling wrote:
> The dfll driver generates opp tables based on internal CVB tables
> instead of using dt opp tables. Some devices such as the Jetson Nano
> require limiting the max frequency even further than the corresponding
> CVB table allows in order to maintain thermal limits.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> index f7d347385b5775ddd702ecbb9821acfc9d4b9ff2..8a049b684f962f2b06209a47866711b92c15c085 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> @@ -70,6 +70,9 @@ Required properties for PWM mode:
>    - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
>    - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
>  
> +Optional properties for limiting frequency:
> +- nvidia,dfll-max-freq: Maximum scaling frequency in hertz.

Use standard unit suffix: nvidia,dfll-max-hz

> +
>  Example for I2C:
>  
>  clock@70110000 {
> 
> -- 
> 2.50.1
> 
