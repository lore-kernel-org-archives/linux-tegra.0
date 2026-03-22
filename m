Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30BB347C6
	for <linux-tegra@vger.kernel.org>; Sun, 22 Mar 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774146872; cv=none; b=LA8P74GRYQ5PDMKzuSHSqvTx8YJL/om3xS6eIK15yFKhPfs8ABUWSW4yNQSR070gd+5ZYKqxF+GxmTauvM+vLm3m1Ttc6+Sj22pP4DtcHZ6Ttg528zZmyFVo5JClrx3dB9uZRbxNkDNMXlpzT+YoxW30pXSawJnPLmwmsNU27+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774146872; c=relaxed/simple;
	bh=uENkwnAPwIxcuNSSxSNUnBu/2/DCKv3oLAP0aQGfxXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbqGK50iVTxVXS6CKAoFdHPz69hLfspsm4vRvTmDzc9Zpy4HpBW5yzXlVU14KdNu2KQxwl/Kt6BWd6xnl/xwa9EjL9MJZsvhIOxDbiRjoJId5VxqQ3ozQoIVGg/GqrgkvgvmIarAuvYSTyqJsHLSxkuNo2oGvM/Sh40I4fE17jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS162EUH; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS162EUH"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so39867266d6.3
        for <linux-tegra@vger.kernel.org>; Sat, 21 Mar 2026 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774146870; x=1774751670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFmKU7I+y/iUHbRAgHsm4IY7K5kFQVNPVjnDFd6Qzbw=;
        b=hS162EUHr0Y6LeArwTp72hW89Dr+FQ1CXE26/sHe07n5dasxTFmFLh9VagDSElf4uV
         5IqnqlBJmXINhwKMlhh/iRGaKc4DNNvbRUzqFs1j2h6tVWdb7BGl76fM3A5WROgaxl1j
         Q/KZ9KNORYll68udk9MtuCx9L7Ng5TThUYrFj7+V1UnLleUP3If44w+rIgQN17/Cn7uh
         +RIUj84QqkCLGZZCcgtuAd3cwW0i8lpBmYyohKyTLrNv5YLeqIH/BqIY2PC8aTWsZJo8
         FXmM/VqJ4hkJln0amFMCmrK4k8ztNv+UHWYm4NLgfOAAB6CYK3/YK+5k/0lXVw4JS7HF
         sCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774146870; x=1774751670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFmKU7I+y/iUHbRAgHsm4IY7K5kFQVNPVjnDFd6Qzbw=;
        b=YG7oPShcdc9HtlTcD35h96ySlyuq4G6DqNdb8rtSRAKp9kiMo6OlKj4V9hpPDptaW8
         0U3NAx/2Rw4bi/1gECVBOxRxPG+fyHmY225L/j0lh0JLl5gjH+FngM/f3zPkJTfTwqpi
         vnYDcW9KR69JJvsGZp+WZUxyYGo0I9Z807tR7PW+pv3HfdbQct6IJpsxVyTka1tVVeWJ
         WGb+y6vL2aX4I05q47NJ0CpwIFWvTbaXiBvWDAqror7yjxlqtpDlI9kD6HgvNJ0MEhP8
         ROgrTJOUOk2d65Bpr2+V34O9NhT0tPE7s4t6555O0fw9o3BAwYubcBhHsBh0dLtDldpC
         aqcg==
X-Forwarded-Encrypted: i=1; AJvYcCXQQVwdratT/zuhbvBkaFCSx8d3QsSo0vYSvG6H3Rh5Te881jqNTedmxoJDN4+TeFLKRLAhCyIovgo3QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAphtFHhVsTe7lIac8GhenzDbtceYpfaEYFGEsiwDD/3JzTc52
	oF0memT3t0q6bA2rtfHVLrG6L0D2yx5LBkJPGUWAex+8B4xztEfb2dLV
X-Gm-Gg: ATEYQzyyJXwvm+yZDxebuqTfNwX7RrFNQV1cTEyfuw1aNxlnsDI7ZVUzISOigRirrNi
	/vobeaEZeLIVhHbYhTY/Mgtrxvmab9PAIBmgC+M/eC7bHglc7DdDhBSTu2rSYDpbY3K1vVxziRq
	8c1Yb8a/FFRfhGnC+exzWHlQ8P2ymLZSe8CLSnmC9DGWezi41lNtEMZsY0qHrUXVTwg4osywOpr
	McCy8wci5u9J/xCBzCRQAeLvsuxuSSzzFE59A86URzVHWTv3Yz2FDYFtzxDSTRc3QdVRCsCOkaV
	BdGcMTPf5V/rKQOC6QbfPObM6V0qjk+mYfuujezZ33dxbEqFFROZ2uR6u32YDnR6BXrqvGbwEk9
	NEAAtyHR+STLuRk4f/qBpp7lHKOJisDZPZwemXug322nxXMDjNTunlwTX3auQLw+KD3LE3eYQnA
	JA/5MzelquW5A+5bNTXISxZ7e45y58/UM8WQ7F
X-Received: by 2002:a05:6214:6003:b0:899:f9f5:97a2 with SMTP id 6a1803df08f44-89c859f982cmr120781226d6.24.1774146869989;
        Sat, 21 Mar 2026 19:34:29 -0700 (PDT)
Received: from thinkcentre01.home ([142.113.119.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm66975556d6.25.2026.03.21.19.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 19:34:29 -0700 (PDT)
From: Cameron Pinchin <c.w.pinchin@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net (moderated list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER...),
	linux-tegra@vger.kernel.org (open list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER...),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: CameronPinchin <cameronpinchin@cmail.carleton.ca>
Subject: [PATCH] staging: nvec: fix comment formatting
Date: Sat, 21 Mar 2026 22:33:46 -0400
Message-ID: <20260322023346.100296-1-c.w.pinchin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: CameronPinchin <cameronpinchin@cmail.carleton.ca>

Fix comment formatting to align with kernel-doc guidelines.

No functional changes.

Signed-off-by: Cameron Pinchin <cameronpinchin@cmail.carleton.ca>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0

