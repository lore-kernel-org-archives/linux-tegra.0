Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA071E1DF0;
	Mon, 12 Jan 2026 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225910; cv=none; b=SUmCS71wOiVzsdXocCilA8biOBXFmAH+fZcipvdzL6fQhLc9FnlRvjga5oVFKHZGtle4O0dZ1gOfYAWsuJf+qrO9Oa0qOq6OtyzrEdkBSxnVwOYFueV2Snk/CEuCvTYLf+2rnEeZ2f2mGiDYfZVV8seLeomuOP32yCgIqCXYpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225910; c=relaxed/simple;
	bh=5vRv/pZsfNb7lRuCrIFMf+OcHs4aWH+H1NEGFhzZhtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxmWBPHyMbzUJHxdhdkwBFw2xAIt4X7b9CirTG6zuIiUo+yNY99p0wnDdPrABtguq6jWV9WHzwumln0hdhAlgahdf7DZbsf0CwQ2fIb8mKmXuVQTQigEH53Q4s2s74+uEqhTb7N1X6cJZ8ORB+jrOvHwHn2ZD9AI6xhYQSZQ9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=bZnFjsaK; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="bZnFjsaK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E262B600025A;
	Mon, 12 Jan 2026 13:45:40 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id T_Lsx4VB-hy2; Mon, 12 Jan 2026 13:45:38 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 86E536000256;
	Mon, 12 Jan 2026 13:45:37 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768225537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4mQuv4mU/Y/i+cCr+u9L7cjmQiPuxL604c9Tea/Ng4=;
	b=bZnFjsaKx+kykBB7D5DFKZ6u726gLCXEeqVigQ8sT0jNAEdBAe4bII2FrXxXdxod2SYFsL
	mw2YEwjBdJyoKl5nQ8QETnjhbiUgZldmjsRoqXfuFtUfMcRTkhb3zcgC1dla4ckKHjJ3wD
	+2+X91U07EdIlRzKF+wdWGFrOtuzzb0f21rwo1lmah8kyf5nLvWU+SeVPSJpwPdPl6XJnY
	666UtsxPmgs31pIFOhOVtAUUofQFgViL9RibK0XzEenXFBmTlcWwqrzS46Tu3r0W4sCD8x
	SK5D03dNCYLcQa/O8bJu+30Qhy9e81XM0sRpKO8JCYuBD1iQzyB1AC2i7LLoXA==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 2936D36008B;
	Mon, 12 Jan 2026 13:45:37 +0000 (WET)
Message-ID: <7a723cf9-700f-460e-a4a9-3d0e1e81ef07@tecnico.ulisboa.pt>
Date: Mon, 12 Jan 2026 13:45:33 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: smaug: Enable DisplayPort via USB-C port
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251226-smaug-typec_dp-v1-1-7eabcd59da4c@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20251226-smaug-typec_dp-v1-1-7eabcd59da4c@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 12/26/25 12:17, Diogo Ivo wrote:
> Enable both SOR and DPAUX modules allowing the USB-C port to transmit
> video in DP altmode. Tested on several monitors with USB-C to HDMI
> adapter.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 49bf23d6f593..b88428aa831e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -31,6 +31,11 @@ memory@80000000 {
>   	};
>   
>   	host1x@50000000 {
> +		dpaux1: dpaux@54040000 {
> +			vdd-supply = <&pp3300>;
> +			status = "okay";
> +		};
> +
>   		dsia: dsi@54300000 {
>   			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
>   			status = "okay";
> @@ -58,6 +63,13 @@ link1: panel@0 {
>   			};
>   		};
>   
> +		sor1: sor@54580000 {
> +			avdd-io-hdmi-dp-supply = <&pp1800>;
> +			vdd-hdmi-dp-pll-supply = <&avddio_1v05>;
> +			nvidia,dpaux = <&dpaux1>;
> +			status = "okay";
> +		};
> +
>   		dpaux: dpaux@545c0000 {
>   			status = "okay";
>   		};
> 
> ---
> base-commit: c100317dc8c40c71bfb572353d87ca1735d39fd5
> change-id: 20251226-smaug-typec_dp-197201aaadae

Gentle ping on this patch.

Thank you,
Diogo
