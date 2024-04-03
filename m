Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA94DA0C
	for <linux-tegra@vger.kernel.org>; Wed,  3 Apr 2024 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151969; cv=none; b=Pig4uV4zmcHQCr0YwjbvjTp1hRABAiEZO1NmHRU1Iga/ZI/0EqlWVsWyfgd52vIJ47CoBtVs2NOxfm6hR96heQF6AvT5JtUBSFrP0xKj1JFVyHjrBNK5FfYkhZUdj6RAJPZYVxa0G+ps4KKN0qnzq1hacfCwyrU4klDUXDTSdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151969; c=relaxed/simple;
	bh=oNVe7SUbSSVH8Hwzoz+0n5x3tQwhvVYI/rKOgk9P1Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edi42Kakgu+u/TbHGlgvmmO0fTS5u5uOmk+eXjg2IrxHCUAYNPoITanP9GeX5pRuRMyuTsT8ugvMLtudMN7WBkpNmaK1uetsgworJu308SNKeNy0MnOIIX1VYj0B1ht75L6taqJ3bz2u0jdMbc1VZL3P93A9ZgMLswoIhakpbYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpxgkZ0v; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpxgkZ0v"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e0878b76f3so8147935ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Apr 2024 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712151966; x=1712756766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=902P16CJPnj1xKchC1BfN1x8nt3eQDIalgicu+1Lvwk=;
        b=lpxgkZ0vASiLQ+/wepIN45dVAGmf9Zm+N8OKg48F7O3ybnu/PMWZSCTidHAS/p10km
         1OVI1Mmgo8kf03lcg4l3kHsjPyj3vsyqMEfwTDvJr4b4FJKBsordR+ZiTdc/z+R05hlk
         qjqk+DIFutN2gM1Tg3ByzlZ1TwUg2m4Ky0UOXzray5y5lPZ+C41NScuZZ0Exe3vXcZ8A
         FeJ7/xSwnTqokTHmXUE67+SMYdCvoQubW8HWAI2XLD023p/5CsZJ2NIGB52+P7q2DTil
         CXVtLh0MNotVxHBZRawG26x5w8Qki7WtZM9536mRQbbPXrJKbCdx4AqnrirQMIujtGHB
         YZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151966; x=1712756766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=902P16CJPnj1xKchC1BfN1x8nt3eQDIalgicu+1Lvwk=;
        b=Nz+t6kLNS1n1K5C4RiSNGNR0aq++PjEjjm7mrnXENOX9VhG5b8ZfTmwhXNZLrD5MO8
         hzE1kFh8TZKQss4VtqrUbZ3XAMpv1bwPuXGIzfnmSxuNq1N74eniavT+VX6l1ThOwtGP
         4x7yG2ElcbuRDxWMg9lsT0ZoK9Keda8G2FuuzzvGS6RmmRRjoGASqqZC4IE1s312Clj5
         /3ijTeGZr875g2d4TrHSf04V1od1JEbxeOd5ev35MY8iBZccTfeKNjOhaO8SZZZUStMo
         hhIw8GvVBuMI9v1/4+YIeR/zgtRK0yl4AXYPYvQN92x2GCq7Ib+qakWYJ1hIDmLaKXP/
         Cvpg==
X-Forwarded-Encrypted: i=1; AJvYcCXcX5p6Hv6+xXA7vwPLSYxcmSO+uin0goZEcpT9qwcr8eNcwXidsGzl9WyrurgLtDQQx/SUSjpIxPDMbS59VWcpWmxHExozoCODj5M=
X-Gm-Message-State: AOJu0Ywwnccx+Y2Winez4VrSYRfZq28auwrJ6VaNrPGqRTeig0gea7ad
	264HcxZzv6IXJegRhHCbc/Z5UK8YO4jSRsWLNl1xIefLX5IBayx2L7nRQ5Ew5w==
X-Google-Smtp-Source: AGHT+IHatIDalzVcNZetMx8G4eOcZq4CA3SOosvubbiLoS5X3FwlL5WkyiDNnVYB6kUtPKfF3k+0Ug==
X-Received: by 2002:a17:903:2282:b0:1e2:45f3:2d57 with SMTP id b2-20020a170903228200b001e245f32d57mr3249524plh.6.1712151965699;
        Wed, 03 Apr 2024 06:46:05 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902654500b001e290812d49sm1720356pln.226.2024.04.03.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:46:05 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:16:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 03/10] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to init()
Message-ID: <20240403134600.GL25309@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <20240401-pci-epf-rework-v2-3-970dbe90b99d@linaro.org>
 <ZgvjWtC0f1CY6DJs@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgvjWtC0f1CY6DJs@ryzen>

On Tue, Apr 02, 2024 at 12:52:10PM +0200, Niklas Cassel wrote:
> On Mon, Apr 01, 2024 at 09:20:29PM +0530, Manivannan Sadhasivam wrote:
> > core_init() callback is used to notify the EPC initialization event to the
> > EPF drivers. The 'core' prefix was used indicate that the controller IP
> > core has completed initialization. But it serves no purpose as the EPF
> > driver will only care about the EPC initialization as a whole and there is
> > no real benefit to distinguish the IP core part.
> > 
> > So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
> > just init() to make it more clear.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c  |  4 ++--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  4 ++--
> >  drivers/pci/endpoint/pci-epc-core.c           | 16 ++++++++--------
> >  include/linux/pci-epf.h                       |  4 ++--
> >  4 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 280863c0eeb9..b3c26ffd29a5 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -716,7 +716,7 @@ static void pci_epf_mhi_dma_deinit(struct pci_epf_mhi *epf_mhi)
> >  	epf_mhi->dma_chan_rx = NULL;
> >  }
> >  
> > -static int pci_epf_mhi_core_init(struct pci_epf *epf)
> > +static int pci_epf_mhi_epc_init(struct pci_epf *epf)
> >  {
> >  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> >  	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
> > @@ -897,7 +897,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
> >  }
> >  
> >  static const struct pci_epc_event_ops pci_epf_mhi_epc_event_ops = {
> > -	.core_init = pci_epf_mhi_core_init,
> > +	.init = pci_epf_mhi_epc_init,
> >  };
> >  
> >  static const struct pci_epc_bus_event_ops pci_epf_mhi_bus_event_ops = {
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 973db0b1bde2..abcb6ca61c4e 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -731,7 +731,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
> >  	return 0;
> >  }
> >  
> > -static int pci_epf_test_core_init(struct pci_epf *epf)
> > +static int pci_epf_test_epc_init(struct pci_epf *epf)
> 
> On V1 you agreed that it is better to remove 'epc' from the naming.
> (For both pci-epf-test and pci-epf-mhi).
> You seem to have forgotten to address this for V2.
> 

Oh yeah, sorry about that. I tried to address comments for both series and
apparently this one got missed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
