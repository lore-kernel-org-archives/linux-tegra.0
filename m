Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A6186E5B
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495880; cv=none; b=LxF6NOXzWOqGL05wO/xDU+vQlDIHoH6Vtgs41cxosTJS0HDzlsWX460vq9xMqdctZEtyg9TK5rDF88nHqbrh1Vi/QhZF2FQZwWf4pffmVkCBuBzPEP2uNXA8XI+PCeM+4VmhJGgKcy0pc77YJhIosM737BbCy9+4zl8dwrE8Hpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495880; c=relaxed/simple;
	bh=0rONa3p2Hf9CZ9n4am2xCHHhSYtlBJ/DNNOvWDHqQ/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QM4bAk4EW8prIdlsnZpAo4xEdYEKbPk6Ie71FVgJ7RaeB9/ygfwprFOCRG1xFoilbADr/k1WDLIEwO5BdV6pp41Z4RyakUcEogsH+HaKm6Wj7mh8iX6tbLxW27nEvV7ZCkrQjFP44H4EYRGbMRJEp79tVHWY9sBkY19bx1gtGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJtkQwc6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJtkQwc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719495879; x=1751031879;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0rONa3p2Hf9CZ9n4am2xCHHhSYtlBJ/DNNOvWDHqQ/I=;
  b=fJtkQwc6diuA3O4i7X7YYCzFXYdjLq3YDU5mHwIiPtiIbwNtLokk7TGj
   TNnF5DeDRgq8Pauqrslw7iCGg0N9JEZCnwg36OjoA4A9NcKZUvCDqfjEa
   B6AmJQsqpM/zPrcNMzUIcRppOIiXUZQNy4wUpiok47xz6fFd4XhXGzYAk
   Xx8Fcs0FceoKjLYrW1SfHcdCQdxIZiywDqq1NHoi6QEttN5IybcBiocIz
   ZX/Gk+EL0N1ZJquaUeBpihJ0BxbwghdngRsMiVPtTWkVys3wv8xmQMvfA
   dbkgRSSeuvo3+j//PvxVIkrgEV1YU3uf3djOLrb4luhK22t06v2WPpSHh
   w==;
X-CSE-ConnectionGUID: rS7Nq8NBSMqCx46hIdhaPA==
X-CSE-MsgGUID: S8Go/MqJSCeI43N1EPBiiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20441801"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="20441801"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 06:44:38 -0700
X-CSE-ConnectionGUID: Ly5QV3S5SVKNVW05B6UusA==
X-CSE-MsgGUID: A9m7VQarSfGADfEej3GT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="67590551"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.49.253])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 06:44:35 -0700
Message-ID: <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
Date: Thu, 27 Jun 2024 16:44:30 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Jon Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-18-hch@lst.de>
 <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
 <20240627094950.GA30655@lst.de>
 <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
 <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/06/24 16:09, Jon Hunter wrote:
> 
> On 27/06/2024 13:44, Christoph Hellwig wrote:
>> On Thu, Jun 27, 2024 at 01:30:03PM +0100, Jon Hunter wrote:
>>> I have been testing on both Tegra194 and Tegra234. Both of these set the
>>> above quirk. This would explain why the max_segment_size is rounded down to
>>> 65024 in the mmc_alloc_disk() function.
>>>
>>> We can check if this is needed but if it is needed then it is not clear
>>> if/how this can be fixed?
>>
>> The older kernels did this:
>>
>>     if (max_size < PAGE_CACHE_SIZE) {
>>         max_size = PAGE_CACHE_SIZE;
>>         printk(KERN_INFO "%s: set to minimum %d\n",
>>             __func__, max_size);
>>     }
>>
>>     q->limits.max_segment_size = max_size;
>>
>> so when these kernels actually worked despite the above warning it
>> must be ok(-ish) to just increase this value.  If that is best done
>> by dropping the quirk, or changing the logic in sdhci.c is something
>> the maintainers that understand the hardware need to decide.
>>
>> The patch below gives you the pre-6.9 behavior just without the
>> boot time warning, but it might not be what was intended by the
>> quirk:
>>
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index 746f4cf7ab0338..0dc3604ac6093a 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -4721,12 +4721,9 @@ int sdhci_setup_host(struct sdhci_host *host)
>>        * be larger than 64 KiB though.
>>        */
>>       if (host->flags & SDHCI_USE_ADMA) {
>> -        if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) {
>> +        if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC)
>>               host->max_adma = 65532; /* 32-bit alignment */
>> -            mmc->max_seg_size = 65535;
>> -        } else {
>> -            mmc->max_seg_size = 65536;
>> -        }
>> +        mmc->max_seg_size = 65536;
>>       } else {
>>           mmc->max_seg_size = mmc->max_req_size;
>>       }
> 
> 
> As a quick test I removed the quirk for Tegra194 and that did work, which achieves the same thing as the above.
> 
> I guess there are two open questions here ...
> 
> 1. Do we need the quirk for all the current Tegra devices? Thierry and I
>    can confirm this.
> 2. For devices that need that quirk and use 64kB pages, what is the
>    appropriate way to handle this for sdhci controllers?

Probably just do what the block layer was doing e.g.

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 746f4cf7ab03..6a1dea0d8d64 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -4724,6 +4724,13 @@ int sdhci_setup_host(struct sdhci_host *host)
 		if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) {
 			host->max_adma = 65532; /* 32-bit alignment */
 			mmc->max_seg_size = 65535;
+			/*
+			 * Block layer cannot accept max_seg_size < PAGE_SIZE
+			 * whereas sdhci_adma_table_pre() will anyway split the
+			 * descriptor to handle size > max_adma.
+			 */
+			if (mmc->max_seg_size < PAGE_SIZE)
+				mmc->max_seg_size = PAGE_SIZE;
 		} else {
 			mmc->max_seg_size = 65536;
 		}


