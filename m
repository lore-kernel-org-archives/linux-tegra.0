Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645568;
	b=EjjUdOiZ6rgrCcONXylyUHbVLkRjLt5Hh3jimTFyUt2ifSBFXqCW9SG8h83qMV761q4D
	 qvDJLs8TVPoR/bo5nBO95yJQCtoBwkpl/5Hu7WjfTx7wWhfQNHlwzYu7aebJxd7ETtSGq
	 gQF7Xl3IXzrvg6M6WPR3X5NtXq85INXSyo0oNWgoA4iBWkZhyLH43Qzz1Ws68FVJ15P+q
	 P+GmP7y3HuKN2J3WC6h7POfLDaY6Rq5r8fgasnBZcJSgacgw7v5EQxrZFqx0w+YUB/I+p
	 CpucnodtRqUCi8voLO73+/M3+t6fAuSarh08DjdkA2tLfLAQZ80qGF2IfZgfMTEFElg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0rVVzmzY0lwgJTS0cbzP8cvMbI4YDQ41g7jiphGM+4E=;
	b=BH0xN54d4uTeo+/5BQzbYMXBZm1vt/afCE5DsC0AVf62pq+nXJL/t+2Bf+3xIrIacy+S
	 QV+k6qpbiwzN3D0p9kViMpBaACYGpKQx5WNosszDeOCB24IBG1qFik77uYLSO7HToHSn1
	 6L0zjWrLDSAKemI1FBAvTlfASNMpRX9VL2KyJYyQP8VRDbpW7Uur5TbiZ7jxA3Pq7eDXp
	 iX/n+yYZPJIpi6e/iyWjxfp8f0i4dR4+oaIp/MOx4VjyBEKcOnoKeaRDiZDEHDzpu97y3
	 7C+4/FyAQSbSQ0+9UW+L3xUXLQ0YInJJ9VjAoCOIQ1teHxZnKlbyek3aSNp87+MP7Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V75xTU1m;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D260A260C
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 22:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527D260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V75xTU1m
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8025714eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 14:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645566; x=1796250366; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rVVzmzY0lwgJTS0cbzP8cvMbI4YDQ41g7jiphGM+4E=;
        b=V75xTU1m3lnS5onyxb+SDoQfZ1LXFsmQgIijAhHx3PkCC09PGzSSgV+mpScmu6ntm5
         JUq/s3EYwdwNPM/KD61zb+DgJeiyTeoC/DjuBpqYxV7eCBjyBSYbns754DMXtMx39oqS
         BXqv4EPRN/NeQbdmiTPNTX2/uB2E8gVT3X2NMdvMVCDUrAFpE4z7ycOvafy2D+NgkEig
         vgMA+X84R08xFS9IBr/9sOesR+gaB13GU4r0gBkfMSeBlclqqYeh/3pBH8T1v/dovtzL
         YXWoLcoTJ6JTkDMHVCNJOXCdTLvEVdALRxvvDsVN4jdfW+gTRRbCYZ0C9GRxhj2dyN0p
         /niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645566; x=1796250366;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rVVzmzY0lwgJTS0cbzP8cvMbI4YDQ41g7jiphGM+4E=;
        b=tl50HetQYazhAzWWryWdNvmYnMLivpboqg1ui60hR2fHYdDuEELNAh3r5cR74eOXaN
         pj/4JNdr8vnGPk+i8nCDpDywfv28xZeAudMB43vkNkXx7F4gkHnY76LqCreVgTVtyK3c
         So6MYKTlYDy/LFDcqPad4Z3017hY+BVXMNeFkC6yHEQtA8Tt2rY/aY/waEa1T+52S0pQ
         Bh0a98i0i1VvMkW9ZxhOYfeWdszhV31XF1gAle4f/SHM88LvSMFmgX9Opwo4bviyyt/j
         HbtE8FHS1qSufhseV0SlfAzf2grPqGrc3BB51s8XXt2fQduPww0Wwt5TQRHXbA0aX1H0
         3gbQ==
X-Forwarded-Encrypted: i=1; AL+hErHpThgKyqe+S5nRlkURfsDJIXSSkfdfLFWXwSJ1CyJiR9fEPlb7Gb6QYue0Q09VPFdrgjnyzHSa+NTM8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CHECR/Mw9YEDMrfqta3JqDq/gr/d+b3eh7WNzoy6BwtXm9NK2
	0QWXIDzzpIYLxei140lURxwiwbluGu4GuY2oTLFlFsWb5kojvO64Bn7ZyBM1zpGybMxNT9M4bew
	/Ug==
X-Received: from dlbtp3.prod.google.com ([2002:a05:7022:3b83:b0:17d:5c89:d119])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f10f:b0:1b3:abd2:2eb2
 with SMTP id a92af1059eb24-1b55689ed61mr23336815c88.10.1795645566067; Wed, 25
 Nov 2026 14:26:06 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:49 +0000
In-Reply-To: <20261125222549.1447825-1-elkin@google.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222549.1447825-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222549.1447825-3-elkin@google.com>
Subject: [PATCH 2/2] pinctrl: tegra: Add register bank bounds checks
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Aaron Kling <webgeek1234@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

Add defensive bounds checks on the register bank index in
tegra_pinconf_reg(), pmx_readl(), and pmx_writel() (using
WARN_ON_ONCE()) so misconfigured pin group tables cannot index past
pmx->regs[pmx->nbanks].

Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 51684c5dda34..c0b584d37a8e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -30,11 +30,17 @@
 
 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 {
+	if (WARN_ON_ONCE(bank >= pmx->nbanks))
+		return 0;
+
 	return readl(pmx->regs[bank] + reg);
 }
 
 static inline void pmx_writel(struct tegra_pmx *pmx, u32 val, u32 bank, u32 reg)
 {
+	if (WARN_ON_ONCE(bank >= pmx->nbanks))
+		return;
+
 	writel_relaxed(val, pmx->regs[bank] + reg);
 	/* make sure pinmux register write completed */
 	pmx_readl(pmx, bank, reg);
@@ -525,7 +531,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		return -ENOTSUPP;
 	}
 
-	if (*reg < 0 || *bit < 0)  {
+	if (*reg < 0 || *bit < 0 || *bank < 0 || *bank >= pmx->nbanks)  {
 		if (report_err) {
 			const char *prop = "unknown";
 			int i;
-- 
2.56.1.839.g22a8290db9-goog

