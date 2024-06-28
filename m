Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7664436A
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562024; cv=none; b=J4iZC3tBH1dOPaukTwlHBuikM1CPgzAScU1DHssuE5cjx4uWl5elqETuUDf3JnHbGmCWzC5cgkL+Y8xuQPSKDOS1goPX+GvC/pAzCdLtoJXRWB10nOicXbqzQX6ElbOQLl67+yMz7l/xrgXRHKbLtMD8B1EKlYmFyk2Bhl4b9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562024; c=relaxed/simple;
	bh=nSqLfxrw982JuZ+Vc9Nmyfmk9Iw6WbPgep7uzJxvzrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ju/2djWZe8iptOETp4PpY9B01bEKMoly1g7DfKiCRPUp2OU/2aiSFdYM+FYR7j5ket5IhfsH0VvWB6xcBqAUaqQvDYDS72Ek/zA/nTW/qsi7jRbsyDYfWsJIx6purh43Y2q6yjyIKQ9zq8rR0RMcgrZb7iE6fIjKaStrWzUajpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCAUCisx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCAUCisx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719562023; x=1751098023;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nSqLfxrw982JuZ+Vc9Nmyfmk9Iw6WbPgep7uzJxvzrE=;
  b=CCAUCisxBYbTvFGSGLPKQxi9c26Fck7dADn49qcr+RjIpUPjDWgJAOot
   7+k25J+vUHoslGI4L3b2/4kegvn2g7A9Meu3X1DY2I3YaeZFf1tJNha+x
   VadNqkOmq9SxgTqQ7/KTbkqOiGz6ElyAGt9Hz4nBTChVpMAhWYnYNY0t8
   NCN+zHy2KnNmZN1Zu5j9PYYa+DtqVUt/XyVvfGczug1YHR9Iqty68TsqP
   8NjwJrXY3Tj/0MkEt2moRXw7HrBVCaMvt4i+Av+nNtEYkubEkndrJ4g3i
   9X1YzL9utFyZGCj4lv7YFiQSNK1P8u10Auvlh9d1JIZZmHb17K8wqXm79
   g==;
X-CSE-ConnectionGUID: WopBw0PYTRSKe5pkXXA9Dw==
X-CSE-MsgGUID: +sFEm2NVQYq6CQAyHBOZRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16569559"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="16569559"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 01:07:03 -0700
X-CSE-ConnectionGUID: M+DM2D2TRumO9rZ/vLy77g==
X-CSE-MsgGUID: 3AT2tJtFSuuBM7g0b8DFfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="44571774"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.49.253])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 01:07:01 -0700
Message-ID: <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com>
Date: Fri, 28 Jun 2024 11:06:54 +0300
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
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-18-hch@lst.de>
 <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
 <20240627094950.GA30655@lst.de>
 <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
 <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
 <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
 <20240627144738.GA20202@lst.de>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240627144738.GA20202@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/24 17:47, Christoph Hellwig wrote:
> On Thu, Jun 27, 2024 at 04:44:30PM +0300, Adrian Hunter wrote:
>> Probably just do what the block layer was doing e.g.
> 
> That was really just a hack due to the lack of error handling in
> the old blk_queue_* interfaces.  If ADMA really doesn't actually have
> a limitation, please just don't set any max_segment_size at all.
> 

There is a limitation of 64KiB max. (or less with 
SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) per descriptor.

