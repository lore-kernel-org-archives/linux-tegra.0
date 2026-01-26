Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1482749D6
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454490; cv=none; b=iK8fXEWUNjpzrqbp4JtNdAVdXqZ3lP7uYKs7OQKHUm2PEY5gKf+8DNf9Znjy8Y/k4W6ElNgopttG3P96jAlHqE6d3mGIo1RC/sgffuNy9HC3tmWZzFiYzf6VosPQJhCYNXdTvlLzLbqND6J7Yz46M4ZwQcWUIq+8eIpMQIPNX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454490; c=relaxed/simple;
	bh=vCLI0D38I7UFcPwZZbFQiumGdDRiJ+S0BamD2HUcfBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6LZviEgAnufapP8JFmw4zUuiFqMKGWE9h5r7Sws+Td+McR3lbYkyXvhiYsLhIBlfmMxaBIjbioEDh5uyV2oXB2FzztOhL0Ntpu/fbYdtoR54aCzym0VperefNj5vo/6ashACxUOMBJpc7luJMxeps1OOtcfPfFSX8ULWYg7XIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtjq860X; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtjq860X"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fed090e5fso2965794f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454487; x=1770059287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBPLwWIdtjG1mcTPYivwQD9uLIkx3G/GI8kSilZAKuE=;
        b=dtjq860Xkddp4LLF5ws38n7lvyP0RYMlhbdwvRlg6KfW6+FuAG2SrKpbsb78om5mDK
         X35Iurakx+oP3TdQqSlH6ju42ozsf86CHxr3JZ97izk5lBCyQoe9MEwru54fjvdY4pdc
         gcduvpz5/h6Jr7TvuBkhlPUOOQ0aZnKfys+RN/gqDCvQfSHV5CECCdpGtNjTRwRzkfQB
         xSH/53lGVJep54PPKeSAZ+0wCqBCpOy6reyjG6rjhXgkmaliQhzAHLtrSqaW+r45g4cH
         obkJ3YlVnzTnUiBfxT3dJVcRY8TTXNGTJFdP2nQuFe9mroz7g7pka3Bpc4JWm0q8BARV
         GaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454487; x=1770059287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VBPLwWIdtjG1mcTPYivwQD9uLIkx3G/GI8kSilZAKuE=;
        b=u5BVHP0dl+lkS5VAfJYbwrMOLAAuxSvFPAUaqHMzc/Yip2BtVT8JiPeuieWuqdHDfV
         KOoozqf0fFKMiVgafqJU2tYLjKKEuPc8T69XqZthiXYUm6gX+qUAmIggh4cHd4YKwYfN
         mKmyqKLPBNkKo6Ayrhl7+NoA1WYKHrD5435X16XYWfmlZcRxT7RiirqiQqQ/mRFcNTCq
         VXAsy1kTiOb6k0Ttu2IamXPJUgCycfJ1QQ/EAE4NDoJFxUjVsYxzfrpY1GzrtTqcMEnQ
         RUef0GrtIGCjJeS5ZIjwORthM5bGfHvzSuZdhBniwD8fPmfMRQ6mMjvgkSfCMishMrB0
         0VGA==
X-Forwarded-Encrypted: i=1; AJvYcCU2qv5ySYKszeffdJ3s8oVbI5nJZ7vQ1kfzBf1Lk6qICY6YaZ7IeOykCMlAQvDW4ftcpJ9YFodIqaPkSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXiBbIOeGi3kZH19dWIx9LzW0khw3ZvHvJxyd2uIsyt4KRxSm7
	urJZERixecUwtBVZQyeot8Jn0fGOpnas+vZ83x5Z1/4MIMu0axV0rUqW
X-Gm-Gg: AZuq6aIxxepx3GbRsv6orL43zM1llPXpoY9vihyfNm3CwOBXmHmzPR19rUYnTAGy9YE
	9UcHJt2l+0EnfccuSCitdX1sz/x6y/Q1YnGhlkdWkisnY9a2maMSZMIylCdKlIkq+z+IQ6MuDTk
	LaYvN8DYLKkX6s+ZwsJb/rVi6NxjVpnrBbwaspBauf4Zsg4VNhbrlWM3xeo5ZWry9Af+szZLeOg
	cclb/YRMKxhJfplCZbvVnUK+NvHA0PY11eSIc3KWuczl0LVjMh2M7ZdL0c8fHUtlCOIER4IqkbH
	PfGTWW4/4zuaqZVyFiLkprUncMtqSFfew/SS2EMzgmqvdqo3vBiTrExMyi1kS4SMDPuDgys5glV
	U/Qjnux/kJVEyXdlm3JZu7UybXP1Q+M/hoSxjuk6A7t2iX8p3sKAhqwI5HYa6MRI4SgbymKUA3v
	2Q
X-Received: by 2002:a5d:64e8:0:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-435ca1addbcmr8972904f8f.40.1769454486750;
        Mon, 26 Jan 2026 11:08:06 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm31802030f8f.11.2026.01.26.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:08:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/5] memory: tegra: implement EMEM regs and ICC ops for Tegra114
Date: Mon, 26 Jan 2026 21:07:52 +0200
Message-ID: <20260126190755.78475-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126190755.78475-1-clamor95@gmail.com>
References: <20260126190755.78475-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare Internal Memory Controller for introduction of External Memory
Controller.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/memory/tegra/tegra114.c | 193 ++++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index d03a5d162dbd..c615857f7fad 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/device.h>
 #include <linux/of.h>
 #include <linux/mm.h>
 
@@ -1165,6 +1166,195 @@ static const struct tegra_mc_reset tegra114_mc_resets[] = {
 	TEGRA114_MC_RESET(VI,       0x200, 0x204, 17),
 };
 
+static void tegra114_mc_tune_client_latency(struct tegra_mc *mc,
+					    const struct tegra_mc_client *client,
+					    unsigned int bandwidth_mbytes_sec)
+{
+	u32 arb_tolerance_compensation_nsec, arb_tolerance_compensation_div;
+	unsigned int fifo_size = client->fifo_size;
+	u32 arb_nsec, la_ticks, value;
+
+	/* see 20.3.1.1 Client Configuration in Tegra4 TRM v01p */
+	if (bandwidth_mbytes_sec)
+		arb_nsec = fifo_size * NSEC_PER_USEC / bandwidth_mbytes_sec;
+	else
+		arb_nsec = U32_MAX;
+
+	/*
+	 * Latency allowness should be set with consideration for the module's
+	 * latency tolerance and internal buffering capabilities.
+	 *
+	 * Display memory clients use isochronous transfers and have very low
+	 * tolerance to a belated transfers. Hence we need to compensate the
+	 * memory arbitration imperfection for them in order to prevent FIFO
+	 * underflow condition when memory bus is busy.
+	 *
+	 * VI clients also need a stronger compensation.
+	 */
+	switch (client->swgroup) {
+	case TEGRA_SWGROUP_MPCORE:
+	case TEGRA_SWGROUP_PTC:
+		/*
+		 * We always want lower latency for these clients, hence
+		 * don't touch them.
+		 */
+		return;
+
+	case TEGRA_SWGROUP_DC:
+	case TEGRA_SWGROUP_DCB:
+		arb_tolerance_compensation_nsec = 1050;
+		arb_tolerance_compensation_div = 2;
+		break;
+
+	case TEGRA_SWGROUP_VI:
+		arb_tolerance_compensation_nsec = 1050;
+		arb_tolerance_compensation_div = 1;
+		break;
+
+	default:
+		arb_tolerance_compensation_nsec = 150;
+		arb_tolerance_compensation_div = 1;
+		break;
+	}
+
+	if (arb_nsec > arb_tolerance_compensation_nsec)
+		arb_nsec -= arb_tolerance_compensation_nsec;
+	else
+		arb_nsec = 0;
+
+	arb_nsec /= arb_tolerance_compensation_div;
+
+	/*
+	 * Latency allowance is a number of ticks a request from a particular
+	 * client may wait in the EMEM arbiter before it becomes a high-priority
+	 * request.
+	 */
+	la_ticks = arb_nsec / mc->tick;
+	la_ticks = min(la_ticks, client->regs.la.mask);
+
+	value = mc_readl(mc, client->regs.la.reg);
+	value &= ~(client->regs.la.mask << client->regs.la.shift);
+	value |= la_ticks << client->regs.la.shift;
+	mc_writel(mc, value, client->regs.la.reg);
+}
+
+static int tegra114_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(src->provider);
+	const struct tegra_mc_client *client = &mc->soc->clients[src->id];
+	u64 peak_bandwidth = icc_units_to_bps(src->peak_bw);
+
+	/*
+	 * Skip pre-initialization that is done by icc_node_add(), which sets
+	 * bandwidth to maximum for all clients before drivers are loaded.
+	 *
+	 * This doesn't make sense for us because we don't have drivers for all
+	 * clients and it's okay to keep configuration left from bootloader
+	 * during boot, at least for today.
+	 */
+	if (src == dst)
+		return 0;
+
+	/* convert bytes/sec to megabytes/sec */
+	do_div(peak_bandwidth, 1000000);
+
+	tegra114_mc_tune_client_latency(mc, client, peak_bandwidth);
+
+	return 0;
+}
+
+static int tegra114_mc_icc_aggreate(struct icc_node *node, u32 tag, u32 avg_bw,
+				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	/*
+	 * ISO clients need to reserve extra bandwidth up-front because
+	 * there could be high bandwidth pressure during initial filling
+	 * of the client's FIFO buffers.  Secondly, we need to take into
+	 * account impurities of the memory subsystem.
+	 */
+	if (tag & TEGRA_MC_ICC_TAG_ISO)
+		peak_bw = tegra_mc_scale_percents(peak_bw, 400);
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static struct icc_node_data *
+tegra114_mc_of_icc_xlate_extended(const struct of_phandle_args *spec, void *data)
+{
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(data);
+	const struct tegra_mc_client *client;
+	unsigned int i, idx = spec->args[0];
+	struct icc_node_data *ndata;
+	struct icc_node *node;
+
+	list_for_each_entry(node, &mc->provider.nodes, node_list) {
+		if (node->id != idx)
+			continue;
+
+		ndata = kzalloc(sizeof(*ndata), GFP_KERNEL);
+		if (!ndata)
+			return ERR_PTR(-ENOMEM);
+
+		client = &mc->soc->clients[idx];
+		ndata->node = node;
+
+		switch (client->swgroup) {
+		case TEGRA_SWGROUP_DC:
+		case TEGRA_SWGROUP_DCB:
+		case TEGRA_SWGROUP_PTC:
+		case TEGRA_SWGROUP_VI:
+			/* these clients are isochronous by default */
+			ndata->tag = TEGRA_MC_ICC_TAG_ISO;
+			break;
+
+		default:
+			ndata->tag = TEGRA_MC_ICC_TAG_DEFAULT;
+			break;
+		}
+
+		return ndata;
+	}
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		if (mc->soc->clients[i].id == idx)
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	dev_err(mc->dev, "invalid ICC client ID %u\n", idx);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static const struct tegra_mc_icc_ops tegra114_mc_icc_ops = {
+	.xlate_extended = tegra114_mc_of_icc_xlate_extended,
+	.aggregate = tegra114_mc_icc_aggreate,
+	.set = tegra114_mc_icc_set,
+};
+
+static const unsigned long tegra114_mc_emem_regs[] = {
+	MC_EMEM_ARB_CFG,
+	MC_EMEM_ARB_OUTSTANDING_REQ,
+	MC_EMEM_ARB_TIMING_RCD,
+	MC_EMEM_ARB_TIMING_RP,
+	MC_EMEM_ARB_TIMING_RC,
+	MC_EMEM_ARB_TIMING_RAS,
+	MC_EMEM_ARB_TIMING_FAW,
+	MC_EMEM_ARB_TIMING_RRD,
+	MC_EMEM_ARB_TIMING_RAP2PRE,
+	MC_EMEM_ARB_TIMING_WAP2PRE,
+	MC_EMEM_ARB_TIMING_R2R,
+	MC_EMEM_ARB_TIMING_W2W,
+	MC_EMEM_ARB_TIMING_R2W,
+	MC_EMEM_ARB_TIMING_W2R,
+	MC_EMEM_ARB_DA_TURNS,
+	MC_EMEM_ARB_DA_COVERS,
+	MC_EMEM_ARB_MISC0,
+	MC_EMEM_ARB_RING1_THROTTLE,
+};
+
 const struct tegra_mc_soc tegra114_mc_soc = {
 	.clients = tegra114_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra114_mc_clients),
@@ -1172,10 +1362,13 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.atom_size = 32,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra114_smmu_soc,
+	.emem_regs = tegra114_mc_emem_regs,
+	.num_emem_regs = ARRAY_SIZE(tegra114_mc_emem_regs),
 	.intmask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
 		   MC_INT_DECERR_EMEM,
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
+	.icc_ops = &tegra114_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 };
-- 
2.51.0

