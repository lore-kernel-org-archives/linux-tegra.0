Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A213806DB
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935598; cv=none; b=tt+3cm6vgIoIQLXiV7g1ETqOlN4DFPVA/1prT+tna+q7Upz/0GGrTPphW3HCGe9NqnZpMEaxQ/ndSJdDY+EhTe2iszzpYMhUJOeYOjiEZlc7j1VIVxLg/jia05QtRDzNgrAUWC57BModMJ5jOQC5ZfblTFg4MTr/stvMAOUTF3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935598; c=relaxed/simple;
	bh=a15gvvp+Y5fZlu/XEV0GqfIuDaHqBSVDDZ/1cfRlK54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgFrgb8ypukl6Akb9gzK6w7UAzOWVC8J8VzTPRnKLRnnUwD7ZdZH6+1i+KFbW8+6mygW3UWHJQT6TP9UQqazClSAiqbUwij/AghfcRFoXU/NPkluPLT7c2ul1K7ORWs43ykeJGf2IQrjJlLRRMiqe4jgnZO5DrYKevnC5BxO2GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNELsXrj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNELsXrj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso5244821b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 04:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771935597; x=1772540397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVGEkSHpVszbSEuz8gxEX8sx0htTMLCK4ylQEIc8lKU=;
        b=FNELsXrjstFMRvTp8mDk5aEjKSoUczQGjiAwssYlllLRxIroPMDdw706CPQoM3+fRS
         fy5HS30nE0oxEb9Nbndw36s1EIfc2rpJ8jIuCYZDnUV1xTErcRZEOLGUZds50GmXG2OE
         JV3e5vRY5tC0mAXNUrkMQjWk8w4R6Qwe1vVpCewFv5Zp2eyaKq6k7DegVbnLGaLuvD9k
         ts4bYIQHDGpuxpGx/Uwo2Rt2sOezkGG5V8XNnY5RR5WJcQR7UOekNhdbRWA0wXJ/o84o
         0l0bR/W1VIqwH1wFfPxagyUgz5jUl5UflMW8kS9Uq+53Lb/Ns5s6v54MLfqplVGrJk8a
         BHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935597; x=1772540397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVGEkSHpVszbSEuz8gxEX8sx0htTMLCK4ylQEIc8lKU=;
        b=vrDi43etcGyeXkEnkl71zrDtOVdBBYPYTZilpG4fZtJ+9tprWXOoHdaWL/t+5ozURZ
         GYMiq+24kCpf10mVJp/T+u+91WpWuwi6+gZgieNc09AMh9ECczsFTMVFd/JFmG4dd7Qt
         iCr7omHBoLD+iLElphBZ1jhj3iXORDIcBb6u0wgD8q2F+3d3hfPocp+UGXvmlmAvuFIv
         5OTsWVB9ouAn00jcPo8fBjsFm8J4xg8qow/AhwCHDfPzdxkawsXUUhFMY4WeYAySuEg/
         5aCejvxFuAwY+ACvSkazQ7hZDMpsJLw6Jbw7WZnsDA7waIMzZ5LZ8iLftmuppmcblBuu
         wYog==
X-Forwarded-Encrypted: i=1; AJvYcCW/zpNxTschwuiN73vvC0ydHy8h1tbY3bteow8/aW/DpCbfYLeg+SurvpdWDglEtkBTORknI89+6pRY0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJFhIzlGE5YYHi65dTISQvmeElJSRTuk0l2S0T9Byv8rsLYzm
	B3048hdk3gLCgIns62xaZK1Zza0/LpFTymVukyUKXqsHRQytt/ZoFRGe
X-Gm-Gg: AZuq6aIX1GFsW/GEuKtNxy5kYkRV2Fc8znZLX4gdEO7iQFLibn+B5iSNIZDWbPjut6V
	shicLJdhKnxIavD11e1rmTUSc8TOV8GMR6h8dd8h4Jkz/aGpkxk+nk095srZakGh0nTM6QwN67c
	iRAD2W0X/3xwKJVtdOPPH82fStR7I/oZIbOqdSfH2vyhStxBoFZbNCld5dL5HrlZb18EJrErtNG
	Yk3MADY3yR4oOdDrIcoSVlYzyct1pY0/yKVs1kDolu/Lo5EwhgQP9NVjTr50i4oLPRrE9E2o76Y
	1I0S2uum+m8SvBjHNZpEnGo4Jg6xJnCgvlL4eVZyv3ZQe7UOUA2ENKmIudpCVRCWaUbZxkERJ+j
	lg35aEDO3FiJx6D9q2y2PQEUSmDwOCH7MV2r8Ij555RQ8DOVLoJaOdfTjW3hXzj2vHxbuiS0J6W
	ibq2YO2hxuhuwGLqxmPlY=
X-Received: by 2002:a05:6a00:440f:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-826da8c0f3emr9998493b3a.13.1771935597103;
        Tue, 24 Feb 2026 04:19:57 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ba11bsm10613950b3a.50.2026.02.24.04.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:19:55 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	linux-tegra@vger.kernel.org (open list:PCI DRIVER FOR NVIDIA TEGRA),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR NVIDIA TEGRA),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 0/5] PCI: tegra: A couple of cleanups
Date: Tue, 24 Feb 2026 17:48:56 +0530
Message-ID: <20260224121948.25218-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This small series provides two cleanup patches for the Tegra PCIe driver.
The overall goal is to replace custom, open-coded logic with standard
kernel helper functions.

These changes improve the driver's readability and maintainability by
everaging modern, well-tested APIs for clock management and register
polling.

v3: Fix the DT binding for nvidia,tegra-pcie.yaml
    tried to address issue for Krzysztof and Jon.
    Added missing regulator and new patch to fix the device tree check.
    Added missing entry in MAINTAINERS.

v2: Fix the DT binding for nvidia,tegra-pcie.yaml
    switch back to devm_clk_bulk_get_all to get all the clocks
    improve the commit message.

v1 Added new devicetree binding nvidia,tegra-pcie.yaml file.
   Switch from devm_clk_bulk_get_all() -> devm_clk_bulk_get() api.
   Fixed checkpatch warnings.

Tested on Jetson Nano 4 GB ram.

jetson-nano:~$ lspci -tvv
-[0000:00]-+-01.0-[01]----00.0  Intel Corporation Wireless 8265 / 8275
           \-02.0-[02]----00.0  Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller

v2:   https://lore.kernel.org/linux-tegra/20251215141603.6749-1-linux.amoon@gmail.com/
v1:   https://lore.kernel.org/linux-tegra/20250926072905.126737-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/linux-tegra/20250831190055.7952-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (5):
  dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
  arm64: dts: tegra: tegra186-p2771: Fix invalid PCIe nvidia,num-lanes
  PCI: tegra: Simplify clock handling by using clk_bulk*() functions
  PCI: tegra: Use readl_poll_timeout() for link status polling
  PCI: tegra: Use BIT() and GENMASK() macros for register definitions

 .../bindings/pci/nvidia,tegra-pcie.yaml       | 528 ++++++++++++++
 .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 ------------------
 MAINTAINERS                                   |   2 +-
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |   2 +-
 drivers/pci/controller/pci-tegra.c            | 237 +++----
 5 files changed, 621 insertions(+), 818 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.50.1

