Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE77F7C3
	for <linux-tegra@vger.kernel.org>; Wed, 24 Jan 2024 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115785; cv=none; b=Y9pyUX5LZeuUuzXqdGG4vW8l0LgH+awhaivlUEUdFEzf4ZIIxWaWLo2+Ks6yctWeUadLuqxkRNyFXVfFygMwSCGDBwOQafr7+iu6cZG7kcaz2mcMZBFh+li15txStDkFvK7+09y6GTzJZVX/maZLgMiuxg7FGN94gfMwJ/T6HDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115785; c=relaxed/simple;
	bh=OckWe4XG0ixqeMakKtCo9WUR9ythXnbH2cRxgj0L6AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqTUuWHBqQc4itoSsJEMMyHCgsD5SUfgww3DCKhh3tAon00oyjbGqF5XZ5rQpoKcAcUHfAeeUy8YsvGTR8l+ECX96eTfoNgyF/+5wwcey8z+8JYXqT8prrOPzOTVpI6uX8Yf8bhUD9eSHjkVZqKbMlp8QHcFs4Ey1l5z5tTMyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oGOd4ErV; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oGOd4ErV"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2144ce7ff41so1603593fac.3
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jan 2024 09:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706115782; x=1706720582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=46DW82ZGTZFbq/v3xqfovKBaw5pAkplLqD4lqGmbUT4=;
        b=oGOd4ErVGS4RtxzGAn3zTp2+m7+eiCS+ZmuC6kGxU8QavUCQl6Di32HQrHSVUha9vI
         q7SDBvxI1AkOQn0xamTqmEmbRDaNfbqPKLmkL3cEddSWShtJEQOPatAbK0h7OeF+9m16
         1Ia1cIosbzuq+JJ3RKDiP225052pxwBxtqoOoDlhFpFyQ9WOQy8pWKhdEzG9+1fR582c
         j2BIbk29p2KOGUjEjYTuZIlekpGkZCa/wIUtde32SpK/aIreN/MLWUOal0enddMyxv3c
         wO2oGEH2tcRKDF+wu5inO4EI1ZqBX72e/7im3v+4Q6lDpq9wGdfcpAIuPpTmSToh183u
         8qHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706115782; x=1706720582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46DW82ZGTZFbq/v3xqfovKBaw5pAkplLqD4lqGmbUT4=;
        b=RXV67dGe95K5z8jAdCA8EcsSVPifJEGTFR/3ZZidx12pMEesOxA9xTP4GcDFvDJ2YY
         xU7u3sa+mPZKjZj4RKHzvodBlosJLzvi1gn2j/k9yMKkxR7mbdNzlAzGgm8Wg2yQq6+p
         68Jhe8c0zv/6KAnVn2vbtCULDKiqK+7Y9qF64y1nCA3wFejsD+TDBshRuEBUz5fDQOxk
         yLUs8neEkXESrj3OJymB369n8jPXu9grgNRVvhNa05HHKSUUAQiahzdPqXpS4EvPhCvy
         LjLGkITI9aZm87vhi5pzB5rlm4HgbmQ8fhLPrUKsH3CqohrEjxTaqMvRFjWHLCZWuYaJ
         TAsw==
X-Gm-Message-State: AOJu0YwfE0ginKjq8F9I+5BTRCfFJidJ++wuDgghnStNckpOL2CHqjVC
	zEozBAssazPZqsTvksgdKDUTGmoYh3U1XqizRjWyefTBtp+jYQZH4mMnwAcK3qQ=
X-Google-Smtp-Source: AGHT+IEFELpRVBGWhMjKivd//Up4NeyH4XQb924O+IsJi62S9Y4yx3cDs6tr3yd1JgyFgpvf+uHklw==
X-Received: by 2002:a05:6870:7d16:b0:214:24ca:1cd6 with SMTP id os22-20020a0568707d1600b0021424ca1cd6mr3852737oab.18.1706115782357;
        Wed, 24 Jan 2024 09:03:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id qa12-20020a056871e70c00b00210d2c251cbsm2878811oac.39.2024.01.24.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 09:03:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rSgeS-008q7W-2p;
	Wed, 24 Jan 2024 13:03:00 -0400
Date: Wed, 24 Jan 2024 13:03:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
	vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com,
	jroedel@suse.de, linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Failed buffer allocation in Tegra fbdev
Message-ID: <20240124170300.GU50608@ziepe.ca>
References: <bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh>
 <20240123151508.GR50608@ziepe.ca>
 <pgund4coabp5pdlmwze5o2d7ogrdncktqz267yzukjcvmikudc@7svrwdci7ujl>
 <55cab5e0-0abf-47d0-becc-05cdf1d22fac@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55cab5e0-0abf-47d0-becc-05cdf1d22fac@arm.com>

On Wed, Jan 24, 2024 at 11:46:59AM +0000, Robin Murphy wrote:
> > > > This may be connected with an error in of_iommu_configure() that
> > > > became visible after commit 6ff6e184f1f4d:
> > > > 
> > > > [    1.200004] host1x drm: iommu configuration for device failed with -ENOENT
> > > 
> > > Hmmm
> > > 
> > > This is a new logging, so it doesn't necessarily mean something has
> > > changed in the code flow.
> > > 
> > > It seems the issue is something in there is returning ENOENT when it
> > > probably should be ENODEV, but I haven't been able to guess where it
> > > comes from.
> > > 
> > > Can you do some tracing and figure out where under
> > > of_iommu_configure() this ENOENT return code is from?
> > 
> > I did the tracing and found that the ENOENT is coming from
> > sysfs_do_create_link_sd() in the following function call chain:
> > 
> > of_iommu_configure() -> iommu_probe_device() -> __iommu_probe_device() ->
> 
> What's the call path leading up to that? If it's the one from
> host1x_device_add() then it's expected and benign - for fiddly reasons,
> iommu_probe_device() ends up being called too early, but will soon be run
> again in the correct circumstances once we proceed into
> host1x_subdev_register()->device_add(). That will have been happening for
> years, we just never reported errors in that spot before (and frankly I'm
> not convinced it's valuable to have added it now).

Hmm. Prior to

commit 14891af3799e ("iommu: Move the iommu driver sysfs setup into
iommu_init/deinit_device()")

The error from iommu_device_link() was ignored. It seems like for most
of the years the probe actually succeeded, just with a mangled sysfs?

Though that host1x_device_add() ignored the return code does make me
wonder..

This is the only clue I see:

commit c95469aa5a188384ccf8ac520ece931c66caf8aa
Author: Alexandre Courbot <acourbot@nvidia.com>
Date:   Fri Feb 26 18:06:53 2016 +0900

    gpu: host1x: Set DMA ops on device creation
    
    Currently host1x-instanciated devices have their dma_ops left to NULL,
    which makes any DMA operation (like buffer import) on ARM64 fallback
    to the dummy_dma_ops and fail with an error.
    
    This patch calls of_dma_configure() with the host1x node when creating
    such a device, so the proper DMA operations are set.
    
    Suggested-by: Thierry Reding <thierry.reding@gmail.com>
    Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
    Signed-off-by: Thierry Reding <treding@nvidia.com>

Which is no longer happening anymore as failure of
iommu_probe_device() will not cause the dma ops to be setup.

So, if everything still works and something else is calling
of_dma_configure() prior to using the struct device for any DMA
operations (eg because a driver is always probed?) then we should just
delete this call.

Robin do you know more? Specifically where is the "soon be run again"?
Was the above issue fixed in commit 07397df29e57 ("dma-mapping: move
dma configuration to bus infrastructure") ?

Jason
