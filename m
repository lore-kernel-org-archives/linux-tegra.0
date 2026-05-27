Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86534364950;
	Wed, 27 May 2026 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893204; cv=none; b=EsUKjXVdxjdoo79SKcEQCIlAhaOt241/fg0BhPeqA8Kp+pJsbp/HP5oL7C1gJR8KhGKzHqc3zsMU/2bKzNRCBC8Vs0rKlJEvpVXuqGhaOFXwRUbMrhqg8+reVf+QnqlCVdjRpnbV/6uRLpPZZ+8cxyt+A8u3r+jk3DcVkGLGp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893204; c=relaxed/simple;
	bh=H/Rms+6k759DaPc6FDpjuNlaRYkZn3kPIXxHOVWODS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BP//3RKMYr3nSx8MwZKeAeRcAyaQ+1M9R8s6pxt7Uu7xhAR80DyUfQ7BS0ecq+09ZQbB/1iRbffihcntKn2yxOcB9x+nyYY6LQFJlyzCfZgoznK2I/GtAFjxzc/gPMMu3kHnDiVEZ1AMuD/1iZ1q4yM5iMOekONVk9/N+uhYgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTf2cAd7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTf2cAd7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1871F000E9;
	Wed, 27 May 2026 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779893203;
	bh=6y6ydWz8U6vpPf9Y84EwbWZmzk5t5YC6HCWXZ30d3Eo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jTf2cAd77cfiJqeIaPBBOR5/mlrwDMnNZQziAYpOq2tvw1HF5b/nnK7xI9TJsGjhy
	 qXkAvRDYDkRZxHog+SiL3oS4ohyqpYhWfo7lbHe8brRPZ0+zQHVbG+qnNqfiRhuk03
	 RYF+BPntsjZKvtLJ/4qL6zf9AtWY0pSNWKVGeW+rmdcwmJ5+WSU1kTRIz8IjMuTWUC
	 epeZACShlFe5ojSY35vwacKnlevca6thmIlFfwoLplmMhm2xvS2pOR/6f1bGc+qN5E
	 rBOMTq5Y0H2ofBMuUnPE+qpOQ+nvNwE042UCvG9k6BFmv1jGVoSJNXgAFc5taCEQJa
	 F1I6XVO1KuRJA==
Message-ID: <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org>
Date: Wed, 27 May 2026 16:46:38 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
To: Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: bbasu@nvidia.com
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
 <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2026 16:21, Sumit Gupta wrote:
> 
> On 27/05/26 18:25, Krzysztof Kozlowski wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 21/05/2026 16:05, Sumit Gupta wrote:
>>> -             err = icc_link_create(node, TEGRA_ICC_MC);
>>> +             err = tegra_mc_icc_link_create(node, node_id, TEGRA_ICC_MC);
>>>                if (err)
>>>                        goto remove_nodes;
>>>
>>> @@ -957,7 +969,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
>>>        if (IS_ERR(mc->regs))
>>>                return PTR_ERR(mc->regs);
>>>
>>> -     mc->debugfs.root = debugfs_create_dir("mc", NULL);
>>> +     if (!mc_debugfs_root)
>> That's a probe path and you created a singletone. Looks like preventing
>> async probing for no real reason.
>>
>> I am very against singletons and debugfs does not look like justified
>> exception.
> 
> The singleton was added so multi-socket MC/EMC instances could
> share a "mc"/"emc" parent. I'll drop it in v2.
> 
> On single-socket SoCs, the "mc"/"emc" names will be unchanged.
> On multi-socket SoCs, each instance will create a top-level debugfs
> dir named with dev_name(). Same pattern in tegra186-emc.c.
> 
>    if (dev_to_node(mc->dev) == NUMA_NO_NODE)
>        mc->debugfs.root = debugfs_create_dir("mc", NULL);
>    else
>        mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev), NULL);

You assume this is fully synced, so you as well could do a look up and
then use what you found or create new dir. If you think that is racy, so
is this approach... How are other drivers handling per-device debugfs
directories? Do they also create such in the top-level? I think no.



Best regards,
Krzysztof
