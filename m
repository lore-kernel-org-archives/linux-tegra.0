Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371981311A9
	for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439081; cv=none; b=jnsyExRFw828sp/OcMLUUJPQw5lcyhn3WNCksX2dIPXBKCdD1LevzJp1JB817Ce7QW1QohAhFH8yg9yEdoXJ8AvPZAl7WEOplvJ6yjqt33XZAllsPO0c2K5s80+o/FUp4LcROZaBV5mQ5yh6XF5+eMiBc7UUCcYzIpNUPhUyQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439081; c=relaxed/simple;
	bh=MsrkW69p8rySCRtLMEt7t+ExHfkgy2bgx4K2VLJtRIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8TZaGDAkP28cnHuXx6+PCyrSbywjjVu+3EBBIhEfpewwPsJSc8DOapBiud96x/qHCqE/nUmUDcD+XftZHeW3fHHQwqdtLjSNiMaxM7Lys5kTaa3uYMkkJW86saFsI6BpFDzML25EDdNT1ETQm0MxbbDLvddCepj5UROtvdPWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K44Vpity; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K44Vpity"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29dee60302fso4225079a91.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711439077; x=1712043877; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltBMUKgzn3zhp60fMyljAq7QO/sGMekj2XSf0AJieWY=;
        b=K44Vpityl70wxDk+ib6CnDpqrxYFhnGK9av1CsMF9Ys4/iwNWdrVIi+FEhyxvce0CB
         gU9hm41RFiiUA963wzug+ypG3N2Ze6bOC1Raaxul8rWiyjM1J2EeaG/beRff2Lh8fMFH
         pmn6GVf8JKeX8kdB8Q8AEL7lKz3Ouv63hzVoKHz+7dTaH24WI13qMZCwb+3NEfN221+1
         JblUd0Gt4ZWQUIK0y1Trvniu5goKH17Up88VAPGiIaodMO3IJLVWc6zWyf2Zwj58PdXN
         DRHDOioCrIR0i6tMhz2P/tUnusQ+BUuVf4Y7zf2iV8wppt84ptibSximcUl1xjBzj8FD
         Q5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439077; x=1712043877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltBMUKgzn3zhp60fMyljAq7QO/sGMekj2XSf0AJieWY=;
        b=k7C/u0iHFP7roa+n87VTjY6EJFF2REsD+8rpQBLqdxbaLPXIG0yCtBCqkWPBz089jN
         nFuo1+vxu6vb9Xkjo6YY4d7b6LZtXMfEcPCrnczrDcId0dWWsieOF+LDzoxNuQFWBrGv
         CSDh+dJ6s7JM5ACNq01U4jb/ywfdRh3cRfAHNIrtMRk/cyv4f9oNDurgUFj0hKnLslbW
         FUnGpbdnYf69+adHSO7nYRhfSIci+EqUmDvOwhy88asQv/2lbfTNd4+1Y4wNWHFK8Ogx
         o0EMxuc09Y2YsWMg9cmKsUAOa8K+V5bbdZHT2Uo2QMEx1xyDLBMop0aN4T+EwdQYcUFJ
         KXhA==
X-Forwarded-Encrypted: i=1; AJvYcCUNHdfauUR/gDGdu7YVyh4sEtwYb1w9lFsp8M5YR++AEjXyy7hHgMpVdU5yyG15Qm/A0IR+LB5KldjgW1eQdhXsP+XKmAioCQlyqT8=
X-Gm-Message-State: AOJu0Ywae4oIQclCbm9xp+i1Q9DUoO4iUmMWuLWN4ak6yDCGWVpztE0f
	TnPlCSLUNsYzii+4TGbwPrzg77MM0oytgbpUYOZZbH5sRTqn4F3V+pgh9EaZtA==
X-Google-Smtp-Source: AGHT+IFpNW25eFjP8EzgblCKW0udVOJeCu+1W8FIYLgYCGlpAIzgTkcJLGCCZzYcvI56FkcxZcDtgA==
X-Received: by 2002:a17:90a:ec0d:b0:2a0:61ca:8d8a with SMTP id l13-20020a17090aec0d00b002a061ca8d8amr1054642pjy.6.1711439077214;
        Tue, 26 Mar 2024 00:44:37 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id q67-20020a17090a17c900b0029c5ee381dfsm8460725pja.26.2024.03.26.00.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:44:36 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:14:29 +0530
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
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326074429.GC9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2s9kTMlZncldWx@ryzen>

On Fri, Mar 22, 2024 at 05:08:22PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:40PM +0530, Manivannan Sadhasivam wrote:
> > All EP specific resources are enabled during PERST# deassert. As a counter
> > operation, all resources should be disabled during PERST# assert. There is
> > no point in skipping that if the link was not enabled.
> > 
> > This will also result in enablement of the resources twice if PERST# got
> > deasserted again. So remove the check from qcom_pcie_perst_assert() and
> > disable all the resources unconditionally.
> > 
> > Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 2fb8c15e7a91..50b1635e3cbb 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> >  static void qcom_pcie_perst_assert(struct dw_pcie *pci)
> >  {
> >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > -	struct device *dev = pci->dev;
> > -
> > -	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
> > -		dev_dbg(dev, "Link is already disabled\n");
> > -		return;
> > -	}
> >  
> >  	dw_pcie_ep_cleanup(&pci->ep);
> >  	qcom_pcie_disable_resources(pcie_ep);
> 
> Are you really sure that this is safe?
> 
> I think I remember seeing some splat in dmesg if some clks, or maybe it
> was regulators, got disabled while already being disabled.
> 
> Perhaps you could test it by simply calling:
> qcom_pcie_disable_resources();
> twice here, and see if you see and splat in dmesg.
> 

Calling the disable_resources() function twice will definitely result in the
splat. But here PERST# is level triggered, so I don't see how the EP can see
assert twice.

Am I missing something?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
