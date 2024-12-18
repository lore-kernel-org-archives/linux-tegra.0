Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303B64C91
	for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2024 02:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490117; cv=none; b=qDuFxVrzJGDS6ak+aDyykaKtQiRn4kcO4CarCIFaUN9D8L+NOU/Y+ZLnTRAzi0faK44gfS+syEbgHA1fjHUSulAFB9kOugMBH/TxIreyyE/bhf6L9AydWT/hvbaRtjR3oG68thk8TMNT/6cY5DYRclaK0mnaqyAikPS2f9/Zn4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490117; c=relaxed/simple;
	bh=NMTHLGaY13yV8rfsMurKGi8SN5d+E6kVGRSO5wY4u8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KF2iLtd+CBNmQdE/aFyobMdvVD9WaJD6kexJH2icF6zRH0owuvn+qJO4JFZFMPLdNjt6w3+CDKD8u80oMFCVWcPn5vpaWvzNoGzNkFGTXEH4IQgGTCJmbOwJOA1Pk4ixphg2CrQCjwdd7YKEBMfY5qhY/pDRffrTMcc/Ivyewlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=nNdIf3Hq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="nNdIf3Hq"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728ec840a8aso6359921b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 18:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734490115; x=1735094915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCQbj5GAsImXzroS8gfN4kBF+HOBeC8t3dRFw2IjIQ0=;
        b=nNdIf3HqEg38vpyx8MODedFXlWVh6yQ7rSdP9FhUBAD/sEuHNsBRGr6tkNF67W49g0
         zj23yhlhvatRvAS0dmoZ1fRD614da8kjYz9VxVaEj50+SlWh1toADHYqLVWWGQpNpWbv
         cT+zBkXtBrP26MdZZD+Y69zhhvBpFNgC5HbyvE8+sBk9mmyNmqM7GsS9yrzGcTB35Qa6
         8KDlucMAS0TG4oGezSsGxOh6a85r+GJzhO/mQPF6kMEM8onM0it9pKRYG2DpFEYHvHXs
         suts9QnSvp5ZS8rXiWczIyBg2goSSI10+1Z7zfSOmPNKb6EVD1L3SH54ishkEu/jogf6
         Wh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734490115; x=1735094915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCQbj5GAsImXzroS8gfN4kBF+HOBeC8t3dRFw2IjIQ0=;
        b=GOo6fXVT70Zk+OK1ikFkjBgF6yxw8+XTPSJlNZcd3BTAroaYfmqM7GjEkJj8exd+0W
         GBv7V/hDf4iN0DLO/kBdHTR8rkd6RQmjcEMtfb5kHmK9VqW8HXIGCfJYzcj9EvC3PSEC
         K2Oslulmu84Ome9Qylk4fO6W3EY+k7NLhWpGjEdv9FDphpYuKQeZQkaruoXnZocSEFHa
         0dJIZ6n+NXjiuT35piSY5tv7QlR8w8DMGWxoCzuyEOpsF1gOZjR1mJfDr+vVvm4YHaxb
         nHitQu477AtYw20euCQMnfexWfrKKvBRXGdqmHFCsOzbFhd+CXoBhCYDINfCb90B7n0K
         bfaA==
X-Forwarded-Encrypted: i=1; AJvYcCUUEEVd4Tqnqe+YApIReilOb7o0vD2xPHNjPLXKG+DxyTAUSTwQDTsbyFesLzqUo/louqweydyDDWB6cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvZT6j+kCnHTCBwOU7AAARlXX+Hv2JfTBXe6yzLAo6UboYzu3o
	vhv+uZl6mQ/fwg7Q8odBhUT39M3k6k8qTNqwL/3Qm5wql2lPMZG4pUmZeoK8p7Y=
X-Gm-Gg: ASbGnctX7v1MeWhPyIstsYbasnE+v7F7499zH0TVaZOEoOurHuZXPMv7CRdFsxDy3Iu
	z/CDqzqgtlntX7sR4tP9YLNqO6DOtf8a4PljSbMblAxYVunQ2VQtIKBzhd+ljSwGL/X41vYhMvY
	62IZN2vZU1nTLiyMJ855tEzaQLydYZSBfWMe8bVgLNHne0b/Kf95+UI8bqIP1zh4PO+fatE3j4M
	VlssVNFpapH9Z/+oTqwFoEv70uX0tiQshbkWGuiU3vBdRVTLOSCSYToATK6FX7OvX6n7Ez/WKRA
	Frs3whqsxXT13gC0CjK+FJzu9232OlztRQ==
X-Google-Smtp-Source: AGHT+IG/Qnto52CiG7/eRPGJZkgRfayId2Z7pbdg5VmTfUqa/hk8jHXAjIWWTsunn8+Dt42jD51UrA==
X-Received: by 2002:a05:6a00:3992:b0:729:1c0f:b94a with SMTP id d2e1a72fcca58-72a8d2cbcd7mr2328682b3a.23.1734490115287;
        Tue, 17 Dec 2024 18:48:35 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c3662csm6501873a12.71.2024.12.17.18.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 18:48:34 -0800 (PST)
Message-ID: <3ee7d8c0-1a5a-4b04-a1fd-bba5f7fb8f8f@pf.is.s.u-tokyo.ac.jp>
Date: Wed, 18 Dec 2024 11:48:30 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra20-emc: fix an OF node reference bug in
 tegra_emc_find_node_by_ram_code()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
References: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
 <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>
 <fc0b53bf-029d-4505-a50b-8108b0788eca@stanley.mountain>
 <c79f0cec-a2b4-4b73-9ee6-f432d4529df1@kernel.org>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <c79f0cec-a2b4-4b73-9ee6-f432d4529df1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/17/24 20:57, Krzysztof Kozlowski wrote:
> On 17/12/2024 12:49, Dan Carpenter wrote:
>> On Tue, Dec 17, 2024 at 10:31:23AM +0100, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:14, Joe Hattori wrote:
>>>> As of_find_node_by_name() release the reference of the given OF node,
>>>
>>> No, it does not.
>>>
>>
>> Yeah, it does.
> 
> Yeah, I focused on returned 'np', but it is about input argument.
> 
>>
>> drivers/of/base.c
>>     927  /**
>>     928   * of_find_node_by_name - Find a node by its "name" property
>>     929   * @from:       The node to start searching from or NULL; the node
>>     930   *              you pass will not be searched, only the next one
>>     931   *              will. Typically, you pass what the previous call
>>     932   *              returned. of_node_put() will be called on @from.
>>                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>     933   * @name:       The name string to match against
>>     934   *
>>     935   * Return: A node pointer with refcount incremented, use
>>     936   * of_node_put() on it when done.
>>     937   */
>>     938  struct device_node *of_find_node_by_name(struct device_node *from,
>>     939          const char *name)
>>     940  {
>>     941          struct device_node *np;
>>     942          unsigned long flags;
>>     943
>>     944          raw_spin_lock_irqsave(&devtree_lock, flags);
>>     945          for_each_of_allnodes_from(from, np)
>>     946                  if (of_node_name_eq(np, name) && of_node_get(np))
>>     947                          break;
>>     948          of_node_put(from);
>>                              ^^^^^
>>
>>     949          raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>     950          return np;
>>     951  }
>>
>>>> tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
>>>> use, resulting in possible UAFs. Given the DT structure, utilize the
>>>> for_each_child_of_node macro and of_get_child_by_name() to avoid the bug.
>>>>
>>>> This bug was found by an experimental verification tool that I am
>>>> developing.
>>>>
>>>> Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
>>>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>>>> ---
>>>>   drivers/memory/tegra/tegra20-emc.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>>>> index 7193f848d17e..9b7d30a21a5b 100644
>>>> --- a/drivers/memory/tegra/tegra20-emc.c
>>>> +++ b/drivers/memory/tegra/tegra20-emc.c
>>>> @@ -474,14 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>>   
>>>>   	ram_code = tegra_read_ram_code();
>>>>   
>>>> -	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This original code is wrong.
>>
>>>> -	     np = of_find_node_by_name(np, "emc-tables")) {
>>>> +	for_each_child_of_node(dev->of_node, np) {
>>>
>>> I don't understand how this change is related to described problem.
>>>
>>>> +		if (!of_node_name_eq(np, "emc-tables"))
>>>> +			continue;
>>>>   		err = of_property_read_u32(np, "nvidia,ram-code", &value);
>>>>   		if (err || value != ram_code) {
>>>>   			struct device_node *lpddr2_np;
>>>>   			bool cfg_mismatches = false;
>>>>   
>>>> -			lpddr2_np = of_find_node_by_name(np, "lpddr2");
>>>> +			lpddr2_np = of_get_child_by_name(np, "lpddr2");
>>>
>>> Why?
>>
>> This drops the reference on "np"
>>
>>>
>>>>   			if (lpddr2_np) {
>>>>   				const struct lpddr2_info *info;
>>>>   
>>>> @@ -518,7 +519,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>>>>   			}
>>>>   
>>>>   			if (cfg_mismatches) {
>>>> -				of_node_put(np);
>>>
>>> If of_find_node_by_name() drops reference, why this was needed?
>>
>> The continue statement also drops the reference.  So this code as an
>> accidental of_node_put(dev->of_node) and two accidental extra calls to
>> of_node_put(np).
> 
> True, I just thought we talk here about looping and there are actually
> more issues in the code.
> 
>>
>> I can't say if the fix is correct, but the bug is real.
> 
> Probably this can be nicely split into two patches. One handling too
> many puts within the loop, without breaking it (so the in-loop
> of_find_node_by_name() and unnecessary of_node_put()). Second of using
> of_find_node_by_name() in the loop itself, leading to drop of device
> of_node reference.

Addressed in the v2 patch series.

> 
> Assuming of course that all the switch to parsing children is correct.

I'll paste my commit message on the v2 2/2 patch here. Unfortunately I 
do not have access to the actual device, but I think we can assume the 
parent-children relationship between the nodes.

According to the yaml file [1] and the dts files [2-4], the "emc-tables"
node is a child of a node with the property "nvidia,use-ram-code", and
the "lpddr2" node is a child of the "emc-tables" node. Thus utilize the
for_each_child_of_node() macro and of_get_child_by_name() instead of
of_find_node_by_name() to simplify the code.

[1]: 
Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
[2]: arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
[3]: arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
[4]: arch/arm/boot/dts/nvidia/tegra20-paz00.dts

> 
> Best regards,
> Krzysztof

Best,
Joe
