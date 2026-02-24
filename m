Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D733B95B
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771966683; cv=none; b=VYqT28ToIKkIJ2gqvAJjzUTQLdt7ZWSHfeksvqyna2kR+und5lHClJpbgkmXnBYX7LOk9fs6SBUfkZH1T3Zy9Ph6zmqaS/RMGDP09ArTm4KqJL7hDDnOAfiS9JFkEp7NiKBhgI7LtYZKHiwuPtctn/HUWidvt7TtIA365J1P07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771966683; c=relaxed/simple;
	bh=kSwpkSCqUHWfyiluPXFGACIrpfsKwv5ePv+HerBIP4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8iFcQKhAduaRkjNSR7tcj63lJCh+E/B5haMX8cT2Uf05NlzWSCzQ0EK8zzfKcxBfMbc0MZq0ga5jQcKkixARPKH6M7ajHSC+xA03aoiwyCiHyHoTcd/Lu7eaRQcJt3Xhprc+xificydh9RS5X25bwIEyxu5sdEng+SgB0w7YxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g46smQj5; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g46smQj5"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a964077671so22325ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 12:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771966682; x=1772571482; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dCfIJGNanLX/GKzPG5uplkTp3s1FhuLnYoYswoYHgEA=;
        b=g46smQj5EV7/iZqJfMm9oqdSVVAeEdN4QWzQUZNVqw/OcullTFxSJ3YcX0+W12A+WZ
         LhoN5FgLhRN/affeRE8/mzmxvoM26U7+9WpBhDK6yqbiCb7lpg8bza2nhlVJzCgcFcVH
         NDIg2kclsz5pv5pQS3ju5pXnlCYEx/sqhTUxt1j+r2H2WHHHpsBJynSw+c0lPHfQCHyG
         2bZcgrsRZiEs24fsPiVY2t/+Z3PG7FFLX+PnBeGPs3qP0d3QH1GrRZygJIVW42R/3gAs
         aw6eOIrHKt++imDjw3O7j5pQwKtz5rDsTRiaWMqmNmLUH8eX2xXM+Qmdpn+qB27YVMcb
         8bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771966682; x=1772571482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCfIJGNanLX/GKzPG5uplkTp3s1FhuLnYoYswoYHgEA=;
        b=ZxiaCuDAmvAg0AjPTIkIMy5Yd6Jr2GnFvCcSGjVO7k+Hx2t2Xan9T0KOYKAE3RCneO
         iVOXA36exQgs6pQ9exsQ4g7ux0PVUXDH8AmpskpUuOot/YSZuTUYszJMnoac+AhJXuZM
         O6qX4CbtqR0sd/jEwFyfGWEC+qe8iYR/8xenPjc8UQ7q7as4KAPxM7moPXPip4BbB3rJ
         jRk0XmfGI+c8c361Nu9lI8IeY9IAjXuzLzawkYpbcGoOIJFCY7sI8SMy+giV8I24kJE4
         rGKEdaCt53vVAVnF3DMSstUXPO3jM7D2wVVGYioTQtGc9wvmb73RElA3nRtmkQ3yjDnE
         o7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIHHotiP0yagKiNb+mXW1iUJQd8EmBBDBEfUoVp4JCz1tfUzBDHB/53Sl17n3bpkKqFPFQ+BxOJwN5BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIn/rkeCTsX0AdlTmsTa44A5T+Dk9Od3Zk8/8dXy+qm2sihLn
	o+0c6mV1braTWio5V2DBJIslYE+uiFKbIg5T2gWWMEdC4nvOZHF+gAVCyt+Q8HV4kg==
X-Gm-Gg: ATEYQzzt9RCZz9vRUdsPnuczCkoONiIA46pq3iBChDnZknJjSxEX6RwhiskhhCG/Cz9
	UOWpcngRyP9TdY4LYdfbdbhlfU5sewDUz8k13xW/PiyIV+2s400Vfj91ZkXJdxQZqt6NIOrXptW
	HKDEDWGduGSvJcp5prT45MGFHOS7IEMQHo8ImgS5+N5geLqR5lvfD8a9gf008YriGny8j6o3+hj
	+zcsWLzv5ad7yTc7xCZfEqLGUgJAybu2zVge47Z7OpoVf7V+/Ei+LlFM8DROqRAUQl6swrrq5ic
	+m1sxCWFgdgG4npXLIu56HwcPoE6GfTWcGm5BI9dgRV5mGRFF6XR80cP/iS8/yPtWpN5f4ZdltN
	agDNES5Jtu///LfobU0ear4h62FBDhUTT09a84fCP9I1O4HfMXDunbNSbKoVlEBk1JwEZLgyi3I
	G26bc3aY2vbNS8g0ODsw9m5kIxKPaAlcEcpomgbK0mXwimadHuAM5ppGGDtzj/jhbWIVbM6V8=
X-Received: by 2002:a17:903:2410:b0:2a1:3cdc:7720 with SMTP id d9443c01a7336-2add13b3df7mr25705ad.21.1771966681213;
        Tue, 24 Feb 2026 12:58:01 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35902bdaffdsm686832a91.17.2026.02.24.12.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 12:58:00 -0800 (PST)
Date: Tue, 24 Feb 2026 20:57:56 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC] iommu/dma: Validate page before accessing P2PDMA
 state
Message-ID: <aZ4Q1HA9q1ojsVYY@google.com>
References: <20260224104257.1641429-1-amhetre@nvidia.com>
 <20260224123221.GM10607@unreal>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224123221.GM10607@unreal>

On Tue, Feb 24, 2026 at 02:32:21PM +0200, Leon Romanovsky wrote:
> On Tue, Feb 24, 2026 at 10:42:57AM +0000, Ashish Mhetre wrote:
> > When mapping scatter-gather entries that reference reserved
> > memory regions without struct page backing (e.g., bootloader created
> > carveouts), is_pci_p2pdma_page() dereferences the page pointer
> > returned by sg_page() without first verifying its validity.
> 
> I believe this behavior started after commit 88df6ab2f34b  
> ("mm: add folio_is_pci_p2pdma()"). Prior to that change, the
> is_zone_device_page(page) check would return false when given a
> non‑existent page pointer.
> 

Doesn't folio_is_pci_p2pdma() also check for zone device?
I see[1] that it does:

static inline bool folio_is_pci_p2pdma(const struct folio *folio)
{
	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
		folio_is_zone_device(folio) &&
		folio->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
}

I believe the problem arises due to the page_folio() call in
folio_is_pci_p2pdma(page_folio(page)); within is_pci_p2pdma_page().
page_folio() assumes it has a valid struct page to work with. For these
carveouts, that isn't true.

Potentially something like the following would stop the crash:

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index e3c2ccf872a8..e47876021afa 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -197,7 +197,8 @@ static inline void folio_set_zone_device_data(struct folio *folio, void *data)

 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
-       return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
+       return IS_ENABLED(CONFIG_PCI_P2PDMA) && page &&
+               pfn_valid(page_to_pfn(page)) &&
                folio_is_pci_p2pdma(page_folio(page));
 }


But my broader question is: why are we calling a page-based API like 
is_pci_p2pdma_page() on non-struct-page memory in the first place?
Could we instead add a helper to verify if the sg_page() return value
is actually backed by a struct page? If it isn't, we should arguably
skip the P2PDMA logic entirely and fall back to a dma_map_phys style 
path. Isn't handling these "pageless" physical ranges the primary reason
dma_map_phys exists?

+mm list

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v6.19.3/source/include/linux/memremap.h#L179


> If any fix is needed, the is_pci_p2pdma_page() must be changed and not iommu.
> 
> Thanks
> 
> > 
> > This causes a kernel paging fault when CONFIG_PCI_P2PDMA is enabled
> > and dma_map_sg_attrs() is called for memory regions that have no
> > associated struct page:
> > 
> > Unable to handle kernel paging request at virtual address fffffc007d100000
> >   ...
> >   Call trace:
> >    iommu_dma_map_sg+0x118/0x414
> >    dma_map_sg_attrs+0x38/0x44
> > 
> > Fix this by adding a pfn_valid() check before calling
> > is_pci_p2pdma_page(). If the page frame number is invalid, skip the
> > P2PDMA check entirely as such memory cannot be P2PDMA memory anyway.
> > 
> > Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> > ---
> >  drivers/iommu/dma-iommu.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index 5dac64be61bb..5f45f33b23c2 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -1423,6 +1423,9 @@ int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
> >  		size_t s_length = s->length;
> >  		size_t pad_len = (mask - iova_len + 1) & mask;
> >  
> > +		if (!pfn_valid(page_to_pfn(sg_page(s))))
> > +			goto post_pci_p2pdma;
> > +
> >  		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(s))) {
> >  		case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >  			/*
> > @@ -1449,6 +1452,7 @@ int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
> >  			goto out_restore_sg;
> >  		}
> >  
> > +post_pci_p2pdma:
> >  		sg_dma_address(s) = s_iova_off;
> >  		sg_dma_len(s) = s_length;
> >  		s->offset -= s_iova_off;
> > -- 
> > 2.25.1
> > 
> > 
> 
