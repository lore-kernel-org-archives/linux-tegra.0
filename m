Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8AB160795
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492268; cv=none; b=JwN0kbRbWhHAuEpuW27q7J8VxubaZBE5wOfHMonnWApVzIlxTMD2ujz7xV3Lx38rCnicEBKrMebxnUfXQwmXlg5hv8HQIw6n8l0SW0AkHhGi2gcyf+e57kVCExdaVeLq/Xws4FIZ9OMGfotn2gfjmk/HILLT61a0hdsI4l7A5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492268; c=relaxed/simple;
	bh=QHdFi5aacwFk7nsXV+jMGJuCGJA0M2JWbaSEErM3vp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArPrv9l7lh7Kp5L04FVSD7cPVcHzsGwgGvYG1q/uJq2oIwiQpEXxJV40WfCdb16H29B9h+po55myCQ03O1FAUCkiq7pq4+qs34zEnt6V0Vs9Ci1IESHEraftdZq+uuLkqriww4hMv0szWVxalCFJVwPoMTrBJG33vM4w14g74vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 09EF868BFE; Thu, 27 Jun 2024 14:44:21 +0200 (CEST)
Date: Thu, 27 Jun 2024 14:44:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240627124420.GA11113@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com> <20240627094950.GA30655@lst.de> <23aa9894-f913-409d-a385-8813711e2898@nvidia.com> <20240627111941.GA4523@lst.de> <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jun 27, 2024 at 01:30:03PM +0100, Jon Hunter wrote:
> I have been testing on both Tegra194 and Tegra234. Both of these set the 
> above quirk. This would explain why the max_segment_size is rounded down to 
> 65024 in the mmc_alloc_disk() function.
>
> We can check if this is needed but if it is needed then it is not clear 
> if/how this can be fixed?

The older kernels did this:

	if (max_size < PAGE_CACHE_SIZE) {
		max_size = PAGE_CACHE_SIZE;
		printk(KERN_INFO "%s: set to minimum %d\n",
			__func__, max_size);
	}

	q->limits.max_segment_size = max_size;

so when these kernels actually worked despite the above warning it
must be ok(-ish) to just increase this value.  If that is best done
by dropping the quirk, or changing the logic in sdhci.c is something
the maintainers that understand the hardware need to decide.

The patch below gives you the pre-6.9 behavior just without the
boot time warning, but it might not be what was intended by the
quirk:

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 746f4cf7ab0338..0dc3604ac6093a 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -4721,12 +4721,9 @@ int sdhci_setup_host(struct sdhci_host *host)
 	 * be larger than 64 KiB though.
 	 */
 	if (host->flags & SDHCI_USE_ADMA) {
-		if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) {
+		if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC)
 			host->max_adma = 65532; /* 32-bit alignment */
-			mmc->max_seg_size = 65535;
-		} else {
-			mmc->max_seg_size = 65536;
-		}
+		mmc->max_seg_size = 65536;
 	} else {
 		mmc->max_seg_size = mmc->max_req_size;
 	}
