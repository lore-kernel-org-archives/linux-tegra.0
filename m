Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F83B9931
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623656; cv=none; b=uskf9ca1bqRmlK25HoRfhJyGI95bn6H71qoiBxtKLnJv2PFoGBjfputJGDRP6UPyOwYBTl7eWzp6kbxQ8OLO+d2uJqbk93o9joEd9n3mkn8zLYlrdA3dgrXeFD96Q02oN4FZLn+6Zw6h47hYNwJF5Lrd0VqtL0rrfZV92Y3nuUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623656; c=relaxed/simple;
	bh=Iql2BNM56R8HoPn0c/UFqQmyvWWZVUhs7fIb3qIZbXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DCp5FQK1G3baC+N47aJXP7TNyUHhGLA7DIFyPr124lhOo2ws7K5D3XayRxRz+ESRPGyOdUGMco1gSR3Vvwt8ZxYqvNjScq1QXI53vLYE5aAFs50PA1MrhOprneqzK9Hdp5+QpOL9mgnvm6ebs+Dws3RMVn6fLg6FKKfqRfDPqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLhtL8dj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLhtL8dj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453427d3f4so10222496b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784623654; x=1785228454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbD7aakjuzas7aIGwnmgoXMf7eV3onlAUDz/4DsKXLM=;
        b=DLhtL8dj1MRqyGtRJUFNvi/Iz5uJErAR52MA/aanRnxfit4/9xX5LgD2A3OCIrUTiQ
         NcayhUZ2OBVXlaFrjfs9g7/2ekh+4f6eTzX1RQlfNGJjOX+HLAFOiho2ihp13nFcX3iu
         LtaTjalgNooW565vJ71xclgy7Fc84ACKps7R0Eq+1qRT+fG4NXGRwLVc2Ct7Ty9roMRF
         UJY3WGORmbe1z2FtgaGkXGQJnrhOWwL20AWNfdoIkudiYpT3qFkRQEi/53WlihYwoJ8p
         lK6tXLwWvSGQOQH70WfBbjo9LEX0hyPVqO/Cslyqs4P/YV3HkM57jEozK1BIhqLtoFHg
         e6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623654; x=1785228454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbD7aakjuzas7aIGwnmgoXMf7eV3onlAUDz/4DsKXLM=;
        b=X9vtn6Y0XHCeyVvzwhN9f0IpghS9td5xtW1RJZNg/rL57LWkpcDFZ4VkWVUyQivlp3
         FTWkSm0nIDvcJ4gWuu6ODVFzPDLK7IDchEnWrNIMaC0teUhsoxv6r6hHEjyDEAc08BNY
         rVISROlg/R0s6MJEqHWFWfJlh0u0pBWwULUJxdjRQrnOBg7dy0CusevLJrEwMFo74Dve
         KHvPupOWaRNRnahiwoWaPo3yQ43EsY9TkLwUF+kdqs2Xb2czFh6+1d6rhPSqrAl1d00S
         iGBDW1k4uQ97cN8rI8Qb+wqMnNT10Z3ZbDDHIE+izNl3prGPi4eM01KPEtvvXVo8Gl/u
         hLvA==
X-Forwarded-Encrypted: i=1; AHgh+RoAKoZNax2F2ZS6hiYtfIbQXXFVLC7kmFQrmC5eRg3IY0cfcOa/HqMpTZfMs4F1Upyn+cxF9/AELPyRpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIv/v42daxxvJ+f0rVAxhX63DYE9Km0hnyXn1qh2vJslxyjY+k
	RWN20EgIgzq0ezRd5H009JPOx/M0USOpq1FVSHbajURZ66hFTYcu9fHv
X-Gm-Gg: AfdE7cmIWrUTxxk2qSDvYRpDUevyprBamR5fNncNf2O09USBJP3tAfQmiysMMTYXIfK
	1Cwd+lsWg/nTR7BjkE4F4rDtLxe/aFL98p6p+Ww1rvJlnDGfipBeHh1dRiUFQc+XBmcLOMyppCL
	ptDv/eHwWKpX2HIwkzIXzU9BMLpF4YLU3X+LI8tVfVPco6GCJMkXmPUo5t12YYVo6WO1lOh9LLa
	il2bOsoSvQtOiyAM4UWXpQBM5n3Aal+YskP/XF4gPUARaylKCQJvE8VcHiuzUPO6yWsR1rU+Msm
	GnKkH5Wv+LQRor4Rzxen73J624UiVZ8cx+x/t2p6OQRFcgE2hb4sKa7ByVFQs+WFY+WvcFUY6G+
	XsNUEtt02/3S/FK0dbydeSAoCd+bkrSBtBw/GUMWs+OOZLeWgXS/LmFUSG3x5MRpbU1z18N9kxi
	TEwILts5hsSn466fgfRcdmEeW/ZgXlBXKnFPwb
X-Received: by 2002:a05:6a21:7a46:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c3ad9bb5e6mr20543046637.53.1784623654436;
        Tue, 21 Jul 2026 01:47:34 -0700 (PDT)
Received: from localhost.localdomain ([125.20.165.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2900a37sm36575095c88.0.2026.07.21.01.47.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 01:47:33 -0700 (PDT)
From: Aayush7352 <aayushdixit924@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush7352 <aayushdixit924@gmail.com>
Subject: [PATCH 1/1] staging: nvec: fix power-off path to not depend on workqueue
Date: Tue, 21 Jul 2026 14:17:27 +0530
Message-ID: <20260721084727.79305-1-aayushdixit924@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_power_off() uses nvec_write_async() which queues work via schedule_work().
During system shutdown or reboot, workqueues may be frozen, so the
AP_PWR_DOWN message never reaches the embedded controller and the
system hangs instead of powering off.

Fix by calling nvec_request_master() directly after queuing the power-off
messages, processing the TX queue synchronously in the power-off context.
Also add a NULL guard for nvec_power_handle.

This addresses the TODO item "add atomic ops in order to fix shutoff/reboot
problems" in drivers/staging/nvec/TODO.
---
 drivers/staging/nvec/nvec.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 88c416ee0..938ea8f34 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -774,10 +774,23 @@ static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 
 static void nvec_power_off(void)
 {
+	struct nvec_chip *nvec = nvec_power_handle;
 	char ap_pwr_down[] = { NVEC_SLEEP, AP_PWR_DOWN };
 
-	nvec_toggle_global_events(nvec_power_handle, false);
-	nvec_write_async(nvec_power_handle, ap_pwr_down, 2);
+	if (!nvec)
+		return;
+
+	nvec_toggle_global_events(nvec, false);
+	nvec_write_async(nvec, ap_pwr_down, 2);
+
+	/*
+	 * Process the TX queue directly instead of relying on the
+	 * workqueue.  Workqueues may be frozen during the power-off
+	 * sequence, so schedule_work() from nvec_write_async() may
+	 * not execute, leaving the AP_PWR_DOWN message unsent and
+	 * the system unable to power off.
+	 */
+	nvec_request_master(&nvec->tx_work);
 }
 
 static int tegra_nvec_probe(struct platform_device *pdev)
-- 
2.55.0

