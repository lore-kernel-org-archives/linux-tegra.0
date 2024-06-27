Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1A197549
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499671; cv=none; b=pH4QJW3YFQkhnit2qfPpOkpSHlUdk+jsP4imCD3PCKlmDNwmUAr6zwhQjkyAATyuJ+yvxo6ftfluPGZLWx47aJkk+TLZZneYpwh5qaaxL2KJhdooSS00E8Lp9OYinJJZ3oBEYXAYaehYPT8eYObAr2QDcCT4ygN/Od8Epy9XBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499671; c=relaxed/simple;
	bh=SqLglSFiJceufrEvI8y7fp/euogv7kgRl1FyA4RFYNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkV4c04OyZ9i/g29If5ppzpL6yK5TOUUaa0K/lXAueayi/XKQfuMitnlWB9+uzXGUtME2kso+xJLEGh7fCxug22NRJzTySb8pZ+eM6s/oDT6NUTjkj/tJaF+HfN0YGo42S9NhKkc2zemgoZ3CSbZ/AmYp5E14tFak24FZIZ+Vbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9DEE2227A87; Thu, 27 Jun 2024 16:47:39 +0200 (CEST)
Date: Thu, 27 Jun 2024 16:47:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240627144738.GA20202@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com> <20240627094950.GA30655@lst.de> <23aa9894-f913-409d-a385-8813711e2898@nvidia.com> <20240627111941.GA4523@lst.de> <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com> <20240627124420.GA11113@lst.de> <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com> <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jun 27, 2024 at 04:44:30PM +0300, Adrian Hunter wrote:
> Probably just do what the block layer was doing e.g.

That was really just a hack due to the lack of error handling in
the old blk_queue_* interfaces.  If ADMA really doesn't actually have
a limitation, please just don't set any max_segment_size at all.

