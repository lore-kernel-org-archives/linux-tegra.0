Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE631CA87
	for <linux-tegra@vger.kernel.org>; Wed, 27 Mar 2024 06:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711520315; cv=none; b=Ir94bqRkmdT3PieRGLnVB0wpKHziH2mVu5FBqffM3KN9g68ynZ7nKambiYUZRB1efsCePI4BG1QxNyA5phco44DVfZOWNVlZb7Er/zyvXgEjnuiYBatH2HMbb1+aAO9CGzuzJi2ySnCrv68dHmFv2Ct14QMZqRQjAa+CmG+jqu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711520315; c=relaxed/simple;
	bh=QSWOd5QSD/Mwb0i+vtxbpmvy9IlXp1/N645iLIzqlgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kxp4H+l9zYAuchNwiIAtsu7x6GKytHa5GGVzNjKQ8QCvRYY69y6erfGDONduT1VIWqmSK5XjB9oZF4TdHVi82EoEygWO68WcksB1RagA653zsK04NVfwa5zQu1j4zHeHO7qMRm4QMUAUZTzpqglxJCGHa4xKhZyNW/KJLLsZVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpAs1eki; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpAs1eki"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e0025ef1efso41777365ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 23:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711520312; x=1712125112; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o0gjg83GHJ5iMw1grXSKgZDAg4bzhxIcgbatUtZtL1w=;
        b=BpAs1eki9UcYrHbYskq6BTJRGnVazUjcNoYWEcquZ4go4y217O2heUBhTAbAlfzi63
         hcoyCJ3Oby3LR2S9jIX3VYjp5dAS678VcM5fHkGB+lnQkCjXBAA4eXyMvNcXfxq7LuXc
         NnfTzf31USr8FlizdgP65bvOVRkRpAgZinQHTC245Q3qTKcrikksDiSPvK045vWwjxK4
         92JGmLIRGiN+D0dmWpeJe/hiBereYxVFb2Yu3Y3Xt+uETckXSMGCpGxeLRdjX9K1tuKY
         jx8Fn6wx9TckYgbZJN3GtHIh+siE8ohRialiOjTJCSZuvdXDKMvuRKWEJz/vsVmHqAUu
         0oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711520312; x=1712125112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0gjg83GHJ5iMw1grXSKgZDAg4bzhxIcgbatUtZtL1w=;
        b=rKKm9a1q1M82WMIhAoDwI4i0GBOCj3zwBFsTjHtnaslI3xvak/PLZ0ZCiG3UN1wzK7
         oXsclbbP2DgGPFuIGbiZjmfkSIu2m5Np/FJ73nzKCpdxw5mMlLohFtr8lsGJ5D/YAzfU
         cUnjA+VbRMyN8prYDuNyX5jM4gmqXHr5SyH0JkLq5A0N7v5Yole83cua8iDfyOWWL1yq
         w4nKhWUUTqT6crhwNsh+ACEzxPZ63uQy9ZXAuum7nC6lF3/57iQWekskxyLCfLWinPhH
         KmllF9Z6Qpof95RRfxcVq03Lpxnhl6Bo9n2y3eMzGFThx7AFuV/oZQfBMJytb56fTKUZ
         DfLw==
X-Forwarded-Encrypted: i=1; AJvYcCUyPndFKT4M/R/9wy+BvyqL/8Bg9eqN4qpGed+IJmTwWIcBLoClZ5/ztrTdRP+gybtvjqUJfEzdnkxpq9JZ0ylBmew5vVEYPlQ5sNw=
X-Gm-Message-State: AOJu0YyeLwK+tgmpmg7o7o7YT+1SUjBYf6Nld/H6hn6NapAoKzcQffZe
	ENrhQRexzNhaSWe7eepq13u2GvKMpUxIl4uwRT5kayFQSV22fdVR4uF/8CRfZQ==
X-Google-Smtp-Source: AGHT+IHji7g8cihtAriwVgPqznOHJahJLJB2a+jqLM2ts6GNSuhe4SxcmmyVioUmpWFcQTqU1N0vyg==
X-Received: by 2002:a17:902:ecc5:b0:1e0:342b:af6f with SMTP id a5-20020a170902ecc500b001e0342baf6fmr3668522plh.16.1711520311993;
        Tue, 26 Mar 2024 23:18:31 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f54a00b001e02875930asm8003160plf.25.2024.03.26.23.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:18:31 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:48:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 05/11] PCI: epf-{mhi/test}: Move DMA initialization to
 EPC init callback
Message-ID: <20240327055457.GA2742@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-5-6134e6c1d491@linaro.org>
 <Zf2tXgKo-gc3qy1D@ryzen>
 <20240326082636.GG9565@thinkpad>
 <ZgKsBoTvPWWhPO9e@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgKsBoTvPWWhPO9e@ryzen>

On Tue, Mar 26, 2024 at 12:05:42PM +0100, Niklas Cassel wrote:
> On Tue, Mar 26, 2024 at 01:56:36PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Mar 22, 2024 at 05:10:06PM +0100, Niklas Cassel wrote:
> > > On Thu, Mar 14, 2024 at 08:53:44PM +0530, Manivannan Sadhasivam wrote:
> > > > To maintain uniformity across EPF drivers, let's move the DMA
> > > > initialization to EPC init callback. This will also allow us to deinit DMA
> > > > during PERST# assert in the further commits.
> > > > 
> > > > For EPC drivers without PERST#, DMA deinit will only happen during driver
> > > > unbind.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > 
> > > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > > 
> > > 
> > > For the record, I was debugging a problem related to EPF DMA recently
> > > and was dumping the DMA mask for the struct device of the epf driver.
> > > I was a bit confused to see it as 32-bits, even though the EPC driver
> > > has it set to 64-bits.
> > > 
> > > The current code works, because e.g., pci_epf_test_write(), etc,
> > > does:
> > > struct device *dma_dev = epf->epc->dev.parent;
> > > dma_map_single(dma_dev, ...);
> > > 
> > > but it also means that all EPF drivers will do this uglyness.
> > > 
> > 
> > This ugliness is required as long as the dmaengine is associated only with the
> > EPC.
> > 
> > > 
> > > 
> > > However, if a EPF driver does e.g.
> > > dma_alloc_coherent(), and sends in the struct *device for the EPF,
> > > which is the most logical thing to do IMO, it will use the wrong DMA
> > > mask.
> > > 
> > > Perhaps EPF or EPC code should make sure that the struct *device
> > > for the EPF will get the same DMA mask as epf->epc->dev.parent,
> > > so that EPF driver developer can use the struct *epf when calling
> > > e.g. dma_alloc_coherent().
> > > 
> > 
> > Makes sense. I think it can be done during bind() in the EPC core. Feel free to
> > submit a patch if you like, otherwise I'll keep it in my todo list.
> 
> So we still want to test:
> -DMA API using the eDMA
> -DMA API using the "dummy" memcpy dma-channel.
> 

IMO, the test driver should just test one form of data transfer. Either CPU
memcpy (using iATU or something similar) or DMA. But I think the motive behind
using DMA memcpy is that to support platforms that do not pass DMA slave
channels in devicetree.

It is applicable to test driver but not to MHI driver since all DMA supported
MHI platforms will pass the DMA slave channels in devicetree.

> However, it seems like both pci-epf-mhi.c and pci-epf-test.c
> do either:
> -Use DMA API
> or
> -Use memcpy_fromio()/memcpy_toio() instead of DMA API
> 
> 
> To me, it seems like we should always be able to use
> DMA API (using either a eDMA or "dummy" memcpy).
> 

No, there are platforms that don't support DMA at all. Like Qcom SDX55, so we
still need to do CPU memcpy.

> I don't really see the need to have the path that does:
> memcpy_fromio()/memcpy_toio().
> 
> I know that for DWC, when using memcpy (and this also
> memcpy via DMA API), we need to map the address using
> iATU first.
> 
> But that could probably be done using another flag,
> perhaps rename that flag FLAG_USE_DMA to NEEDS_MAP or
> something.
> (Such that we can change these drivers to only have a
> code path that uses DMA API.)
> (...and making sure that inheriting the DMA mask does
> not affect the DMA mask for DMA_MEMCPY.)
> 
> But perhaps I am missing something... and DMA_MEMCPY is
> not always available?
> 

Yes.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
