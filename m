Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E952E13CFB6
	for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433659; cv=none; b=L4Xu2bFDioCamLqju8TneFndSL5xZavbUPsvHh3NhShgLH3+x0qgbm8DAz5iv5N3ncDLQakmMW8AKLVKiy1B4lYPnacHFXGguySCrndaw0GH4zfM3sf+sDq2NSVavjm9zBdlP0fWcA3XQsMUn+3+0UdTsLcJqHbxhuc6gQgDCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433659; c=relaxed/simple;
	bh=vfNVmxhndlH7GQQa+Y9ZSSOGcULsDsb/OM7klDeC5+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqWzY0X9+9UX/ufGvOD4wYIR7Agp3y72wflAG6vgC4khvZ2ki+z/VXXn5YURZaO/qT3yQ5wCRv+Om7bOzCtLHXrAaLv0w/14lDl1VYFdoCISuBnhz7OtPjPTWAtn6dzGp0zeTkPex8UATR0xhpqBErBTQm2Ul8DULJsk8uUzINU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=jWMFbba2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="jWMFbba2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21636268e43so62456295ad.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 03:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734433656; x=1735038456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwzoZPi8EGWSmvxbzv9VS0/haBoVMROVd5LaZIn0acQ=;
        b=jWMFbba2Gqv8mpZzQjkQzhLmuckxAn4nN/JmhiNwsIfTnL7GnkljHz95Nve3gC3OQw
         hZUKV23whZQf0T7VaaaIhi/mJ0cU7Txyny1eOUsShHRwE2MgbD3TlZiNG+RpPnT52SWc
         txzQRff6JYavDT2UOJp0pQXNMoSiPcvCvkf2ioJbk4Kxo6jk9hXcEbT4xDY/8Jh0m74A
         Yg//AoFA1iU/L8lDC82TQOI212vLOzOfBe5fkVJ9U7oLDwADZHEquccq5qiSZXsCW2+f
         z7Plv2h2RRmy0Sn6bM4/YS82qXBDT3yGmSIAaddFh6BSncUzOsuZD/7sbs8HFixe+jpN
         QTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433656; x=1735038456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwzoZPi8EGWSmvxbzv9VS0/haBoVMROVd5LaZIn0acQ=;
        b=I2ZJdpLzn8mcZ989WzLWwpqxYDTLdaGMf5Kclt7CZ0KVGD+Vnf1ihtlbd5o2oFjc8h
         2aZ0Hyh5ooL8dk6kkkr6/NSq5R4CUc8IeqFbtjwbobFU4+/J0NQFbQu0d3NpGc2WvTPJ
         PBuMMk3t/G1Ao3lJlFd5BAKutJ5MsgbK5mTCSsj8stMXfqIyKPJ9XmEaMtkAtEuoKdvI
         WIpm5ObgmsRbT/AhSgCUlm96gDRpOrutJS/o/yiCqnodg2So2IXksvhxRzDNSz35cLPw
         nJlxX1uOIbOwV09qHOj866Z2EOw+ClldaN3bbcENa5zf4EUd3cgW4v88Hism0lqLcwWI
         pyFg==
X-Gm-Message-State: AOJu0YzX0SzJ14veLauhOE1TWG6aAitOFHzrapJe/VcDgKLHOHUMQ+pc
	9TfJ4wrdAY+ZSFuT9BJaRN6uxM5rcebzbNBj4410JdLOaYco9cIdaqx6mi9iZF/xy0t8JeN5LD7
	WzM79Bw==
X-Gm-Gg: ASbGncsnpW1ts+L17YE1clQ+7XSG2vANS8FPsFk92PFFVdIy10PXqw9SXPTIQcPTUMk
	/piOI8JS8QHzrhZGCzMM0+/BFI+NEcLElXiMjHRZ1bcfXkIu6J5KN6ED7RIwoYtEHw5mHjyZitu
	Gf6/AMAulRDkG8sksiORZgPIUVDLMda1FjbG6TjSHc1JdGzetsdwsbk4hRjL+N1EaAmPa/7sQYl
	IZNDYZVJEdAzysLUBZbij499FVYRpjk4f+R4RLjT3qZIuz7vH8qDW1hFQHF8tg+DbqSS9CywPSD
	jELoBwJcqj247zxKbl5KUl7caNKkexzMQA==
X-Google-Smtp-Source: AGHT+IFZrZYDJmN44dZJRqCSGE5F3p5G/HgaxNI6dAkyko986M2b+s8nhJAH/M86hockDP1eene39g==
X-Received: by 2002:a17:903:234d:b0:216:42fd:79d2 with SMTP id d9443c01a7336-21892a52c51mr208864345ad.49.1734433656138;
        Tue, 17 Dec 2024 03:07:36 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e640desm57373045ad.214.2024.12.17.03.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 03:07:35 -0800 (PST)
Message-ID: <ef7dc4de-fc61-4bc2-a7c7-6b24adb9229b@pf.is.s.u-tokyo.ac.jp>
Date: Tue, 17 Dec 2024 20:07:32 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra20-emc: fix an OF node reference bug in
 tegra_emc_find_node_by_ram_code()
To: Krzysztof Kozlowski <krzk@kernel.org>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org
References: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
 <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/17/24 18:31, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:14, Joe Hattori wrote:
>> As of_find_node_by_name() release the reference of the given OF node,
> 
> No, it does not.

I see in the document of the of_find_node_by_name() says that it calls 
of_node_put(), or am I looking at the wrong code?
/**
  * of_find_node_by_name - Find a node by its "name" property
  * @from:	The node to start searching from or NULL; the node
  *		you pass will not be searched, only the next one
  *		will. Typically, you pass what the previous call
  *		returned. of_node_put() will be called on @from.
  * @name:	The name string to match against
  *
  * Return: A node pointer with refcount incremented, use
  * of_node_put() on it when done.
  */


> 
>> tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
>> use, resulting in possible UAFs. Given the DT structure, utilize the
>> for_each_child_of_node macro and of_get_child_by_name() to avoid the bug.
>>
>> This bug was found by an experimental verification tool that I am
>> developing.
>>
>> Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>>   drivers/memory/tegra/tegra20-emc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>> index 7193f848d17e..9b7d30a21a5b 100644
>> --- a/drivers/memory/tegra/tegra20-emc.c
>> +++ b/drivers/memory/tegra/tegra20-emc.c
>> @@ -474,14 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>   
>>   	ram_code = tegra_read_ram_code();
>>   
>> -	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
>> -	     np = of_find_node_by_name(np, "emc-tables")) {
>> +	for_each_child_of_node(dev->of_node, np) {
> 
> I don't understand how this change is related to described problem.

As per the document, of_find_node_by_name() calls of_node_put(np), and 
the current code is calling of_node_put() before continuing the loop, so 
the np can be released twice.

> 
>> +		if (!of_node_name_eq(np, "emc-tables"))
>> +			continue;
>>   		err = of_property_read_u32(np, "nvidia,ram-code", &value);
>>   		if (err || value != ram_code) {
>>   			struct device_node *lpddr2_np;
>>   			bool cfg_mismatches = false;
>>   
>> -			lpddr2_np = of_find_node_by_name(np, "lpddr2");
>> +			lpddr2_np = of_get_child_by_name(np, "lpddr2");
> 
> Why?

Given the Devicetree structure, I understand that calling 
of_get_child_by_name() suffices here, which also does not release the 
reference of np.

> 
>>   			if (lpddr2_np) {
>>   				const struct lpddr2_info *info;
>>   
>> @@ -518,7 +519,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>   			}
>>   
>>   			if (cfg_mismatches) {
>> -				of_node_put(np);
> 
> If of_find_node_by_name() drops reference, why this was needed >
>>   				continue;
> 
> 
> 
> Best regards,
> Krzysztof

Best,
Joe
