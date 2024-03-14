Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90A74C1E
	for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429894; cv=none; b=q7fehCAqDsttyRH4Tffna9B1Dg83nkpLSIe1/a8O8PzeYAv+SPXYpEI8jPWLaqmwlvbUoY2I9tAO8ay6lBO8xYnZ/wMTavU7re1oW5eMNix8wQ5hbRrSKZGDIvhrlGYye21/ZD/iUciiVESWi67EYxyHLZ6rxLNfvEchywXZFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429894; c=relaxed/simple;
	bh=hHeQESdb2n2JfoPbQGhczuNq7aes0p4VCwzYiQEpxZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSb1Fpd4kHn5Dra7xfBE0lSKAUEMU/C5n7fyP1QuybPzcxTJ2JRMY+uXlfHL0MxpA45O+zTdg1cMxgPi8UYJqZfvIY8CWJqvYnIDLTjxM5eU6Bo5DjOlErocEG3Br1y8Shk3tdFMSh3sRaNIQG3WqUeuau2XJPhhw6rcz05qlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSTQvwDE; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSTQvwDE"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e445b4f80bso455561a34.0
        for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429891; x=1711034691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAPCqDad3eib+irwWdn4c3jB6WrUBpvIqANM1/Xo8ds=;
        b=pSTQvwDESdYVRTDMINy4anraTmpdArHxuraiOMTwiou3GEuFPUjbxgW/aCG65vQks6
         0X4kmqu9kMHL9Eo1Do77T9HRG7tbtc1v1x50zK26302MFxnRGSZjdjyo6lk3awCp/hs7
         Ej/K/CRmyblvPuKOdyILgVbcyiTLbe0GU+UC9ukRZz0YTNMcrEpRsgQLiUVIng2EsdfW
         xFr/zQG0CXjciJ62oXIdUJjtNux6dc4RxhWoWpwdfP5sIuHoPRFv/D6pmX6wFE16AE7S
         KhJ38Nu7m2Zkg9SPz45se66uHytNP94fFwSR/yG7dGY/Md6vdeSqvu+mXAzDfhF+jPdc
         ck8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429891; x=1711034691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAPCqDad3eib+irwWdn4c3jB6WrUBpvIqANM1/Xo8ds=;
        b=ATq9DHb4BrWru3odzXTr/GwwK/0oJ0plDn9Yxj6kgNz6F7Pa5Ack98+g0baPEcwo8G
         p/3fcf32uDiL6RcssYW2Qf1FD0aPTeIl22gdSTSYk5H9x6nKJ5I/mrreCBGdGdG9i34c
         9AxzOF3CrQ88VY/MnpJNJ3k38Vx/IQ6NkMgyVZjNw6I+zii0tEr9dRohgleaUYOwjcMe
         WGOryjHtMnyMlx7Eq0SVL1wOA+GzVl31NJOyPcagoWWIweff8e27E1WYPJ9QEJ8H3eYJ
         T/bEDf6rtkx1Kwr8F88UXLR6DJmSZ0hzpWWLXNOCKyX79YEXJZWDAGgCGh4geaZJed7p
         Id5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQgpb2wXyfURznCRJAGrlVD++dYyKFpjTHHMB0bndQm8Y9OuOQzkXA0mm0bng7hgqX1vyEQND4oJzEuzl44uPi/CZyEZR4u9SexIA=
X-Gm-Message-State: AOJu0Yzf7dRR92pjwvp7s5P2htq3aGvLs65c2+FexMKLTrBGHq81bdUW
	SQ1qqNolTC4wVJqVxzpRrLNeNPcptoaDL1dmp/gHtw9GZZyz92sKKgXrv5077A==
X-Google-Smtp-Source: AGHT+IE64oFvYSc5N18qT9eho49uPQW+36wypqNmg2HTtOjDLk47z73mf9gPacmb4/W/bBMA5EydJQ==
X-Received: by 2002:a05:6870:64a5:b0:21f:d173:4f19 with SMTP id cz37-20020a05687064a500b0021fd1734f19mr2087318oab.40.1710429891056;
        Thu, 14 Mar 2024 08:24:51 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:50 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:49 +0530
Subject: [PATCH 10/11] PCI: qcom-ep: Rework {start/stop}_link() callbacks
 implementation
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-10-6134e6c1d491@linaro.org>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
In-Reply-To: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=hHeQESdb2n2JfoPbQGhczuNq7aes0p4VCwzYiQEpxZY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQfg97viBuOIgmUL62KebaBZQIQNgdeCdUj
 aCgxk36waWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9dH/B/93GdKJANpOSa22x4XiYazPXmYMSF7FXM0F0/rb0MhOjtc62toq2EEl6mi3yPtj3T/Gz5j
 ea1MwxgLD8daifKkQZmj1ZyR6luJ4Xar+fQFq3jcSvB+S2TDdgPmHA/dMtCYUBnO415ZZlEgxyi
 kn5bs1s2wkckx37TU65QJHX+Hffu/kuodZSw+zYUvnLwSEfkbw4xXUjuySbTnVVoR1pa6TuQT4M
 eLFMtcYj4maR+1bcv7bSGm9KXeJWHl3j7igzlknj4moBwRwE4UBQlVAxbhSIlsh9ObXdfhE12c0
 tZAkWrM06kPRlEbBYazKyTQ6wbkB+Vfid8ikgvuzgVrcUsdR
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

DWC specific start_link() and stop_link() callbacks are supposed to start
and stop the link training of the PCIe bus. But the current implementation
of this driver enables/disables the PERST# IRQ.

Even though this is not causing any issues, this creates inconsistency
among the controller drivers. So for the sake of consistency, let's just
start/stop the link training in these callbacks.

Also, PERST# IRQ is now enabled from the start itself, thus allowing the
controller driver to initialize the registers when PERST# gets deasserted
without waiting for the user intervention though configfs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 811f250e967a..653e4ace0a07 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -122,6 +122,9 @@
 /* PARF_CFG_BITS register fields */
 #define PARF_CFG_BITS_REQ_EXIT_L1SS_MSI_LTR_EN	BIT(1)
 
+/* PARF_LTSSM register fields */
+#define LTSSM_EN				BIT(8)
+
 /* ELBI registers */
 #define ELBI_SYS_STTS				0x08
 #define ELBI_CS2_ENABLE				0xa4
@@ -250,8 +253,12 @@ static int qcom_pcie_dw_link_up(struct dw_pcie *pci)
 static int qcom_pcie_dw_start_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+	u32 val;
 
-	enable_irq(pcie_ep->perst_irq);
+	/* Enable LTSSM */
+	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
+	val |= LTSSM_EN;
+	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
 
 	return 0;
 }
@@ -259,8 +266,12 @@ static int qcom_pcie_dw_start_link(struct dw_pcie *pci)
 static void qcom_pcie_dw_stop_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+	u32 val;
 
-	disable_irq(pcie_ep->perst_irq);
+	/* Disable LTSSM */
+	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
+	val &= ~LTSSM_EN;
+	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
 }
 
 static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
@@ -484,11 +495,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 
 	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
 
-	/* Enable LTSSM */
-	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
-	val |= BIT(8);
-	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
-
 	return 0;
 
 err_disable_resources:
@@ -707,7 +713,6 @@ static int qcom_pcie_ep_enable_irq_resources(struct platform_device *pdev,
 	}
 
 	pcie_ep->perst_irq = gpiod_to_irq(pcie_ep->reset);
-	irq_set_status_flags(pcie_ep->perst_irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(&pdev->dev, pcie_ep->perst_irq, NULL,
 					qcom_pcie_ep_perst_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,

-- 
2.25.1

