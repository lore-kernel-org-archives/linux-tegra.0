Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF902C032E
	for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579215; cv=none; b=MPLwhL4/H0q1Am3Q/6gBPAd4VyYyc0XyL40mOgpR8SB/1OmSwygabg9764Zy7JBMW5kfqw5obYrf8CfJ7pVDg/XFBFkPU+1uEfYfsvuHc2XjJjX9ou5I3dk0Am2xr1eAXnsPeZllCwuEKO6COk/PlAI19bBahYyv+yAYfjhF5x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579215; c=relaxed/simple;
	bh=WdBEdLpSforioHhbukeXfUmMVDWPeJnblF0f8wKYRHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=revxQk518I8UreCAbt3zK95rKOpjnAHUD2mGaPE9RvU48PcIozrNfDcS0bsF6sCLMfPlDsFtWwK0xq5ubGAr2hTamUZD9i35e4Ct8BmOV8JQL5ZjDYgj7nZssFurqCGtv/kdOosMo4CBr3gohhlc/Qi2floNHeLrc8ScpxYwgQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiIdaDij; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiIdaDij"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso3268552a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 08:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761579213; x=1762184013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gyCJFEF05gZrJ9JMkK8QYJcfOxWfVMGePa9EE1L1ZCg=;
        b=NiIdaDij8RPnXWj5KP9bBwW3FrHfB1ghyPDE6n0usJ9YA8UycbUr3YgbZG6mQqrl0C
         72emAI2qz26zXXMge2PohWi7BIchYLVh3yTPyDC5rUQd5g41O1yX49NxVx2kbMO0/uqk
         k1AKn+GP7QwYp1gAZYlSrhv0NMentposByT5A7ucW9TSaG9sE8v2r2OxDeH03xzWAGll
         RPjOEYjuxxRQoCXOp/wYVDcREfLlsRpGehLV86qjGeQRDL5nfjrPGbsVFCFIuM7Aj8aG
         72lg8xsHUz6MWUB5o7oTcIcIpXM8E6XcZwO7aE2VL9x5uaP1wknA2GwB/nTnOANX97pZ
         VkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579213; x=1762184013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyCJFEF05gZrJ9JMkK8QYJcfOxWfVMGePa9EE1L1ZCg=;
        b=Dt3AO7Ps057uXWfveUY50FFXaEV9h0a+8+3204AR59XaLkMZ6p26CdLKXMh98gcsuM
         tXwWw/GUshJQb/9UdKYBB66fuxYwcM8fO3c7FTJWYyKtHaAcrWiLPZTuiiE4mtmB3eKy
         LjXo80DGQ/hPn2HSh2zlGguzfqHYwgIEy9+AuT6pqa/py+Vf8rlKz91VYv0txYqQ6dyj
         J3zIVQiRGI5F3c4G9unxZppGwHIrPmPItc1xMf/ihLK/033YDlb0tA5aqq3SY1VRBR9Y
         SSjmD2xAV4OK1kkm6UE8zVXMhSg9baH4/KSzI+6zdFKMRNwiMSS44QcmAbc7Q3XTO49P
         b8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVlKoUh3FFv7496E2ZUdqQti1rmQy1lkyNwg3TYTDsVYS4UKcFLMFuujsCdgvQmjlSXt5x/uDYxhTTN2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4bU/vZS9uYjb+8AXAXWiTCoqip7HITN9DLleWUqaNp1Rnvtp
	Bz8DNKAf9FT/JALOaFM/3bhHaLyM17Pzi+XauccejYyBPhMQe2muLGRn
X-Gm-Gg: ASbGncu9Ne7rCLiol7l4bVigbeuVPukMIOx/y5pizbBXXNaDxwbt3H4PJlYOx8Rg0Wt
	PpShhVgwEo813nJ5ZdnF3HzV63prFZ1ZV7wj95rSLYGHnPRDU1ImDFrDpwBpafVitXXyGw7XPD5
	YErgZwQmy6kCcNfpHn2JaOMRF9sPyRz/Nwk+d9oz8oqfSpXfze9wFEWnaBmz9OHMBnmWyEuVmcY
	pVWM2oBK79n7b/wIocLUd3jQDsy3e+JZ9Q99uLWn02DEqMRwIvgZ7H6mJrMLGxyBdvsyGuzBQFG
	uwI+u/OIB4yactmidnVy7JIgvjxwgg0PS7xFdwxAc4r795K2SXezQMu7vxvN8jeTzf9wv1pOuWE
	DUr50jjE6qtcLGbXgl7UDx6mzLNd4DV29pQaAIkUywoYl9Qa8+s8XJnuwA7JpsPiYaQ2PCZZEM9
	dxFg770QRZcmWr1AU81Ho/4KUk82Wr8YMm
X-Google-Smtp-Source: AGHT+IEshwgNJwDO9dUyM9pXppLasDaedDty5cozPvWHVpiDiRN+D5hXAsbWqdxeVF4eaG1w7MO3rw==
X-Received: by 2002:a17:903:124e:b0:24b:270e:56cb with SMTP id d9443c01a7336-294cb3e5310mr4051855ad.27.1761579213005;
        Mon, 27 Oct 2025 08:33:33 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498cf4a40sm87272165ad.0.2025.10.27.08.33.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 08:33:32 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stephen Warren <swarren@nvidia.com>,
	Hiroshi DOYU <hdoyu@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] amba: tegra-ahb: fix reference count leak in tegra_ahb_enable_smmu
Date: Mon, 27 Oct 2025 23:33:15 +0800
Message-Id: <20251027153317.66454-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver_find_device_by_of_node() function returns a device with its
reference count incremented. driver_find_device_by_of_node() is an inline
wrapper that calls driver_find_device(), which calls get_device(dev) and
returns the found device with an incremented reference count.

Fix this by adding the missing put_device() call after the device
operations are completed.

Found via static analysis.

Fixes: 89c788bab1f0 ("ARM: tegra: Add SMMU enabler in AHB")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/amba/tegra-ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index c0e8b765522d..6c306d017b67 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -147,6 +147,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
 	val = gizmo_readl(ahb, AHB_ARBITRATION_XBAR_CTRL);
 	val |= AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE;
 	gizmo_writel(ahb, val, AHB_ARBITRATION_XBAR_CTRL);
+	put_device(dev);
 	return 0;
 }
 EXPORT_SYMBOL(tegra_ahb_enable_smmu);
-- 
2.39.5 (Apple Git-154)

