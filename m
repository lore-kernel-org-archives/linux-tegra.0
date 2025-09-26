Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9574D28C5DE
	for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871834; cv=none; b=KK2pwXP01pbFscSm/7s3CUWyiaDrsqptMC1gX62iU7v3zyHazMYxPLOq1J/o3fAxS9OYhmjOf69o71SSKZHvs5/PT1MOGVoZw8FHtZixLzy/3R/FFMeT9+vCMpMoKK/QjlDjBXomEm3n+So4ygYjZSnWH/yq3saXacqFIggQO2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871834; c=relaxed/simple;
	bh=6Lc+pIB1LdtktN7Z2Zgxt+CHB2qivEkBYFlDtKk9Bz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZMhxMsj50vAAl3oWp0eARoksJWGiFqY+fKzmRGyx+vSVFGPSE6ICzotrKuUX5auKxWdJUNAdI4to83xghPCWuKb6F3LZZEK5t9a/x9ksfUyQ7TxUVgTYyF6hP3ZgJvroWOP9iaHzfUMBsDwtuQnxUzrmTE84kR5ja850ti/Pk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsmADlEt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsmADlEt"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b54dd647edcso1644356a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871832; x=1759476632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSEZq8w/PRxCnrID2Y5d0d0SEP9SLps2HU2L0+eGoGY=;
        b=NsmADlEtq+xQKbWYlrQlxwAdsYPUOBhPVz1WvpIMEOTqZ7D5pqfeVWOHCjyzD/0Ish
         MofTuwICp9QZvLjcZ+jXoqKtYDy81uRZTmtNsNXj3yi/b5T0cE8QlKLXa0Z3KeUqLOIF
         A8Al+q64R/JRzaKfSYIFHVoS1NaNqsBBBlt6YAkrSaYtoKNV6Qs/JeKinQn2XqR6OzQi
         d2YPme/Zzn7xg5Ev5BXivoyLUbd/e7j0KtmLwa8RPuuwxcDP6PDPYv5MmlgRugpMwz+9
         4z6NZPL/2JzD8EgZZiCM/MFuCtHOV1BVa0kVavLKNNAkJEByCwnzfddsAVBHs0DePFhm
         A8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871832; x=1759476632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSEZq8w/PRxCnrID2Y5d0d0SEP9SLps2HU2L0+eGoGY=;
        b=ogB7US9rSsngMEVZtFXmXnPgkumIeZXetJE7TqLpw0BxpCQeMCPzlRMOWm8tGVLFpH
         kdyFfoRvhMgDuWIqEHQO4mF6Pj+0nYYC3mQtKYH3MDdIoTaxw72vlrgi2WfD0WqJWrYC
         ijn9zv19Cu4b5YGQCpNggGTGLki2fQGuKOROF/J0+nuqHqcLIbWpv5L3s1MKHSx07dIQ
         YMx8+iy0rAMB3ENfCz+I40IAVnb5NUveSDhgKkoxkt+yBpZSoZoWF5BFFJV0nMaKxhsp
         vkyZW1bONAuQrnxLHTDVSAsH0wasO18PQimBjLfNbvDIFvkZCgCGJlZlosHPPw3YV7MK
         6+xw==
X-Forwarded-Encrypted: i=1; AJvYcCXmgR066bSzJ5kIhQHga3x9gXrwNlPmk460vtoTUxzw/O32yPrmivswQCAuo+rLsC/oQJr+zroC3/P6zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNV2Nc1TQw6hif0iCjdZRkP6/LXNKLL9pOcK1JCEbzOMFwwEKi
	xakHpx3cJpm9PWVKV3rJ4OMByBTl2eVkNA04Nh0OEc6QK3ZvfYmtoSrJt6ZkD6ei
X-Gm-Gg: ASbGncveiSTZaPB0ByRNYIYkgfHKD5Fk+eNRQPl7qah1wld2A0H+ULsy8moAWfsPsdm
	/zxRQ06gcxnNdqpCzfMqP36iswr/kYKEuqNYk4Bp0axTwJriQ8QV0fDb4DOeb8dXgNMxuF01gyb
	b+AUsI3sNb4sRpagUBP7GkyLBxli6huWPIUd+P5C38MD3dfu0EUPC9P9iiQ7YCpcrrCsvNE19pc
	tMt2BZ9ZB7A8WMKal1RuNxizyj0haUeQZGJmGZDAM+kuyxWCsEHffF7KmbXyJVEapuGsVsAr3NG
	uZFQga0OpZmLIgC2HnJKoVvZ9ik5ECet6aGzdyaNldrU4tQ1HICbXoweDI7u5VZs0NXh1xyaL3w
	F+cCXoevxMCn6aUPAe32I
X-Google-Smtp-Source: AGHT+IG+8wcNbZ1mF4LIuGVqoV+lEiR0nH0teiABbbJAvSAPFBdcwV+sobdgY9ZY43R4oF0vAZAAdA==
X-Received: by 2002:a17:902:db04:b0:265:9878:4852 with SMTP id d9443c01a7336-27ed49ddab3mr78603555ad.15.1758871831650;
        Fri, 26 Sep 2025 00:30:31 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a98b9sm44083065ad.111.2025.09.26.00.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:30:30 -0700 (PDT)
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
Subject: [PATCH v1 5/5] PCI: tegra: Document map_lock and mask_lock usage
Date: Fri, 26 Sep 2025 12:57:46 +0530
Message-ID: <20250926072905.126737-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250926072905.126737-1-linux.amoon@gmail.com>
References: <20250926072905.126737-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments to clarify the purpose of map_lock and mask_lock in the
tegra_msi structure. This addresses checkpatch.pl warnings about missing
comments for struct mutex and spinlock_t definitions, improving code
readability without functional changes.

CHECK: struct mutex definition without comment
+       struct mutex map_lock;

CHECK: spinlock_t definition without comment
+       spinlock_t mask_lock;

Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: new patch in this series.
---
 drivers/pci/controller/pci-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 02cee0763396..24b6ae0f0035 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -270,7 +270,9 @@
 struct tegra_msi {
 	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
 	struct irq_domain *domain;
+	/* Protects mapping operations */
 	struct mutex map_lock;
+	/* Guards interrupt mask updates */
 	spinlock_t mask_lock;
 	void *virt;
 	dma_addr_t phys;
-- 
2.50.1

