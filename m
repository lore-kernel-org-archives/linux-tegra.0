Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E653D6494
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458483; cv=none; b=aP0pp+FxhgZkpSosSaBAnUef4GdoQL8cPAkWuT6keqNWG20Q0F2ZMkMRPzP+/8lB2HKqvk+LrAsfb98V9aoLO9uVBTvnUoS993T9NSE6JwhTeo0zvdbwbbc6DD3YUx66WG3kIzTzcj2TvRpIMhQiBt0qviRwXR5a8lDjEMsw3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458483; c=relaxed/simple;
	bh=aVFPK7SUpcpakPalTN3Yuz97INHgAbhDB4lXhxI43k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBRF0lw2e0jhfwcuYxrrpmH237laQocBn8CAUyHEOUyJ6ZjHo47YkHRXcCRbGxFQslHpOVvoj6YFfMTLAlhdKhcASnCEhACtkYjYKme55OITt4BgqMpZMR2pDqs/ME0ACQCV1+ktG48SVcZOU6pbDPafeWuvYaL6VD+4pJM8zec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR1fHvxS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR1fHvxS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so10404224a91.1
        for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777458480; x=1778063280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+9QBBMU8htpcS6BmZ6YxHpCBuohfRwpwtrnTFil/Yo=;
        b=MR1fHvxSxBm93sjFnEN0TH0225cWbCntxDq+TVuvvJCRCUtD1B/JKe5zbtEJ6lfXWA
         MTej4gZl54gBesKO88Kr2Xsj8InHVVTlGsXCYv69lMW6kSm/j7Hz4/RjYUfdSn0hxQ1L
         wBs1nJ3TGYj67j05vo76VXz0pZGnyOb1IsxjhxL8/1lkGj7XWDEwSjkyhlwhyQia3BYx
         8q4m4AYnEGr00BfT66NFw8fEs60GCPvR9Vz9yQz5bquKNF63jn+C7Lqvw9YiBBxiwzA9
         G09Db2h/1cWDivP8D70ov8VVaWKhZBFn4fS3bcCJUmgx41qhdvt3iHbDjQNiH9LLlcwq
         waMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458480; x=1778063280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+9QBBMU8htpcS6BmZ6YxHpCBuohfRwpwtrnTFil/Yo=;
        b=VVK3FIysG1/qbmA7v7zeVAMTpuHCjC40Q0td7eGyMGLeMRLsmL13BkIk18DHeRUmwQ
         6uOYKEUvtY8n6Jk6y+FgK+bMqNMdKNvCPxRShpkQJvg1UUKpNbLmO3v7va1/tR5bj77H
         qCFFF3mRB3MMpqZc2aEV6MwDI+cx+dI9xn8mfcPYuic1PHI9FRql63sxfE2FeFdnLmtr
         T8WUhUy+VB3Pz5/duAFWHbw04EmhnL6mh0+wRE9kAy7z49/QyVTxxJTiSiAG2isCwK0a
         Nqh1bxbXGl8X61UESQMIqYqa7uSVDDZbWjEDHTXo04v8AXyFaI+HvF0AtOLwc2Wi4dPc
         +sqw==
X-Forwarded-Encrypted: i=1; AFNElJ9Qz9uLwa8c/8NCcsuqf0vkrMV5mk7cofu0ft9Npuy+KQyUFF8VV8LIHbkQYITZClah55rP4UYOsh6dyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsS2GB0BBYGcCgQH/nJSm8UEIOYWGu6TAN771ATlMQBYDqg9D
	D3vY3YrmgpRLfJozs9v+9jNBShdyhlYcZQP7yQHjYIBZ5gzNvL8DfRzC
X-Gm-Gg: AeBDieuSPgPe4LmAoOyZXrwUJ2ELvVPd45tt0jFoLYop5xYyjiJQPt0MpOnfHDMB7ve
	juIwVd+aDUSiZXhYYw7VB0GAggrSaxLtQQGhDvCP0lse7bHFpcSR+48nS3W6snx+DUcdtQM5rZR
	iuSAdaPFA666S5NJILJrx02pbYr0nt9njIuBa3NdXW9TKjKu+M4bJBxgL6tmiVcwJwB+iSG7qZf
	P5X2V3rgmfln4JPg4Bd/dBwR1haXiEcKrIfs6Cc2W0b1b2e6iwp2jwoKnUoh/9wIztvUp7Ecz6X
	qUam5V5NECceRJS6sp9GFu1Wv/Dcw1UJ221D2QPPvVgy0BQsQv0Gv4B0w1MRnb3J1kzRGTfK3xa
	xuDG6G93vs6wlc9fi6kOVFblFl0v6chFnWtccPRovcdOoJej1iaIsCdUyS1DrruE7VZNjEZ3ipq
	xf5uxcJaEDb/tWaNIU3/p6aD5cdUOQxWZu7UH0WhYAQkaX+ATB1iqmQBSG2ipsT7alWkJX
X-Received: by 2002:a17:90a:e18c:b0:35e:5929:d78d with SMTP id 98e67ed59e1d1-364a0ade51bmr3299256a91.3.1777458479986;
        Wed, 29 Apr 2026 03:27:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a27c356asm1107003a91.0.2026.04.29.03.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:27:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: tegra: Use guard() for mutex locks
Date: Wed, 29 Apr 2026 17:27:43 +0700
Message-ID: <20260429102743.103197-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra_isomgr_bw.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
index fa979960bc09..db33acbf6c67 100644
--- a/sound/soc/tegra/tegra_isomgr_bw.c
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -55,19 +55,18 @@ int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
 				sample_bytes;
 	}
 
-	mutex_lock(&adma_isomgr->mutex);
-
-	if (is_running) {
-		if (bandwidth + adma_isomgr->current_bandwidth > adma_isomgr->max_bw)
-			bandwidth = adma_isomgr->max_bw - adma_isomgr->current_bandwidth;
-
-		adma_isomgr->current_bandwidth += bandwidth;
-	} else {
-		adma_isomgr->current_bandwidth -= adma_isomgr->bw_per_dev[type][pcm->device];
+	scoped_guard(mutex, &adma_isomgr->mutex) {
+		if (is_running) {
+			if (bandwidth + adma_isomgr->current_bandwidth > adma_isomgr->max_bw)
+				bandwidth = adma_isomgr->max_bw - adma_isomgr->current_bandwidth;
+
+			adma_isomgr->current_bandwidth += bandwidth;
+		} else {
+			adma_isomgr->current_bandwidth -=
+				adma_isomgr->bw_per_dev[type][pcm->device];
+		}
 	}
 
-	mutex_unlock(&adma_isomgr->mutex);
-
 	adma_isomgr->bw_per_dev[type][pcm->device] = bandwidth;
 
 	dev_dbg(dev, "Setting up bandwidth to %d KBps\n", adma_isomgr->current_bandwidth);
-- 
2.43.0

