Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085974271
	for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429870; cv=none; b=mvZsscieSNTyE6ton7dLjTkW7jyKCHDpGOWRbCnnPvUx5U7Xl3ofwDXmHT93ZnaGrRmbuVCfifWwoVXzFDzmYR6lSEyCqg6Q61NAZAejro2B9HbvxUCSCdWo3sswnu/qbm5hL6sihPbPrcvCJegHyYVz8olizGu83yiqNxqtebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429870; c=relaxed/simple;
	bh=CBpicfl2jZnCC76RyM7G2pppIecHVAKp449ulgCHbMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lDKe4K8kMykM/WCYuFU9VQ7KmgSfeEHSPXOHC10yK/BQYEXHCBgoPAl7dOCmpxQn9o8Dk8l8Up37a3LEnrJ2oGURRVRBEkr85WO89LWY9M5ec6ivmJnaph1caxGq2GOvHErna1OxMwuXxupcyvvFNnZQkwhFc8FTN3uSehv4xis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zPVX3J8h; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zPVX3J8h"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6cafb2954so766993b3a.0
        for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429869; x=1711034669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZKNFv7W+z0Jmquv6Bh6TAujvuXFvLOzGspkZq/gQ/k=;
        b=zPVX3J8h6vPKSRPl40agelBQeWxJ1a8pQr4C7zcM0XmyOo9cWCxS4Osw8cYKGPB5g3
         Q/gWt0z1aBTPzpSjLmgHKUhlpqFvdKT2r19q5QTu/uHl78DiIVI3mOPdtSyNXCques6u
         QoGuslG4fKkQHjq2vCnFwLQMM1v1hLbPaE2yqRVLUrxuMJcl85dvRTTp3Eq55KMmQqcp
         RyAgfjqfMaraygeWfCFg+jALHiL2qNyN0EBkbHoQdA0BlFSd7k3eOukhOE1L3TBbgalV
         P+1yNeloa3HYfouNP+VPgZy3u1yJnO6jHN/D77jw4Hnqq2eKxUHny1JuEIqL45n6ccIF
         YyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429869; x=1711034669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZKNFv7W+z0Jmquv6Bh6TAujvuXFvLOzGspkZq/gQ/k=;
        b=dN1xT5v34nWuiId441q+NGbQU2IPC05l0IB4juUzlPLdGLiBguZSnuiuh46L4YDpoV
         /QrteVGvJuvn7XSR3uD1vubDs5T6Q2e3YZRK6qZGW0a1qGRhP8oYSBnpPMYRdKSWoP+J
         dw8mZSJ2N8LNZi9qLi+RrDB6oH9TGhPq4wQLsEHwEq4owx3HvAsQ7W7Kqco3dqJZMNOb
         1Cz1LqH2GePs+mmYSvFYtbpH3GSkvas6Bw0pFWfgDNjweyISkmbgPHVzsB+u8MPOAgfR
         0pb08P9TPJVY0+hh44K9gNGtvw8caPUh51AKOwQOIgBlbv+JIF1ieSo5DGxKSA6MRd9g
         +gSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUva1V+1reoDPDLvxYTLWGZwmcXGqrb6bTSB0c63HxnTffkxOe5NYGal2BrsfAyPWm4555WEGDc/e0M+fA9K5596oEok/fRgz1PUQw=
X-Gm-Message-State: AOJu0YwvJEaypmASYrMLXtdJ7PMyoQTPG/WGNTMbvarOyyJeK2oGCWUO
	Msh7UPBxVAnEOklg4WVBMuiNiZeklRS1IMwZu7PRnGrFzcmWB6PBqUaKDe82zA==
X-Google-Smtp-Source: AGHT+IF66n5aH76Dwfjq/9Zk53tqHbvE+/63K2G3MyytOYMIznHuwCihGVuqIpBwIw1J3oOM+HPzWg==
X-Received: by 2002:a05:6a20:12d5:b0:1a1:8c2f:39d7 with SMTP id v21-20020a056a2012d500b001a18c2f39d7mr465209pzg.34.1710429868800;
        Thu, 14 Mar 2024 08:24:28 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:28 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:44 +0530
Subject: [PATCH 05/11] PCI: epf-{mhi/test}: Move DMA initialization to EPC
 init callback
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-5-6134e6c1d491@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CBpicfl2jZnCC76RyM7G2pppIecHVAKp449ulgCHbMc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaP+o8zfBr0UizIqcxCHqrxTSXAATyIlsJwT
 F6IqVxYZHeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWjwAKCRBVnxHm/pHO
 9TJPB/9+jDVZAzNzQ64Fun9kiNXglbqEvRtb92z/JqLw9+ncYlfS3fJEf98CKNoFgGr6bDjyT9C
 kK6apBbEDwcNZ2WIi5QGuvdXuU7aVl/pP3+qkOlNSvWdBuxMvfcJZieT794IBIpvrUwVcf6/l/5
 KvFbJlU8lNGlsVsX93cr/vWPtE0f3zNv+C0tIdesuuPz/6jynH7Ib78QbuagPs7sHzLxB33uIC9
 ZeJ0qDsORVdgZOUqroJ8nqIsepuYBIKq3c5gkyGj+jHDZlrREvJT+YQDuxCAoUCasTmtFmMTesO
 7GU9Rn5mXuGwvyVlF6EaE+/8SWzr/xb/wGWDiS6lZIoZy5N0
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index da894a9a447e..4e4300efd9d7 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -737,6 +737,14 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	if (!epf_mhi->epc_features)
 		return -ENODATA;
 
+	if (info->flags & MHI_EPF_USE_DMA) {
+		ret = pci_epf_mhi_dma_init(epf_mhi);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -749,14 +757,6 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	struct device *dev = &epf->dev;
 	int ret;
 
-	if (info->flags & MHI_EPF_USE_DMA) {
-		ret = pci_epf_mhi_dma_init(epf_mhi);
-		if (ret) {
-			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
-			return ret;
-		}
-	}
-
 	mhi_cntrl->mmio = epf_mhi->mmio;
 	mhi_cntrl->irq = epf_mhi->irq;
 	mhi_cntrl->mru = info->mru;
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 2fac36553633..8f1e0cb08814 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -753,6 +753,12 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
 	bool msi_capable = true;
 	int ret;
 
+	epf_test->dma_supported = true;
+
+	ret = pci_epf_test_init_dma_chan(epf_test);
+	if (ret)
+		epf_test->dma_supported = false;
+
 	epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
 	if (epc_features) {
 		msix_capable = epc_features->msix_capable;
@@ -942,12 +948,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	if (ret)
 		return ret;
 
-	epf_test->dma_supported = true;
-
-	ret = pci_epf_test_init_dma_chan(epf_test);
-	if (ret)
-		epf_test->dma_supported = false;
-
 	return 0;
 }
 

-- 
2.25.1

