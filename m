Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E52192F4;
	Sun, 18 Jan 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768760023; cv=none; b=h2cD3kiVhkwAsSa7Xh0v1Dyf60K9X+fIr3aiNaLKBIAKRNb+Lv7mSGBqcHQUD/PQO5Qgjjya9HeYvXCHGdLRr7LoP4bGZ3ohD2yB6EB7CYIkxU73Me1r8gmfpE9lQWceVEHJXchvhKYEMrLcbzMhIIdyQCePZRIdg5g7Qsh84xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768760023; c=relaxed/simple;
	bh=SRj8VTyNCJuXfdO4PLxPdiGX0WqsJya+URI9tLlcQTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDUkv7zh16Dp1lc6Sr3r9RkfWZmsUVrFX0wWYV9lPQ8rndcyLcpIBYZRY9J88ySu+jN+IMTJVeMPIGn1xQ3DBj7PTUTYTL0jh9Ku6sh0CvoolGPf3XesjA1xzb45ZOHqEngk43+EYfWrI3sfO7j/c8vou+gxLk+DKMdeJadngOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPYeJ5hM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPYeJ5hM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865A3C116D0;
	Sun, 18 Jan 2026 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768760022;
	bh=SRj8VTyNCJuXfdO4PLxPdiGX0WqsJya+URI9tLlcQTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPYeJ5hMrQtzxAN3mO76UfN8ud0++kZ6LhS85zQUmishQfTL2Ny272Jl98jPXFjCf
	 tt4XTo29ihyRxklF8Ej4wCDfdBO4OIy/PjOnwAmqfT8HnYwGtwIdM8GGLNHuXFMD3S
	 A0qy50IVDCBnlMPocKA+6jt9MGB5H0xVtxl5TXt9T7a5ft4MF5gfhT4fySN+aiElJN
	 md3TqKTdnVL/Dhw/vfWGbNMg85ql+j90YcOy3W5DIFF8pyVLzOlds45xjqYtxbbuNv
	 jCe0uCELODhNVdLzoLXWvWbfsS+yt6aZ3UpNp95dq+Gu6iOSKvLqH5cZhhqbR+jLAs
	 ByPp51hmRrHxg==
Message-ID: <ac198371-fd2c-4f55-8fc2-2f3e18a88ccb@kernel.org>
Date: Sun, 18 Jan 2026 19:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: tegra: Add support for DBB clock on Tegra264
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260116123732.140813-1-thierry.reding@gmail.com>
 <7510a358-608a-475f-9f71-50fa72a72d27@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <7510a358-608a-475f-9f71-50fa72a72d27@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2026 14:15, Jon Hunter wrote:
> 
> On 16/01/2026 12:37, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The DBB clock is needed by many IP blocks in order to access system
>> memory via the data backbone. The memory controller and external memory
>> controllers are the central place where these accesses are managed, so
>> make sure that the clock can be controlled from the corresponding
>> driver.
>>
>> Note that not all drivers fully register bandwidth requests, and hence
>> the EMC driver doesn't have enough information to know when it's safe to
>> switch the clock off, so for now it will be kept on permanently.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Changes in v2:
>> - convert to dev_err_probe() (Krzysztof)
>>
>>   drivers/memory/tegra/tegra186-emc.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
>> index dfddceecdd1a..03ebab6fbe68 100644
>> --- a/drivers/memory/tegra/tegra186-emc.c
>> +++ b/drivers/memory/tegra/tegra186-emc.c
>> @@ -22,6 +22,7 @@ struct tegra186_emc {
>>   	struct tegra_bpmp *bpmp;
>>   	struct device *dev;
>>   	struct clk *clk;
>> +	struct clk *clk_dbb;
>>   
>>   	struct tegra186_emc_dvfs *dvfs;
>>   	unsigned int num_dvfs;
>> @@ -328,6 +329,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>   		goto put_bpmp;
>>   	}
>>   
>> +	emc->clk_dbb = devm_clk_get_optional_enabled(&pdev->dev, "dbb");


This looks like new clock and I don't see it in the bindings. Are you
sure this is not an undocumented ABI? In case this was asked last time,
commit msg or changelog should briefly mention it, to avoid exactly that
question.

Best regards,
Krzysztof
