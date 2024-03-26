Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C0413340F
	for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711441608; cv=none; b=JrBIrWTN3VQyRNQWDcH3uImhuXUS5TbXNAm5AyZ3mfII4Q08g8ZdhGvdVFkdxnQIZ7eRR5mxPsQlnt+/qMbedgaOPmNZneZXPilycZ04Rw4y9y+5xoAkWz+ozemNCfwDPgv+4aCH8YZHuPVCotEDUy6JzP+nqpPze8oNuf0P+Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711441608; c=relaxed/simple;
	bh=U5m+8FX647w4/K2HXpnx2cvWPRgEHrgbpctLLo957Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzOG8oBbGbUCVphItPAU8jJrMR6Zh3UMfu30dU0UNBNULNLLNdFS82WahCZAK9Gbmt/+UqbKu+D6StuKWFcYL7rBfLEkbFBGVyZWJLAMDT+UpKm9N9wuEoAKKeRFho6Lg4Ds1Q2+laWXti02B3nWFBIn0igIyexdukxHrZkumzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Idb6tQtO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Idb6tQtO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ea7f2d093aso3427312b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711441606; x=1712046406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IntzFmsPrn2+uoKnC+EJNUNsN+NtjwIxBR/+rWXPmU=;
        b=Idb6tQtOZWceEwn3EChP7/g+o4u7prQN9I0Czp2LJ+WGjE2WeYa0aRquQfVERZAN2Z
         XOSn3yDI9FU8HUI8Iu9AiX0wLvAvdmSkmm0pTFNhLkTlFynr3fBEJJsz1p7R8l9OQ5XA
         8AHKlKVcHjHjmxF954NUj0HCdD3TYCouwTG3WuNtrsEaIT49KYjyUbRz89llwfoSdTSx
         +jkKrwYdceHhEox1Yz2UCph/tdAXG1gto8Ll2FiMs0CE7wuV0Kb1DhVT2FXKOds7Z6Tt
         hc0wEBFt5f2+lzi5Uvsdm/dILHW2kWUgS+1O3+/yOzxEOT152iLmNfaD6GRgZFPK0oGO
         PYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711441606; x=1712046406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IntzFmsPrn2+uoKnC+EJNUNsN+NtjwIxBR/+rWXPmU=;
        b=f4wXBJWrZkKKzdAPLiasxeA6SFBv4WxYXZwKnMrPcr0oPltLRS0kdLKmdvXQkuVqqZ
         6V0tVUIm5jt9QDKXj3qtuReNqx5rPL3WO2FxQRc92ZwttH1rNvrtdcon11HY4KaP46sX
         yi5TE5Hk9vxvfwFaP01qErwPtnmeHj1GsBeflILD2F7qW71cVYcnrcYYOjDnOCrMmdXK
         n5Ce1FkfJHv5yqhbfBe0qtf0P7hhVTM7vawqQLll1tR76xrd2oaVmZD/lQVJAmDP6sHU
         xfi+LAzSdbCREtJnj7XguhibstIVfFopolpDQLfM7AG5MQeaCBe31dGxGFDxb7impWvR
         LLhw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Smc+ZjGhbn12YpZ8PsD48r3lJlEQEKsq1yBWH6mdOEeS8cSrnNi3e7ExxyWgQL3OFQh+aEaq74/MwCvKYLJEBpYjmdEIvF2m+2w=
X-Gm-Message-State: AOJu0YxENKGNG4V3hWnJOrLwHpE+VEQ6YEbVQxHAbebA8eEe5utoGgsT
	9IeQwDNjUdh92rr2UcuQheNTzPb79O+cdQkZfuEuyQv9V/bdJQRodq1BeA3p7g==
X-Google-Smtp-Source: AGHT+IG2cCQjr2tiQ1gTo/RBtFnfWmQaUILNHd/nY6TpsRWeYwsnWDE7alZ4NDHWcHcOV3MNjKksBg==
X-Received: by 2002:a05:6a20:4da7:b0:1a3:dc61:d457 with SMTP id gj39-20020a056a204da700b001a3dc61d457mr164678pzb.3.1711441605602;
        Tue, 26 Mar 2024 01:26:45 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001e0a28f61d0sm6119095plb.70.2024.03.26.01.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 01:26:45 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:56:36 +0530
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
Message-ID: <20240326082636.GG9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-5-6134e6c1d491@linaro.org>
 <Zf2tXgKo-gc3qy1D@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2tXgKo-gc3qy1D@ryzen>

On Fri, Mar 22, 2024 at 05:10:06PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:44PM +0530, Manivannan Sadhasivam wrote:
> > To maintain uniformity across EPF drivers, let's move the DMA
> > initialization to EPC init callback. This will also allow us to deinit DMA
> > during PERST# assert in the further commits.
> > 
> > For EPC drivers without PERST#, DMA deinit will only happen during driver
> > unbind.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> For the record, I was debugging a problem related to EPF DMA recently
> and was dumping the DMA mask for the struct device of the epf driver.
> I was a bit confused to see it as 32-bits, even though the EPC driver
> has it set to 64-bits.
> 
> The current code works, because e.g., pci_epf_test_write(), etc,
> does:
> struct device *dma_dev = epf->epc->dev.parent;
> dma_map_single(dma_dev, ...);
> 
> but it also means that all EPF drivers will do this uglyness.
> 

This ugliness is required as long as the dmaengine is associated only with the
EPC.

> 
> 
> However, if a EPF driver does e.g.
> dma_alloc_coherent(), and sends in the struct *device for the EPF,
> which is the most logical thing to do IMO, it will use the wrong DMA
> mask.
> 
> Perhaps EPF or EPC code should make sure that the struct *device
> for the EPF will get the same DMA mask as epf->epc->dev.parent,
> so that EPF driver developer can use the struct *epf when calling
> e.g. dma_alloc_coherent().
> 

Makes sense. I think it can be done during bind() in the EPC core. Feel free to
submit a patch if you like, otherwise I'll keep it in my todo list.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
