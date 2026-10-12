Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156B33C195
	for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798517; cv=none; b=W1qJsQwheljYXLod6zK50BfkxZac0No3wI0APd8L6tRnJVil/WvpyPEdF87Dv4AqvNii2pXJti85sWWpdKLg05e0hFaezzdujrkPgAUDR1jVP1Jb4tfe2I5zzkw3AQQGqKMG+4LDTNa+Ml4lKxbxne6Sy0dS1O6UjlFCMDZS1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798517; c=relaxed/simple;
	bh=Xwo1yCAMK5tqAeCHkGuwh4MMuZ0ul0FuqvfPBWClix4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkpsebzMnhykMP8tw6/L68g7LpDZ5TYa0xGWuhtL9TDOnzK/Mb6hyQeBRiEPTu9nI40T1sGWYxG+gkiczDTIgFLhI9pr6ydrdYa1iQhhPmfuvl/KaC8g2J2mtnL9lfTt7ndojizXAmgMLqpNHwoSyAOTUnB2k355BL9PwtKxHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TORYaqkV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TORYaqkV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1174315a91.2
        for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798515; x=1792403315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AE3qN2Gya+sk1Ul6ZbTJH8NleA3l4oK8s0FP1HbUA3M=;
        b=TORYaqkVFtclOWs603SYkBWWxbqnriwpP+x52DkpssGyR5Unfd/daaOYmfUzIzbDe2
         UROnVRll3Vn0U/sZ51Qosr5Wl92DBaiYgY1lOmzexCtjjlOWEJ06/EJa+ud1VWNel3X9
         um22y+RmZykC3PnCNi6rRrMRLBojjLpNcz4x7nPtfPaCrLmHTxEACWD9mtBLZyaorTwh
         SG95Igkt9EIDDU9dSLWqQ8vmfGdYYuJx/6yzyMyCWBxDzZnL8f7Jll1Dn9fB9U9/XhP4
         KVgfb8YVgCfQ5TUYyALGeysPFYWpscTiow9rK/nM6Q4Vig4GBg2bEMhgquvgmF6Bvw9f
         Ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798515; x=1792403315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE3qN2Gya+sk1Ul6ZbTJH8NleA3l4oK8s0FP1HbUA3M=;
        b=p0aLIi4yDn056OM5WaCp2EmtFXTe1gmphhIIzTCcp4GDmZqYgMywHxwhCLIqejX5k+
         gDJOtbQFSIOabXybjNlUDACzov6vM88pfuTJcdRfRlZjzrvPN4y9SPEPx5nbLgSe3kRo
         uj5LZ7aimuZXZgMLYPI9byjYUXnMIR5uK5idrNkLDKcjyK19CgOYRq2HKiGHJIAflJO9
         2PZpR98ZbTdhBbzBrkcATvssZb0rnZ1wNoxeGs/+oWEgowiXPl6FG9o9wTGeCCOXq5Td
         rrZidb0dFNprq2UuXI0A3iGATqubCByF6zUz0LfkKs9f0VEN1kuNQdDVXNfK0/R0M/lJ
         kkNA==
X-Forwarded-Encrypted: i=1; AKwUvBz5DwXFOVv9wrBkpZbiotHicZjJw5s+MfVpXGZQhLwf2yg+TNhDFngPx6l1ds29H7TwnkE9vjoPhXbw2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIW75tusMONjizCzqZy8p333BWGvpbJLtS4jfJoA60995pIshm8
	w1LwuYLXl1fqlc66gwzgAkBymdRyPq1Ui2mZtpbpR6seqlKbatgZBZiW
X-Gm-Gg: AYBFou3cfeccJ7TT+dRhn6D/M4YzSA5MI9QC6j6XKkMYVidqGxSkPSfDDL5EzpNSxpd
	c/82F1KIoXtZ+eVuUZVuzBQKbXaQRzQ1ZV7lJoz9BCtksEtAya2I22Adg/lQ1vu5YZLqxwbd3FT
	orM3lpuIC+2CZTGURJOSqb5d0vm49ShxxvSgHnKhy8tLaxCNg6sgcmB/aJRh1QYpVfMgZFwfy3R
	wydnpVMtWF0BSPHdz/Cax/XkTIJf18d7pkSNwz3kQm5WPzs72YaVkkm4R8QaFN2aUsKaRVNi3ml
	m/bMd9mXT+GhWOd9eqvD8r4ZWFccaPW0dxfJ4iq3f6WlzYKcl7FbZcEN+QALjl+yvOg6K6foP9M
	FN2rSs4Ltt6JZdJwK9/DLRjMgWY9qY6JtAtYwGCfMxCl4AsuWWtzUj1tl3dA7h9Ci71axaXBNkJ
	OIzcYdCNRi2qt3Hbz4hddLt8k1TKsBFU/yFnNmYRPI6HNFbD3Ni3a41zdoymK0s5T7JVKgVAg64
	PC1cYW6GeRhZiFYZ2YpWV6v2Gk9LVPruCqP0LkaGA/7j0bX76SZp5xJjjsytOb4knAwEoMfxvwe
	JzXAWA4cwlhjCw==
X-Received: by 2002:a17:90b:58cb:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ac0e6a4ed3mr1023251a91.0.1791798515002;
        Mon, 12 Oct 2026 02:48:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm16189628a91.4.2026.10.12.02.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:48:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] PCI: tegra194: Use dev_err_probe() for PERST# GPIO
Date: Mon, 12 Oct 2026 16:48:14 +0700
Message-ID: <20261012094815.28160-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when getting the PERST# GPIO to simplify error
handling and properly handle -EPROBE_DEFER.

Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Follow the subject line capitalization style.
 - Use "PERST#" in the subject, commit log, and dmesg text to match
   spec usage.

 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 63a0f56cad8e..2f8e828c4d9a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1200,18 +1200,9 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 
 	/* Endpoint mode specific DT entries */
 	pcie->pex_rst_gpiod = devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
-	if (IS_ERR(pcie->pex_rst_gpiod)) {
-		int err = PTR_ERR(pcie->pex_rst_gpiod);
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, pcie->dev,
-			   dev_fmt("Failed to get PERST GPIO: %d\n"),
-			   err);
-		return err;
-	}
+	if (IS_ERR(pcie->pex_rst_gpiod))
+		return dev_err_probe(pcie->dev, PTR_ERR(pcie->pex_rst_gpiod),
+				     "Failed to get PERST# GPIO\n");
 
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
-- 
2.43.0

