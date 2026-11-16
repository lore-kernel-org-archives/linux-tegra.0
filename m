Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.136.128.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823578;
	b=eVDyIXJc/mnAHJchV5PJKZtCJrJuMSEcnsAb+/EhTlOQYaYBEimrBCT8f+IXHCYb4z+5
	 DA+MniSo9dQYBTLkJUivs+6uNtJnyX42G7NCHmbRQW/RF9h/Gq3+/pwaBjsgm9bt4M2Zf
	 GnlTZQ2oL5Rv9vF053Yu7j9UnXr33sCh3QQ3DZUutSCKehTPFEYl+OW1kiZlIMo3eJEv+
	 Fj1uKapeOWwSRps48a3xhTzWY2Y/zigywZJug/dVf7kmg+z3TgxlDlclRbFb38Rs9DfM3
	 Lj8BOm6G41cTOE6UbuP60/wqur5gtuzJfSf5xHt2zj8w6YdPI59Xe9okCyl5oey8tZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823578;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NV+XnX4mNyEXtqkj/wzdDhLoatsGfYR/NfVvipmDQUs=;
	b=yrDIRh3rQ7qkTOjHbAFJNOEqJs1MHwkGhoyHOcCquvuKRAgmuj8HiTAQw7O7YPkAKOvL
	 OseFDoWKiB65vaPI06dC7ZG5zaORwc2pC/FkZjwaNiBPltgULsnTzUDAPuecNX33VT27X
	 DS7jDaDDSh2pxnt2p962kkC6B0lNfsLTUOu8ALthL52Ju+nM+klHdbnJbQyGseVI+9uFB
	 +Vss9ffNbaDoHptyefibxGotGEWkTV92xZgqOkzII2JjfDq5zv9KfQq/nH1ICKuKdmIAL
	 gmkkMC7/cZULpg26ngEzu+z/foMm6e3uA4rU6kyLysWohoG4rU2+xeCSLuRw6yry8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tecnico.ulisboa.pt;
	spf=pass smtp.mailfrom=tecnico.ulisboa.pt;
	dkim=pass header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.a=rsa-sha256 header.s=mail2 header.b=hObBXvIZ;
	arc=none smtp.remote-ip=193.136.128.21
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD0606A31C;
	Mon, 16 Nov 2026 10:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.a=rsa-sha256 header.s=mail2 header.b=hObBXvIZ
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A9777600540A;
	Mon, 16 Nov 2026 10:06:08 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id JCu_BqulwoY9; Mon, 16 Nov 2026 10:06:06 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 986E26005401;
	Mon, 16 Nov 2026 10:06:06 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1794823566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NV+XnX4mNyEXtqkj/wzdDhLoatsGfYR/NfVvipmDQUs=;
	b=hObBXvIZKHAMBXcs6Xu+aCov7PSLO7RRtoscJWKcQLkyH8BeAQcuDJqWuDE+WtdjA0J8Oa
	4AXAmV4MpAFRDsXLrnM+ynqk3FNKDE6sSu/rDRvzAn8TPkQyEp9QHakLEG3UW61z0ij2pd
	eEgMkXdN6EIeymEY3vr17T/tjLfay95vz84tN63GgCpaq1wXvhaFPoeHXD5+qCSYvgjWRg
	/ijDQIs//T/s81IB76m1ogSQH4/KNCZDNxGoc+s6WWFlVuyPYgcJtr4IhbhccTw1oKhqiY
	rEHnbNEy2ledZLfiPaUXhMO8E0M4nTMR6nLTm/HTaHsQTitpP2Svl92qiBukpw==
Received: from [IPV6:2001:8a0:67d4:4500:6e34:588e:1ff0:6387] (unknown [IPv6:2001:8a0:67d4:4500:6e34:588e:1ff0:6387])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 04A8D360171;
	Mon, 16 Nov 2026 10:06:06 +0000 (WET)
Message-ID: <96cbf2eb-1647-4d06-a744-2543b8172365@tecnico.ulisboa.pt>
Date: Mon, 16 Nov 2026 10:06:03 +0000
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: tegra: smaug: Add rt5677 mclk1 input
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Animesh Agarwal <animeshagarwal28@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Oder Chiou <oder_chiou@realtek.com>,
 Ben Zhang <benzh@chromium.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260923-rt5677-mclk-v2-0-6ca31e8f68a4@tecnico.ulisboa.pt>
 <20260923-rt5677-mclk-v2-2-6ca31e8f68a4@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20260923-rt5677-mclk-v2-2-6ca31e8f68a4@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 9/23/26 17:45, Diogo Ivo wrote:
> The codec's MCLK1 input is driven by the first audio clock output of
> the PMC. Describe it in the codec's node.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index e0fde65a552b..ae8ce941f20d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1754,6 +1754,8 @@ audio-codec@2d {
>   			realtek,reset-gpio = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_LOW>;
>   			gpio-controller;
>   			#gpio-cells = <2>;
> +			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +			clock-names = "mclk1";
>   			status = "okay";
>   		};
>   
> 

Gentle ping on this patch.

Thanks,
Diogo
