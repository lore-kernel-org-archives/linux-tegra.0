Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE36FBF6
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jul 2024 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720077905; cv=none; b=UOClZSqo15mwx+5S0e4nY+lwjdelCRttMjFhoouT679zUOJDW2iybYn+Z5EoqNnkH8MxenFXxcYQUMqZN9cozbvaryx/UaLAtjTMKGXJ9r/kY5D1KHH4zxcjcRK2P4Sr67WzquseXHxdTYf1/TMi5N+xxiaXqVbMT9HuiUdaRF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720077905; c=relaxed/simple;
	bh=uDlexOUUCI3CqChoE3ytKmOwiRinirtnqpUjCxkclWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnA0fFNp1Jrrsuswwt400UEqoory+d++n3ug6uXVLi0z4xoh22FO7NgU+xTNX1U4SEqPCGVO4gFSDno10R3ZRouBdBf95Pgjc6ED1UQ7zbUZTB8GEr8VtDSleXo7WCJXu+oIrugizHVPNc9UQIpVueqAOsJtnR/qBjxK5Dlpoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9D36568AA6; Thu,  4 Jul 2024 09:24:59 +0200 (CEST)
Date: Thu, 4 Jul 2024 09:24:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240704072459.GA25935@lst.de>
References: <20240627124420.GA11113@lst.de> <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com> <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com> <20240627144738.GA20202@lst.de> <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com> <20240628123214.GB17080@lst.de> <48066c53-e421-46a5-a3dd-ecb7a024dff9@intel.com> <20240628125129.GA19835@lst.de> <617e143f-173b-4c74-a039-9a166efbf879@intel.com> <bdc112cc-c004-4137-88fe-fcfa81203ef7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc112cc-c004-4137-88fe-fcfa81203ef7@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 03, 2024 at 09:22:14AM +0100, Jon Hunter wrote:
>> Improving it looks straight forward, but then there is testing and
>> checking the code for anything that might be assuming an sg element
>> is not more than 64KiB.
>>
>> However it doesn't seem to offer any benefit, so it is difficult to
>> justify doing.
>
>
> Did we come to any agreement on how to fix this?

FYI, all I'm asking is to add a clear comment explaining setting
a different value depending on the page size.  Otherwise I'm ok with
the patch from Adrian.
