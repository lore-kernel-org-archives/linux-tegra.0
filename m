Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363991E3DF7
	for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435769; cv=none; b=poQGJdv+LScb2G4xHAJttWjQ9pP3K0PXCSzeNy3KZziryAub/1jbtgEEUynd/mG7VRo5pXEYkE58IxMPJU5t5E18zK3pvt9D5EVYOUOEUjMjltjyUkkRClR22Uq8B4rQi0XsBtOuOakcb76moSAVOIWOP6lJcg93QE8Kx4Uez00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435769; c=relaxed/simple;
	bh=MUE7u9DBjXlKgzQucisF2XuBaVVftZfOahNhSetNR+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENO235Ek9bOUqcqDPAvRaeFV+VbE3A1qeSBK5GpLaWm9ZSB7L/gu8prLDgYynlLk9H+o31ZtNol9g4qsjFcBWFL1dq4LSVO/V2ZV47Bt7Ne/qOOY8qGPM8qO6sGa7nBadIxKn9pZtO3g9zC9Cv8Bg7foMMB6yVODfD3PttS+OdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGZaYXCH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGZaYXCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7D9C4CED3;
	Tue, 17 Dec 2024 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734435768;
	bh=MUE7u9DBjXlKgzQucisF2XuBaVVftZfOahNhSetNR+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LGZaYXCHn4YBuc4GeRm+NLzdw8cMMJ5R0njTiJHiYFWNDWwjdETMhKvRdfKAMuuwn
	 Bq/BUSv6GLlD9ycjL6cN2i66WFsAMnhtK7Th/7zaSNpz/lKmkb5QDpu8arQ8DbmNc3
	 uvPc++Rf8qQ1RuIp+tokqa5tmUh3YSKag/jTw9uJyJNUFcPrUcSuwliTI5q+3CUOWt
	 j4WEg5WHsDOk7sIeuULlKF+Nn8rfM3IK1QVYTaSc6B5R7vvTGkEQOU/HP/bl1mRLFX
	 nbSaOwhH1qT+OUUBbAxw4mzOcFpanQgcfinYQZBIIgEwc6kFu1GbxDcLz/AmFbd1Xm
	 smCwwOUugNzXw==
Message-ID: <1d5fa252-c43a-42de-8794-fecfaf90b71a@kernel.org>
Date: Tue, 17 Dec 2024 12:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra20-emc: fix an OF node reference bug in
 tegra_emc_find_node_by_ram_code()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org
References: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
 <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>
 <ef7dc4de-fc61-4bc2-a7c7-6b24adb9229b@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ef7dc4de-fc61-4bc2-a7c7-6b24adb9229b@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 12:07, Joe Hattori wrote:
> 
> 
> On 12/17/24 18:31, Krzysztof Kozlowski wrote:
>> On 17/12/2024 10:14, Joe Hattori wrote:
>>> As of_find_node_by_name() release the reference of the given OF node,
>>
>> No, it does not.
> 
> I see in the document of the of_find_node_by_name() says that it calls 
> of_node_put(), or am I looking at the wrong code?

Hm, that's true that reference is put, but on the input node, not
returned one. I don't get to which node you are referring here thus
which node has double release or use-after-release.

Maybe it is all about incorrect dropping of this device's device node,
which should never happen in driver's probe path?


> /**
>   * of_find_node_by_name - Find a node by its "name" property
>   * @from:	The node to start searching from or NULL; the node
>   *		you pass will not be searched, only the next one
>   *		will. Typically, you pass what the previous call
>   *		returned. of_node_put() will be called on @from.
>   * @name:	The name string to match against
>   *
>   * Return: A node pointer with refcount incremented, use
>   * of_node_put() on it when done.
>   */
> 
> 
>>
>>> tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
>>> use, resulting in possible UAFs. Given the DT structure, utilize the
>>> for_each_child_of_node macro and of_get_child_by_name() to avoid the bug.
>>>
>>> This bug was found by an experimental verification tool that I am
>>> developing.
>>>
>>> Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
>>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>>> ---
>>>   drivers/memory/tegra/tegra20-emc.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>>> index 7193f848d17e..9b7d30a21a5b 100644
>>> --- a/drivers/memory/tegra/tegra20-emc.c
>>> +++ b/drivers/memory/tegra/tegra20-emc.c
>>> @@ -474,14 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>   
>>>   	ram_code = tegra_read_ram_code();
>>>   
>>> -	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
>>> -	     np = of_find_node_by_name(np, "emc-tables")) {
>>> +	for_each_child_of_node(dev->of_node, np) {
>>
>> I don't understand how this change is related to described problem.
> 
> As per the document, of_find_node_by_name() calls of_node_put(np), and 

In the first call no, it will of_node_put(from), not 'np'.
'from' != 'np'.


> the current code is calling of_node_put() before continuing the loop, so 
> the np can be released twice.

By the second release, you mean in the "if (cfg_mismatches)" path?
Otherwise there is no second release in the for loop.

> 
>>
>>> +		if (!of_node_name_eq(np, "emc-tables"))
>>> +			continue;
>>>   		err = of_property_read_u32(np, "nvidia,ram-code", &value);
>>>   		if (err || value != ram_code) {
>>>   			struct device_node *lpddr2_np;
>>>   			bool cfg_mismatches = false;
>>>   
>>> -			lpddr2_np = of_find_node_by_name(np, "lpddr2");
>>> +			lpddr2_np = of_get_child_by_name(np, "lpddr2");
>>
>> Why?
> 
> Given the Devicetree structure, I understand that calling 
> of_get_child_by_name() suffices here, which also does not release the 
> reference of np.

So you assume these have to be children. Is it tested with bindings?
With actual device?

> 
>>
>>>   			if (lpddr2_np) {
>>>   				const struct lpddr2_info *info;
>>>   
>>> @@ -518,7 +519,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>   			}
>>>   
>>>   			if (cfg_mismatches) {
>>> -				of_node_put(np);
>>
>> If of_find_node_by_name() drops reference, why this was needed >
>>>   				continue;
>>


Best regards,
Krzysztof
