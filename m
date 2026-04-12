Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DED2BE051
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011787; cv=none; b=GJrF3gJqlhr9MeZnFK4JzGww9vXXXMFe3evjWNl+67w87TTC/8HG4i4vCa2lFlabuf8U1f8vdIBK9W1div3H3dWneeAzc4JHuOml+p+EmdaMyZ/pGxlHQq/3yHSmhci/XOZH2aRuWCASCeBoD3GnZxm3zNqDPb+uqGWb/fz2xew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011787; c=relaxed/simple;
	bh=QrDJhhk0twAoCgQb0RphuWTv0vbxFxQEpBvzjFSkNow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SIc7K6QrqDs0nDNepE3Rvh4slspq2Zu5YAgPp3pk9OteHU4KR0wjNkNsH+CahuuEUQ6BoPBPghXBnUree6oe0i/AGuT5RpfwtkMS6EWWMu+9Fbf7OK913uS+zbfcyMPmde+DDvpg/fniOB8EoIJQ/Jpi5j1PGTqPw+k6LpYWvro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2mATZi0; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2mATZi0"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c42a23c8eso996314c88.1
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776011786; x=1776616586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9Q7XW5fCWd+W/KHOAvk90/HILYyws38daEBVyb/sVw=;
        b=l2mATZi0OrSws6PqfWE9zYTMpcD/sk6v7AL/1rpXpBrt9mrSqNHl0zyfeRWEhThVsm
         sTazkxNvRBdTLFPCTLoeqOM4tREWA1ZBmSzuXWk7W/+bMcua+1ESpR/DY5V079oZqJ2+
         GMnXox604nGvG2Iy/deES6RJ3TaaIBY7DncGkMetI9ZWm9fSgnTeDb6tkfiNs/z0ZLOr
         2naXwW4cQ/Rmjk0wWHfdRTe/+J4tMJrvAJ0xEvx/6FU/VDEZwvmJPZXgCQ+gl/dfLek7
         zplPDL7Iowg7HVGhPDFXVuFhY2ce4PrZzOjdaFBE5sISUW1R5LBZghQn6mQCAoyPXGva
         iI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011786; x=1776616586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9Q7XW5fCWd+W/KHOAvk90/HILYyws38daEBVyb/sVw=;
        b=WnkCkSg2RBIm1h81SP5wZP60rczOkGEl1RCvhR8A4Fpq5g9Pgfnjw7QOHBwRif7xws
         tbDxLC1y9UXBA0jv8ScorekXdhkdsPy85fDFZNMS85O4mu0woFoLO1boyhWMXOZsD7s0
         msI8AXW9yJkvviDnBQSLmKWp+e1KhlskQA/4OQ1Q2WS1nztUMydQM9oclj8PjYrEuhKN
         J1Fhp/7u5FxH0VxPoSTpbXFvxg0u6kPqrCY4WLIMN9tsz6EEw95mdIskzBvx5xlBu9Xa
         kmx4MDrJrpk8l0rRRgjWF5ov7OgwKWpdaDoIFtT4UtBpQvZlw1HctkJ4aS0elzst/FAE
         O6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsc5SFMyMe8qA2nIW9xJF9ieinxxGbEriHiwVynATF0ODSRTLEG2Rj2YUT09ssTHR9N3blqu9R5QqWag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwctffKTXulNaGd+sdwVyh301ZjUzgttAZzHSVjQyj/7AisxplA
	uuOLoG5oUVbZkeqgFZR7V+TIRBsp5pMdwo2K85bd15Elh0+hfMA/0Xf7
X-Gm-Gg: AeBDiesJHPox8IjlTLNtzoVJI5kSowdlfLvqQYjaZmmzSDtkqdI4Adi3qjl9QwwCWNq
	GunYpG0+zQBMMoeX+O6bRKQzSWwKLYHJ6+T2HUjBMgecKKhjGYtSsxs6XExCCJywr+8/ZUsvV2k
	MPzIhHHHECcciWtVGei30QHiBr6fajq6k9C/mR9WBcwU/QzT/3OVkto9XH42IGf/BO9ADnoS/T8
	ZlN0M4/10PDSmqiwhlvT0C27BWB20BY9EqllxzSW2QksrBvMHtUOMacfPvRPc7himnz6v1wtx4v
	gJTqJTFI54AsvxDx5aGuZKlIyQO4TYCxGsmdGiZwf35fzmb+T4/ysRlDBsechCfMQbtE9soA4WE
	Zd0hlClOSGOa/RdfkCdjNQJ3wR2bu6qvjdj8BKyQxcOiN8HK4XVlV1kiLwbuO96SeN98ZkTrVyH
	hegRQRe3F3DVj7hJc7s51Gm0T5z8TLs68cYG/03HlcG9vOSS/bdhAP504=
X-Received: by 2002:a05:7022:6a9:b0:123:3488:899f with SMTP id a92af1059eb24-12c34f14188mr5695800c88.32.1776011785777;
        Sun, 12 Apr 2026 09:36:25 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34acb077sm10201730c88.6.2026.04.12.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:36:24 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in pg_mode stop path
Date: Sun, 12 Apr 2026 16:36:00 +0000
Message-Id: <20260412163600.29925-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra210_csi_port_start_streaming() enables the CSI PHY regardless
of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
the PHY when pg_mode is set due to an early return.

Remove the early return so that the PHY disable path is always
executed, ensuring consistent teardown.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..57b5da11da93 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -1095,11 +1095,9 @@ tegra210_csi_port_stop_streaming(struct tegra_csi_channel *csi_chan, u8 portno)
 		 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
 		 CSI_PP_DISABLE);
 
-	if (csi_chan->pg_mode) {
+	if (csi_chan->pg_mode)
 		tpg_write(csi, portno, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
 			  PG_DISABLE);
-		return;
-	}
 
 	if (csi_chan->numlanes == 4) {
 		csi_write(csi, portno, TEGRA_CSI_PHY_CIL_COMMAND,
-- 
2.34.1

