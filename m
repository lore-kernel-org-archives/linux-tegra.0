Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880126;
	b=ABnoA5ocfzaagTtYcXIIkjyztKyr3gymLEGJQtaiYnSeMug9/o0SIcL97m9ky2NU5RlV
	 v2KP6v8UdYVS2L/5+WeVN4CtDcPlHTA8otvigsNtJ/9P/48b0m70n5N9z28LxvI9Fc0ok
	 ZTYeAx0NK1cCS0vXFrsJfpjooS3v38U3EAn5kRYkXSV4aoNBlY9J4926gCzUzck8cGUtC
	 ty0d6f2bQ5xGv9hs5dtLWGBlY1ioD7WEEpZAItGhCjM2RvbCetR6GsfqymLYWHjYKTiL5
	 olgiq1314eHJ9fcfS6RKe4GTMv/Zpe6pI4HTD3UyTo/io5BZHUPHDT6ke+UD4GQt9aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
	b=RFv4/F8k9Ow+vOBohvoPf0S0SaB4sUgDpTgJSvDMf/ig9GNK8ucU1yBOJBKBOAeWvqCR
	 ueaDlNSkoZjvQB4To+zmdK7a+LlQSeNjfrwzCwjnJ7iEkspRaummMoM3sMDK/SIUbgIUx
	 L2lc0IWlgOyr9NYMEmt1SoiRbFGrsLPBzQmFHtPMcy880Y65p4ollJAlIMYdn4X5TvcUK
	 n/Dsb/TiD33WIhl4nWX9ch6jzCRDQBYHfvaOkbstUEOQoJQriYiS61PEc8oZ7u/hBPQgx
	 4/Fw+EGIQZssT+6H5ajOYb8ZLcrEfU1RZPNOh3P9tYs217gIx7pPNaHsr03OHhRTjxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lhj41ntJ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360FE606A31F
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 15:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360FE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lhj41ntJ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so73872635e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880124; x=1796484924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
        b=Lhj41ntJIj6j0g+5m/PV3M0F9CFMLiYPxvxKjMLjkJWXvno68ILod9L2mpP/CsKhFg
         I3ap1mfQ6MjWG3nnIQ6XKLaznVHiH6RwphnNkOENQl/0LLfXVEkBbDfxzJM1hjPSlCCU
         7qan8THMN6WzaJIrL2DYepj5UCNJH7QfFhiRMaexVlnF/0pPKHqjye6PpS3NybGg3z7S
         TVGk2GLi1jdlAjlyWU/6QQ1N0qP7sWGDhUnfLOeOnWNaygpd8OxBfDD6KPwJkdzynkjU
         d3ME9580Dx70y7R2Ys/xEdAeLPhkuXuOYYln3RulTlwGatX4LnS+5EL+L/1nSMsIDYRq
         Z6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880124; x=1796484924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
        b=nO16zJvw/8v04+Yz1ns3CJj6QDilENmUdDMPLmsW16S5ja3g8wFc30shsUuTexbJDF
         qEXXtA5a6yQ0gHr7+nC+8K2wf/B0tfU4AaCILoeReTd5PZq2ZNSh+g/6cX4vLTgjHKEm
         7eZ2/Io/qyLqHOVDVpG7mVYTRvIIu0bDD4SZIFMzy3HUvfpKnJ/A5Qhreu9O52coumQx
         MjeSDPGU+srcaCbvCfw4U33xYAmlUhCB8ZvGabc9OIu23naoqjfqJxghjKVjGil2rO+n
         qRSGScMWp0zBrr1T63+LWraXMEWYNs3FFKCiVQsR28Bu2IhPpXlT+fDtNdy72ELP84e0
         ms5w==
X-Forwarded-Encrypted: i=1; AL+hErGZziNXHo6fks/zvK8K1/tkZZ4H/O0pRtlYjTU69FFHjhj7uMsGfy5nt+I+FubNo+0OWQsqbcCQ483Ogw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CMbQqoUz4q0uNFk+uNcAuEYh4Wwz4OtSRixGgqeAe7P/US6Hz
	FNCsQQsoiNLHPwQ+DKYXSP2EbBdwFPK47V+oFg9EMxKmtZKAsz+3Yf/M
X-Gm-Gg: AZFdTZdb+B0eR5wqEM6e01ZdjBx3ePf9D+ioGcVE9hZMO2QTS7IrjyM3ctyOFWj7k4h
	WcWuvciwWUvY0Pr+7QHJqCzi9uKHFIaRP+nJTR5imDaz4pMvSj5+9wQ/Bo6yNYmbSJ5Gt0/ubrA
	xXOd2I1EGyq3BC5yQ2qgtsj7arnfaN01hIOpaVDZjLj8TihEdkeMo5Gnmy5pqb+Vcio7MeSflXl
	4OwvrpJpEfDBKGbjbRLKa6Wc9H2xZ85dqJuCWurGLoP4gPqU8oJ7N5aT3ZCWKyL7/2tPtOUf8wB
	tOxAPFo3DFD/2TeiFBfOwFt9w8xOlA3uXIsbYhajtsuO47QF+wCXL1ZQ2nnROrj6bo7LQL31XIU
	/YTadlhGS8pVowdjdVV+q59QcqOy97TXm7eZYxa93Be56xxXElDt8i61+cLmwvq/xc/X7auj4Q2
	OWclxDdnx/v9jVlhl327su4Z57uoWZUkdpgSm1310dFcbGwA7lk4tkAA4+nuX1YEUFk3XSWNn1V
	EPDielOw6OOaBeT/NQ2SrkBCZvloqaEN2bomyKFxvA30iBy1Q+fkrHc7ZRFl6XUnEy4Kl2UOKYL
	1J+EtL1XlksYIJ2uMwIzzmBulIRMy/qN+Q/p1ue1WF24vq7iTXbEwkHSRSErfQ==
X-Received: by 2002:a05:600c:a117:b0:4bb:a5e1:7497 with SMTP id 5b1f17b1804b1-4bba5e18d83mr191413735e9.32.1795880124443;
        Sat, 28 Nov 2026 07:35:24 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:23 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:59 +0100
Subject: [PATCH 3/4] soc/tegra: pmc: Power up VDE partition before
 restarting Tegra20
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-3-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=+L9yJ+khZAxRa3E+MLPbYZHl84vHWWJzo21sWA+6TPo=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl62HpkcHB/xanbbc80tjw3ThAw4qOkt7npyQ/lu1u
 npC+fOlHaUsDGJcDLJiiixmD4W+8Mzzer/h5dZOmDmsTCBDGLg4BWAi9zgY/rtM0Hm/P3KDQEOp
 dFH83KNGuxdPv947OWSlddbdP7+l95xnZLi0JjJ+86e0vNl19bnPGlaF5U61z17zdfnPaQn1va+
 ze5gB
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The Tegra20 boot ROM hangs on a warm reset if the VDE power partition is
power-gated or clamped. The partition is powered on after a cold boot,
and since the PMC isn't reset by a warm reset, it keeps the state Linux
left it in.

This is currently worked around by the VDE driver, which powers the
partition on from its shutdown callback. That doesn't cover emergency
restarts, such as on a panic, which don't run shutdown callbacks, or the
cases where the VDE driver isn't loaded or hasn't probed yet. The PMC
driver also powers the partition down at probe time, so the cold-boot
state doesn't survive even without the VDE driver.

Power the partition on and remove its clamps from the PMC restart path
instead, right before the main reset. Factor the clamp mask computation
out of __tegra_powergate_remove_clamping() so that it can be shared.

Fixes: 8f0c714ad9be ("media: staging: tegra-vde: Turn ON power domain on shutdown")
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 74 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fcd9a644d97f..3fe4db473905 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -377,6 +377,7 @@ struct tegra_pmc_soc {
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
 	bool needs_mbist_war;
+	bool needs_vde_restart_war;
 	bool has_io_pad_wren;
 	bool maybe_tz_only;
 
@@ -711,11 +712,24 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 	return err;
 }
 
+static u32 tegra_powergate_clamp_mask(unsigned int id)
+{
+	/*
+	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
+	 * swapped relatively to the partition ids
+	 */
+	if (id == TEGRA_POWERGATE_VDEC)
+		return BIT(TEGRA_POWERGATE_PCIE);
+
+	if (id == TEGRA_POWERGATE_PCIE)
+		return BIT(TEGRA_POWERGATE_VDEC);
+
+	return BIT(id);
+}
+
 static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 					     unsigned int id)
 {
-	u32 mask;
-
 	mutex_lock(&pmc->powergates_lock);
 
 	/*
@@ -729,18 +743,7 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 		}
 	}
 
-	/*
-	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
-	 * swapped relatively to the partition ids
-	 */
-	if (id == TEGRA_POWERGATE_VDEC)
-		mask = (1 << TEGRA_POWERGATE_PCIE);
-	else if (id == TEGRA_POWERGATE_PCIE)
-		mask = (1 << TEGRA_POWERGATE_VDEC);
-	else
-		mask = (1 << id);
-
-	tegra_pmc_writel(pmc, mask, REMOVE_CLAMPING);
+	tegra_pmc_writel(pmc, tegra_powergate_clamp_mask(id), REMOVE_CLAMPING);
 
 out:
 	mutex_unlock(&pmc->powergates_lock);
@@ -1189,10 +1192,52 @@ static int tegra_pmc_reboot_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/*
+ * The Tegra20 boot ROM hangs on a warm reset if the VDE partition is
+ * power-gated or clamped, as it is powered on after a cold boot, so power
+ * it on before resetting. The PMC isn't reset, so the partition keeps its
+ * state.
+ *
+ * This runs with interrupts disabled, so tegra_powergate_set() can't be
+ * used, as it takes a mutex and sleeps. The partition is powered on without
+ * enabling its clocks and deasserting its resets, which the reset takes care
+ * of.
+ */
+static void tegra_pmc_restart_power_up_vde(struct tegra_pmc *pmc)
+{
+	const unsigned int id = TEGRA_POWERGATE_VDEC;
+	unsigned int retries = 3;
+	bool on;
+	int err;
+
+	if (!pmc->soc || !pmc->soc->needs_vde_restart_war)
+		return;
+
+	if (tegra_powergate_state(pmc, id))
+		return;
+
+	do {
+		tegra_pmc_writel(pmc, PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
+		err = read_poll_timeout_atomic(tegra_powergate_state, on, on,
+					       10, 100000, false, pmc, id);
+	} while (err && --retries);
+
+	if (err) {
+		pr_warn("failed to power up VDE partition: %d\n", err);
+		return;
+	}
+
+	udelay(10);
+	tegra_pmc_writel(pmc, tegra_powergate_clamp_mask(id), REMOVE_CLAMPING);
+	udelay(10);
+}
+
 static void tegra_pmc_restart(struct tegra_pmc *pmc)
 {
 	u32 value;
 
+	tegra_pmc_restart_power_up_vde(pmc);
+
 	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value |= PMC_CNTRL_MAIN_RST;
@@ -3448,6 +3493,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
+	.needs_vde_restart_war = true,
 	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = 0,

-- 
2.56.1

