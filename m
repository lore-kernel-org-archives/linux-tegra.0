Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25333BBAF
	for <linux-tegra@vger.kernel.org>; Mon, 15 Dec 2025 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808208; cv=none; b=Exg0KV9K7nj1nk7NqE3MvmcshCO7yBJDP+ENDdODI/KKuRbTKKiptqkbz1Eg1GgxBsXZISvJ45l187m45BHUCA2+mNhvAaQGLso/oLSdj3jZ01az1urZNHhZibmmcdI38RRNMsm+PsJD0hAQn8fJQ2Zw/p0mrK2K2GOXj5tzXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808208; c=relaxed/simple;
	bh=JtFZo/uyQAWSjmMOB6k1d/9548yEmgKRfxSDFklyJp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzIzoQ0DONtboCPMBMoTJJmXaxZZ9aSKE4R5iRyeiOcB9UpS98Hp2HU+WoF68T1mcnyXmnd8bzPlLFTn1SntZBYomLb51rldKZGLIRBmy44uCvM3xKapihe7C5PjwWbkiozIPZvZq0dOhH8rpG98p/Y9juB7kWGwRXJcmcqHmWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=im2rH2CJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="im2rH2CJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso2862250b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 15 Dec 2025 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765808201; x=1766413001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/TuzCGlQTRhxK78zbbN56sGpgmiksawHrsvuWBiDTI=;
        b=im2rH2CJL4Svgrj2vpz4+2lj01/mtn21cXDnimM3EXByPnGxl0S6Cq4eFr67sH/FLM
         VOUJ6mesbF/q/eBKB7ICwtxHJdJbAiSuvSYjJSY81thTp4Kaf9aIM1HFR56MIIPiChDL
         pC8dAUB7vKbedsN0JwO05BeUUjG+FSpBx46yCZtEUa5XYPQXgPzQJ0sUfIG9MSOQMSnG
         JlZu7jITE0Ivdzx02qYvK92ZQFsKsP/8s/2AZpOST66K/jOgY5RrV4u7AmCtdHRapjk3
         ltec1OxzLtDaREZfBGyPrNRvpBtRWJuzNUjzZ6RqYB/ZDc1AzqCahv58REeQNiSGrHxB
         OBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808201; x=1766413001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7/TuzCGlQTRhxK78zbbN56sGpgmiksawHrsvuWBiDTI=;
        b=ti0ptUntlrQNJuJthZJs0apG//PTsiOeC+wkP0/gprI2utmCMLN7CtHVwf8Nf2H2BU
         w8/jY43VxbBkm3WGfI1josTVcm8/O5DgTweCl9Wnz4hhxtmc4kC+poGaprvlyn4E7ReF
         Lt0Gug/77vGdij6ynFtem1kCwXIa9orV5C7YxnjSV4w4eVMTWOCdljD8Ry/9e5KQBbZW
         FwoQgt1OKniaBb0+RFej0Y8isSNSLaEXr26oxVCSHqoa7398xZHL4ufTjG5c3vVdvFlF
         vX0GMi9qsHa+/WTdSHy8wW5+tPA8+lfQk1eF/G2rR3doJo1w151jW12Z0pQVvexJRUxF
         +Meg==
X-Forwarded-Encrypted: i=1; AJvYcCWWOouNdUjwuI+TvwBgkMJIgt5bSgWKdk1xCvSbscYfE8GYfNFNc8WA7Uk/rKJ5Fnb3lflnhWi1L8R7RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Fv6WdCnSt9KPlo4ds3Mw3SOfcq6SRTlRZMf9DUBT+rOf+0AD
	IRZO89uinrVEnFJX9bhPbRG62zvhUn0HloIWO/6HeGFCFsDHf0cmBuMF
X-Gm-Gg: AY/fxX4CSigY87fPZYG3Ad3RAzwixVT1HrHJv55ttmfYfDMMdrXqfmKmG0Z+AFEdyYi
	reheDhsaXFOaztvsIXdfDXm2wUoZaj2Hzw3KfhuVvdSPp+VTCqQ0fwrm0APj88PB25OnBoj9mhr
	geux829+dRISTT05uhUl/A2lUWtQPFA73MMdXdNcUQnmLhEIDqAPs2O5JLRjDAPOnw7Q6rq230l
	DMmcLK90qXv0OOZoFcdnbKeCq6PdubWSfBOIY30YabF2psLHLm6HJGN9EghI3Y39r7BGVq8Q+2K
	W+s0t5PttH+20RsMph+d8FJX0JcbWFGiqkYNVkz7DIA9l6ijMUB65SaY0jI4HbCoqWbKm4FbV6S
	rfLMo8CxD3d/lTvuxQYvwKyG2yA4OX91Jwnru5jznYZpWChPs3wI3zvtHsFQBr0gPuFRrMu0/d1
	5tMnvdWw==
X-Google-Smtp-Source: AGHT+IHofev4tgipZDGPnuJ3GMiH1rsQTbZ29334XG9Ue8yjcy1ZxYa5orNEikBSTFF67OplRvrkjw==
X-Received: by 2002:a05:6a00:450d:b0:7bf:1a4b:1670 with SMTP id d2e1a72fcca58-7f66763cda0mr9290540b3a.6.1765808200740;
        Mon, 15 Dec 2025 06:16:40 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2772a51sm12938189b3a.17.2025.12.15.06.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:16:40 -0800 (PST)
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
Subject: [PATCH v2 3/4] PCI: tegra: Use readl_poll_timeout() for link status polling
Date: Mon, 15 Dec 2025 19:45:36 +0530
Message-ID: <20251215141603.6749-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251215141603.6749-1-linux.amoon@gmail.com>
References: <20251215141603.6749-1-linux.amoon@gmail.com>
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
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: None
v1: dropped the include  <linux/iopoll.h> header file.
---
 drivers/pci/controller/pci-tegra.c | 37 +++++++++++-------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 275d9295789a..336d2cf4d828 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2156,37 +2156,28 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
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

