Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188473160
	for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429854; cv=none; b=MDwfNWWs7efBgD/2gpWHSX9jscBQ7+3HJhlsiLMAym3vOoXG3HQ+JTkcxc4/YofcWSQ02ZiTRB5jBUelq8njhMb77HKBFUM8l+P5he3eYenoER6qb4WTOaU94CfJX6ZxqFuoYVYmi+i29xZQjtBAJIx/OhSvYiKaRYEpojOqD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429854; c=relaxed/simple;
	bh=JRZLwKxhEM0x8HfB67G9+Fzppqg8xFqlyA8aRxI9XHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIk5aB9yFuWt9rDk4NSqPaxyk90rxj8XhImr5LHxJyyyRgfX6UFAWiPRQtiXYqaW8/ocVZlyRE2YVvI1uwhGv3WDEb4PPOKbEDeAtRkX4R/JwfiHCqclJfIvUtLx9HdVrGl0dla5Oqst8X4aI7wI7ibdk4w5Wj9ieUww1b95yxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LK7PBwQM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LK7PBwQM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6b6e000a4so885699b3a.0
        for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429851; x=1711034651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IrOa9F9FCptyyElLcaGG4pDepSH3LTIYhrJfnXA2HI=;
        b=LK7PBwQMYWbLkvRxwvWy/ZjWPoXZwFihG1FkCi0AIudAoVAB1eS0H7bH/s3Oy6y6jk
         AF0rYbkid5IvNxMpChhQrDoMdEmVgp1vo/3+y8qmMI/rAnubePompPYvVzReDulzX1uo
         znWPI8C7hQ7CbQ94rPH/OCmc45KtaRYsRcckWj1zLLNAGwTiyhlLs+PNUWLdtLOAZPZc
         K7ufHM2XenZaIthORJ3vX0Ob+vOVNVNLsI8SJKRhetdnZ5+O/rdViopv6cbqRCxlyHK5
         s+/zYojZ32by9TLWxXMr9KYeZrHjwcYNalAIn9PuYIuBYNmGAPeXBvJuXZ+hZzkr0WGT
         lF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429851; x=1711034651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IrOa9F9FCptyyElLcaGG4pDepSH3LTIYhrJfnXA2HI=;
        b=bAS27QvZEuGentc7pjVWRKDYTaUxz5rdR0wbjms9fVhCzt2Y3j8gA6aNuAU8m9LLWF
         EZH0mTFjAtNrlm2nFGz3iOFFpOy5OdzHpfTxspey7uiNrGK48vcfW3lU7L+Be4z0oMlq
         i7OOqijZOGVm4E51BKQ7e4mUP9yWRXR4arV6Wct053juhICyviaG9+LpEzruTAJE6OT7
         5R8jwgaFi+AOTLh60FFCXWSonVRtcb9gHe/E3NJWbgfWYoA8gtdhB/a7LB97R+IuzVD7
         O7AkLDwleiQu2aQc/WUmfyAAiQMpGKCnEU8h3OdqWuxMqPKfUakoWVEYqrFmdkABrqWy
         HGPA==
X-Forwarded-Encrypted: i=1; AJvYcCXDcm2I/KUA+2lgcUXfAjWj4oBsHerX/LVJrjEVjYkWwR7YtZYa9RT4r8d/HsGZPuOC6qhherNd50t9FJyFTrvQzLIErRw7jgHWf3o=
X-Gm-Message-State: AOJu0YwHrOBP2sxhPlgwWU0EHjAg3qbOUwC5j2env1uhTw6o7BL6eTaE
	GhUmj07tNH25k5rkhQ4r04Lx3wA5+jaJIK+PB347w5OMqoRfht0fdK9RqGK/Nw==
X-Google-Smtp-Source: AGHT+IG7jwbZIclHbE1GnAK6Rj5Bq8CoICWzMlScgrOOGIyJU6eaD/H0E/Up5FStL4M0GtXAcOvRKg==
X-Received: by 2002:a05:6a20:3941:b0:1a1:e41:3edb with SMTP id r1-20020a056a20394100b001a10e413edbmr3110511pzg.11.1710429850762;
        Thu, 14 Mar 2024 08:24:10 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:40 +0530
Subject: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=JRZLwKxhEM0x8HfB67G9+Fzppqg8xFqlyA8aRxI9XHM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaOLrQOPVb1HVr/175Bwj4SLK9E64perYmGL
 IBSuWUMVHGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWjgAKCRBVnxHm/pHO
 9ROLCACSxVDvqf0sTonqAB4efCgXpbE8NA//bIFdXLvO2DxsLrdraqYdwvMEiH+CAtxrSHwW3cE
 FCGe61CdFCnn3hhtoh05WnTStcOoxu7X2p8Lah7zUn7BBg7dScjvASClkPt0iqwsQjNhi0LmwHW
 xSofd+6XrLFHrATDGnodX1uVN2PcZZSXJdHw5oINOdggFxeHD1m9exuzvl6s5gY5SJ3lgg4q8Nw
 SZ86dARIy67pxK4Tkui+6vLp8YpJuby4gtksND4QVksT3VGTatVl30dDQE+e86Ntl1YgSKaJost
 K6XAXGDFLhZf0jQo8+mwwqh3P5s4NtOxeKumlgu2yg6kSQ4B
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All EP specific resources are enabled during PERST# deassert. As a counter
operation, all resources should be disabled during PERST# assert. There is
no point in skipping that if the link was not enabled.

This will also result in enablement of the resources twice if PERST# got
deasserted again. So remove the check from qcom_pcie_perst_assert() and
disable all the resources unconditionally.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
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

