Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F283BD240;
	Mon, 23 Mar 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282733; cv=none; b=tPWbu8pFXGP9lyNq+otAAUJ06/Xn0cybVq1uiSvcnr199j+UlXRDspiJNsVZcZQiNMmzoxPvimTta4z3J/CeirXh/XUv1a6uSUtU8P5I9lLVIghFNfzwSiWIvoeaS4pA0u66hi8Y/zhNYqTFU3XwZVvDjnrxPsnS2hF2oL9R/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282733; c=relaxed/simple;
	bh=M5QeRzIGTSi8QucDztLJjf8IAm9qudG5yPQTCbZRj9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KN0xjc6+o5JtyONfAUofo2Lq+FQZhmMa4QT+abN9Hwzc7y2CUfRFTOjv+YZCyaSiruj8gD2qY9K1B1rqqR99TEdLNOqHiBO2kuCf/U5eWO0dEpERuf6OWV1cdS5jRrK7C40lPqP9xIll/ppmR/erR5p/scMuMC7NsUiNBHYqiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=lG1FLwVs; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="lG1FLwVs"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7C8AF60020D8;
	Mon, 23 Mar 2026 16:18:47 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id prURoX9IXMB4; Mon, 23 Mar 2026 16:18:45 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 9498260020DD;
	Mon, 23 Mar 2026 16:18:44 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1774282724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+IRrMfgVF8wvDQmFhzp07fRN2j9nS+Minhbb7GzKmY=;
	b=lG1FLwVsjTa45iF93urTqx0H+U83TTdWqYjFuwBZGx/hDqem40QdLM0OUcqeDAkljpqKtE
	TQFcS6rO7Zrc61A9eR8Mh3dFLzjhVNsOtQvAEqKvXspYryjqtebQMfui5+09wKZiuEoq+d
	8DkvMV7j0o4o/OGMIJvi4Whi078Mheeen3jESZmWVjdntHg00hQXwIyp+b5aeNzcIiBA6d
	3aDljw3QcUuQerjQx+YrEawqOp/HrLanLTrGJyI588DFcp4BXncUDZF6KtIcCxyJiRg7qd
	ydsrWayGjnNvYOxZayXADrOCjd1exK3xKnpcDHH9VMURsxdkWHQZxBCSrshwbQ==
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 59D823601AC;
	Mon, 23 Mar 2026 16:18:44 +0000 (WET)
Message-ID: <3b342fb9-0d64-45fd-813f-a26913353e4f@tecnico.ulisboa.pt>
Date: Mon, 23 Mar 2026 16:18:28 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: smaug: Enable SPI-NOR flash
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260203-smaug-spi_flash-v1-1-a6d477ac7055@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20260203-smaug-spi_flash-v1-1-a6d477ac7055@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Ping on this patch.

Best regards,

Diogo

On 2/3/26 17:01, Diogo Ivo wrote:
> Add support for the SPI-NOR flash found in Pixel C devices.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index b88428aa831e..f0b8c2c80aa5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1892,6 +1892,18 @@ interrupt-controller@702f9000 {
>   		};
>   	};
>   
> +	spi@70410000 {
> +		status = "okay";
> +
> +		flash@0 {
> +			compatible = "jedec,spi-nor";
> +			reg = <0>;
> +			spi-max-frequency = <104000000>;
> +			spi-tx-bus-width = <2>;
> +			spi-rx-bus-width = <2>;
> +		};
> +	};
> +
>   	clk32k_in: clock-32k {
>   		compatible = "fixed-clock";
>   		clock-frequency = <32768>;
> 
> ---
> base-commit: 9a55406e2eb67b27eb5bb0f2d5a3afdea7d1f5df
> change-id: 20260203-smaug-spi_flash-c51faa6c1022
> 
> Best regards,
