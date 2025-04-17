Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879BF1DC184;
	Thu, 17 Apr 2025 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867532; cv=none; b=D83IJ+2tGneoCBYcCWsqgzm1r25d/mRyYRuFr0g6pNaeAxTWrcump28dKqGWifOmPwtCh3uZuDu9TabKKeBUy8hA4m5u0rExjZaPp+ztcAhEiNJRHwItP8l1uMgj+FKHjY7XrYSWoxHEs3DU7hXLr6dWXM49rGWjIFtp+0v4JtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867532; c=relaxed/simple;
	bh=JPdhn7AtEcTtMM1v4/SejvrTSWV3dDDCPqq8C0psiXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hA4TleiFkwvcUJut6iUhQUSGJZ9vcdKIT+ZlT/JZVXz7CSqIjuULZtOz9PpWYrOkL9peEA54/YDGMt8l+JBTzTZCh4W5SLOxppfyqQ9doJugYa60AtvdsQHMfA0r2RkACT9a4Llr5U4T++4QKphqMurtsy7CcX8j5ojPPvpKLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfrvLCKA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfrvLCKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B53C4CEE4;
	Thu, 17 Apr 2025 05:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744867531;
	bh=JPdhn7AtEcTtMM1v4/SejvrTSWV3dDDCPqq8C0psiXU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RfrvLCKAHn/v4/wtpqynKsNHFX81aauWIUgwhSnrFbcTeFBVrSwuJ0iFHlUyWo++i
	 dQx5ZWzAbrWnYVQcX8fubCDeoj7FEyhm+KptDNblWmDCcKxk8ue8pQ1sdU3QOiUUnO
	 G88HSSOTCcqwRKHA7KYOhtr+My1fyv3wWGgiIaid85wt/+QKCRGor3AzUYk5shPpl9
	 U3pSM2t+N3gMHF1pDrZa3wZlndEAwuQaT7JcUXRod1TgCTfcYInkYh81Vo0qSETSN4
	 feuSqtIi0AZe2/icbjP5Va9A01t43HgP1lulxeyUU1PEG4gBNargVLhfUs9wxPCBE7
	 xxFKX/GUUdX0w==
Message-ID: <cd1c064d-dfee-426d-969d-9755a028e225@kernel.org>
Date: Thu, 17 Apr 2025 07:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: tegra: Add device-tree node for NVVRS PSEQ
To: Shubhi Garg <shgarg@nvidia.com>, lee@kernel.org,
 alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250416120619.483793-1-shgarg@nvidia.com>
 <20250416120619.483793-3-shgarg@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250416120619.483793-3-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2025 14:06, Shubhi Garg wrote:
> Add NVIDIA VRS Power Sequencer device tree node for Tegra234 P3701 and
> P3767 platforms.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 17 +++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
> index 9086a0d010e5..d3c1f13b2b99 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
> @@ -170,6 +170,17 @@ bpmp {
>  		i2c {
>  			status = "okay";
>  
> +			vrs@3c {
> +				compatible = "nvidia,vrs-pseq";
> +				reg = <0x3c>;
> +				interrupt-parent = <&pmc>;
> +				/* VRS Wake ID is 24 */
> +				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				status = "okay";

Where was it disabled?



Best regards,
Krzysztof
