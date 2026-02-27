Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CF313E31
	for <linux-tegra@vger.kernel.org>; Fri, 27 Feb 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201332; cv=none; b=me2cr2pahzxkhFRolzKqq2tduqAtze/u0NEaPchSlZnQ++K+uuByZfsJfQGwBZfaJuikvCSkT8pXa9gBphkjR+IidmJt1zZc7AB+zEc8tesg3xP98MsuXBxqtXwR0XaDYlUaOPNbJX94ng7dGGr3DSZenE59e1yrmFl5U6t7ZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201332; c=relaxed/simple;
	bh=FiPOmkSP7ehgLmpdTYk5UUCfeoVIQIAHj0q6pX90Rco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1DCUrq5LFadVTcFUvcAX3NOLh+NWPOhBYV3DD/W3Uxwt2q+WxssV9LyeHSxampK2HSms/A/VpksEjzHBMUoO3ZLrA7FGG4he+roV6WXYLCIgga80KUzDVJg4FDmYaZd9Ya/6hHNlEnnt6Xzt62p5IMTq91Kc6X5XqAm6wnXro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MLC+cBcX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MLC+cBcX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a964077671so87275ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Feb 2026 06:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772201330; x=1772806130; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+478MnXHHm9he6xCScSmHIKPdUGXlF+DBnPVpCD0kfA=;
        b=MLC+cBcXlZd6dCDivqKaOdxdC0173OHpGlX9kfk8ztL6vGajp/MBm+4BfCRPm5EiC8
         uUxhtzuenDMkdLwK8LQjtE3no5S8CW6Mw8eIVGSpgyTcnqXizp524odnmTQQg061Lk8l
         IGurrMkxgFVbQli9BNQCWpNTGZbFP2W+6fCNosGdUpvRCwGQugScN1XoI4mq4DNQ/Co7
         zK59D4azH6diUBqEm6vcOgqRpERQYqbFl25l77J01a3oJfGCN3B/QpQpwSDQx/+jegsn
         xRrpsmmt3hjW02KugFvprCsY6cc2RI5RkY2FsDVEYeT43xEF7s/YnLMtsxkhT9zbncPw
         aO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201330; x=1772806130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+478MnXHHm9he6xCScSmHIKPdUGXlF+DBnPVpCD0kfA=;
        b=WLFDPRMwxsU0ufrwXlDNUGdpzhiXrE0HtOqEcJtT8p9NRBy6Po3LMEI+WyCWKJqMOJ
         EBXgG5TL3YXUGOiJ9s5/27CpuUkpVdV53avIakShB6Yduoi4AcOwneKD7/lUftzWJbWq
         Jx8s4Fo/zQozaTpHB9kZcGWluj163u2LxZTl0/DeKKN9odIUoQH7bZ9/Gzaqm+sP1mZJ
         xjL5KvJSEdFUso5owOQwPOfMCrGgtWHUr1IR61M6TwSsPZGp1SF01fuA1aqJM/jfVZym
         lrv/RNjweCt3sIYH01OBSmAsdJnXZ/+UmeBSWkbwsDHg5w5xCJaT8a7Tg6pCgAz1m+Qa
         S6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVz63I7FxzHp8ujzhewB1PPHeBzDGj085cbzziCctny0ZdS0NVi2YHZ0L+OB8G4QB0nzQaG3on35bM7iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycsTsDoTbnn0i7B4i77Kkvt2DuLeS8FHfq6xxbRfXxKVMT0K1f
	4Y8+xCy54c4omf2PmRPFuLKryZzupKWiGV3JDMuCbprjwNHptZjCKsm6eP3HjBDVCA==
X-Gm-Gg: ATEYQzzVi8ZQfw+46XnJzzk2XVRI+T13eNaA0EnInljRvrxQwjFGwLD5hVIDGymWy8p
	FFG6pjQiJiWNT4DlpSEMWXh6+CswjPn9JmZRoMm6GjxXbuWUbKMF+eUR0TZlhe5gvPXc49K88cm
	z4enrwddY1AVmD+TptSUPhbecjygkFKrHWsXzIkDgUbV9Vh913iDPPxRC2Uj8DdXjIC4XI3hBYU
	VAzn87HkoaDtOftAL2CFzquBZtCTLGC2o+qVAVfRfBg3PWheqdr4D5XLCXF2hs3Mwvta6aosWk2
	RHw2oUgyW4CYaB0o1FruIJ0EnhTzB3UZvZZgCn8JybV2c67AfoFPomYplJiCwi/7Nm5glTY2xDq
	XxjDWS36GIMNMNNeq1QLqyxp+UzC5HbumjT+hNdsu2mKIP+hae9HpBuivjsNfnqDXWQ2ef5NQPw
	ZL27Dn327oRd8nbEsdOOvQp7C2UejYqDDDhuxDYZHWMPi3sOzx4HoeKrXYkn07
X-Received: by 2002:a17:903:15ce:b0:2a3:cd98:f07 with SMTP id d9443c01a7336-2adfefd95b6mr4837465ad.3.1772201329615;
        Fri, 27 Feb 2026 06:08:49 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b148bsm77618315ad.10.2026.02.27.06.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:08:48 -0800 (PST)
Date: Fri, 27 Feb 2026 14:08:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, robin.murphy@arm.com,
	joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mm@kvack.org, jgg@ziepe.ca, jgg@nvidia.com
Subject: Re: [PATCH RFC] iommu/dma: Validate page before accessing P2PDMA
 state
Message-ID: <aaGlapPSmFJcXsDh@google.com>
References: <20260224104257.1641429-1-amhetre@nvidia.com>
 <20260224123221.GM10607@unreal>
 <aZ4Q1HA9q1ojsVYY@google.com>
 <9d01b4e3-be5b-4c9c-8088-1d10f67f1fd8@nvidia.com>
 <20260225075609.GB9541@unreal>
 <aZ9Xccnn7JOikudb@google.com>
 <20260226075806.GE12611@unreal>
 <58634d52-5d44-4ec9-b1f6-273b5c32b525@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58634d52-5d44-4ec9-b1f6-273b5c32b525@nvidia.com>

On Fri, Feb 27, 2026 at 11:16:02AM +0530, Ashish Mhetre wrote:
> 
> 
> On 2/26/2026 1:28 PM, Leon Romanovsky wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Wed, Feb 25, 2026 at 08:11:29PM +0000, Pranjal Shrivastava wrote:
> > > On Wed, Feb 25, 2026 at 09:56:09AM +0200, Leon Romanovsky wrote:
> > > > On Wed, Feb 25, 2026 at 10:19:41AM +0530, Ashish Mhetre wrote:
> > > > > 
> > > > > On 2/25/2026 2:27 AM, Pranjal Shrivastava wrote:
> > > > > > External email: Use caution opening links or attachments
> > > > > > 
> > > > > > 
> > > > > > On Tue, Feb 24, 2026 at 02:32:21PM +0200, Leon Romanovsky wrote:
> > > > > > > On Tue, Feb 24, 2026 at 10:42:57AM +0000, Ashish Mhetre wrote:
> > > > > > > > When mapping scatter-gather entries that reference reserved
> > > > > > > > memory regions without struct page backing (e.g., bootloader created
> > > > > > > > carveouts), is_pci_p2pdma_page() dereferences the page pointer
> > > > > > > > returned by sg_page() without first verifying its validity.
> > > > > > > I believe this behavior started after commit 88df6ab2f34b
> > > > > > > ("mm: add folio_is_pci_p2pdma()"). Prior to that change, the
> > > > > > > is_zone_device_page(page) check would return false when given a
> > > > > > > non‑existent page pointer.
> > > > > > > 
> > > > > Thanks Leon for the review. This crash started after commit 30280eee2db1
> > > > > ("iommu/dma: support PCI P2PDMA pages in dma-iommu map_sg").
> > > > > 
> > > > > > Doesn't folio_is_pci_p2pdma() also check for zone device?
> > > > > > I see[1] that it does:
> > > > > > 
> > > > > > static inline bool folio_is_pci_p2pdma(const struct folio *folio)
> > > > > > {
> > > > > >           return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> > > > > >                   folio_is_zone_device(folio) &&
> > > > > >                   folio->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
> > > > > > }
> > > > > > 
> > > > > > I believe the problem arises due to the page_folio() call in
> > > > > > folio_is_pci_p2pdma(page_folio(page)); within is_pci_p2pdma_page().
> > > > > > page_folio() assumes it has a valid struct page to work with. For these
> > > > > > carveouts, that isn't true.
> > > > > > 
> > > > > > Potentially something like the following would stop the crash:
> > > > > > 
> > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > index e3c2ccf872a8..e47876021afa 100644
> > > > > > --- a/include/linux/memremap.h
> > > > > > +++ b/include/linux/memremap.h
> > > > > > @@ -197,7 +197,8 @@ static inline void folio_set_zone_device_data(struct folio *folio, void *data)
> > > > > > 
> > > > > >    static inline bool is_pci_p2pdma_page(const struct page *page)
> > > > > >    {
> > > > > > -       return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> > > > > > +       return IS_ENABLED(CONFIG_PCI_P2PDMA) && page &&
> > > > > > +               pfn_valid(page_to_pfn(page)) &&
> > > > > >                   folio_is_pci_p2pdma(page_folio(page));
> > > > > >    }
> > > > > > 
> > > > > Yes, this will also fix the crash.
> > > > > 
> > > > > > But my broader question is: why are we calling a page-based API like
> > > > > > is_pci_p2pdma_page() on non-struct-page memory in the first place?
> > > > > > Could we instead add a helper to verify if the sg_page() return value
> > > > > > is actually backed by a struct page? If it isn't, we should arguably
> > > > > > skip the P2PDMA logic entirely and fall back to a dma_map_phys style
> > > > > > path. Isn't handling these "pageless" physical ranges the primary reason
> > > > > > dma_map_phys exists?
> > > > > Thanks for the feedback, Pranjal.
> > > > > 
> > > > > To clarify: are you suggesting we handle non-page-backed mappings inside
> > > > > iommu_dma_map_sg (within dma-iommu), or that callers should detect
> > > > > non-page-backed memory and use dma_map_phys instead of dma_map_sg?
> > > > The latter one.
> > > > 
> > > Yup, I meant the latter.
> > > 
> > > > > Former approach sounds better so that existing iommu_dma_map_sg callers
> > > > > don't need changes, but I'd like to confirm your preference.
> > > > The bug is in callers which used wrong API, they need to be adapted.
> > > Yes, the thing is, if the caller already knows that the region to be
> > > mapped is NOT struct page-backed, then why does it use dma_map_sg
> > > variants?
> > Before dma_map_phys() was added, there was no reliable way to DMA‑map
> > such memory, and using dma_map_sg() was a workaround that happened to

Ack.

> > work. I'm not sure whether it worked by design or by accident, but the
> > correct approach now is to use dma_map_phys().
> 
> Thanks Leon and Pranjal for the detailed feedback. I'll update our callers
> to use
> dma_map_phys() for non-page-backed buffers.
> 
> One question: would it make sense to add a check in iommu_dma_map_sg to
> fail gracefully when non-page-backed buffers are passed, instead of crashing
> the kernel?

In my opinion, the answer is no, since this is almost like the "should
the kernel protect developers from themselves" debate.. we should be a
little dramatic to make sure the developer doesn't call the wrong API.
Sure, we could return a DMA_MAPPING_ERROR or something but a silent 
DMA_MAPPING_ERROR can be ignored by a lazy driver resulting in a much
harder-to-debug scenario than a straight-forward crash.

The question is, are we sure to use scatterlists to represent non-paged
memory? 

If no, then why are we even calling the dma_map_sg* API?
struct scatterlist has a field "page_link" [1] which is literally the
struct page with a few bits representing something else.

If yes, then we could maybe encode some information (similar to
SG_CHAIN) representing if the sg is backed by a struct page. And then in
the *sg_map APIs, we could fallback to the dma_phys API if it isn't
struct paged-backed. (This would be quite some re-work and not limited
to the DMA API alone).

But as Leon pointed out that the use of sg for non-paged memory started
as a "work-around" since there was no equivalent API to dma_map_phys
earlier. Since that's the status quo, I'm leaning towards no.

But I think this gives us a nice opportunity to discuss if we really
*need* to have scatterlists to represent non-paged memory. I remember
some similar discussion happened during tcp_devmem reviews [2].

Adding Jason for his thoughts as well..

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v6.19.3/source/include/linux/scatterlist.h#L12
[2] https://lore.kernel.org/netdev/20241115015912.GA559636@ziepe.ca/
