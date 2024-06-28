Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A3194C67
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719579097; cv=none; b=Nx3tQWVSO/pCEZhHDMrxlOD10j40Qh28z7BDIh/i6+Cmk9rXo1Fyl7cA1Wmyp/5htotDZc889AAOmBM4pA0h7mC9PYXbTvqG3FtY3bC+MrltSwHTv6nmtGnsX+tIAScAhYDfIkRICRsHfupJZLnQwGAYNGdZFw4yslDlsjQweJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719579097; c=relaxed/simple;
	bh=yRAfQBfZhP6jCsKatBrkb+8O4dsCOnhW+aYSsz96a6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIYmuDPOl2oThDGs/nnmKZbGhozkeoDSFF0sbE0UpNeQXAKImDHGUWvAAEb7yaKbq1AV5zz22qS4OjvFWmlFzewvZlPjMTybFPtMo2wuH/J70K/cm+oIzJurC5Dy2Gs46YQERw5gcpRmRSmoWOg8YJar0v3OUEDRjlldD2VsUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2471867373; Fri, 28 Jun 2024 14:51:29 +0200 (CEST)
Date: Fri, 28 Jun 2024 14:51:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Jon Hunter <jonathanh@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240628125129.GA19835@lst.de>
References: <23aa9894-f913-409d-a385-8813711e2898@nvidia.com> <20240627111941.GA4523@lst.de> <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com> <20240627124420.GA11113@lst.de> <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com> <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com> <20240627144738.GA20202@lst.de> <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com> <20240628123214.GB17080@lst.de> <48066c53-e421-46a5-a3dd-ecb7a024dff9@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48066c53-e421-46a5-a3dd-ecb7a024dff9@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 28, 2024 at 03:37:35PM +0300, Adrian Hunter wrote:
> > Hmm, I thought the conflusion was that it can be more, which is why
> > you proposed to increase it if the PAGE_SIZE is >= 64k.  And based on
> > Jon's report at least for his tegra setups it works with 64k.
> 
> There is a workaround in that case to split to 32KiB chunks

Which I guess is less optimal than just using the block layer
splitting?  Maybe add a big fat comment explaining this?
