Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDA27733
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577941; cv=none; b=rQ/Wgpysfp5Fcx9JC0xSOWtP92ePIXYLEddgakggKjOAhreVajeZTJ/NM/JxG0R8EVl5xlkIqn7MkGtxO8C2WZfqwO8lyE/cY4sk7ya2pZKozxctMTPnn2k2ss6RjL1McvDzDp5kbI/YIOtCn23HyksuHXb31bSIgrITydi+Lto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577941; c=relaxed/simple;
	bh=NUCeQfu6VY+Dlc9cr/gEXxNSOwgP2nOoJKvWpfI3RD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgWoKYqG53o8BjdH/FnTQ4YTpjgzb5AQT1elvK6FEh1AaZ7Wmus6XpTNkJbMeVwixeyoQ7FmZSliauQw83EDvGK8p8zmAiT+ZmgAXAGQibt1z/i2gfH57gGhZWZz3fhwDKjtQonQf6CMMAVt4QyQSqkoQCsWYNigRgPQofP1Kg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3E56068CFE; Fri, 28 Jun 2024 14:32:14 +0200 (CEST)
Date: Fri, 28 Jun 2024 14:32:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Jon Hunter <jonathanh@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240628123214.GB17080@lst.de>
References: <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com> <20240627094950.GA30655@lst.de> <23aa9894-f913-409d-a385-8813711e2898@nvidia.com> <20240627111941.GA4523@lst.de> <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com> <20240627124420.GA11113@lst.de> <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com> <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com> <20240627144738.GA20202@lst.de> <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 28, 2024 at 11:06:54AM +0300, Adrian Hunter wrote:
> On 27/06/24 17:47, Christoph Hellwig wrote:
> > On Thu, Jun 27, 2024 at 04:44:30PM +0300, Adrian Hunter wrote:
> >> Probably just do what the block layer was doing e.g.
> > 
> > That was really just a hack due to the lack of error handling in
> > the old blk_queue_* interfaces.  If ADMA really doesn't actually have
> > a limitation, please just don't set any max_segment_size at all.
> > 
> 
> There is a limitation of 64KiB max. (or less with 
> SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) per descriptor.

Hmm, I thought the conflusion was that it can be more, which is why
you proposed to increase it if the PAGE_SIZE is >= 64k.  And based on
Jon's report at least for his tegra setups it works with 64k.
