Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AF1EEA5D;
	Thu,  6 Nov 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440230; cv=none; b=gjLTa3jrdlDEnWuYpYf4/m3sEDRp5QAn6zUY/kzL4UHR18H6u89tkHtScZhIxwUv4aZrFdnBw1+e1Lg1ZJ4YkXqPteIhgLqV/R1WaOTHfCvew1auynTMzXkKNnfhORRT/w8W2MchPRrgV2428/MZgghjcrD0G8AkMx57xcZmqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440230; c=relaxed/simple;
	bh=WOGz5zHsl9XCqC1tDXHOQNBKUlu5HckNP7FXGTFgO2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2w353h5ftjIttuIJ6esdKUtm3JW+rQ+tLGVKNLfN6J9eVx12U6nxAU4yt1HJ7Gg2puVnpoLXa+0jXVc9DON5G+pDbJwfiqpJjsmsppdhhT2tvp3Lp+3a9fFf474Xc+No+mZCfbOs0LMsVHdMD6ymyYyIIfG5JUhNjvd1cifoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EERpNU/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EERpNU/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF622C4CEFB;
	Thu,  6 Nov 2025 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762440230;
	bh=WOGz5zHsl9XCqC1tDXHOQNBKUlu5HckNP7FXGTFgO2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EERpNU/8B4+Y73DK4pQ+WLZj2KIkXd7YCnZ07fHPRcdupfLQ8YCm2rnjO0M87PM/F
	 knx8P8+xzNCU2jXPzfToclJUiiaTpAGvT/zj15y4ikGT0B+y1OtGFs5ctRVjA7MLvp
	 5d2+bXg8AQphEQImtOL2fjqcKkrQI8YCOJ1nj8HtncfSMoo206fyuKODSmjzSSx+lI
	 kQPcvmCTlgZkIrFIgmnEsyTO4X1duGfLJ0rHmXtbyMTSdLBadYqgjLVOO/dRG+P8uv
	 2D9VuhKAhpczGeXnFh80u2ZnkadCsRAojlo8bA8gyq7BcZ6Ca1MjrOTgSFblSHPatU
	 l+/Wxd/0ZoOHQ==
Message-ID: <86d203a7-af58-4777-ada5-0dda28186d7f@kernel.org>
Date: Thu, 6 Nov 2025 15:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] memory: tegra186-emc: Simplify and handle
 deferred probe with dev_err_probe()
To: Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
 <20250911-memory-tegra-cleanup-v2-8-d08022ff2f85@linaro.org>
 <4ba8a1ec-fa17-4564-a174-0b8e8eada061@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4ba8a1ec-fa17-4564-a174-0b8e8eada061@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2025 13:04, Jon Hunter wrote:
> 
> On 11/09/2025 10:43, Krzysztof Kozlowski wrote:
>> Certain calls, like clk_get, can cause probe deferral and driver should
>> handle it.  Use dev_err_probe() to fix that and also change other
>> non-deferred errors cases to make the code simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   drivers/memory/tegra/tegra186-emc.c | 14 ++++++--------
>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
>> index 00baa7ab89214b1a151ab0c0a9ab76f90f922478..a0de80afe3e90531fcfb29d20773aed0d04478c5 100644
>> --- a/drivers/memory/tegra/tegra186-emc.c
>> +++ b/drivers/memory/tegra/tegra186-emc.c
>> @@ -302,9 +302,8 @@ static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
>>   
>>   remove_nodes:
>>   	icc_nodes_remove(&emc->provider);
>> -	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
>>   
>> -	return err;
>> +	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
>>   }
>>   
>>   static int tegra186_emc_probe(struct platform_device *pdev)
>> @@ -319,14 +318,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>   
>>   	emc->bpmp = tegra_bpmp_get(&pdev->dev);
>>   	if (IS_ERR(emc->bpmp))
>> -		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp), "failed to get BPMP\n");
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp),
>> +				     "failed to get BPMP\n");
>>   
>>   	emc->clk = devm_clk_get(&pdev->dev, "emc");
>> -	if (IS_ERR(emc->clk)) {
>> -		err = PTR_ERR(emc->clk);
>> -		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
>> -		goto put_bpmp;
>> -	}
>> +	if (IS_ERR(emc->clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
>> +				     "failed to get EMC clock\n");
> 
> I see now that we dropped a 'put_bpmp' here and we should not have. I 
> see this is in -next, do you want fix up or I can send a patch?

Great thanks!

Best regards,
Krzysztof
