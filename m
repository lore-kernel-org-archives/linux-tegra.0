Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A628F50F
	for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871808; cv=none; b=rZ4EovT+KFVff/34YU6xo9MKPmkO/7NwrA+0SeACC6+Geo0bEMk4TbJK0hUnP2QNUOsi8c4VadmmnpXCB0Yhgu2NvUKsyypKBMzCWqJaPqSVkle2hcNs/g5HkRcEHW/UJMk6GD6+m6v9I2ioHwEVIE5RAjoMGHLfAQQw3hGms+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871808; c=relaxed/simple;
	bh=B9tSdkHs2Yg94R47L+fGUJTllZ1iYKjZrE7h+YiOBsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neZEYMpvaRgEFWi528jjCNnR7wZ0T9pm4gcVQSLvoDie/cvyFGiUTVC0Fuu+ODqtcNi+izaJubkSzRgV2IUhBBXYuvVpHKpc/ek16icVRGN/rRzgT3YG+2TuBvk11zyuQyJWpFwvHTKhC9ZMuUep967AJ9RA8dWhhN1T4koq1sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D558smNv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D558smNv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b556b3501easo1633801a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 00:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871806; x=1759476606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm7nBZJ8GEby0mK5cxdZtoEeYLLJ3ejp8euQ7RZMF2I=;
        b=D558smNvNnZiUCj6F+E7/mOoa3zWkUoorW5QTbSA525Sf+XOWpuDN6erMd44WHk+cy
         SFOxYmGn+PfldUeVEbSf61xf3/CJ5vNOn60j8OK0/mwe9rGBAsqxVsY7oHh0Gzg3uRZP
         CQBEGfv0fcm1I6C9OPdJh3ZbdZ5xMbPZLlpvuXTtPepvrRx9xHkyrFYDibQldAclGOuz
         kK7G1870DmlwPJWcfzFEagUymqQ8HgQ48yW/1zctSJYMMDB7O1KODPa/WA4/3Z67nNFA
         q2+plW98tOfzgm0Og6jupSVu7uFm+9h4100+rPPEofjXLmSBf/8diYZbApNt2wZp9HqH
         TBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871806; x=1759476606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm7nBZJ8GEby0mK5cxdZtoEeYLLJ3ejp8euQ7RZMF2I=;
        b=nGzi54qRmnVsCjNX8X2S1c4X/OooA3Zu/r5derzyfZdteGNg8F0PQpyHEDqoyD++bp
         oxFKXcjAmHI1X+kUjd05xHerI0q8PD3dv4xBUtKVsIaOC1VfH1ZJUv8a9RmLoNSxtwdG
         KRAxuXqIudNGtp1fcBXb+/mP1jCXlUwoX9RbgNRM9SgRm8psR8HNC7Xl2B5+uft56I1l
         aUhPCWhArn3kur5EGfel5LyAAR6nUlO3kboVUCW3XCNDptT3iGj5quN/bbqS1SYU7i8q
         y1/kX0QEBh7IdQo0Dql+3TrJODpV06zRQlAs2OLpKjVzjAVbWV5G5yOFq43C6ucqhUjK
         Q+mg==
X-Forwarded-Encrypted: i=1; AJvYcCVG3zm7Fy15roOtI+Whj6PgzPgdSTpE9Goq5B1scTeNo02W+9pky7W7X1MUbBiqXKyjg9hIxqo36o96Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEnlg7Wd27/G7EX0zDI+aDopE8cSBjx9H9JBWK17hCqmWCuj80
	CvWQFrKNE3zVADPNvj+SOfikjvEvaAlSWZEOCi7S0vpdAB8ae06EMXBk
X-Gm-Gg: ASbGncsHvSLH35EUau7kwznSySpdVUA68J0ITmWzkmXzjL3GChCfmvcO+/79NKlo271
	58B/C4Kt/EtsfmPN5I1lmA5sewiaoAi/5H01wcTI4n1O1qLTd+igFOkafvy8FtoF2yqtieGD7yY
	HVpc8+4+0YjCNwVy74UVtYy6I8fwYu4wH3fmvGVxyBjC4jBOadiD4IUVzVxZ7ZExLYQnVw+l5Ct
	k/Y7oPXCsNDlgqrTurQtY50j78bIRBNULJpz3AqX/nuGn5edeam63JnZzdAj62hF89mCRcrWV9Y
	pc9RhgSC25h8nOEi/U36zCQIELmoUPyo/YS8dQPkYnpmIPlZHCv1shGBD4QGi/6+Y7JDesGNCsb
	vG3h7TbaXOLRiQmbIchDr
X-Google-Smtp-Source: AGHT+IGI+U3QK7iLuAmmvXRmiYoOumdYgGGFoBVB3R//J+qy9voB0vaTp3PbDWtHrr0QJs4yRB3UPg==
X-Received: by 2002:a17:902:e54d:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-27ed4a67210mr74057675ad.58.1758871806190;
        Fri, 26 Sep 2025 00:30:06 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a98b9sm44083065ad.111.2025.09.26.00.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:30:04 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v1 3/5] PCI: tegra: Use readl_poll_timeout() for link status polling
Date: Fri, 26 Sep 2025 12:57:44 +0530
Message-ID: <20250926072905.126737-4-linux.amoon@gmail.com>
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

Replace the manual `do-while` polling loops with the readl_poll_timeout()
helper when checking the link DL_UP and DL_LINK_ACTIVE status bits
during link bring-up. This simplifies the code by removing the open-coded
timeout logic in favor of the standard, more robust iopoll framework.
The change improves readability and reduces code duplication.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: dropped the include  <linux/iopoll.h> header file.
---
 drivers/pci/controller/pci-tegra.c | 37 +++++++++++-------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 07a61d902eae..b0056818a203 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2169,37 +2169,28 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
 	value |= RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT;
 	writel(value, port->base + RP_PRIV_MISC);
 
-	do {
-		unsigned int timeout = TEGRA_PCIE_LINKUP_TIMEOUT;
+	while (retries--) {
+		int err;
 
-		do {
-			value = readl(port->base + RP_VEND_XP);
-
-			if (value & RP_VEND_XP_DL_UP)
-				break;
-
-			usleep_range(1000, 2000);
-		} while (--timeout);
-
-		if (!timeout) {
+		err = readl_poll_timeout(port->base + RP_VEND_XP, value,
+					 value & RP_VEND_XP_DL_UP,
+					 1000,
+					 TEGRA_PCIE_LINKUP_TIMEOUT * 1000);
+		if (err) {
 			dev_dbg(dev, "link %u down, retrying\n", port->index);
 			goto retry;
 		}
 
-		timeout = TEGRA_PCIE_LINKUP_TIMEOUT;
-
-		do {
-			value = readl(port->base + RP_LINK_CONTROL_STATUS);
-
-			if (value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE)
-				return true;
-
-			usleep_range(1000, 2000);
-		} while (--timeout);
+		err = readl_poll_timeout(port->base + RP_LINK_CONTROL_STATUS,
+					 value,
+					 value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE,
+					 1000, TEGRA_PCIE_LINKUP_TIMEOUT * 1000);
+		if (!err)
+			return true;
 
 retry:
 		tegra_pcie_port_reset(port);
-	} while (--retries);
+	}
 
 	return false;
 }
-- 
2.50.1

