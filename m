Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F20471433
	for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370194; cv=none; b=nDnH9aKYI3mxuWOwuzK6xLpak/jXHzdStEoen7KJZgHxQHnAp93GujWIv/ZXrwQx4fXCs0o/H1gBTi7sg+pmcplSES0kPmP3WILB7iw5HMmo64QPKPW3rBDgyCsazUp1HnkgpZqFzSbw/0RzDfgoPz3v6pYjGcQ1Bt4MQoEs+SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370194; c=relaxed/simple;
	bh=5B1H9FA7mZy/gFbNTlCD7iwhPS8Ucq4yIS3VU3Z7Aio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCbhhsuZ13wrK4pYu87pZ2a9fbyj/SLyBKt0Zv2pKhy8+rzNAPImBf9OjlHoFTc2sHx2+R93jKjHDolZ23L5iBihPZTKga0ovNqVqRUa9WMNjRs/Lp5NHoML0+rUNZQFydi46Ut1ygxbKrAxlSgUbl8Klie4ihgUFZWWrOOvX6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMGUdK1O; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMGUdK1O"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so994188a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 07 Oct 2026 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370143; x=1791974943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiCqXelSwhsxxAotTgryiWxi3hHYLhT7SYQdblGbV2w=;
        b=KMGUdK1OpSDMw4BfTyYR8pEniuILqLBYG2dGQWn1ANmOUfrDDq89hdYnoCcnhi9Znz
         PG9LnDcm1TJws9+lVP2aoRrL4Yi43fLCrjub1WcWf11N3Uw4eoEUH6PxEbLw/4ArcEab
         vjMsBdA1jh1fBWEChxRjjOzeilpf5J+jvEFIP9QfMyHy8/Bel+dewyxSg6Q5708Pv5IR
         8CzF4nQUXtoCQN738tnATSgXsvc9XQatrGhdgexLyAkErW+lOl1uD0fqp8s8gNY073ki
         YDpJhnvLCQBACCWJRFVK08EivOSxqvAjLKUTeP/4GnvzKkhwHifLjgauGQXNKEaXJgFB
         IAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370143; x=1791974943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiCqXelSwhsxxAotTgryiWxi3hHYLhT7SYQdblGbV2w=;
        b=GtKdiFGjEOkPxHM+xFWRpMxjvCkmBP6/SNrqVcLH0NGrLfFf9chTfcAQfGUvv+bAJ6
         4Cvx2eO4fwOTDtMEAEHJYZYZ7Mkb0i/ZDRA79akrBputYOs0jh3MVtLwiYawr9LXgoU6
         Rn7XrTnGCgME9mroRXQiPsMIIzgn/q4KKQOL+xkZGb/TVRXZpeGQS1z1pdn7RWYvducb
         eAKaKUYOnTxSEktB1MmG5lHJ5/rLAmZvfPRz3oJs7OP9P6FN+y6CdOVYmoXqpkAbSP1H
         qNcvsFB95y5L/yMdHkRKvTINRUnEQE7sO1lQIQjiPgEtq6ZqCZ/PCmFPRbC5W7Qn5Y7n
         xGfw==
X-Forwarded-Encrypted: i=1; AKwUvByfJKNi2+bla6/OP3Qs5x5If6Gq13hiNYINqWwqnWWFfhVcE6ttv2BfNLR190wQ8F+6Fe9dHXfXERsP4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIkyZ8Er133ipnPBafLFKLkH7arARe+U7xUiqe46D/0hCnoZH8
	9HgcTv8qinkC66XVZ7DBc6Z5qGJOKR7enh8Lbt73EHgTp0Nvh/iGbGln
X-Gm-Gg: AYBFou3qoaNKBwOIeKKlowRvD6GfEGcHUOEPSSb5kowCmxnyceolP15hg5lMYMOdc93
	USskduyqbxpi48f1b6FBQ7qJAW2SFTIMUBxay2LgkwsgjwkNCDdciGtNXIO2HcVrhBqcaWU2wGU
	pFGzvmBY5/p6YM2BQDU/GFOwmXfgi8vghpDBV/Y/AVhnZJD9EUpfQjqiyl3gAUu/LgcIaOph8fE
	n2RebfNNG8f64DiHB9co7uci63sqebv5gfmlRNzx5Ao3ylFfftf+5eJR4evzrQM3bZ5j+rQ5Zkz
	uPHhC5Zw/KoLARXs2s0gXzJDoEI/ExEIAXITjUrUNAOUdbebw+5Pxth0+9U8K2cIjR8PyIopZh2
	JoxFLwKCvNHvPwL8NovqjpF2xTrChrUkf7lcfrLSev5X/oZcEiSx4U1o6de0yLR9/Qba2Urpy/0
	00gLotpf5/gGtAU5R9btXntz3I9S18J1IdrAR5KangOR7c1eY+zbc5/wHvCNdH9N/MdrwnQYFdd
	kC9URhr+12nJw2JoP5qp6M2QTj6luiMpwEVs8/NEfaPAsq1y5Uwm9zXNXrayTXLjJR5+3Om79gG
	AE3pukoanN2Jew==
X-Received: by 2002:a17:90b:3c04:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a8a08514e6mr1600840a91.17.1791370143411;
        Wed, 07 Oct 2026 03:49:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm9119961a91.12.2026.10.07.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] PCI: tegra194: propagate REFCLK select GPIO errors
Date: Wed,  7 Oct 2026 17:48:47 +0700
Message-ID: <20261007104847.507776-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007104847.507776-1-phucduc.bui@gmail.com>
References: <20261007104847.507776-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

The current code treats GPIO lookup errors as if the GPIO were not
present.

Check the return value and propagate errors from the REFCLK select GPIO
lookup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 767e11216196..5ebe01f72833 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1207,18 +1207,9 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
 							     GPIOD_OUT_HIGH);
-	if (IS_ERR(pcie->pex_refclk_sel_gpiod)) {
-		int err = PTR_ERR(pcie->pex_refclk_sel_gpiod);
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, pcie->dev,
-			   dev_fmt("Failed to get REFCLK select GPIOs: %d\n"),
-			   err);
-		pcie->pex_refclk_sel_gpiod = NULL;
-	}
+	if (IS_ERR(pcie->pex_refclk_sel_gpiod))
+		return dev_err_probe(pcie->dev, PTR_ERR(pcie->pex_refclk_sel_gpiod),
+				     "Failed to get REFCLK select GPIOs\n");
 
 	return 0;
 }
-- 
2.43.0

