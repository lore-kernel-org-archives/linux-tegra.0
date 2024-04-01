Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FEC481DB
	for <linux-tegra@vger.kernel.org>; Mon,  1 Apr 2024 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986658; cv=none; b=JK/HgpIMeGRshJv4r9pF4NrQtG2ZUu1RIpNJOtdnoN5tEII5V+VDp69PHTz2RIylK+aST/5rgFNdpPBvc0q6OYnf7bKXlAYNm0hLA7MRe6FumGSY5J1lWFiXgz9kMPoM+uQFts2tlLfgCHbJwOnIh3/ksoCxlWzc33kA11mD6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986658; c=relaxed/simple;
	bh=rwb0ErsAMOJOBGTVMRpx900gyCjG88g972dlNjto2GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSWxKkg6+RzDNnfj0RQM+5REp+DUoQATMR6c4yEL5fl5pf6c+yg05MyO6rL7UA0mcnLrARrp/XyIQSnrWyidu2DKVbY2qBzKKdrvCgsxwANAieJexYcsCrB5QCN7Q6t1b5UPSNzGtCpyT9a9CJeiZN86h+vyX9jOcWvdTB5ySFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LB07Ez4b; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LB07Ez4b"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1def3340682so36289625ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 01 Apr 2024 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986655; x=1712591455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrN5HMtM25sMebZ7OPzRb4bH/7+xLTv/ToBzj1D+nVM=;
        b=LB07Ez4bmH+cvjJ4dYTQBr2Kam8X1wHhOCju7NswDvqrnbyLTap8RKPXbeeoQXx+ow
         U24VdsyaZqzwvFIdjSpKC1iSUU2TF0WcIKnMCgZXTU2jNlP1wjTA2u+3ZAFM9z76Yzns
         wnTmInTcJCJCTmIxBQ+yhNiO+JNmiJK5j8nwWUaJF7B5jSvHZjMup/BSL4vz/fjB5zmc
         RApaKH3uw8OmhQo69iLZnye/mBQEA3xbF0D+ekgX+R2U2q21onY7CaACwgKFolsqneBU
         6YRtxzxSJFuKLi1dVMLK3/ib8KhWEoeDTg0fWu6YR2JwC9PK3LihUAkiB+2AmCa6AhLg
         yRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986655; x=1712591455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrN5HMtM25sMebZ7OPzRb4bH/7+xLTv/ToBzj1D+nVM=;
        b=tlUpP+Kkz0nThbV6Z9y8bJzSHG1/YrYbJwPNtGWWcV+TUmPrd8n5k7zOtn6ZNhahWR
         DB8x7msNZhQ4PnZx31NQ8Fo7aQSgGgNYLo3G/d7nKOOsOjKdScFTs4lK0mJz4t/1r0u2
         ZWeebRp+6cJpN4rpPe22H3YyKX9fKDwtNzCawxgQTAYl9ugPym+gxBa4A5MV6ObOLZSD
         6BQXhvqBsUt0WFk+6ejGRmQ7mYtmTEL+jwEYpWUe2K0ImCOYu0tPSv8vC43z2S8w9bAr
         6Q3DnqzU0GFQnxI8EOCcThUS9DjDBvaKfs/kJUbcOPoRH36ZGEv55oeAW6lP1wGLG/Wn
         hcOw==
X-Forwarded-Encrypted: i=1; AJvYcCWjf/rjfJDZxcInrOh/N++mavsGDm8zugyoaEhagxpZkEPNaCKrKpA6TuUZrpAJ1Pd/ePiwPdhQmnBz451ODtuvsjk9PW2LVdtaouo=
X-Gm-Message-State: AOJu0YzlZx6I/xERBGUO7yxZM9g0iZwPE6zXkmfIMt4FX+ruXEeLGKEL
	SPfuegUzG6Hq17xs2+kljgMe3HZIVCcfmbkzpZbnfQR89P8GLRQ3A6faC43LLQ==
X-Google-Smtp-Source: AGHT+IF39HRm8jjnMyloFugbCcUu8btXf6eiHmmOu5g4fIblYTCoIk5bCK6gKkCClyNdWAmIhWpeiw==
X-Received: by 2002:a17:903:1112:b0:1e0:b689:950b with SMTP id n18-20020a170903111200b001e0b689950bmr12426593plh.16.1711986654875;
        Mon, 01 Apr 2024 08:50:54 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:50:54 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:27 +0530
Subject: [PATCH v2 01/10] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-1-970dbe90b99d@linaro.org>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
In-Reply-To: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=rwb0ErsAMOJOBGTVMRpx900gyCjG88g972dlNjto2GQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfTbHdb/NIZ4j2oaEOmJtQbURUAdORx/0MXJ
 2C+AX0dVXyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX0wAKCRBVnxHm/pHO
 9VaACACeknBp/KA4sTwit2LLbMMFCbWmaxjzozgXzDR6cM8p3cnLQfaO840eMISjPS+6luIH5Js
 rWpBVMbkc5CqPad3QyA4/nGN/XWVSLpPFs7xpv/k8m6uAucHOsFkotHQToKVgSnPFjoMTDqyf6h
 dgEHUBvZjmyk5Gd4ajsjuGsOm2iuXEobRe+F/VwvtWYODEKE1gx3BKF1JicHxgMGUpqZ/4cchVj
 2CjZvKYvSitmy+EXNj3ZDBNXgPbAunKidHvpuDiKoLEH3nrOtzr9M4BL6Ziyfig5x6zHsBAaz2Z
 zdBh5sM4eKVDqaPEvufI0LNt6UwHfKpJoNOb2dipbSD/0RPn
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All EP specific resources are enabled during PERST# deassert. As a counter
operation, all resources should be disabled during PERST# assert. There is
no point in skipping that if the link was not enabled.

This will also result in enablement of the resources twice if PERST# got
deasserted again. So remove the check from qcom_pcie_perst_assert() and
disable all the resources unconditionally.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..50b1635e3cbb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
-	struct device *dev = pci->dev;
-
-	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
-		dev_dbg(dev, "Link is already disabled\n");
-		return;
-	}
 
 	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);

-- 
2.25.1

