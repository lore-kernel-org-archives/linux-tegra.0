Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6141920DD7D
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977457; cv=none; b=DTPn9VdhD+GEyoAUakb22tiu+MInfn0zZRiZufWH2F8cv/eK65pk7nm5871WY3Ve0jhI3YZi3IUplZxf93GKzEmTDi369l4bCOE8CBJy0bweUmiBAHZLQtAjhodLF52Oxb5GQzyNuNYFdpbyA/LACXkFglOsaQtn5TZj55G+mTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977457; c=relaxed/simple;
	bh=1iE7kyMiiAkOz5s4QzZFSu3p3d86/ZBJI/5t8DJhip0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFNXdJVauPQKPyVehGacv9xtIySG4z6F8piMUatLIaaSUhI++EzkEsZ3N2ePBNtVxqcHMWGtlxyeshhSE5j1ziN/amPuGvLPlvVNrqSI/B+GyQLxKBfTVL64e69RzCZGXPoRrcA27EukQQLXl8vWX1LjTjcIK/Ql4lIjMYrtMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=aJLEqrYu; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aJLEqrYu"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fadb9a0325so32695336d6.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748977453; x=1749582253; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UXYCmwjnaG+anreKggrejlGyUaUlc7DjriLRrlaOB2k=;
        b=aJLEqrYuxxPFaMYFcVVrQw7TL0DIfo+dMOeyCw/J2Vbc6goaVfJzPZ0eXcxp4/HUOF
         WOt2ierBnFbQ4dXRchLfKXltLE2D4v7mKfvjDLbeNtdHbp8l7gZBtE6jCFtKM84L9l9U
         6b0C7fUaHPXNMBw/tWGFeASVab5AKnxwNdxvtDXRwUlb+THTYqnh2Z2gdsDozeCgJzMM
         HukQTI6j6UnoqysvaqMto4PqPCAcov/0ReBbk7oN6iBQV7udgXIAauMSM8sA14eanmsU
         QA82kde75MJ/NR/Q+UMqaxkncVwMoXPbbBeAJFaN2P0oh8/0tDVpQXaA/gUCMndiE+Vf
         QoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748977453; x=1749582253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXYCmwjnaG+anreKggrejlGyUaUlc7DjriLRrlaOB2k=;
        b=TBQEiXHpDQ0ECNinUhTtkpzYOcqRq9VjYsJNsOznQ7/3bXnF1xGJfBn1I2NU94BjD3
         zuriFBZotlh9s1gw4DRfAeya8stXi9GEZxAvct55UiRgnhvQ382KotD+OOLkynkmw2XY
         9LCNEFkdr2QzyEpOjNQehGMP44h1p9kWZHIygVX0Un9lrb6iO919+KoINZ1zjGmv9qkt
         BO+9d1taP+EO+naSRqj/gQ4PsO6wr+Tn9vI81PFvUL7fIdBHEzGPGbkAJDAQbHT6CRPy
         QBcPZrQ2OVXHslIfOvsONYnuZV+qLtJ57srv5LBk0RRgQIIwh6tR0Tm0ETvLQMlrYmK4
         +zLg==
X-Forwarded-Encrypted: i=1; AJvYcCXyWrYXWsiL3o2aQMj6Q2+7bpqFdtqUUDC3rYudUbQoJGPDpZR0Ph22isYOGnCmsQsgZHXm8mv2uIjs/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0IKLVfdom6NWVrra+BEpZfstwMxCL+9/VnmBPB9iZn1zDi2c
	KOqfWa9hSus5g/OxkuVNC4+1O7KJg7Mwl8HKGh0/vBvh0r4QD/5zQ2BlW2jKwoMaXu8=
X-Gm-Gg: ASbGnctX2OyAEU25mTa9YM7ERWg+joe1Z5gBIQk1f0BZEdAym6V8pDiW3g8bRQxI5el
	GZIeJYASXO6XifwClKScPq7JjuJf+/sYT9xt0CWFAtgDi66cL7+5HcOMD9VIabvY9vyB3D8UJpK
	v7KEG5JMbSoEHqZH+H1BCST8kAXDJMk1eA+dIe81ZPsRnTuUsajOsgx/vo+uk4pgIfbhIUr32ga
	lYyrSenu+63byA0CpJ7LrE8QcaJZ3pSG4qNyLUXFk134Ha32mxWDCVHTPxQFeRmuI0t2XlwSkna
	/RouSq5If3W+Yq9rBwBdnbTRXz5uSpF+w/AizdpjR5FoFZYJjZ7GRmD/nktz363DSTXOmvky+xP
	3Vlw52vQ4k0xqhQCzLzHrFa6Tu2GBqzmahiswYA==
X-Google-Smtp-Source: AGHT+IFFUZuPO+81N5QFepQ+p15xv6hiwM8o2n1pMfqmwA6DzUC9YiQS3MCF40Hc6U9DxrLtLQtJxw==
X-Received: by 2002:a05:6214:21c4:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-6fad1aad547mr291202096d6.37.1748977453083;
        Tue, 03 Jun 2025 12:04:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1c7b2sm85288206d6.111.2025.06.03.12.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 12:04:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMWvj-00000001ogI-3gkJ;
	Tue, 03 Jun 2025 16:04:11 -0300
Date: Tue, 3 Jun 2025 16:04:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
	vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com,
	jroedel@suse.de, regressions@lists.linux.dev,
	linux-tegra@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [REGRESSION] EMEM address decode error when using Tegra210 media
 engines
Message-ID: <20250603190411.GC407166@ziepe.ca>
References: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>
 <20250603153257.GB407166@ziepe.ca>
 <46ef896e-9b73-437f-bfa9-4dcae5089028@tecnico.ulisboa.pt>
 <ef7c8bf7-d6b1-4486-bb8c-04d24488ecdc@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef7c8bf7-d6b1-4486-bb8c-04d24488ecdc@arm.com>

On Tue, Jun 03, 2025 at 06:43:49PM +0100, Robin Murphy wrote:
> On 2025-06-03 5:52 pm, Diogo Ivo wrote:
> > 
> > On 6/3/25 4:32 PM, Jason Gunthorpe wrote:
> > > On Tue, Jun 03, 2025 at 04:06:47PM +0100, Diogo Ivo wrote:
> > > > Hello,
> > > > 
> > > > Commit 50568f87d1e233e introduced a regression when trying to
> > > > use the media
> > > > accelerators present on the Tegra X1 SoC.
> > > > 
> > > > I came across this regression when testing the branch [1] that leverages
> > > > the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
> > > > 50568f87d1e233e we see the following error messages after
> > > > submitting a job
> > > > through the TEGRA_CHANNEL_SUBMIT IOCTL:
> > > 
> > > Maybe this?
> > > 
> > > @@ -567,7 +567,7 @@ static void tegra_smmu_set_pde(struct
> > > tegra_smmu_as *as, unsigned long iova,
> > >          /* The flush the page directory entry from caches */
> > >          dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
> > > -                                        sizeof(*pd), DMA_TO_DEVICE);
> > > +                                        sizeof(pd->val[0]),
> > > DMA_TO_DEVICE);
> > >          /* And flush the iommu */
> > >          smmu_flush_ptc(smmu, as->pd_dma, offset);
> > > 
> > > It is the only mistake I was able to notice.
> > > 
> > > But I'd be puzzled - I'd expect bigger sizeof would make it slower not
> > > broken.. Though your crash sure looks like either missing cache
> > > coherency or a bad PTE construction.
> 
> I reckon the "unsigned long offset = pd_index * sizeof(*pd);" a few lines
> above is probably more impactful ;)

Oh yes, almost certainly. Very good of you to notice it!

Diogo how about this:

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 61897d50162dd7..72a400f7ae0c20 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -560,14 +560,14 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
        unsigned int pd_index = iova_pd_index(iova);
        struct tegra_smmu *smmu = as->smmu;
        struct tegra_pd *pd = as->pd;
-       unsigned long offset = pd_index * sizeof(*pd);
+       unsigned long offset = pd_index * sizeof(pd->val[0]);
 
        /* Set the page directory entry first */
        pd->val[pd_index] = value;
 
        /* The flush the page directory entry from caches */
        dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
-                                        sizeof(*pd), DMA_TO_DEVICE);
+                                        sizeof(pd->val[0]), DMA_TO_DEVICE);
 
        /* And flush the iommu */
        smmu_flush_ptc(smmu, as->pd_dma, offset);
