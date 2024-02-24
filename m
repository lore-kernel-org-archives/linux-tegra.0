Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0978E21A06
	for <linux-tegra@vger.kernel.org>; Sat, 24 Feb 2024 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757763; cv=none; b=bb3LjZQ26Ev49iD6rgUgEKdL4j5ypWPe9BcrCFP29wWx+URhT/Wa/cheTi8g5x8NEdX2CFWUxtTGxLORkg3ysaH/Whh4tujCjgu5yuKMXDDd9Yib/dpUNG2OKdEhExXeYbzxQ9aMbX2ByQuQdfb4HBGmowAbXtd25jV0C29V+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757763; c=relaxed/simple;
	bh=lMx8jaitSygvuxgneq9A64SvIefKCHyxvtG/ZW2Dw20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZ6Ctcmj6R3GrhH7FNtH167/qXG7oNgVMxMI03E0ZAMEvtdLZc3+LZlF5h9+HZOqbwxhwZ7+HYOLIdw+JvNO41UGYV9jwr9YW7nKAl3Xsm01DIjfXAmcpn0E234S1eghcAFAt0l3JKns6Z+/z+QUNLL+0WPaeaDk5TFFT8F6iWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZkeXl0Jb; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkeXl0Jb"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so1295561a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 22:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757742; x=1709362542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWp8V5CHI0uxSxSBbNBsR7PWeN0w7yn0quv2v4HN+ko=;
        b=ZkeXl0Jb+MJlnGoDqdBJhCYyv1tqdkC1+tRTOLbAbyd8qUcdNJ4lv6WYw3g0B/n8AD
         gynYStUEBAWy9Lohy22jcD9zi6GqVU0f/nzNsCnIm6Yus280HgPgpDxWTiJxLH0NGSYY
         0nTsj4joRwPCBLOgEtwGjSfNazPfKxNhoCq2fg9IOnYfY8pWQMH6CNUtv0OueyiOw/v1
         pYgB1aJ5QF5c/8wGzkgFSUQYcM9WQHNa/o2k3bvg70F39dQPka8IN+8vhdXudS7VzfOh
         3kNJkQC164PPdLehzff51YzILCa3FmjJLMWXOBPfqPA0DNy39jFdXSkaOmtABqf8SRos
         Jc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757742; x=1709362542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWp8V5CHI0uxSxSBbNBsR7PWeN0w7yn0quv2v4HN+ko=;
        b=CsAj6sxo4+gb0/MqAFk81q+SJp6Y1OIVkh83c6uIyjeLJXqNxKdnmS5zOabQuyUIjI
         caeLV/zDOzflEgstO+HXvwtb8JoY+ZoU8evpdQBIEYtZ3X2ItwcwIPceyDC9Jr0dtZhc
         gbH1+NX4NNkh3HvEkhYflf3FUo7G6Jox+ydRC803AQvKWHvk9I6i2SzwoNsj75z00/4R
         bFJppF/9RDtNkrkVfa6quUzEnKSrbSZ2SSCIbmlnwd/IBTXQVY3Vm5GKrcGcz6ze6d8K
         GWmFJG54PlLaUby65eCWlDCjqUEbMoepY4vqAZNSEqz1ZvhKcEfnbgj1szXhGpyWuZ18
         HUnA==
X-Forwarded-Encrypted: i=1; AJvYcCVLW3NGn8haG3AYDuhmqhOBr47kY0UhKoOXika6bF3LOhyk+/GGPbEW5J0ueYyH7sKDdPdpEFfIcDjHG2VNR69CM059RxIe+x2UMRM=
X-Gm-Message-State: AOJu0YzkLPBbKAm4sjngL4aZiOeTc4hfBMLltsmkyVfInoYw/uRGiuco
	EmGLO5zDytjVvTbALZ01c2z+PPEL+6syof5XtP53SyJ3OBs1lyhu42157Kg+UQ==
X-Google-Smtp-Source: AGHT+IFIskgaUGsMeIsmD3wiZleHjPkQUC5UtWw1p5Y1MMAUTOUlX+m9mazTIw4TXKmo+YHlNBnbOg==
X-Received: by 2002:a05:6a00:929f:b0:6e2:84fd:f1fa with SMTP id jw31-20020a056a00929f00b006e284fdf1famr2371986pfb.27.1708757742305;
        Fri, 23 Feb 2024 22:55:42 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:55:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:15 +0530
Subject: [PATCH v8 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=lMx8jaitSygvuxgneq9A64SvIefKCHyxvtG/ZW2Dw20=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKYYNXTQqfakMhAc2cB0T7CbXovjsrJ1sBzi
 8zlVkSivSSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSmAAKCRBVnxHm/pHO
 9cmyB/4qQE8r3RLSi2d/HtaZZLx8MEt1MwfmzXRoVQvk0BpZk52ucQfYu9tPZHtvn0QhqaeguMG
 kHvpOq/OjK6ysW9Mz9sksSLuftRowU+M/XSD5auWFruzs+MttLNgKNQ+42pc+8/zaQWqqrWsIqm
 rTNN6OWSBX2S9AXzHQrGuye7rAP7yNqGKkz49WYveJ7BuIwOumJ1qYjSXZ6ivJotKM30t7m3IuC
 nFvuH4vEiySlwwuD7OyQLZI5Zc5WQC0TdoFhLKX/170qukRMqF5jK9ngyp750FYG7zK71N2lU5A
 cdKGTDKtlqjjQuKRQBcEFzzYW037RMl2AedyC9A5V0SNMvMe
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..4e45bc4bca45 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1

