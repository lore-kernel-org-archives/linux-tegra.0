Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36235465B
	for <linux-tegra@vger.kernel.org>; Tue, 30 Apr 2024 06:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457676; cv=none; b=gaxpdM4RZe/atujzhIkXXCIbtd5cUbqbmRpFn/imMvz4CUNDnOQdIhX01vS4na3sc+zYAmhX7YhS947VWmK0hwEvnIjvpSVpabE5Qx/HwEMPZ8H6zbGjIEBMAqCPbE6+g9pV9EGDTJOqm98iagY0+2eg/vP8fmz6DmGC2kNCWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457676; c=relaxed/simple;
	bh=k6wJF3EN6aRmkmMhxj7MuPWYMx698jnme1fa7UNZ/38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chDdJWu8vFLjnHYgzfm0E+h/yWS4uegfrk83LhBlcrLlC6/N9fdtbowdrslijFucwjy1YfB61waOWB03nJnkecvelL06oV451DDhPMk5k2EojmaYRxrSuHO+jlCd/LQaZyXgSzpACzHq3JhWgWkjNL+pIrCjEwH6Y+KVgzdTnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLrE2vyJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLrE2vyJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e834159f40so42655315ad.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 23:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457674; x=1715062474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5hSvb4uyPJ54kPzH7K5/6HoCGv5wEu2F/LB4hbEFp8=;
        b=MLrE2vyJDfRRYFesre3IbxoM0M6ZfSCzoUuhTUB9pKg/JbzW4fXLyTSquMuuJnLuSS
         GfPGl/XK8wRf5cJ1BQM76xI90nJ50z3jn4e1sxl/V5x3DBWzUyFHZ+x+NfL+3+G0PzoI
         /+RqdEpBMWZzl/yXIOdkMi8LwbX37ii8AVVWz25eKBYTd1yLi4SVOmORjmAhq//1Svln
         crchGUnLNoOKXDhnFWoDzpMfMoS4H7hFblpRpEsoKyQXG98Vq35GB0NQ0hd2qNtTVeip
         jLE0PwFEFLYyzFsN5ClXrT6curAz6Or7YVJ2+F2C0X6sy8vhbyweJ1qkiBbCz77MAPlm
         s4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457674; x=1715062474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5hSvb4uyPJ54kPzH7K5/6HoCGv5wEu2F/LB4hbEFp8=;
        b=jrfWShFoj3/BVOY/tiArCxIrg/OMWgNLlmw5BUcLqwiI+QrVvOt6w0mrYLidEml5Ry
         hAnJ3nmQsl95wOxOSWt66+cO+cCA0bRSC3URSSaNvigOwq9Pv5v76WZKVqKheZjQybos
         1UgiW9N9Gk6AvcPZkNfSnxHy7pWcQv8U7SaJ3VaiasrU8Kv7qVcBJzeH1KMwGruV6QbP
         wdpQXe3Re7EVWYjPvXXEmKOAplVyY5Yy9Yc7cyKw1kSfT+0NpVFPscnTSxHUC0EvbuSP
         lDkZ+3StMX+dTlSAhU6aKbSnE/IIDnC73Qko4DSZYDlXNQRnNT9smOrUk9ZC2CpQ2U42
         UW+A==
X-Forwarded-Encrypted: i=1; AJvYcCXvEa4HxYmdE0qDleVvzmlwqo2+TVKyV0ZdNSGxf9/Dv4kcvABXecGoFanjFOXfaX0LyDsy5ITTfxSZURGjpqkS0drJ/ssZg04GN8U=
X-Gm-Message-State: AOJu0Yx2hou1Ob04smXNR3I32yE2I2S+V0LP0EFc1eB+K+LNauR9CWVi
	6IgEaUTLNRgcU1fHOGpTxZcSUZOKROwz56SyX3gV5ZL+hqI6S4GubX6R4qG/vQ==
X-Google-Smtp-Source: AGHT+IGX8lbqUAItQ0yMmEiPFz/NJHhGg51DuVNt95DDcQS8ZGGfIFPc6uVZ0u3523qwhTRTM0DXlg==
X-Received: by 2002:a17:902:e808:b0:1e5:86ba:88b5 with SMTP id u8-20020a170902e80800b001e586ba88b5mr15538076plg.7.1714457674018;
        Mon, 29 Apr 2024 23:14:34 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:33 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:50 +0530
Subject: [PATCH v4 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-9-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=k6wJF3EN6aRmkmMhxj7MuPWYMx698jnme1fa7UNZ/38=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwcrYzciZg9ws1bBqYoxIutXEpuRniXqU0RC
 Z7E4BagdfqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHAAKCRBVnxHm/pHO
 9ZYUB/95SvHPv2j7LsEiAwDAMAlNSKfTzd90sEzInXtrvlRTVsUI5zSswK/S7crXSbscV/TlPEm
 BWhHSdxSvQwPwmjiZ3Q+Qgu79cJG5JPjjb950Xkm0bXreZL6SKa1ACLc39OjrB+XsmjxlwbHWl+
 RE/igJ2z6DSW2QRUyh50nANFwqBqg68+T5ARZ2McCRXsxcCShb3RgMXKgW52kOIBKuWTlVZ8lHV
 f3yuwMgkrH5s1etLMbGA+j3RAn/fNo526Pk8phIxs5nQh17q9KkfcP5YHeJGzM5ZvUxljWzxnHZ
 GPI0pgwZoOi3dMuZxzPZjeTXCsuO982uE8XY4Rc2TPAilmtr
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 3ee715df36ea..6106b005e66b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -635,7 +635,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received Bus Master Enable event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1

