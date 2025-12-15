Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1802B30F52B
	for <linux-tegra@vger.kernel.org>; Mon, 15 Dec 2025 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808179; cv=none; b=IZohy50qPqAWNu+x2c868+P3m66x9IRIxhyllYIcHMICpR6I0Tkj0nu4r1atrseZJqkHrymiaeBpKzEMeqZcEtnsTULncOPFH6B16Ep58BnmaJoVcbSGubVHd7u0sdVXZZdhz0rt+gy7dZ/ymGACEGDlShdKQ18aF9x2/Jnh3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808179; c=relaxed/simple;
	bh=i37Ne7uHL/y4kp6pZyX/ySd/DfSKUARKKWMR9IDTZkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNbIEaJuvEjv4GZrR4petY7J0/8qfQYUvLpQb+We2ktJb5qmuAj3rna+RCRMi2x92drs9fPPkp69NBahyCIv1nF8B2IEjCoxNg7YSEBzxT1VUDQj2dOv4aat5oG0jjpAKHuUD+870kUqDpFZqxawDVBvFvfF5Zqw95znsKdO3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxJlDgRi; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxJlDgRi"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3661459b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Dec 2025 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765808171; x=1766412971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqcyxQ6AG4Chn3aVf8oO4S4Fgo01WzKngrtkHDhk3Yw=;
        b=fxJlDgRiNAVqWADAbe3W8kbU5Qa68ZHGFh42sjC9ElCVd2IS9J151SPd1IUtfqEtIn
         S0Miw6eFBVJuHsH16Kfu5fAtrwotNBsXnMezqeciClOrR+c+3N7JL+0f0M+5idc209s6
         FNot2Q9Mq4JGeg8NrIHdkx/8RVV6tdFGHxct0A6d0dBXViaVnUB/Nn08eGTk5Og0qikZ
         Li5HTiRyf+ZoBT9oWytcy/iVuw+AA3xOq4/NJs7uJJaYO2x3WO49DZ31n5KliTFr1FE1
         P2jlTSiLLNPkBKMn8zma/GqXQfKrwHHiAxzA8ctVWKxG4vOyW+9oR7v3pEdiNm03TlUE
         cFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808171; x=1766412971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqcyxQ6AG4Chn3aVf8oO4S4Fgo01WzKngrtkHDhk3Yw=;
        b=kEk84ijO5VtTwoQrB+uOgHnADH5Ak6ZlISrquGPqEYX0qrdOumjlCnxVpbUXfQa6yp
         yqpk5cIivlzI49B++BItjHWyuyIWQPNYbAQtONQnv9bh/9p0XTcCjILsj8AA11RZciqv
         9KRScTBo9EzXSXipwrMlxiDlxi9JuiuVGGw8Pea3nfhK8lfOJBkYplTdeaaKErxQv8RP
         bAW+8DRS10qY0qWZatMU9WpTNk2ugkzxQvt9o0MkFquxbp+x+OGwbbzNtsKMK4bVEtgj
         Ki71NoNvIF/ueBtVZCazmgviGfj0IokfutHESHxkMFfDOkQla52Ew+ApR2TN1ZjQYZLd
         0tUA==
X-Forwarded-Encrypted: i=1; AJvYcCU84RgwAMxJT/g39nSDrcClb3b2dzrSaCpo2hCC3AETduifHWSMjqTg2eL+3QB8VsiQkwQ/WFAT6H/ZHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKToLD3xlEGV8MRW5sQaS0OMSWLJpHOGUYQHvZVsg95n4rPZf
	qaivgI3KDNdAE+rdtt1UGuryqS1yS2lUZRWBlZhmtuqiJvitN4cqITu1
X-Gm-Gg: AY/fxX6CNJsuB4cQH+5aiOZeUCcqkejWitmG59samm1EUlXSGmL3eWrDIY+rVxBhhgR
	+g2kTXt3QUsfZUPW+hfwIADaqklVBaEB4iXcgIVpJ2pB4iZik+yppconm07JDJlBPf0KCGPjI0S
	UhceWv8X+D8tFt4HPTT8A40XmpGRRGbYfD+zPp5UWYHmXUayt8gckJDcfK6/mvituXSmUFK17yn
	PaxByjsI3TPI43oMn+wYO0dU71E9q4MMWYp9tXauw8xO006QDXoIRRiqJmEFv7wyIKTsWHr1Hp7
	pR7fZELHdRE98xZFjoiTV1fmFh5dHKxgsZW80GE3xjc2S1dPonfPOZZQAj2NcjWYebRY9ZmjUo6
	CnJGOwDoSAaYHLv74m4dAhkRwL7m41xntSKxmWqeGOCLYIALVllQqT98HmFkHJU9WukFVe18CN7
	/jjmPqgg==
X-Google-Smtp-Source: AGHT+IHzU7O4bBwW+r0bzOaaR59QHp7R8Qe7T7RCV80z/qUtmi5w0XidJGu/xJXthigLDAzj67uUbA==
X-Received: by 2002:a05:6a21:3283:b0:341:5935:e212 with SMTP id adf61e73a8af0-369b4836e53mr11108196637.18.1765808171097;
        Mon, 15 Dec 2025 06:16:11 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2772a51sm12938189b3a.17.2025.12.15.06.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:16:10 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 0/4] PCI: tegra: A couple of cleanups
Date: Mon, 15 Dec 2025 19:45:33 +0530
Message-ID: <20251215141603.6749-1-linux.amoon@gmail.com>
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

v1:   https://lore.kernel.org/linux-tegra/20250926072905.126737-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/linux-tegra/20250831190055.7952-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (4):
  dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
  PCI: tegra: Simplify clock handling by using clk_bulk*() functions
  PCI: tegra: Use readl_poll_timeout() for link status polling
  PCI: tegra: Use BIT() and GENMASK() macros for register definitions

 .../bindings/pci/nvidia,tegra-pcie.yaml       | 380 ++++++++++
 .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 ------------------
 drivers/pci/controller/pci-tegra.c            | 237 +++----
 3 files changed, 471 insertions(+), 816 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.50.1

