Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A63D23BF9B
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964781; cv=none; b=RGDrK5TARZH1zY7x84X0pFZK+4nF0yYhr4Z0xwZw9Ms6gdCdEEFJAu0Vzt1NW25vA8PmKbrGN3BdZQTzu8/A8BwNmMoca4TnmxCm1+/m1E9/Kd0g0omVcZKs0LYMYYRqs6VF0BsX3xQSdPA0uOyvcSenm9rxsr4HtSsLA0WPTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964781; c=relaxed/simple;
	bh=l9yh5roB6TAD+eJpxkrTHsMLVCJdRJ3KS9fKxDqDNog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRKoXE1fM9Co4TrlmBsvf8IVtwy5XBp5gk37ohuBvjBfFjG3anJq+8AgU+/o/eRBPV4aaZbUqRUNAKO4OGRTq7CENjgrXkvqQm2AN3/73uzrZUCsvQociIojo56pF7lLUkcNHud2uVFlG4WMvnpPS1u9hRRDD3U8lIh05lqmmYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iXHGlJYu; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iXHGlJYu"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d094e26252so831237685a.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748964778; x=1749569578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mtQW3fkkCN4JKD2bOxa9OSXsumf197V91aZsIjfwDI=;
        b=iXHGlJYuIdwZTH47GRTUbOnPY8Iz3kqbDdX8FPDDdlDr3j/h7Aa/zvm3uoVdDzWElY
         rUEPYd4MCvKMYKO/tUDgtuc6LWRfMgBSG9AujRkVUQq/BfKVZqZJ1FomjEarYcfLTKM3
         4SIFtFbI3LCHXdmFDEjXyVB5cz42P9cjxHOQcnEcIwl+qjH287L+6NKkSogpVKd9D+KK
         9ba88EoPQNdEq0K/TyRJMLrHLS89BK7mbgDrgCC/kbYBGlwwvQbQ9R8UceGfNofQ3Hs4
         S+Pp8t8EVAsxw4iMRG937auj91oD3XKwr4yFhrWIlUpSM0/elrIz0QXyPgamJ92HI+15
         yNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748964778; x=1749569578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mtQW3fkkCN4JKD2bOxa9OSXsumf197V91aZsIjfwDI=;
        b=L72GWP6D4mWdGUftxVU+35OjwazhS7fcmJJqGqz8fQl+4qquOlBgBeX6m2fSeh2wlE
         oTKgkiaJ11KszaT1mMliUA2hX5wKrQqE8xeuWxKelkXhXgV82bVOgPT26V339oC1tbON
         NZpKpXHQeXrXFf6daAW43lko4fP5CgWQr2OoCMLdRZoJGZQ8dz5tXRhfLsZr2i8zR03N
         hPGFSQkTtX9J4P1A45PtzFcnB76y7k+6K1i3jAVF0jzCe2MK/O6YtEHYe6DZCqut6ZMd
         VRJ0R3T21BiwbYHtjhwSAMmGi8o8NPBUS03ZavxpUo970HKBYuflAkAwBOZnN1047R48
         XcMg==
X-Forwarded-Encrypted: i=1; AJvYcCUsQCu8H2adkGOg9xn5Y/Oolq1vSaq6Bw+TMQxJLFVeb8n9y0zow0Lqp9PNq1GtUtVBIFpXdH6RFLHLVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUqsWOgZ2YRMkz/GuKM2UXcQvu1vSNvsbTj+44FHNwZwS2GNP
	6B3wnpIBBiUsp7iABja/3XkhlwfWwKtm1et00Hol79g44rG4hY4amUUMIEI/nQW4zZ9C+IBOzn6
	hoCy3
X-Gm-Gg: ASbGncuIDb/cwg2LIM3ggeO2Psf+Bmi0Mho7fHQEuZof2ALaXbMT29biaeV/+KJHcZk
	dNO+EErQIXNOk/3siFIsnxX3xzyndSIx6A7Ds/mEM4ErCi+/vX3Mp07ZooZQp0IbSK4MD67u8w5
	0e0MBH1aKC+5s5f1ag70PqEPJQ4smdWGJnfI9U8eXdTb2dYz558RgSW04aD/WTGn5peTxyMnm7+
	mOHVoLTnlTYyEzgTZU0uwQQJJ7QxK/IvCc+n8i7//ozpqKAc5J/mM/9N7YavAcDEU/gIkyrkVU1
	wTQVB1Q+7F5r2P9REZerx5+rwMh/afNkst50GssKRK/AXAso9fEFKb2qeBWV40YjPxa8Q6Btj21
	Mg7qDzwG6MpbNSWNEPEXztBXANlE=
X-Google-Smtp-Source: AGHT+IGNetUYleKkkekxf29HMZ0X2KdHF1aj+g1S3YQFzx43O8VQkGEV1jpWL/mxUQXnB44kVfrbIQ==
X-Received: by 2002:a05:620a:6081:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7d0a4e396a1mr2453954585a.34.1748964778475;
        Tue, 03 Jun 2025 08:32:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a70fasm854998785a.95.2025.06.03.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:32:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMTdJ-00000001j8y-2UtV;
	Tue, 03 Jun 2025 12:32:57 -0300
Date: Tue, 3 Jun 2025 12:32:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, jonathanh@nvidia.com,
	baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de,
	regressions@lists.linux.dev, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [REGRESSION] EMEM address decode error when using Tegra210 media
 engines
Message-ID: <20250603153257.GB407166@ziepe.ca>
References: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>

On Tue, Jun 03, 2025 at 04:06:47PM +0100, Diogo Ivo wrote:
> Hello,
> 
> Commit 50568f87d1e233e introduced a regression when trying to use the media
> accelerators present on the Tegra X1 SoC.
> 
> I came across this regression when testing the branch [1] that leverages
> the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
> 50568f87d1e233e we see the following error messages after submitting a job
> through the TEGRA_CHANNEL_SUBMIT IOCTL:

Maybe this?

@@ -567,7 +567,7 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 
        /* The flush the page directory entry from caches */
        dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
-                                        sizeof(*pd), DMA_TO_DEVICE);
+                                        sizeof(pd->val[0]), DMA_TO_DEVICE);
 
        /* And flush the iommu */
        smmu_flush_ptc(smmu, as->pd_dma, offset);

It is the only mistake I was able to notice.

But I'd be puzzled - I'd expect bigger sizeof would make it slower not
broken.. Though your crash sure looks like either missing cache
coherency or a bad PTE construction.

Jason
