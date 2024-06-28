Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D574155CAE
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719582344; cv=none; b=NqqPzasj+Jp2DXrgN5phuBXN/HuRBZYSPTAyM+IoGFoNh/oYEHitBcO0uArYSkEuRh4057nADMgn6sveJ/Noke8hUB2POIjoKkUrhQ5ll73fHTxe4hEPROTIfNqR1WZSsPeTYl9N+EFODzut3XBcJKLccVTui21tgUoLMU8uuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719582344; c=relaxed/simple;
	bh=FG8dp0Vjz+TdKlt0qBPCJLHbU8Him2oyYAX9SDN0mkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXdVLA2zJ2onwWSRFcAl84ejPDDFo40h5YdT8cEQ2B1q2KIRuzEz4ZU8ExqL/+oCTgMDAV0Z+I5mlAL4JyzfAx1Wi4jbal60wFGDpPykxZbl1DiNDHE/UgzgQeg1rFomPL2lWs6N9k60Mt4rV3aOqAPe6TAd+6PXiwVMn2k64Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIQlgmnc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIQlgmnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719582342; x=1751118342;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FG8dp0Vjz+TdKlt0qBPCJLHbU8Him2oyYAX9SDN0mkY=;
  b=eIQlgmnccTMmqeJdO6rBkmzbJTosbgYYOp3NzPRgmAqoUdJHyHK1QfRL
   ogAZt1mBuZYHc/BGf1a/xIBdRSAY4MINsafcJc3suxSN9QA0/pnoIIYz4
   Of9/9JLf8LO/6rtxpS2cHHVAf5zI16syIxOmuKLze41nUGKklQ0TAoaG6
   /nxlH+OrV2XRAvZIqgz2llzAymLGHfBfy1qll76GtepWpK1UV+V+/ErGO
   vAq/VaiDvmkd3WGIYdRPW2WBz/J+P0J9E3Bcpc8bKHs+5LPKWUxpEcZpM
   55B1lOSsn/MSt4KbNhCd6ak5dYfuhEiWWoJG4R5tLYiP9VFS9Gh7tR1R+
   A==;
X-CSE-ConnectionGUID: HW/EoPxHRcCFm6vXxN5LTg==
X-CSE-MsgGUID: ncUe8nJ0QGqedJxzI8nGaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34302911"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34302911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:45:41 -0700
X-CSE-ConnectionGUID: es64Nxd7RgSakUqWvLNTrA==
X-CSE-MsgGUID: GfPnrnSTRBW5eseL7B4JFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44854174"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.49.253])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:45:39 -0700
Message-ID: <617e143f-173b-4c74-a039-9a166efbf879@intel.com>
Date: Fri, 28 Jun 2024 16:45:32 +0300
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
References: <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
 <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
 <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
 <20240627144738.GA20202@lst.de>
 <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com>
 <20240628123214.GB17080@lst.de>
 <48066c53-e421-46a5-a3dd-ecb7a024dff9@intel.com>
 <20240628125129.GA19835@lst.de>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240628125129.GA19835@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/24 15:51, Christoph Hellwig wrote:
> On Fri, Jun 28, 2024 at 03:37:35PM +0300, Adrian Hunter wrote:
>>> Hmm, I thought the conflusion was that it can be more, which is why
>>> you proposed to increase it if the PAGE_SIZE is >= 64k.  And based on
>>> Jon's report at least for his tegra setups it works with 64k.
>>
>> There is a workaround in that case to split to 32KiB chunks
> 
> Which I guess is less optimal than just using the block layer
> splitting?  Maybe add a big fat comment explaining this?

Improving it looks straight forward, but then there is testing and
checking the code for anything that might be assuming an sg element
is not more than 64KiB.

However it doesn't seem to offer any benefit, so it is difficult to
justify doing.

