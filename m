Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3B160884
	for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441553; cv=none; b=lOqVhkmQnFgrNGNOX66P3P725cI0ik2WmG0IgrrAcfpAXWIGZjZAXvErQsTN/35ZHuDYb7DgKUL984FtYQ9VEdMUninCLLaqnqs3FQv78TPZFmr2TUkZ3uq+EtJpPGYXOvye56OIVU+ZNLEUwXXlXHo4nnHGZNpKXvvmM4mChN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441553; c=relaxed/simple;
	bh=0z6wX7i75zAQbc5rT+hGCcXotYGUGlxy6iIs1Con2yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8D5apPxVZhw0Zwufh2GX3TuJRHoE2VpVLm+Ry0jrjfLEVzfhvePFE0B4RgwIeTbEC8ZzJl7KueCpK2pD/ZvqL3qImM0A03Mon85zG9dA0zvToDbW46uQ4zvt2mfo+UhSpBT8lDWCVHgRt6w67KDdSvqi6umquOC7mLik/BogA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGAcee6F; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGAcee6F"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2351c03438cso249545fac.2
        for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713441550; x=1714046350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N2Z6xy8oQhfjIfDa8B6axpEslsZ8eq+zErFp+7u1hA=;
        b=bGAcee6F2vzAMddbo+//uDUxrf1Ui/nOdVOLxo+zCS6WtGZ3lbTD/NnXwtfWtr4zsk
         1GhRl5bCHV0FEEmgUMCl30J/iX0lbdGBwFeVrMLhJf8BkhsYNRVIlJ/4ti0/vlM4fBEk
         AlXSHhNUk8mcB3jog0P4FJjwDhs0foIuckx3sEeE5dzznmUOZW61toqONrDDUV6aKFqU
         zCKmpw/r0WQKfjL05qmaA1WHSJeCbRKTKDKlGTLZNC2AakkHYym8CMgaEPnA3laUk/zH
         3sJIDawwW3AYqB9Gwo5i6NX3gkHqp/syH486fzsIjggD2b4GU82f8omteeT6jc/fQ+gg
         VtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441550; x=1714046350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2N2Z6xy8oQhfjIfDa8B6axpEslsZ8eq+zErFp+7u1hA=;
        b=fRSs0NYq9Q/+KnnM5lpoEqr4Nmkaqq/30tyQba1U6lft+LmGthvYTtLS4ajOGgw6bF
         M/PEs8+g+n9YeaRSsvSy0ZQbN8VS7g7DhYWR6fiV50uTjTuKgUJAdB7TAA/37ACTBTul
         6xw4PbRI550OeKYRwzg7X6gBeF1s1Jp7YIhvezHWNCnCdEarS5eIth9mcJvyYz4nz+UU
         ey0g2wDn8n6U88T7fmaNRZVeHNbKT9w8+5LanhTheHfin4zFTT/D+lRnlQD+sGhVMsCP
         MzHaYVWNSnpOfnPJFJPiA3yPTPYgQDFJzTdhSf5MgAVVamR36PwNQ02P78J6zL3/JwYM
         8Bcg==
X-Forwarded-Encrypted: i=1; AJvYcCVbeJnQQGG7xPuNTwdcNBfFuGQ/8d52oAB6MS+luSHTTHzLvEaZZejrdpRb5ExKXc2UPq5SpySBqusU4Qu2EnoP/QuV0bw8cy0W60Q=
X-Gm-Message-State: AOJu0YyrBysv/qJ+XxCJzozCL8kK9Yt4VWx1NwTvtqwXQlwKSoE6+2Ap
	TQ22jwlpIe3XQbM+YGuYZo2b+iqmR2Lm3mjtZhV+f8ymU1CTy2mxlCLPcJ7g5Q==
X-Google-Smtp-Source: AGHT+IGqqD+K5zG10HIErj/uVTd8nkUVVpXS7lvDEvXl1IFawaGTfNbyTrK9ZXW3ToRDC5Vf7qCWgQ==
X-Received: by 2002:a05:6870:9a07:b0:233:5fa0:8b72 with SMTP id fo7-20020a0568709a0700b002335fa08b72mr3134116oab.27.1713441550127;
        Thu, 18 Apr 2024 04:59:10 -0700 (PDT)
Received: from [127.0.1.1] ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id ei16-20020a056a0080d000b006ed06c4074bsm1305512pfb.85.2024.04.18.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:59:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 18 Apr 2024 17:28:33 +0530
Subject: [PATCH v3 5/9] PCI: endpoint: pci-epf-{mhi/test}: Move DMA
 initialization to EPC init callback
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-pci-epf-rework-v3-5-222a5d1ed2e5@linaro.org>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
In-Reply-To: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=0z6wX7i75zAQbc5rT+hGCcXotYGUGlxy6iIs1Con2yc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmIQrzCIMss9Xjkc+w+Ay5cf4DIf0b4nbOW0HHv
 I2+r5lXzJeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZiEK8wAKCRBVnxHm/pHO
 9fSDB/97uQNmmFoSDfLvIRtqPL8WQZukYg0HqiFlU/A2DvHpF0l0a4/dOpB02EhlwCbzlgRsApX
 fnI5M09vT+w8De2g+dGSs7akU9bU6xtBY6d2JlPhD+6nIt4ONnfuKABaUHTt4vGTGb0X+sV7F1M
 SCbAz+4UgR3hMi3A4h/aoWe0yU0Bxu2pwlXpBVzb5I8WoVChpKfRBkGmqdcWij+zg6EuX8UyeJQ
 9i62Vjln9QTwFdV3peHBz66cj8gsmwVi/Wb3gSK/JDtHJtVnzvNS6laQyolSf4QIeULgqSp/QXm
 p3O41K0ndqaHwllHSz95vDE5zF1i2j1ukljaN7P2z82XwB6v
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index b662905e2532..205c02953f25 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -753,6 +753,14 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
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
 
@@ -765,14 +773,6 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
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
index 2430384f9a89..ab714108dfdb 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -739,6 +739,12 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
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
@@ -895,12 +901,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
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

