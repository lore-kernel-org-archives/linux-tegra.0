Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671CB154433
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719578266; cv=none; b=UgWcmDvINsni1+A6hqHzKZuXWi6s1JaS0CUwa08pztByU8aQmmTlxL2LfUIW0fgf93mCBjHTCCA7NgPJkjDIFuAJsWiHs9TY5YIhrRimAxhg2Q+2r9AE/rQc7+8ffDW4T/Szpakzi+ujgyfRy8fwmG67hYYO995zVQ1te9Gqumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719578266; c=relaxed/simple;
	bh=KnnBUbkF68D6XT5PB9RUfSAgHQXWLitriX/KTWSmAJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuvwEAwoPmU9UqDYuK0R2LvP8yjYOYEh6NmCYeurxFQZI1LCvCm4sHS3cxxKx+GkmY/ysOKYAEYgG0AdqJG0BGxe2Mn8US3sP3VGM+uWJXsXHtlcvLxf1hOPv6ntMM9F78GVt4P4LFp1b+4bLcd10p5QBA96iLhco7BKz9vg46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ProsxSpm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ProsxSpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719578264; x=1751114264;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KnnBUbkF68D6XT5PB9RUfSAgHQXWLitriX/KTWSmAJA=;
  b=ProsxSpmllf/m05bF55xeosgChMtSNUvGrFoZ+o0gTSU5u3BZ9J6AevA
   V/c6U1WrbRQcOMF4Nq7C1M5LatJFZRJOlrwCHwzl6bZ2dT4J6gihoItzj
   K1Bz25GXPDO5OGLJuW6rzYGX6uSxjaYU44IEB7Sr39S0w41LFxqIJPanU
   q0cPYkeSvgYqKYnfQxyXImKwIqjNPYvMY7C36pt1HQ+wvAMiWqmYrMm5u
   lxPSHSWGrMdjWtmjPpg8hYrNf6mvJ6R90jXpDaVgxVFntjMh5drMwp/A4
   GoxHEZU2l8e6DMgrkd3uhf21GEzET4CjsEoXflj7hA059H8ny8W/BUgkV
   Q==;
X-CSE-ConnectionGUID: U9zl8AaOQzal0amyI/h23A==
X-CSE-MsgGUID: Atd713aaRXWlFABDL7k8Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16578300"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16578300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 05:37:43 -0700
X-CSE-ConnectionGUID: yVtpikjES7aPrySF9030qA==
X-CSE-MsgGUID: MQH0QypiSi21Wpxl1FfjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="45139603"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.49.253])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 05:37:42 -0700
Message-ID: <48066c53-e421-46a5-a3dd-ecb7a024dff9@intel.com>
Date: Fri, 28 Jun 2024 15:37:35 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
 <20240627094950.GA30655@lst.de>
 <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
 <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
 <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
 <20240627144738.GA20202@lst.de>
 <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com>
 <20240628123214.GB17080@lst.de>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240628123214.GB17080@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/24 15:32, Christoph Hellwig wrote:
> On Fri, Jun 28, 2024 at 11:06:54AM +0300, Adrian Hunter wrote:
>> On 27/06/24 17:47, Christoph Hellwig wrote:
>>> On Thu, Jun 27, 2024 at 04:44:30PM +0300, Adrian Hunter wrote:
>>>> Probably just do what the block layer was doing e.g.
>>>
>>> That was really just a hack due to the lack of error handling in
>>> the old blk_queue_* interfaces.  If ADMA really doesn't actually have
>>> a limitation, please just don't set any max_segment_size at all.
>>>
>>
>> There is a limitation of 64KiB max. (or less with 
>> SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) per descriptor.
> 
> Hmm, I thought the conflusion was that it can be more, which is why
> you proposed to increase it if the PAGE_SIZE is >= 64k.  And based on
> Jon's report at least for his tegra setups it works with 64k.

There is a workaround in that case to split to 32KiB chunks

