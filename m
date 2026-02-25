Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D5129BD80
	for <linux-tegra@vger.kernel.org>; Wed, 25 Feb 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050533; cv=none; b=PGTXR1tFN9m3c8uPyzsxor5UMeYDBmCsVavMJLQSl7iA6bkT9X3lar6jNycaF0VZ/sMuiYzGjtxdC025om83pzxw/sMoJM8TkgDpMg0aCjL46/zgJqjf6uQEZNlTb6fR/lF+tE8qteYZVQzDQX1cKrt9wWuVR/v0a1dMH/H6m2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050533; c=relaxed/simple;
	bh=bs36U7Z6zD0Hnagwm/ZqHl1ycDYGkn0uTVkMRoGi2qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A94g6+jC5YmhHpWiYqxdiOJWQhfAgMd2owMTGS72tLZWViGk+xjaglgcNLEtckvO0v4zNXpIekQKPiTEaujDaSeZS5C/dxC75WbeX6xiMYANhPB/050RWnhsUuVn9CUcAm4GVIuhP0i16P0q5UZfEgwk4bvRECYEI8Uqf+d0vMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gdIrmXbQ; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gdIrmXbQ"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2ada9e4ea32so625ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Feb 2026 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772050530; x=1772655330; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4YyrNDRwRzkk9A2IzQ/QDYdpFxKzWLCjN0pyf/juCsM=;
        b=gdIrmXbQgS64eNB3vcNMG1Y/7MZrj19eHjwL/NVgz6ubaOhwfy5mmR03onlODD6Dge
         3Jo6Pc43vgzjPx47KGSgDMPlu5LoWPrTObyMvZkoUzQ03Ztol4VlPNSa5IbZqCudtAu4
         eQ/bxRTYDMBGMSXYIIFPkxQGfaj+B+dWPHbPpI/AJnUugEJ4ZOHAs08A0bGm7tiXkR47
         VLF0HpBBllCZzRPRzflqHXCdzMfEBcU5aOtYX02phgScW0xQdn6Xvg5Uz08QJwdsR4Y0
         LwmUx6KXvOZY/ssSsT0fULArDO4Tv088u7ePnUtl03Spx9iua4YT28YmiNq0L0pYDt2m
         BD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772050530; x=1772655330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YyrNDRwRzkk9A2IzQ/QDYdpFxKzWLCjN0pyf/juCsM=;
        b=Ok6CEOiapHzv6XtivsnYN5qaA6XnEfBPjPU4bD6oMVmW53dpoZ+Mvc3RyLAyN/v6+x
         /dBuAGKu77Ev82CX37kYBhbT4TPcAKZX9cBlF0UJlqTod3uqoMQ8kZ6slpmzu3IBNRxu
         btPRnOoKfVWMuWW21y92fZPsZyHl0Tkc2iGvViGuAE5AUP30ZguXyq4mSXyLaFS/LWJm
         cbjeJsQwXJeSsFzzWk7aQMTXqMsoKOP4yh4MaLWuTxK9wNMT1JY97qeNNvPDGw50Mmi1
         2En2FFVTOcz3ky+5dyPbW2/jwzGCY7MGTR7PKiUPoggq42rmClPgEzvbe8P/egkmXTSS
         XijA==
X-Forwarded-Encrypted: i=1; AJvYcCXRcydFowZr59sF7Ebe1lAPtba48xozCgZrXMR+KwTmY1V/ex5S+B82KD0eWRLHOLjt/J3XX4zLGn5Wmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZRhcacf8Xxfcr0rJgVyi2rcWiWQaUiK2dZlV1O7YNciaQgs/
	E712NAkNPi7twln4vA5OAA4e3oufmOofSOuwKWzz2qxIowlQV06A0UUpYmV0Vhxmdg==
X-Gm-Gg: ATEYQzwFfPBxELcH0hJIc0WAdtf3fPSFJANdiRDO6QFzcLHRcxeehW+1XJfXXpH1zul
	4J2yxfwhzybFCooNNDUrZVUStCiq0K5bTIgCCtVzQdIrcD34yDQm2eIayHBcFMEiXMPijjGe0Rm
	uoNPIqqIo7+og+v76x+pZoh6AfMs3P4fm61m674Q49pGd5pAJojVbElwkpNf4u8BO6k55PoLegt
	8F5hFhWxbsRbloTnbdK4A6tK27xs/VnORFNvwaAtns8Fu78kmV63E6ep5cE5p13GccxnLG0FTlT
	ojDa2ZooRNqZfPetR9uJRyfS565KzC1pZBRbyugHQxVzjoYdkkpotxDxJowILnBSAqCTgz04ORX
	Ri6iHjYvlq/9JK6qji9N8oolh9XskxaFt0BRkwdyIUnl7VfEA8hoF2pFHQenBaloURjFhkGeYPd
	oNYMhfMpuTCnxAHp3ffL9s2pBRDiZkbyvOp9a1AosB2zKu1YNZsztCeyQAevDu
X-Received: by 2002:a17:903:2a86:b0:29e:27f4:bac0 with SMTP id d9443c01a7336-2adf77c692amr376915ad.16.1772050529556;
        Wed, 25 Feb 2026 12:15:29 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6d5970sm502335ad.80.2026.02.25.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:15:28 -0800 (PST)
Date: Wed, 25 Feb 2026 20:15:24 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC] iommu/dma: Validate page before accessing P2PDMA
 state
Message-ID: <aZ9YXDleB5XyC7zt@google.com>
References: <20260224104257.1641429-1-amhetre@nvidia.com>
 <20260224123221.GM10607@unreal>
 <aZ4Q1HA9q1ojsVYY@google.com>
 <20260225075000.GA9541@unreal>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225075000.GA9541@unreal>

On Wed, Feb 25, 2026 at 09:50:00AM +0200, Leon Romanovsky wrote:
> On Tue, Feb 24, 2026 at 08:57:56PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Feb 24, 2026 at 02:32:21PM +0200, Leon Romanovsky wrote:
> > > On Tue, Feb 24, 2026 at 10:42:57AM +0000, Ashish Mhetre wrote:
> > > > When mapping scatter-gather entries that reference reserved
> > > > memory regions without struct page backing (e.g., bootloader created
> > > > carveouts), is_pci_p2pdma_page() dereferences the page pointer
> > > > returned by sg_page() without first verifying its validity.
> > > 
> > > I believe this behavior started after commit 88df6ab2f34b  
> > > ("mm: add folio_is_pci_p2pdma()"). Prior to that change, the
> > > is_zone_device_page(page) check would return false when given a
> > > non‑existent page pointer.
> > > 
> > 
> > Doesn't folio_is_pci_p2pdma() also check for zone device?
> > I see[1] that it does:
> > 
> > static inline bool folio_is_pci_p2pdma(const struct folio *folio)
> > {
> > 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> > 		folio_is_zone_device(folio) &&
> > 		folio->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
> > }
> > 
> > I believe the problem arises due to the page_folio() call in
> > folio_is_pci_p2pdma(page_folio(page)); within is_pci_p2pdma_page().
> > page_folio() assumes it has a valid struct page to work with. For these
> > carveouts, that isn't true.
> 
> Yes, i came to the same conclusion, just explained why it worked before.
> 

Ack.

> > 
> > Potentially something like the following would stop the crash:
> > 
> > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > index e3c2ccf872a8..e47876021afa 100644
> > --- a/include/linux/memremap.h
> > +++ b/include/linux/memremap.h
> > @@ -197,7 +197,8 @@ static inline void folio_set_zone_device_data(struct folio *folio, void *data)
> > 
> >  static inline bool is_pci_p2pdma_page(const struct page *page)
> >  {
> > -       return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> > +       return IS_ENABLED(CONFIG_PCI_P2PDMA) && page &&
> > +               pfn_valid(page_to_pfn(page)) &&
> 
> pfn_valid() is a relatively expensive function [1] to invoke in the data path,
> and is_pci_p2pdma_page() ends up being called in these execution flows.
> 

Right, that makes sense. Ideally, it shouldn't be there at either of the
places (iommu_dma_map_sg or is_pci_p2pdma_page()).

> [1] https://elixir.bootlin.com/linux/v6.19.3/source/include/linux/mmzone.h#L2167
> 
> >                 folio_is_pci_p2pdma(page_folio(page));
> >  }
> > 
> > 
> > But my broader question is: why are we calling a page-based API like 
> > is_pci_p2pdma_page() on non-struct-page memory in the first place?
> 
> +1
> 
> > Could we instead add a helper to verify if the sg_page() return value
> > is actually backed by a struct page?
> 
> According to the SG design, callers should store only struct page pointers.
> There is one known user that violates this requirement: dmabuf, which is
> gradually being migrated away from this behavior [2].
> 
> [2] https://lore.kernel.org/all/0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/
> 
> > If it isn't, we should arguably skip the P2PDMA logic entirely and fall
> > back to a dma_map_phys style path. Isn't handling these "pageless" physical
> > ranges the primary reason dma_map_phys exists?
> 
> Right. dma_map_sg() is indeed the wrong API to use for memory that is not
> backed by struct page pointers.
> 
> Thanks
> 

[--->8---]

Thanks,
Praan

