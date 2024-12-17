Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093071EF0B7
	for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436658; cv=none; b=afHe+cHkDBL4KAC+XjEA9qBQGsCdkAgjUGPrQNw3tE+DOpr1NssP5w7FJd6lTPIM4adTWr0/9EfRGlmq9bBQpeL8182tLb6wzOkMrp90s6t2tV8dnNtug5ELDfyLQjHbky+QDZeGTT4sT5VN16VJ1iAzwJOhwu15H3hZFNJU2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436658; c=relaxed/simple;
	bh=SeqqEUMx/eygPcpetPpRQMX3qH9YJMIRJTzxGYW78Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaXc+jYoU08sgloU8VmOsuy5f7Y1m7Td2k78Apz2G4pIIuhfBrgIIhGJ3JgLG81bkvv12iqTpQ5jqc2T5q5dnAS7eIJwmEFLWKhiT0GMloRDMg6RCl86skpE8BqPCaOPsH0GZKYWqkM7s9ej55Upa+euSjYqsxiwtcVtXcxWpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaBVs/zr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaBVs/zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A0EC4CED3;
	Tue, 17 Dec 2024 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734436657;
	bh=SeqqEUMx/eygPcpetPpRQMX3qH9YJMIRJTzxGYW78Y8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jaBVs/zrs5SA7avMi3h5BPTRf4Qcg/Y3ccUT0nbojcqOuYMwMicIKG22yVYhKFqEa
	 GhbBS1NLDg0ESqzUuZWDrkRyYHiW/6wpG5Iv4hpjQUhpFNN8DcGzGz068h5ai8LAY7
	 YkGR58pkxKgDI6MYTvoRl2omcPQacKGfA/aS/UulZQByXb2nFAfHyhNOI2FjX6dM5O
	 djqO9x0D8dcRit8vEUxOVjVptzDU4F3XRZ2Xr6I0OIF0O6ZsaHqCjxzPAjt85akafq
	 EtR+jfW4SLG4Mq+94iJdcGjPHgwsWFd1YFGoWY96PHKiS1IxLE+uh5l9LXwVgwOzcW
	 gr/82x8rz54Ng==
Message-ID: <c79f0cec-a2b4-4b73-9ee6-f432d4529df1@kernel.org>
Date: Tue, 17 Dec 2024 12:57:33 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra20-emc: fix an OF node reference bug in
 tegra_emc_find_node_by_ram_code()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
 <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>
 <fc0b53bf-029d-4505-a50b-8108b0788eca@stanley.mountain>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <fc0b53bf-029d-4505-a50b-8108b0788eca@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 12:49, Dan Carpenter wrote:
> On Tue, Dec 17, 2024 at 10:31:23AM +0100, Krzysztof Kozlowski wrote:
>> On 17/12/2024 10:14, Joe Hattori wrote:
>>> As of_find_node_by_name() release the reference of the given OF node,
>>
>> No, it does not.
>>
> 
> Yeah, it does.

Yeah, I focused on returned 'np', but it is about input argument.

> 
> drivers/of/base.c
>    927  /**
>    928   * of_find_node_by_name - Find a node by its "name" property
>    929   * @from:       The node to start searching from or NULL; the node
>    930   *              you pass will not be searched, only the next one
>    931   *              will. Typically, you pass what the previous call
>    932   *              returned. of_node_put() will be called on @from.
>                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    933   * @name:       The name string to match against
>    934   *
>    935   * Return: A node pointer with refcount incremented, use
>    936   * of_node_put() on it when done.
>    937   */
>    938  struct device_node *of_find_node_by_name(struct device_node *from,
>    939          const char *name)
>    940  {
>    941          struct device_node *np;
>    942          unsigned long flags;
>    943  
>    944          raw_spin_lock_irqsave(&devtree_lock, flags);
>    945          for_each_of_allnodes_from(from, np)
>    946                  if (of_node_name_eq(np, name) && of_node_get(np))
>    947                          break;
>    948          of_node_put(from);
>                             ^^^^^
> 
>    949          raw_spin_unlock_irqrestore(&devtree_lock, flags);
>    950          return np;
>    951  }
> 
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
>>>  drivers/memory/tegra/tegra20-emc.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>>> index 7193f848d17e..9b7d30a21a5b 100644
>>> --- a/drivers/memory/tegra/tegra20-emc.c
>>> +++ b/drivers/memory/tegra/tegra20-emc.c
>>> @@ -474,14 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>  
>>>  	ram_code = tegra_read_ram_code();
>>>  
>>> -	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This original code is wrong.
> 
>>> -	     np = of_find_node_by_name(np, "emc-tables")) {
>>> +	for_each_child_of_node(dev->of_node, np) {
>>
>> I don't understand how this change is related to described problem.
>>
>>> +		if (!of_node_name_eq(np, "emc-tables"))
>>> +			continue;
>>>  		err = of_property_read_u32(np, "nvidia,ram-code", &value);
>>>  		if (err || value != ram_code) {
>>>  			struct device_node *lpddr2_np;
>>>  			bool cfg_mismatches = false;
>>>  
>>> -			lpddr2_np = of_find_node_by_name(np, "lpddr2");
>>> +			lpddr2_np = of_get_child_by_name(np, "lpddr2");
>>
>> Why?
> 
> This drops the reference on "np"
> 
>>
>>>  			if (lpddr2_np) {
>>>  				const struct lpddr2_info *info;
>>>  
>>> @@ -518,7 +519,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>  			}
>>>  
>>>  			if (cfg_mismatches) {
>>> -				of_node_put(np);
>>
>> If of_find_node_by_name() drops reference, why this was needed?
> 
> The continue statement also drops the reference.  So this code as an
> accidental of_node_put(dev->of_node) and two accidental extra calls to
> of_node_put(np).

True, I just thought we talk here about looping and there are actually
more issues in the code.

> 
> I can't say if the fix is correct, but the bug is real.

Probably this can be nicely split into two patches. One handling too
many puts within the loop, without breaking it (so the in-loop
of_find_node_by_name() and unnecessary of_node_put()). Second of using
of_find_node_by_name() in the loop itself, leading to drop of device
of_node reference.

Assuming of course that all the switch to parsing children is correct.

Best regards,
Krzysztof
