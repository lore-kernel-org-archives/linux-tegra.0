Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB053A4F55
	for <linux-tegra@vger.kernel.org>; Tue, 20 Jan 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906653; cv=none; b=qiDuUMXyO1oYO/kkQLTk5gBW87RlWxITW6K4FShTweKRABXTbKEWUOMOTaWPC8if0X/1bxaV1pf92Eaubo6LgANM3B0a6RvHvqSLVMZ3mqwXpDFaaA1nGmA4+U2GR+o1JRTOj+16ochcmPstkXb3/3nO0AcItU2UmcI4cWo1k6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906653; c=relaxed/simple;
	bh=+cP6+RCnMfK6M/Ziao97TAb1J+8zzVDBx+mwEUETYBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkCrJJlanoz6Xt1QHloVoa8U1itWrxUxNyqwIv1FEFuG8/evw9YY9V06hxruLaoqY20cz5HokfqNK41se5DDS1oFfTcbPbcqMsT9Lv7VuLSV77j1tk90Z6DB7nHouQolB5GIq23yYayFwlczrfDbXcNXTcQaw5+j3lcZkQ0vssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAjflM3L; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAjflM3L"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so10964494a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 Jan 2026 02:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768906650; x=1769511450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjcmz31DBpGZJXncDVSE7eZnziXM/fDQkTmesLv1Zt8=;
        b=bAjflM3LetFGkznHyT/j3COIg+iG/6LhcQ7uXm9Y5mWoxGOpTxR1bVbRxWJxydp3Ov
         CZCqigqZExNVThux5T4LCCeJHUUh8PEsFWThr5fA08QeD0t0M47Wqk5BQcBvVqQ6msRU
         DaDASRg0fgnGbPbAhNMncjLFMtxxRSps4jwwSZ3yhHTrbqiNhG6BUjbZ4aP7WOuSzx+T
         Y7RqkN31R0Cw7ZhjhmHWK003kQfyHNJ8/j+oQ55/xM5BUWBCcNQqkUFItTlZkQVZyjsA
         9NjlI14zpbt474FVsmO5m8xH0K3w8lGGKzXTuILCG5WMxRIwdBT2M9VI68bp2uhynVrY
         ao4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906650; x=1769511450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjcmz31DBpGZJXncDVSE7eZnziXM/fDQkTmesLv1Zt8=;
        b=FCBRYhF+FjjsKX28ysJ2zay+eFFPkpej92ftfRKRo1x2vwgpHFRViaF6sMssa98Fd1
         YfkV/94TAX1MAS5cgsDHf26gvn8Gox4jaJdJ36nhwi2NuJ/cDNMfw3THLzwhoJm2ITcM
         3lolc7A1hpIM69aSu3JDKxFkqJcIS3fuOtNq248/pcSLedhoY3SckSXQfMNqvhNUo8iK
         DPEx5qHem42tGf4ib3jUG331XSSt8DRLAtm5nHUv/fuA1dIGcIzoHX4yhHKEpwuZjHqE
         0Kpeu7oR90Gy0aHPfphKQLEVanRp2YbVLEnmi3L5LPbgAQFoLXvFdzvEGp8GhfpG/LbU
         qBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQOEEh9x/GRakHRuRJsfSit2V0ZprJjov1hDwYP4XHXXS9VHRWViOBm/t44xSf5My8MLyKwRQSwPZWuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+ZfbtBb4fDEgnk0yghlwMfWIQ12g+vKIl5E2+iGe8nBIsaUs
	K+WbEWDZnzQBCZaWJ8RJPhzisdIkAG38SHqnvGj+7aM5BDCJ9i2J437j
X-Gm-Gg: AZuq6aI7zVVtTe9FUrt4OJp2RPB11pGVmrer6CxtIhsGZIdjRBR7Ksf9aCdeSnC1b3z
	ZCgh+5Izg3DbzEwmWo0wRk3NvAZf0dDP5vPRhehF5W0vpq3jFBYJggDbhhOX4iBo+2e3cUojbgG
	IFcUXB4wORzBs3kx/RzYRxcxdK45oOKiTshFOpcQY/YBuyoxI9uv+iVEo4pJijus/9tpQN7k5Ld
	4Kx9jouAFXZb8MrFOZhe6CwEVFAzxFVtarSYhBRvEZxYdnBA2Mgx452MpVRiBdFT8Jb3WWcZ+3Q
	SN0tZcKT54TJ0KBPvkBORkJh1OtF7KKzaIMEbCw0Vu8Z/Qvt2OzQXw25Snw3szYRqIF+G/oURmc
	VGl3YuT2l+SqEynxkFiGFcj3OFUZsCJ9wxjgnNJI39sMbZxY96DXynOFmwhdZwz4KsIMaHI3iDi
	/m4u/0+yrs6JoUV5UDlBQFHIM61AKP+eA6r9WxSLkFH6HcKEpBOvHIoomrJywfAMHlGtCypxjAF
	dpz3g58wYn8/W9uVg==
X-Received: by 2002:a17:907:3e12:b0:b70:4f7d:24f8 with SMTP id a640c23a62f3a-b8793a1ee62mr1347293166b.22.1768906650116;
        Tue, 20 Jan 2026 02:57:30 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959f6e74sm1374866366b.48.2026.01.20.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:57:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Prathamesh Shete <pshete@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: pmc: Add missing kerneldoc for new fields
Date: Tue, 20 Jan 2026 11:57:23 +0100
Message-ID: <20260120105723.3019205-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The wake_work and wake_status fields were recently introduced but were
missing a kerneldoc description. Add one to fix the corresponding build
warning.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9cdbd8ba94be..dfcfd89d23a4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -438,6 +438,8 @@ struct tegra_pmc_soc {
  * @wake_cntrl_level_map: Bitmap to hold wake levels to be programmed in
  *     cntrl register associated with each wake during system suspend.
  * @syscore: syscore suspend/resume callbacks
+ * @wake_work: IRQ worker to retrigger wake interrupts on resume
+ * @wake_status: wake IRQ status at resume, cached for IRQ worker
  */
 struct tegra_pmc {
 	struct device *dev;
-- 
2.52.0

