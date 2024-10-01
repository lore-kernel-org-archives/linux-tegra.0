Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617011BCA19
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727809819; cv=none; b=XqeYOkTKsmsg6R5wJX0ZgTiz60AAn1Uf/Z3k+oLGMIw1qekDDj+o9Iu556PF7CpkuKnzT/0CnxaOzrgXr/rGGX6OR6VnHFrhuHZLDQY7i+s4gyI83bcj763QZ1ug6MUrbH8Tzq9I+6m4sVk/C+Z5ircOC0vdl1WpUMrRzojC/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727809819; c=relaxed/simple;
	bh=HitGqJQB6WxIPjJHcizCQwGzykKIcuGwsdcoLmq9H7A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ArArRUbNFG/Z54iaaLU8+8mWujDq3WqdVh8jUz7fr1vO4grM8ET0x++qxpxHnF8sm4Ni3PRaorqz7tAKYLA8zfEIqFRy/oaY+PuDRuDDPhLRZMkZTAWaQ0Xaxb4O9BP1rvlZFljcse+CpJoih/NDhoO5w1PmSZr/U/QeeH3TdNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6Qzfg6+; arc=none smtp.client-ip=209.85.160.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6Qzfg6+"
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-458311b338eso48416821cf.2
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727809817; x=1728414617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LZTYvdSVn9UmwVLnLrgDtYj9JaAmrXyJSTldZP5LKc=;
        b=U6Qzfg6+SF8kZloUVhNir/Jx5+xP6hIVLJvumS0pPY9Sd7YzoShgCgS2TdTiuNMGwI
         AYaL/zwtezPlhpaqodQmAcCJ1JxFQ1SseZa2uvYicRK1gdaPT91fpMgSrA4RfqwUA5kw
         uUTz3QWQfbPp1/H6GMt/qhCTAzPmt/XxSIEA2KpyDS7KlUHSHKuu2EfX3fRrlc1qx8mE
         Yn7tdgAU/AxsrEBMoBctN28sEK+rFEVvm7H3+3S9fgDKpvzCMhchKS5dhGMBoHERyEv5
         3pk3JUSmKyRkRqZE7vyUk+VgyJF4VxxNGmiE21Q/lKSsLAAfBlcSeGo2SRcYtqXHQK4+
         0FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727809817; x=1728414617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LZTYvdSVn9UmwVLnLrgDtYj9JaAmrXyJSTldZP5LKc=;
        b=fQZMYqwv7rbuL7e5WninXqKKs6wX2mdNMnRQCfE/aaTXZwaYdKn7tiOyNRRSnuLkrA
         BaZ8uRgMK55iXEA5ZDbm+1A3zPbScTO6nxBtaNwlgUtBN0+Nhb190BiyFFFwfaam5bGl
         QypbRf1XASUpSFT83MHwBdp1LAplyFcAOrmGURNVyLDCrcpThTjQKuxDGy4SJZbJB7pX
         ZGhiX9QtN9aDjTmKLaBboy04DLcurcLx+TWJdU939VRl+w/+XHJLPEKK3zh72/FmNxbi
         NM+5ocTxYOpW665dsc6rhMWRyK8OvOPhIGEa6jMOpZ/E9NSk67cECMi8QDtz+CmwU7rh
         TONg==
X-Gm-Message-State: AOJu0YzssGv3QuKAz0NiHDAGSqYa00JePgOBl0zY2mKVx4+mATSZcW7b
	faSN22C1HT3Hezr0nrc7HrD/tG39+OxWshKe2qUXsRy9mqSEDdxP
X-Google-Smtp-Source: AGHT+IEp7gq6cwqiT0z32EXdbqcv6sLaa52tzWHfqQWSS8JyjFeZaDGlmeZouSTtSVX/Y8lXi/OBzQ==
X-Received: by 2002:ac8:5a4d:0:b0:458:2dba:55a7 with SMTP id d75a77b69052e-45d8049a5bdmr8389171cf.2.1727809817118;
        Tue, 01 Oct 2024 12:10:17 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f2bb69bsm47556281cf.30.2024.10.01.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 12:10:16 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	krzysztof.kozlowski@linaro.org,
	sumitg@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
Date: Tue,  1 Oct 2024 14:09:54 -0500
Message-Id: <20241001190953.31152-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like commit 90ca6956d383 ("ice: Fix freeing uninitialized pointers"),
automatically cleaned up pointers need to be initialized before exiting their scope.
Additionally, device_node() should be replaced with a proper freeing
free function of_node_put() in this case.
And the pointer need to be initialized to NULL before any return statement.

Fixes: 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node handling to simplify error paths")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zijie Zhao <zzjas98@gmail.com>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/firmware/tegra/bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 2bee6e918f81..b365995364fb 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -35,7 +35,7 @@ channel_to_ops(struct tegra_bpmp_channel *channel)
 
 struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
-	struct device_node *np __free(device_node);
+	struct device_node *np __free(of_node_put) = NULL;
 	struct platform_device *pdev;
 	struct tegra_bpmp *bpmp;
 
-- 
2.25.1

