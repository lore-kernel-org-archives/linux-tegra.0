Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E5233954;
	Tue, 30 Jun 2026 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813746; cv=none; b=jzM/YWto+Vr4N1iLlyTji1mDBozSALqe6kYqM5r/mIG0s40zQUAHd++RHjE2IQnpTcvJbLimxorSmFyZWdvSqaCiIDgg6GsP5o9PCJRUE4X1KH9aygx8tDu31rk6wXCdGW+Pu0Y4PnQ70ZiIITjks+aQ7Dyy5oImKrZi5ccmgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813746; c=relaxed/simple;
	bh=FcILYO7YeymQ40JFBqeJx2qm0QoGV9USV6tfMNlw74c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HByYseQiJlpMj5Wehy41ScvhUzS2hz/fJDgQdVQrILSYVDOPOf6ANIJHouqWRbQC0B6OKbNCIkGuP3mDL6FBgMoJFzurR2b/Qi+Ga76pN/AaWlcy/RhYsN/EiQq2W31zXYM1taAcKZAv17ZXmWjt4kSgAvenoIP1RBa3S20EBH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdaamA2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdaamA2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4941F000E9;
	Tue, 30 Jun 2026 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782813745;
	bh=IirM4wI5XZENDNWsaZo6Yx58U08mja1Z/9oBrnnn/qg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cdaamA2gaY2OZMBOQfuymv11CI14X6/xqzHoPfLgWPAkBFdDuSOsMBiMhiq/b9ZcN
	 vkrD8MO1+HUnrW6F025Ys+AALphVA39Fp3jBdelH4/7BB15VeIBPNY61upEa0RGXfj
	 Ox0HK0RDb/osRHCK8/3N+/d5Cemaf/8oGxGBtUt1xoPKMmYVBlL6IUfv+6umplgfMh
	 luKNwaGGn9MM3d6B5A8di9qMH5mdD+3NEMmp+m92mb09Yi9aVb3hISF+XCqwYK3Ruc
	 JhjoUy5+EGM0cAg2/dV2Z/SrjzhWR+9J7fKikBs+N4G+XewMwKLZhJtVR74Soflmac
	 2H8M2DIhlCf2g==
Message-ID: <d7bc7c0a-9f36-4440-b6d0-2e23667659c4@kernel.org>
Date: Tue, 30 Jun 2026 12:02:18 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
To: Jiqi Li <lijq9@lenovo.com>, linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mperttunen@nvidia.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, mpearson-lenovo@squebb.ca
References: <20260630091743.657388-1-lijq9@lenovo.com>
 <20260630091743.657388-3-lijq9@lenovo.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260630091743.657388-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 11:17, Jiqi Li wrote:
> Add initial device tree support for the Lenovo ThinkEdge SE70, an
> industrial edge gateway based on the NVIDIA Jetson Xavier NX module
> (P3668-0001) with a custom carrier board.
> 
> This initial submission includes:
> - 40-pin expansion header pinmux configuration
> - External Micro SD card slot with dedicated 3.3V regulator
> - I2C bus for 40-pin header
> 
> Static verification passed: dt_binding_check and dtbs compilation
> complete without errors.
> 
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>
> ---
> Changes in v2:
> - Remove unused input-related headers from baseboard DTSI
> ---
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  ...ra194-lenovo-thinkedge-se70-baseboard.dtsi | 103 ++++++++++++++++++
>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts |  14 +++
>  3 files changed, 118 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70-baseboard.dtsi

What is the "baseboard"? You do not have compatible for SoM, so se70
feels like final baseboard. Also commit msg says that se70 is the final
carrier board, so a DTSI for non-existing hardware feels confusing.

...

> +};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> index 000000000000..a8de685f05ef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "tegra194-p3668-0001.dtsi"
> +#include "tegra194-lenovo-thinkedge-se70-baseboard.dtsi"
> +
> +/ {
> +	model = "Lenovo ThinkEdge SE70";
> +	compatible = "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nvidia,tegra194";
> +
> +	chosen {
> +		bootargs = "console=ttyTCU0,115200";


Why do you need bootargs? stdout property does not work?

Best regards,
Krzysztof
