Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3714882B
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487189; cv=none; b=VDl8MwP2QaOnUsw6mQdYkibFd1fDQPwj2OrCJ+I1wyqf4lMOtDYht3+bderEOA+wFAOcBLi0u49oEgSSXv+FK2KIDYGlGbgoDAoXjSpRrfAqL2lDhWHJc56o3tHcRgKNn/mP8HzYrMPpWdnceleqZPrt3OI/Bi0L8OBgbKbapXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487189; c=relaxed/simple;
	bh=Vop4yRTrht3WJS1PXxLSkpYxEiqcxrMSuKdzzrIdx9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSemG9XYYhRw84vVLu2sTqrn+gyXD4c+aAAYI7qmysUn5Fv7S5InJDqiMNouc9N0a2w2NvVJlp1sYb5G3hyA8k9G/IDZV3tNJzbglCqte3f93nPzCQtGrSVtYZwf4hQcwJAxy6Nbwmw1/Nc3lxpc/+ErqEFRCSwW+C0jAajkfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 32B8768BFE; Thu, 27 Jun 2024 13:19:42 +0200 (CEST)
Date: Thu, 27 Jun 2024 13:19:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240627111941.GA4523@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com> <20240627094950.GA30655@lst.de> <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jun 27, 2024 at 10:58:58AM +0100, Jon Hunter wrote:
>
> On 27/06/2024 10:49, Christoph Hellwig wrote:
>> On Thu, Jun 27, 2024 at 10:43:24AM +0100, Jon Hunter wrote:
>>> We have just noticed that since Linux v6.9 was released, that if we
>>> build the kernel with 64kB MMU pages, then we see the following WARNING
>>> and probe failure ...
>>
>> The old code upgraded the limits to the PAGE_SIZE for this case after
>> issunig a warning.  Your driver probably incorrectly advertised the
>> lower max_segment_size.  Try setting it to 64k.  I would have sent you
>> a patch for that, but I can't see what mmc host driver you are using.
>
>
> We are using the sdhci-tegra.c driver. I don't see it set in there, but I 
> see references to max_seg_size in the main sdhci.c driver.

sdhci-tegra.c sets SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC for various
devices, I guess you have one od those?  This sounds like the device
might not actually need it, but I'll need help from the SDHCI and
tegra maintainers here.

