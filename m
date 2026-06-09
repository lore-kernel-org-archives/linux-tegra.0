Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B2221FCD;
	Tue,  9 Jun 2026 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017717; cv=none; b=UsPD+DcvBbmFdKN1mAIlSWOUunQ4HzZqOmr+Sl9QwWzWgyDHDOJUsyXt/9L0rMrCmV8iSHm5PvZye8D7jdfOlJPv9G4obQ0JWYpfEzoY2lYfZHiizVyGO6PmIKYui3yqNcwoxZH63LLueZY42PP3roDX6BGXfaUU+PWJlsT11EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017717; c=relaxed/simple;
	bh=kKpG0gAhAGVntdHPD+n5ECoqxSj1x3Gfqlct2FItSP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+Beb6gojIpZiDYfNfAUchpovKdH9ywhUIxgPtTwhf0G9NaEbtNJ1SKnA6gmmci083LWiMUGNx/vUMKBo22n51Fcj7rHbze744Fursh9DPcwWzrz5jPjG1uCt3oQQ3V4nQFX8pH+3AIkWnk2JgMZfJFAkJyVmjNBCRtGR8IlfeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLVjMV90; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLVjMV90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B241F00893;
	Tue,  9 Jun 2026 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781017715;
	bh=zclvmjBeqhlBuxOGS6uNOQaBQOyfAdQWBrRW7MPmNyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MLVjMV902l5PxA+V+wj08KBxjJCaUASKjqdsHvt+RaqjIBNPydGrQcY0WKp9xkAY9
	 ojZnsmgn6+FjtAlCX7nzUTZ3ZPzXejDbW3GTHMc/X/kGEqhTmy4XwXlvGD/fpjMo6A
	 z36yZeSYEw4V7sl3O/K+lBj+SFZXQeFXQ23JIwD/WT7W5WCalyCeDkPN6JYjDIV93u
	 6th7i7R6gQBXxD9MSEnfwfFZehEEGXH6CtLgNLwdUhjaLFl6g/HTFMxo0u7dj8pki9
	 r2TiuUC/Us0wKz4QVsSfUS6MNZ2EESJzdYabOEI8AY21/H13wCwZY1fgUerYPwKApR
	 Iao/8YWT9vqwg==
Message-ID: <95d51b76-bfbf-4201-94be-a8539ee4daa2@kernel.org>
Date: Tue, 9 Jun 2026 17:08:28 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] memory: tegra186-emc: stop borrowing MC aggregate
 hook for EMC
To: Jon Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
 treding@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: bbasu@nvidia.com
References: <20260527140127.49172-1-sumitg@nvidia.com>
 <20260527140127.49172-2-sumitg@nvidia.com>
 <31cba498-24c9-4d73-bb17-bba9cf730b55@kernel.org>
 <0d8f1f3b-ed7b-4066-af6e-08c006788535@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <0d8f1f3b-ed7b-4066-af6e-08c006788535@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/06/2026 17:07, Jon Hunter wrote:
> 
> On 09/06/2026 16:01, Krzysztof Kozlowski wrote:
>> On 27/05/2026 16:01, Sumit Gupta wrote:
>>> tegra186_emc_interconnect_init() copies the MC's ICC aggregate hook
>>> into the EMC provider.  That hook (tegra234_mc_icc_aggregate /
>>> tegra264_mc_icc_aggregate) uses container_of() to recover 'mc',
>>> which is only valid when the icc_provider is embedded in struct
>>> tegra_mc.  For an EMC node the provider is embedded in struct
>>> tegra186_emc, so 'mc' points into unrelated memory.
>>>
>>> This stayed harmless until commit faafd6ca7e6e ("memory: tegra:
>>> make icc_set_bw return zero if BWMGR not supported") added an
>>> unconditional read of mc->bwmgr_mrq_supported at the top of the
>>> hook.  UBSAN catches the stray load on every EMC aggregation:
>>>
>>>    UBSAN: invalid-load in drivers/memory/tegra/tegra234.c:1104:9
>>>    load of value 112 is not a valid value for type '_Bool'
>>>
>>> No functional impact in practice, since the hook's only other mc
>>> dereference (mc->num_channels) sits inside a
>>> TEGRA_ICC_MC_CPU_CLUSTER* branch that EMC nodes never enter.
>>>
>>> Fix this by setting the EMC provider's aggregate hook to
>>> icc_std_aggregate, instead of borrowing the MC's hook.  The MC
>>> providers continue using their own aggregate hooks, where
>>> container_of() correctly resolves to struct tegra_mc.
>>>
>>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>>
>> I assume these reports were offlist. Otherwise this has a valid
>> checkpatch warning.
> 
> 
> Yes some of our internal testing flagged this and I had asked Sumit to 
> take a look.
> 

Ack, thanks!

Best regards,
Krzysztof
