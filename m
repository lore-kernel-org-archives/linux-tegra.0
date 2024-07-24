Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB42D030
	for <linux-tegra@vger.kernel.org>; Wed, 24 Jul 2024 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829034; cv=none; b=joDGWop/zVYhA/bbzRNWDZSPZGsppb8K8EzpEvCeJeUEvZMDlI32UolwYaiBZVei64uxuNxmqtRKkBLOYltLTd1rXPGsqCf8FpXGLXKt8vuolsGMF3VQiiFPblXXr6vdiw+Syo/8AUE9De7QcDML/Z4Z6No5WEJtboEAjkOazXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829034; c=relaxed/simple;
	bh=s18bgWf0OFUxHbMJYtCB40QxzEeOIwnX88xESSf+9Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxB4fGCb2I5ztGWgtv0WunthPbWys9QDrqdPDuJGouWBl944KyT0PI8MyLTn7wFSGgDsGz+DWACisiOXtykJSelkzn8p0pF3Lnl74wU+rmWfsmf8aORYXLYyjimgnOidWVyKtrSc5maoHFchwWTjpv7pEiNSN2lEalHn+pNitb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3Yjsp1F; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3Yjsp1F"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d333d57cdso1990248b3a.3
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jul 2024 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721829032; x=1722433832; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbALP3QIjCL6mWz14PmpKACkxPrqfTSuSK7rkKg3La4=;
        b=v3Yjsp1FfWuzXR9KIvO1sxZkyZ4mOVGYGKyozb7kadyq1MoPFScmzH2QQHJYZe9WaM
         RD8KbmLLPq46jJSZhRkvJ09YODH1i4JmFjhNQZymiCsbjiRnmRZf/Rt37Idx2rmNUBHO
         h+bCoQGAAqbzsKs8yr6LiIhkXqQV6GPMJKj08dr4ZGNSLoQiDSbWbMTIckSTzjxZvHTv
         n6FBvJPMbvtDmMnihdG3uHF5APlKQeqYtOPiHXQMydY+9HecBLgebR1Jenm5ygvbvC7P
         YtRnphDYSMYHx4BYzPpt2XasfJY4+VvYDtr3Kmp/4/P6v4puN46UdB8YG9ohZi7wbNrZ
         GcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721829032; x=1722433832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbALP3QIjCL6mWz14PmpKACkxPrqfTSuSK7rkKg3La4=;
        b=JEc1rhV5TxiOWoaBFXBzpimiM8x7+VyL5Nzfv50M1yVELh4aUl/0mnbApf96DNpDOy
         ZixEFjGXQXPdv1leHO99NQN1q6V4EbOCG/lhl9IkehOqdvhpmLO6yvRfO43fSRTuy5BX
         1ySNrvWPNFW0mQmq2uCNLuiXM9EXeR9BeaebMzVPTicfr9MIwq/bfQd5UUnlFMystqm2
         DaYF9wTAbT42XjuI/Fwz0XmhM2PaFixTBNaYyWL0op9dtLrtXT81DHV8+pVXv/ePWnlR
         aNOR5vxJFWpw2zCCnV0TqeV48O5LeC2nO+Tdu+Jh11in0V5idVll8+y/uv77NxPn+LOo
         gzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLzt7d3ZyPMvzAKpOtAzYlpH10Ui+6V/EEVI666H2Ha6IAX/c5bDW3ORmDXSmmZ0YH2vGK8QrXhFgetlozddJm9GYzaf+s7M6hyUo=
X-Gm-Message-State: AOJu0YzIdLUSc57a+Ff34fQ/guqBac6WfsefzRWshtoaW0wYaE759Uul
	z3eUWiLWazXuNgf3Ggtompl9y5Z15E6wCgWm3vdsgDDRsnGT4KRCH1VOVgepeQ==
X-Google-Smtp-Source: AGHT+IG0YFoIL4lPnBLT+Aopu2jQ/kCeCrRtyAOg5jS+eqaqVK57qCofzoxxbC6rl3vwtZMbLKsHKg==
X-Received: by 2002:a05:6a00:a82:b0:70d:3337:7820 with SMTP id d2e1a72fcca58-70e99689086mr3278241b3a.8.1721829032049;
        Wed, 24 Jul 2024 06:50:32 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d22f50f46sm5507795b3a.77.2024.07.24.06.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 06:50:31 -0700 (PDT)
Date: Wed, 24 Jul 2024 19:20:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 00/15] genirq/msi: Silence set affinity failed warning
Message-ID: <20240724135020.GD3349@thinkpad>
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>

On Tue, Jul 23, 2024 at 03:27:00PM +0200, Marek Vasut wrote:
> Various PCIe controllers that mux MSIs onto single IRQ line produce these
> "IRQ%d: set affinity failed" warnings when entering suspend. Remove the
> .irq_set_affinity callbacks and make sure they are NULL in all affected
> controllers, so this warning in kernel/irq/msi.c is not triggered.
> 
> This has been compile-tested only on all but the R-Car PCI controller.
> 
> The clean ups are done per-driver so they can be easily reverted in case
> they break something.
> 

Whole series looks good to me (PCI controller specific patches).

FWIW,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Marek Vasut (15):
>   genirq/msi: Silence set affinity failed warning
>   PCI: aardvark: Silence set affinity failed warning
>   PCI: altera-msi: Silence set affinity failed warning
>   PCI: brcmstb: Silence set affinity failed warning
>   PCI: dwc: Silence set affinity failed warning
>   PCI: mediatek-gen3: Silence set affinity failed warning
>   PCI: mediatek: Silence set affinity failed warning
>   PCI: mobiveil: Silence set affinity failed warning
>   PCI: plda: Silence set affinity failed warning
>   PCI: rcar-host: Silence set affinity failed warning
>   PCI: tegra: Silence set affinity failed warning
>   PCI: vmd: Silence set affinity failed warning
>   PCI: xilinx-nwl: Silence set affinity failed warning
>   PCI: xilinx-xdma: Silence set affinity failed warning
>   PCI: xilinx: Silence set affinity failed warning
> 
>  drivers/pci/controller/dwc/pci-keystone.c           |  7 -------
>  drivers/pci/controller/dwc/pcie-designware-host.c   | 12 +++---------
>  .../pci/controller/mobiveil/pcie-mobiveil-host.c    | 11 ++---------
>  drivers/pci/controller/pci-aardvark.c               | 10 ++--------
>  drivers/pci/controller/pci-tegra.c                  | 10 ++--------
>  drivers/pci/controller/pcie-altera-msi.c            | 11 ++---------
>  drivers/pci/controller/pcie-brcmstb.c               | 11 ++---------
>  drivers/pci/controller/pcie-mediatek-gen3.c         | 13 +++----------
>  drivers/pci/controller/pcie-mediatek.c              | 11 ++---------
>  drivers/pci/controller/pcie-rcar-host.c             | 10 ++--------
>  drivers/pci/controller/pcie-xilinx-dma-pl.c         | 11 ++---------
>  drivers/pci/controller/pcie-xilinx-nwl.c            | 11 ++---------
>  drivers/pci/controller/pcie-xilinx.c                |  9 ++-------
>  drivers/pci/controller/plda/pcie-plda-host.c        | 11 ++---------
>  drivers/pci/controller/vmd.c                        | 13 +------------
>  include/linux/msi.h                                 |  2 ++
>  kernel/irq/msi.c                                    |  2 +-
>  17 files changed, 32 insertions(+), 133 deletions(-)
> 
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: "Pali Rohár" <pali@kernel.org>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Daire McNamara <daire.mcnamara@microchip.com>
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Cc: Jianjun Wang <jianjun.wang@mediatek.com>
> Cc: Jim Quinlan <jim2101024@gmail.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Jonathan Derrick <jonathan.derrick@linux.dev>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joyce Ooi <joyce.ooi@intel.com>
> Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Koichiro Den <den@valinux.co.jp>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> 
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
