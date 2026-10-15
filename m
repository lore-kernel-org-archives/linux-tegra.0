Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF5B45D923;
	Thu, 15 Oct 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058608; cv=none; b=mlhy4efN2vHh/1u6C+sMMEArRDuMgRNWlvjeJvPjFD+JPqveYu69LzaeV2+1qbwqBuceD94Au6ZQvLd3x04zIqeCYqFBMmassfRPbPzOXxysEwilFtwXcNQR63V7bksiaw2jNijhDJADWVYsoW0TfwmbOunicruY0M6+0VSiLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058608; c=relaxed/simple;
	bh=jQfSLed4h//EKi1zFvLaF3DZxizTMwuRBrKZKA0SkCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9Kyu8EhcAGpnp/nWyA+KQFwEYvwPvwFioVZxpLPv0Foy7i5dztKM+O+hwihtO98nlgZiYOHkF5Y8HZzzdnQ8EJoJysYwqWW/oC2MhngPOVq8YfAsRjciedar+j5Xm11kx5TFcFppLuzvq1lto8LnLRowC4ym60jAZcqOQC9LT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ospqc/jo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ospqc/jo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83322F;
	Thu, 15 Oct 2026 03:03:20 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70B5B3F871;
	Thu, 15 Oct 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792058603; bh=jQfSLed4h//EKi1zFvLaF3DZxizTMwuRBrKZKA0SkCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ospqc/jotDB57wXSnGWpaAnDpiiDDQypchsf84aZpuHa47m/33nzc41Dr5AHsIt8v
	 jjfBUGLOvZh2OtCykrhLpsW1fqaFB1I8QKCmxsXQVprsUY9NFXFXOf8WkrTs/EqZXK
	 JK5o31xXcjuwy68k94tHKRt1vKs7A4PR48vD3600=
Message-ID: <03b070de-b0b0-44d9-89ce-891e6c3ac4d2@arm.com>
Date: Thu, 15 Oct 2026 11:03:19 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>,
 Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
 <20261013070205.3566865-3-smadhavan@nvidia.com>
 <23e9b66f-083a-4a77-8214-25f30c08057a@arm.com>
 <c0c04151-1ba9-473c-86a4-e066d6881858@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c0c04151-1ba9-473c-86a4-e066d6881858@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/15/26 09:43, Bence Csókás wrote:
> Hi,
> 
> On 2026. 10. 14. 17:38, Andre Przywara wrote:
>>> +static int smccc_cache_probe(struct arm_smccc_device *sdev)
>>> +{
>>> +    struct arm_smccc_res res = {};
>>> +    struct smccc_cache *cache;
>>> +    int ret;
>>> +
>>> +    arm_smccc_1_1_invoke(sdev->func_id, &res);
>>
>> I think you should provide the explicit function ID name here, and not 
>> rely on which function exactly is used to probe for the interface's 
>> existence.
> 
> I thought that was the point of the matcher, that you could in theory

But that probe() function here is not a "matcher" or a check function, 
that is done in the SMCCC bus generic code, using a function ID that has 
no side effects and does not return -1.

The reason for this SMC call here is to learn the attributes, they are 
used below to fill the latency and rate_limit fields in the struct.
So we should then make this explicit, I think, by using the 
ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES name.
> assign the same probe handler to any function ID? For example if there's 
> some FW that implements this (or a compatible) function, but at a 
> different ID, you would only update the match table? At least that's how 
> most subsystems (I2C, PCI, USB) do it.

Not sure I understand this, this is a driver specifically for the 
CLEANINV_MEM_REGION SMCCC interface, I don't see how you would reuse 
that, or plug any other interfaces to it.

>>> +    if ((s32)res.a0)
>>> +        return -ENODEV;
>>> +
>>> +    cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
>>> +                           struct smccc_cache, cci);
>>> +    if (!cache)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_init(&cache->lock);
>>> +    cache->latency_us = lower_32_bits(res.a2);
>>> +    cache->rate_limit = res.a3;
>>
>> According to the spec you would need lower_32_bits() for a3 as well - 
>> if we are going to use this value. But I don't think we need to, see 
>> above.
> Where does it say that? My copy of DEN 0028 1.7 H, released 2026/Jul/24, 
> only says the following:
> 
>    X3 (uint64_t attr_2)
>      Rate Limit: The maximum number of SMCCCC_ARCH_CLEAN_INV_MEMREGION 
> calls allowed per second. If set to 0, it indicates that this field is 
> not reported by the implementation.
> 
> See my second-to-last comment on v2 of this patch:
> 
> https://lore.kernel.org/lkml/591e7ac9-310e-40f4-ab22-161d6ea8f487@arm.com/
> 
> Maybe I have an outdated copy already? ;_;

No, I had! Mine said v1.7H, but is was an early version, which had the 
upper 32 bits of rate_limit as reserved.
Indeed in the later public version it's a 64-bit field, so ignore my 
comment. Sorry for the noise!

Cheers,
Andre

