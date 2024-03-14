Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A94C58104
	for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429849; cv=none; b=U6fC/8aymxpKellWukQLU/a3ciH1j2g2Bb/YVA3JwrPaxXxwAG/HEwlZ0dIT3QR0DTz1bImVtGxCtDqtNH9/qOJNn/jM7ScezKCqSWvODQi/0UAYuaQG57bxljvlcXj1MaXM3Y0OKFLCy8+JhpWP0z9jZEos8nswBBRjlmYcKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429849; c=relaxed/simple;
	bh=+XqMRpYE8HYIeYnArh9TOIJOZHL3dBFs8VCBPD9Q15c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jHAy1rlh4Otnxj8/pUaMKfQYbsc30QEKrDS6CHV977Og/hLpxPBl9gZNxIkehXpk+ti9sSmUlMGYMR/lrfdjdfgWRHVacQiYMvXbznqC65HyRJFmHUNGSODOFJ0mFghlCQgZKZFUpEzNlvPOw/Kc8zKnhGW5YQEpkI5NzrhiIzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlYqSTHf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlYqSTHf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso340890b3a.1
        for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429846; x=1711034646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uipF2nWjwEvJ8FinmI/99ZEfUz9FMdfPX7qMJmCrSQo=;
        b=BlYqSTHfD9UyaO7QVLhiSf54KlVc81u084CL0d6bDiHMVx3Qds5aFDQ+qTDpErSu2D
         XlsgTVI4RKjJVl3UMQktfDuibqduqOrh1HGRbdLv75+58BKu63/lUGl5jZhh+LuGrVLs
         8kpUs91JFZ+pfZUqE8+qm/rDtiTKciCLiRsD8O+HI+vtJ/KpVxNc2zfqKLDYN/40kpwD
         3oWLUx15fqU9rXyhUW7NKKBqoX5elZUesr90pwDIwyR/XrH9T9agOWbd4tynlBEo7H3t
         fTgegKj4w9RFNTSUWX97cUYfkHQhJSFpsxWMNnwlE72cPxLUDAkPfjtXOj2yfVGrKzCV
         3s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429846; x=1711034646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uipF2nWjwEvJ8FinmI/99ZEfUz9FMdfPX7qMJmCrSQo=;
        b=E+Asu2Z+hMltUXvLDE4KCBZFJ7+X40kWcHg+kl2BLxc/KeXMlgcvFQB8vzka3wc5wf
         QFHrKAb4Oodit3Ssrw0vQMq+w30d4u+d5Z3Pd4en1MmEE6RdmtMn98uMRq8xFu/8Yj+M
         2e/U6wOLl2IkZpQiYEvplW9n/qxG7XnC3vVSiFPDCyY3Kmq3i0HUs/kjC2WLJmSTO7v+
         fdd+y8K443Y//LTMYFEEDiOftKB/PwRs4+XrfdJ5mohP2V02fKoyqdf4gcn58QAE25H+
         tEsKtWg2acUQp5pWBIgcYut6zbO/cC8TH80dzjuG9wxekHlkJJtr9IjsGOS37mqJ9boG
         1atQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQrrLAQgCmG5ckxhek+nKq4A9/ZAV1llbeAiXM0q1fwo2ayGDZjnz32SIRA71grECVp52QMeJeytuDmAaRqRcc48YMYYBi2LI0zog=
X-Gm-Message-State: AOJu0YzuDI9H6OF1Hu0cWN2QIjxV1L13x3MBTf2Jfblu7lXADZBWSz2J
	Q7T/3fV07g+GREM5k1Kguv0qS5GUUH+mQvW4/R92UuCe4J0AZjnBTAUhhpG1pA==
X-Google-Smtp-Source: AGHT+IFklPwK5lYnqo3cgyMR3pbXaUxnP8BhUJMkvG0Mpsc5bJGrHi6YT+MWzcxtRkOPSBXX0DpvhA==
X-Received: by 2002:a05:6a21:99a2:b0:1a1:5a12:9119 with SMTP id ve34-20020a056a2199a200b001a15a129119mr8387816pzb.3.1710429846330;
        Thu, 14 Mar 2024 08:24:06 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/11] PCI: endpoint: Make host reboot handling more robust
Date: Thu, 14 Mar 2024 20:53:39 +0530
Message-Id: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsW82UC/x3MQQqAIBBA0avIrBtQs6KuEi2sphqCkhEqCO+et
 HyL/1+IJEwROvWC0MWRzyPDFAqmzR8rIc/ZYLV1ujQOw8RIYUGh+5QdfU11NRpd+qaFHAWhhZ9
 /2A8pfYuAfZ5gAAAA
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Niklas Cassel <cassel@kernel.org>, Vidya Sagar <vidyas@nvidia.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=+XqMRpYE8HYIeYnArh9TOIJOZHL3dBFs8VCBPD9Q15c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaJsDnRXWXOn639N6QSYpQWMRYVyNmaaXhJa
 fn0bkPxFe2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWiQAKCRBVnxHm/pHO
 9aycB/9b/o4Li6j8PqMVlSnWfc7wdfhcraMkEMFGScwUc/THnarLDa5UEMcMICzCyb9OLOWRndt
 oCBxFCx4BL1ZKDe4PUbQUdo47vJm12TLIoq5bnXsy8rl7eUSaxklwzQaG1HxCbenXX6Ob93oo3M
 nOaWZ/FWBuLztkGRERM5PsXEcw0ViOcPwn3IlQ/1qBvKdBCQ+bJEtrJFih8ES1wXtxMCeeeBMem
 0kVbsWosc0pA5xP6Q8EKQfQRX3VLIpRuoL1MmkEA+yQTL03Au8rJS8JowKwbh/MjtDwv+XSiSUu
 Xx+afP9RJhNfpvDPNHIJ/UKyy2Hhztd6xfR07xVMgfhQgjzZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hello,

This is the follow up series of [1], to improve the handling of host reboot in
the endpoint subsystem. This involves refining the PERST# and Link Down event
handling in both the controller and function drivers.

Testing
=======

This series is tested on Qcom SM8450 based development board with both MHI_EPF
and EPF_TEST function drivers.

Dependency
==========

This series depends on [1].

- Mani

[1] https://lore.kernel.org/linux-pci/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (11):
      PCI: qcom-ep: Disable resources unconditionally during PERST# assert
      PCI: endpoint: Decouple EPC and PCIe bus specific events
      PCI: endpoint: Rename core_init() callback in 'struct pci_epc_event_ops' to init()
      PCI: epf-test: Refactor pci_epf_test_unbind() function
      PCI: epf-{mhi/test}: Move DMA initialization to EPC init callback
      PCI: endpoint: Introduce EPC 'deinit' event and notify the EPF drivers
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: epf-test: Handle Link Down event
      PCI: qcom-ep: Rework {start/stop}_link() callbacks implementation
      PCI: tegra194: Rework {start/stop}_link() callbacks implementation

 drivers/pci/controller/dwc/pcie-designware-ep.c |  93 +++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  30 +++----
 drivers/pci/controller/dwc/pcie-tegra194.c      |  25 +++---
 drivers/pci/endpoint/functions/pci-epf-mhi.c    |  47 ++++++++---
 drivers/pci/endpoint/functions/pci-epf-test.c   | 108 +++++++++++++++++-------
 drivers/pci/endpoint/pci-epc-core.c             |  53 +++++++++---
 include/linux/pci-epc.h                         |   1 +
 include/linux/pci-epf.h                         |  27 ++++--
 9 files changed, 265 insertions(+), 124 deletions(-)
---
base-commit: d65c75fc384ada26392a975c351689ec4e069c50
change-id: 20240314-pci-epf-rework-a6e65b103a79

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

