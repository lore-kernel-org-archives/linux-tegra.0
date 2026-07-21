Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D963C7E16
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627816; cv=none; b=EaMzkE4LI8aztHmrnTdaH8XX2IsyJpLQfBy5m+bqvTAEqJYeEWEBQVL5lX+sK5fgvXNvMGAmg30GL2AeXx9rQxogsg/pfcEngklyhIiSPFOlQmIt2IQireT5Qzu9A7UQrxex3TAUp7mo0HDtUtSlWHxJyn1d6j17Yknvr0iVhxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627816; c=relaxed/simple;
	bh=tikWYDEQLVc5waY2/78bTj9CLn2yecpBpXsk/U5GP90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3SzrLyvYh48dZMCzC7RwS2NU1NAsQoPgA0G4BBk4WDzXkyyRdUaaE3jjcy0QoIJ3XNgTjGRhZ23gnXpHYSzzYZLaBRI00nFnQDOhMx2cSuXnS9Hg/Xpc0cRUsBL6uPrgygxEnLsa60EosWwRbZg64U23iRnKrek6uN5FJox+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQJxuUM6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQJxuUM6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso125112655ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627814; x=1785232614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4FztRgbbuu/DGlKT6aKIPa27gZ9w0psRj4kEpq+JGc=;
        b=pQJxuUM6JCcA38h3IKGJrRdbLZjDnsOzqJn+qXUWJwkYny2Hmpu9wQUmJ5tWV2Dx3p
         1Y6cFMFJpIYs0WTGnWlmGIWHIuj8Ug7kArFdJuzH6S+4vI/ElpeJLmL95Ag4aKXbPd2T
         MGe0YuXfgdTvf9Ww6nXTbXwuClxBMaUaro0dycVMqlruyIFHY6RAe1CrWf+UrfkADnNq
         CdwUcdO7yot8BW6uXRWw2w2ifFAFwy2UoNOoU2Tp1PiuGbMNfgxiRr/cOGat3/RlIpHD
         QK4cUE40QCyoiQPq2+86NcHbgMMYq40qdUPqmOGkWszqHlvP+yktgQeckTieMSjyopY/
         0eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627814; x=1785232614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4FztRgbbuu/DGlKT6aKIPa27gZ9w0psRj4kEpq+JGc=;
        b=K11+2I5kZYZbN4Vxh7EgT2Zi9LU85VFzxs2WJubNkLYZp6HB5EbiqnMQdanbECPVb0
         UfRof2iFSFlj2RXilN41K/EK2O1AyM+TIp/LASZTcq0hhS8jdlDqoFr3bjlJGjtgRrGV
         bD7kwVAEJUYcInoA66c5Wv27YwrNc5mVr8RH54udXgteuP+4qQsIJEM+B8+rX1sqQCqe
         DOmT8tkrw/SuIAj10syjAb8RQ45a3XLRbqBFD70gJ7bp7GS7OtvzpfK1zgR1eROY3Yj+
         0b9oocMoA1LesGoQQMHwsTCx6DY/hQY73ISlKhCCpF61hVz9D3Oo/ZW7qoZU/VkzC2gf
         jIjw==
X-Forwarded-Encrypted: i=1; AHgh+RoQZFbNv0O1EjVQIgT8BqrMsF8m76qc1APEcDpL7SuopO3aiy9OYWga7SAC4TFSMXvyGtcbbMPreEwaEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXG+0fnG3f2vXIhNjwpyeU3QFopQlyauu7LAfFMdzcuWYJNWLM
	tCqlF8N01ZCWvll42sEBSptMoNnL4TAwt5F5ZvkB7Yu3hahE3zKe2o88
X-Gm-Gg: AR+sD12WCK7uBFPQOCzibnwJy5mUei7jaSXx+A08TuSnT50CbX17Ipvi6kyT3mGeMBV
	E69zIW9Nm98BDuDHdrz1GaiWQYbco56r3Yi0ffTWvd+5Sqda+TJwCa+RKESw+hQSHbAXL7EJQOr
	6Gi4gtXm82/jF0VYtpHo8veWWgmXXyF2V4ZoIraF8XsAPU6og+1gUhv3RP77AFVT/IDsr8RE0dw
	Ir0lpPCocEtMw9g9z5rwLAfUlTC7hmDCkydyHtvD8D7KutYNkk8W6XVSXxI7WzhzbslCl606jOK
	QBhQEJz5UaFd5gPzTffVS5tiy+OxLszPUkun+REjWmxvX4ac7bUSoTuSLpjdNdHjznfnEy3lk3V
	CMYw5vVwnyiB4S9jpuDLRGmy74kbyEezTlky4QKNORau9WZTy7It+XIbmL4ZNf9N2jlzrIGYR0A
	wouDQMS/5tQj0AgEtzvc08h/X1S+zR79YGzaVu
X-Received: by 2002:a17:902:ce0d:b0:2cc:9a86:9c42 with SMTP id d9443c01a7336-2cf349eb316mr181225525ad.45.1784627814521;
        Tue, 21 Jul 2026 02:56:54 -0700 (PDT)
Received: from localhost.localdomain ([125.20.165.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm44496508eec.26.2026.07.21.02.56.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 02:56:53 -0700 (PDT)
From: Aayush7352 <aayushdixit924@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Aayush Dixit <aayushdixit924@gmail.com>
Subject: [PATCH] staging: nvec: fix power-off path to not depend on workqueue
Date: Tue, 21 Jul 2026 15:26:46 +0530
Message-ID: <20260721095646.80663-1-aayushdixit924@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Dixit <aayushdixit924@gmail.com>

nvec_power_off() uses nvec_write_async() which queues work via
schedule_work().  During system shutdown or reboot, workqueues may be
frozen, so the AP_PWR_DOWN message never reaches the embedded
controller and the system hangs instead of powering off.

Fix by calling nvec_request_master() directly after queuing the
power-off messages, processing the TX queue synchronously in the
power-off context.  Also add a NULL guard for nvec_power_handle.

This addresses the TODO item "add atomic ops in order to fix
shutoff/reboot problems" in drivers/staging/nvec/TODO.

Signed-off-by: Aayush Dixit <aayushdixit924@gmail.com>
---
This patch has not been tested.  Compile-tested and checkpatch-clean only.

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

