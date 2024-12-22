Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9FA846F
	for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2024 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734862011; cv=none; b=cwvW9pf4OzJ813WNSCSDbpLjw2bX09FfSilSuxgnDKhUWE86LNwgzgcVr3WZIhVRBPN0kShenz0OoSuoD2eJhusAl4xdvRH4Bu8+ES9cjnqA0+S6TIVvjaXYdYy1FJAbAv86VnW/3G0/xB8X3Dqwaz28ztcPR1BF6RxHpYsnqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734862011; c=relaxed/simple;
	bh=T8m8Y2H6kLPBc6oDNyrlw+liihofez91a2A3wdJUlOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVOIRXNEWAIDwIoS1PiwwKpvb8puF5Flfbe1zQ0ULX99JZD7pwSmjNYLQp8ABVzj9wkupOcnOymeULCgMVl8Utw99hJBcXEMgaj3rjGpAc6xCq81N77cA7VfoltVPgSiDeaTHKMBT73YDojhn3/ZAYYDHMTQjBVzVVZeeIFKLpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxtAHkKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxtAHkKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAA1C4CED4;
	Sun, 22 Dec 2024 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734862011;
	bh=T8m8Y2H6kLPBc6oDNyrlw+liihofez91a2A3wdJUlOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GxtAHkKnntf+h9Ff8qXp50E2202i6oxmyRvcdUxfGGsR7K6kH/h2hEwEIW7iByi91
	 MJnW2QpAs1AVlwLVwetpcwjW2eaS+43ZSQOID4/aEGbl0if2YB+4HdTrR+F72M5llt
	 NEh2EBB1qxNxnYhrR9xwx8f1EWezCylMnZcml6E5WW58juSqNSM4nFSqJOR3zCNq9j
	 dBoZLw3YQTrjv+Q03TL/obt0C+2L3/UWKeTUCuf4qXww+m7X2vyHzHUq/188dPLdv/
	 5+giqBDDlXtSl2Ld7e9qR2aFjFMXhhifwgH+DFsboTT//dlnayY5153iThmLxq/yrC
	 WKRYtcKZHNyhA==
Message-ID: <a56fce70-6bc0-4f8b-b066-41732673c2a2@kernel.org>
Date: Sun, 22 Dec 2024 11:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] memory: tegra20-emc: fix an OF node reference bug
 in tegra_emc_find_node_by_ram_code()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, dan.carpenter@linaro.org
References: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
 <20241218024415.2494267-2-joe@pf.is.s.u-tokyo.ac.jp>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241218024415.2494267-2-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2024 03:44, Joe Hattori wrote:
> As of_find_node_by_name() release the reference of the argument OF node,
> tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
> use, resulting in possible UAFs. Avoid calling of_node_put() at the end

Why avoiding? Avoiding is optional, aren't you fixing some bug?

> of the loop, and call of_node_get() before some calls of
> of_find_node_by_name().
> 
> This bug was found by an experimental verification tool that I am
> developing.
> 
> Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 7193f848d17e..fef54179ddee 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -474,6 +474,7 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>  
>  	ram_code = tegra_read_ram_code();
>  
> +	of_node_get(dev->of_node);
>  	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
>  	     np = of_find_node_by_name(np, "emc-tables")) {
>  		err = of_property_read_u32(np, "nvidia,ram-code", &value);
> @@ -481,6 +482,7 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>  			struct device_node *lpddr2_np;
>  			bool cfg_mismatches = false;
>  
> +			of_node_get(np);
>  			lpddr2_np = of_find_node_by_name(np, "lpddr2");
>  			if (lpddr2_np) {
>  				const struct lpddr2_info *info;
> @@ -518,7 +520,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>  			}
>  
>  			if (cfg_mismatches) {
> -				of_node_put(np);

Anyway these two patches show that my previous advice was wrong. You add
code which you immediately remove. I took v1 with tweaked commit msg.

>  				continue;
>  			}
>  		}


Best regards,
Krzysztof
