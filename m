Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7250271
	for <linux-tegra@vger.kernel.org>; Tue, 27 Feb 2024 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709059684; cv=none; b=FQ++F/o4Vao6bMDaqkglhY7RPof1ewA3I09rNdMeQRBZ755TmdHlacGTgUPiF7e81IjrTe03JV7qXTsjgGRXhi4UuKQEIKRBYtR0FNx7KMD0nIV3qo1F5BCsK3tuvtNPhl+PWTz2OLa1fBoJJEg9EAUql7LYahyQH2mc/gV9QJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709059684; c=relaxed/simple;
	bh=eopTjD6dnBhQmGbU1b50iW81wisqf1duKytlAiZoS+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpB2Sz5SkCIp5hKJmCg52ueO9w0IvvFLFfpGWKbhEZ/2O+BcGb2SrzpnophYy0Iw7Tcyd5CsHeODvHn/lfI8SiRMQJNdWPRuaZItQWdPJfjH1VvupwTu9e2CTOQ8ycs4TQHfiLRe7rJsjrxDnBmzse7lukcmNECuW9/4QgdkUGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R77E8hBV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R77E8hBV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so3793780b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Feb 2024 10:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709059682; x=1709664482; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8ShmjsBfirtuVXn7YN7NE2+9S2ssUe4qcNu7gqy8zk=;
        b=R77E8hBVMGqBGagFYRfwRcGo/Qk+s0Bpxn/QeEk4KyPQeYsl4IpIRxtCmy29ksnqPU
         3kRR25neRJUdEb2imXR1R0g4q9JBJkejJRjpurELLRsyK691fkcTL5wmkz06KN8fz0u2
         oOZAwczL8HsPOzQS4asKKlqZmKlLbz1Sd8IV8niWe2V0uK4Q2eaYcFSYfg9rwc4IeCdf
         SUipNY8f1Atcesj+CjQ/oekZSzSb1/ssEjVSQZIbArUXYPOn0lFBqzYEKyno90GZcsvJ
         K8/d1Sugq/CvIj5Y7yBAA/EMgnoXgdF8bL795rBUXLEDvr9drmK65/yWRXjOdObt2HJQ
         fYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059682; x=1709664482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8ShmjsBfirtuVXn7YN7NE2+9S2ssUe4qcNu7gqy8zk=;
        b=GJ9r3cQS4+W/KMvPhXOIpZrcuWz59o/Q7l/No5ffndNyl6f+Pf3rusUoaZ9bPFc5+w
         waaaWvyfZ18feHb1ogkLHpVuYWOFMms5CZFRfh+oQpvQn7CvGVlhS7eAOinhTI61RO2C
         wsVcG5bF8DCGBsMbLoneN9jW5iBAcEzwc/t0l08qCayFZiBTLkVMyHm+c0wea6slAdsZ
         gP7pDH3UIWvFOJvtoOUrq1WcvHoJIP2TWthTHnJJbD0yPD0yRXYncL5tsBJsgAR8Da3l
         ycY6CqtoBcfKHFJANMCp0tKDAFCOLc7moqI5q8QFZIjwYhSZBaZM3zuZW+ioLvimu2bw
         DYRg==
X-Forwarded-Encrypted: i=1; AJvYcCX6r++wGCcKbCuK20p1M5WXoSYDM3zPWRS80COI1a/yul7gMx9kKsBpqdCjJbmZkd7ABeIH+wb0cZav3i5h1dM1vFqA/VgfnYM9YGo=
X-Gm-Message-State: AOJu0YwPnrJ2JdJ2B/hkkKerCY1pIFpWxm7iwNcQqNK2gpilVhlXvose
	X9e85YaO0XEu24MNZhMvc5ys1tBSXA6eYIucHTeZM871K0Oj4gDKBVuWaKMKjA==
X-Google-Smtp-Source: AGHT+IGkys0fKbeS9Jt1kuxo+kV1ICMy26+vP7tNYAsfOhXbaH/LE978wltzQSZ6voKtVRqGdPcHyg==
X-Received: by 2002:a05:6a21:920b:b0:1a0:adbc:7a96 with SMTP id tl11-20020a056a21920b00b001a0adbc7a96mr3099279pzb.36.1709059682411;
        Tue, 27 Feb 2024 10:48:02 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id km8-20020a17090327c800b001d8f81ecebesm1845645plb.192.2024.02.27.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:48:02 -0800 (PST)
Date: Wed, 28 Feb 2024 00:17:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v8 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <20240227184746.GU2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
 <ZdzIada1H95ike0t@lizhi-Precision-Tower-5810>
 <20240227123230.GP2587@thinkpad>
 <Zd4dFyM78Nc1f7fk@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4dFyM78Nc1f7fk@lizhi-Precision-Tower-5810>

On Tue, Feb 27, 2024 at 12:34:15PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 06:02:30PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 12:20:41PM -0500, Frank Li wrote:
> > > On Sat, Feb 24, 2024 at 12:24:15PM +0530, Manivannan Sadhasivam wrote:
> > > > Now that the API is available, let's make use of it. It also handles the
> > > > reinitialization of DWC non-sticky registers in addition to sending the
> > > > notification to EPF drivers.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > index 2fb8c15e7a91..4e45bc4bca45 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > @@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
> > > >  	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> > > >  		dev_dbg(dev, "Received Linkdown event\n");
> > > >  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
> > > > -		pci_epc_linkdown(pci->ep.epc);
> > > > +		dw_pcie_ep_linkdown(&pci->ep);
> > > 
> > > Suppose pci_epc_linkdown() will call dw_pcie_ep_linkdown() ?
> > > why need direct call dw_pcie_ep_linkdown() here?
> > > 
> > 
> > I've already justified this in the commit message. Here is the excerpt:
> > 
> > "It also handles the reinitialization of DWC non-sticky registers in addition
> > to sending the notification to EPF drivers."
> 
> API function name is too similar. It is hard to know difference from API
> naming. It'd better to know what function do from function name.
> 

In reality we cannot name a function based on everything it does. The naming is
mostly based on what is the primary motive of the API and here it is handling
Link down event. Maybe dw_pcie_ep_handle_linkdown() would be an apt one, but
that's out of scope of this series (since changing that would also require
changes to other similar APIs).

- Mani

> Frank
> > 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
