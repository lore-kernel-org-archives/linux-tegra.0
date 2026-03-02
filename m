Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E99634CFD4;
	Mon,  2 Mar 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442607; cv=none; b=q6lafjltmCPsa2FN8du+d7qpvvh0pFjMLtfh/rLCqJPf2Ou622jf3+H3Ysruud0BIlamzPXEMFi3BDiw/D9N5t6u0xjAykfINeLoMRl9wVVfowAgWRpOPw88B7XZLUSlYn7VAcRdtePX3jEtslKZ25rZnJd5d3l5VrbxOTNMME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442607; c=relaxed/simple;
	bh=e2tpTFdMX/3gIuwgJ2igzz1nxPtReRSI7K4bqcD3kPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8yZuViWsGzURr9SfIIl7tmDDOkNg34dirCInaB2Vl8LoBdMyFtz7WkMUBnSw0W37TYAQHFguCUMEWw57BD9rDmKUt3ZwVODYTna7vc8W91Yc0cVWbn/9F/ABOJZ6BvkldwzF8VQ2grLZvNswIhZoa0vXfEpo2damIK/qt+HE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=G5ML0Rjp; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="G5ML0Rjp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7D7526002984;
	Mon,  2 Mar 2026 09:10:04 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id I03Mb2ac7psX; Mon,  2 Mar 2026 09:10:02 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 458D16002985;
	Mon,  2 Mar 2026 09:10:01 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1772442601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8Tz4FFQl5iQc1XWMkYIGnjVlMkJFC7GVijqzDIR/RQ=;
	b=G5ML0RjpomBDzOtL9Y7bQJQFLkgFLjejj5UGjbfvqGGgli8hzII95UwsPxZIsUDR/Owf0F
	MzTIausAYhI3ueZk7ZMaUn8/u64a/e47gMU4YrzOcc+VYWjvfWbNNHdmO9kBThvKb3vh3i
	T06GU881j+a6hrWI+HnYlKuRXnVdkehHTo5zZyeBiiO/pD/2aBHomIoqv4bOwWCmu6wYkU
	Pmy2H/cFAJvd0BozClXKsPrWTXtTuo98Wt9JbyD5zSQYpZVQSDynA9gUsu5ZyytMfB+FMY
	kISfVIrtA3NLdyDavw1NQ2+LP9lkGmgj1w7lTaFw3uP/E6uMNYYM2J90SZ/Z+Q==
Received: from [IPV6:2001:8a0:fbec:a900:2c09:2fb0:9be7:36e0] (unknown [IPv6:2001:8a0:fbec:a900:2c09:2fb0:9be7:36e0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EEC0D36013C;
	Mon,  2 Mar 2026 09:10:00 +0000 (WET)
Message-ID: <34d43310-1358-4a03-b70b-330f90956532@tecnico.ulisboa.pt>
Date: Mon, 2 Mar 2026 09:09:49 +0000
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

Gentle ping on this patch.

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
