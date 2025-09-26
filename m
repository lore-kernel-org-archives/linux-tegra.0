Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEB287271
	for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871757; cv=none; b=lpUlQfcuG+yJpIzK2ieYqLFKZ1HCQFG6FQtr9beBkehzxi8xoe4hP5j7jIakKlUeyzaeMK2/h1HgBo/3p4bB1W3ygnUiPvbeUzTvRtC2wrITkSAZPFK2ao2J4/GXho94yCphmszgxvXsPd4ESfQCIiy/JN0qW/9ua9z/yow77uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871757; c=relaxed/simple;
	bh=KKeLdXdxMAxZlR0cCMx0pVd79S7jNFLhBZQcQpx/FbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2UTxHSqH4R99xvROPjvnFME9LOCI/gb3jBxiZQnldm5GvYUPiKOnm9pMFrXdH/EOrxsIH/r/asGnQdKSawXH0Q80XpK869dCTrCASsb+p6KFRZoXNVe8P57RBSOrZpUSX9w1xH5kJJ4q7kigbijAvxIbO6W6ZuAOeBTmWlHh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K60Oi0or; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K60Oi0or"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5241e51764so1669351a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871755; x=1759476555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYEa9oczgUXfiwew8zKgW7hYIrVnSKo3dCzTihagGEA=;
        b=K60Oi0or+zeuFSRcfSW8SlDcSOy8uPXFPwzMAf5qQoPB80pri9tfrIDwjbgkh8SYeq
         2BQTdXCSBywy8aZ3361KKcxu7n8NFqmhUahbEh77zDC526ZLO8h6UxOJonN7tgKOYjwy
         7r053WIPNTbitgzAgHW8cXp6ERniOzs0vKtitG8pnEnEB5MKyp4BSQ4m1jdZY1upwSUH
         yI6Oy5CfZ93IS8ADUnvKJTq6o1KyszSvB20/bBttcj12RVMAZ/whBZXBuwJADmpiV+j8
         Ud9vcH/uDaDBG2DQ+5YhxyuXXciYBiQPVX4L+TdeQ6UjZcPaglgF9sYysJL9JeO+DS/i
         lNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871755; x=1759476555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYEa9oczgUXfiwew8zKgW7hYIrVnSKo3dCzTihagGEA=;
        b=vVJnwbhQUoRTqDxv4TkKPHqw8TTel8dhsmye+9eGyLGjSPQvYdI68GYh2LjEApiToe
         tKkKAYDmSsTH8LYSYc/NfM16MaqNvW70yEpLRgD2YNpmanOcwz3QV/3p3wXes+fhJCCm
         /3bNWPiptStDPwWvp+7itJwn2Jpje/L0hGkuNvewIy+Tv+Lhq215Fn4sIgQf2FEteHpE
         ++mjuHV5bb/lYxLuikNJ3Tmd+NBsf1SS7DFFvgPSsjOvdK0jh4Uw6B0jVy2/h+gJzMZo
         PZLBJhsbELRO8omUR1jjmqQqcKP7Vu8u8tMkIscXaTNX2/Ok+O8SDsp4c8ILUrjwTjHG
         5mRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsFhMalEKX3zO2LyNbnNqCLoR+8wbE45tEj2fUYYemXTz0tvkW1ReXFovma+8lRgoCi1LdjHNZtsuyFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA00eSPYhwdgzOHhsB6PmBoRgQ+1zILIp+frJuLZNo9KDlWxoo
	Yk7IvOnyV0WwDfqXNsU2R1mLvrVbP7J2andGrEpF0h5XVYrkHrf8fP6g
X-Gm-Gg: ASbGnctzwx9NX0DZ1B9G2fSbQyb/Q5KNEojOvByrHtDm+UYRvCUbeh8Ee0YJTr3H30D
	Fex30uySIY50Nt2yOb4bFtyN0j/nOfldv+Vl1Ve+nFKQ7UgsL0X+g9Ss1tlFKv/6ZShJGotMrLa
	ptczX+BBhiaTHpiOW4F5E6AGh0lFgoVadZtbqZTXbILRiE5JMiKZj08mkaLqLod5t7FFIyhE0DG
	I8YY20JYPMjTpOSBgnsKwC+f8m/E0321CmdQnnf1U6c4i2WGiHpQOVawvOONkyshMywbYloL4cu
	dNxNepvXoz9PFFtb/JubPLMTU812B5am1UFoYHINif5aH9Uhg4pgE7dsggIQVAP47/LJLDAb5XJ
	10W64MgkAjTLZvZnrPVg+
X-Google-Smtp-Source: AGHT+IFnyJDdAuSLIa/C8964VsLcbnuC5hHMVE2YI+68PeLlsmcnEA8Npkepb0UD0ObLZTs0q3j5XQ==
X-Received: by 2002:a17:903:22c7:b0:26b:3aab:f6b8 with SMTP id d9443c01a7336-27ed4a603dcmr74120275ad.58.1758871754907;
        Fri, 26 Sep 2025 00:29:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a98b9sm44083065ad.111.2025.09.26.00.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:29:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/5] PCI: tegra: A couple of cleanups
Date: Fri, 26 Sep 2025 12:57:41 +0530
Message-ID: <20250926072905.126737-1-linux.amoon@gmail.com>
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

v1 Added new devicetree binding nvidia,tegra-pcie.yaml file.
   Switch from devm_clk_bulk_get_all() -> devm_clk_bulk_get() api.
   Fixed checkpatch warnings.

Tested on Jetson Nano 4 GB ram.

RFC : https://lore.kernel.org/linux-tegra/20250831190055.7952-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (5):
  dt-bindings: PCI: Convert the existing nvidia,tegra-pcie.txt bindings
    documentation into a YAML schema
  PCI: tegra: Simplify clock handling by using clk_bulk*() functions
  PCI: tegra: Use readl_poll_timeout() for link status polling
  PCI: tegra: Use BIT() and GENMASK() macros for register definitions
  PCI: tegra: Document map_lock and mask_lock usage

 .../bindings/pci/nvidia,tegra-pcie.yaml       | 651 +++++++++++++++++
 .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 ------------------
 drivers/pci/controller/pci-tegra.c            | 268 ++++---
 3 files changed, 777 insertions(+), 812 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt


base-commit: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
-- 
2.50.1

