Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DEE1F9F7A
	for <linux-tegra@vger.kernel.org>; Sat,  7 Mar 2026 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772868293; cv=none; b=oJ5E4KUTpbEMW7MgDwswZ3qfG7sQqk0pijPwfY9GJVAhyEVxysrsZINOBzCCSGjeW6P6AKS/tYQBKZnTYUqTsLOEG/DbObVj53QEhRtrg0PBv72Nl+pBYVuiE8JNdDjToZuJLSFKnifqH/B4NvaARn7AH2CDjWrzJaMf8pkYnPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772868293; c=relaxed/simple;
	bh=DnhrfTpoqQP0Gz7wQMlEMENHf6+HnkuBCFqW+aSeYnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HOx5IDhvATuuInumwvlowLDj+saqD/H/AQldM7HBJkJ1UcldPSxTu7BWh/JHt3jx0BjiHx0zu04GmPT1UIvwllvLdg+7NB8WHHFkPQtXIWeuc36roo5Mhl+JPu+HfN2dPh78ozEYTGXfzKKQODOBfiCDr6IQWJbBEhCm06Z5Npc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1NtuXyM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1NtuXyM"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so8791354a91.1
        for <linux-tegra@vger.kernel.org>; Fri, 06 Mar 2026 23:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772868291; x=1773473091; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/X3H2rOzzx5YHCEmX+zODgRnC+Epx7QrZClKaRyRVk=;
        b=E1NtuXyMjMHGzqkkoWZ4umzEZ0OgUXcjZiRodJz5YrLxqzxCKuQSRA6oPMdMYod7NP
         oJtLMSE1bQE5K97V7ZAaVyfhUwCblWuwXpQSQ+E6w+wH+Pmqef+g4kjSQ9Xetuk1fiVN
         4aIN90SgadeHe3BjRIBvch6OWBX48DY1gqp6iYUb4V7LYN1/ps0/kWNEspj/YUxeadLI
         QSo4GM+XZvDvl3aNLaRGW4IuVS0rQOIaw0t1y4A4OZy9FEvyqoKCWtLiGivn6niHpkSZ
         5ioCFxwGdAqzoB5kdYt5nL37XI0bvCV+/b/4/M7nVaZJPtFeGEzT1aSl1HsFVElJBdcf
         LUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772868291; x=1773473091;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/X3H2rOzzx5YHCEmX+zODgRnC+Epx7QrZClKaRyRVk=;
        b=lqj5HG02Heuj88mOuEQ7Zhrvke6xKCHeN5WheTPvoDtZKV8HY89C0N8X+QHK3GEvO5
         CJaDiSdj+/w4ouqHtp99HJWRJaaEdeADphywFgMwZYe91wI1g4zq5Cxs07pZIldYWwb0
         y50zayoRx2fbb5ly2Ijk6sUYSpaeLylNR2SeLgtttu6s+Gm8eY/Fw2fSSVXZCccz+Mvv
         DJscLRb6WK1llmxvsttDMVUsx4V+26AkCM3WEPfB/irzHEYp2su9zqH51hV+rWzhy79O
         j3P0tu4DeXlkr/2MgdCJ9wLiNQbEogDEHtB0XlUfYvO0jCdsL5+QnV0pSoQu9DHLKkqA
         cz1Q==
X-Gm-Message-State: AOJu0YwRUff0blRE+QMsk1ETUXfUq4puTdGTvCs4JAFZkNL30uCd5dbd
	1ASvEAL7V9lcusa6VdYhPGniF3hYDFZrOA/ImIhoeTgqYigqzgIsHakj
X-Gm-Gg: ATEYQzz596dJswE2MGDD/IZhXaIZ8Fqx4D87tgNRX2W40oGZ7zuWa/FGT4RDqPgHmfQ
	DeERD9+iV4b5JDDHSMqIYYgts+SGDlFTxpQv9FbZ2PxWodZEmotTd2xiKndkx2cDote2bIknsuW
	4Ui9ffGV+AnPPKjHxGiYjKGDnlFxLM/7p1a55vLQdXaANAe+tCeC/zAUshGixiz9DG4xyEVgZdY
	b8sW93V+m0vcrk9i5CLaO009CFRczwNvQLMWVVlKyOF2btMr9AewRNuAP8ku7ZhBoFkCwUtaLJq
	pW/+LOhHwl+L0Txcab9qgjuTAzmDgCCpb0MGyfGLgJmMQABhXcFvHYr/71FTqWL3o+VzsSImBFZ
	tyD59frF/voIpLhVEiGil5AGokKy0bUyTCgF+KVe4CbR4ueB+KRli5qoiPBxvGqBvnuKfHd97sX
	mQICA84n44JjtjmDfGV/kT5Ky7gbtAEEwGWcE=
X-Received: by 2002:a17:90b:268a:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-359be3217ccmr4437933a91.23.1772868291381;
        Fri, 06 Mar 2026 23:24:51 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:59cb:c81:de53:1143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2de7932sm8771067a91.10.2026.03.06.23.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 23:24:51 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 07 Mar 2026 15:24:45 +0800
Subject: [PATCH] spi: tegra210-quad: Remove redundant
 pm_runtime_mark_last_busy() calls
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-quad-v1-1-f103515db501@gmail.com>
X-B4-Tracking: v=1; b=H4sIALzSq2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNz3cLSxBTd5BSz5MRUUwuDZGNjJaDSgqLUtMwKsDHRsbW1AMePXvl
 WAAAA
X-Change-ID: 20260307-quad-cd6cae580c33
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, 
 Vishwaroop A <va@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772868288; l=1684;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=DnhrfTpoqQP0Gz7wQMlEMENHf6+HnkuBCFqW+aSeYnk=;
 b=IEraBS2OLNJDNH+FaVM/+ejP3HTtIK1IW6JwxK8aw9S99xwDsO5H3Q62bsDhfM+YJGWUbWi6P
 P+iRp84xfXiCrIU+fEkHdbPxBbTZh9+Hmy48A9+itlDqJP5x7pdG0Sq
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

pm_runtime_put_autosuspend() already internally updates the last_busy
timestamp before scheduling the autosuspend, making explicit
pm_runtime_mark_last_busy() calls immediately before it redundant.

Fixes: 7c12f6ead467 ("spi: tegra210-quad: Add runtime autosuspend support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-tegra210-quad.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index 7fac695b5142..7cca5578eba3 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -1000,7 +1000,6 @@ static int tegra_qspi_setup(struct spi_device *spi)
 
 	spin_unlock_irqrestore(&tqspi->lock, flags);
 
-	pm_runtime_mark_last_busy(tqspi->dev);
 	pm_runtime_put_autosuspend(tqspi->dev);
 
 	return 0;
@@ -1790,7 +1789,6 @@ static int tegra_qspi_probe(struct platform_device *pdev)
 	tqspi->spi_cs_timing2 = tegra_qspi_readl(tqspi, QSPI_CS_TIMING2);
 	tqspi->def_command2_reg = tegra_qspi_readl(tqspi, QSPI_COMMAND2);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	ret = request_threaded_irq(tqspi->irq, NULL,
@@ -1851,7 +1849,6 @@ static int __maybe_unused tegra_qspi_resume(struct device *dev)
 
 	tegra_qspi_writel(tqspi, tqspi->command1_reg, QSPI_COMMAND1);
 	tegra_qspi_writel(tqspi, tqspi->def_command2_reg, QSPI_COMMAND2);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return spi_controller_resume(host);

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-quad-cd6cae580c33

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

