Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028813537E0
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273423; cv=none; b=iAMjWP+wKv1ccrg9GK7wWBcNHPulrptZaKq+lZu7UqIy+11wDmUZUusiI8U7ezuq8rr0ZBoJLADW54DgakIY4vSkgLQgQYJru9Bl35iVwk1WwRtCvBUsJg5++/2z1fQESs0u8zsSPDLV7TmPUZnW+p/UzNBVnLlmzc4FzLTe0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273423; c=relaxed/simple;
	bh=flMFDcMoilUKZ2HI+QqMrSzjnoRTTOGEem++WXzh2jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJWkn3LBTs4Y8vkZFQlDj0UhYwxneavSwcxaBsrkErIBN1lcK6iiwoqteoy4RbYYvf0lrUIP4JIejLV7nhZA79gSOyXptSA2uOOflRfKiloKjVz4LEwbupNsKu+17ZAhD00WeSWHKf+asT1ULLJHFp1q9lCN6HH8lda0o6yPtpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeV+Wm3V; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeV+Wm3V"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d77f6092eso6839631f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 00:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273420; x=1777878220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZ1HBa/aKFGSf/GyiqKwru3OQmj7Gbd7sN3EDBVCVtk=;
        b=HeV+Wm3VaxrdZL1n97/dwwtsG/8UWxwPsj8jkaDGFHCvCzS0LRs4RaeLGJOKd84Jj0
         tIdSIFE5PMLYhr7ubjvdUYWljUx1lTVhOEfOoXo7hgpN1Ecl3La2vFz2ga9HKjstwMCm
         rlu7F9sdc0iFQ7on6iKKdeamEN73I69rA/sscQLZ1hY6rMaU9bWi8HmUjle2ff9IpACJ
         2ayRa4RNhqMistt8dvTRsxTbVBKcv+gIK4/9FHae1cnGehzECEPRJfjnPh6qSawFgTco
         Iqi+6tkavRUrBeltPqkmAxl6MhOGHW9xjasoX6PF/ANGf1ZuzVBro26mdb+lOPl/JYSv
         xyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273420; x=1777878220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fZ1HBa/aKFGSf/GyiqKwru3OQmj7Gbd7sN3EDBVCVtk=;
        b=PjNKs/JNrvYWCLhUaIAa5dR1A8LlqrNXOylirnVutwlU1lwD/0uuj1XOUVctlq8d+c
         6Zav1cqR4mxLmFhepz/naiFkx+M0+lTKiP6PwFWmytlK19zi6lfdP2KrEb3mCvF6Ao5/
         Q6wCtHAGGf0q6G7+w9BS8NDG4Y3zW0/7PW9J8MfYrXLIN2Dk1SNvUE3RWYpe3ErD0q4L
         Rj3mt0X+mIPPXtJAm9DreOjnZ7xKZLctAZ4UqR4K3IPxbk5gZU5OdCWtzwl1Kz9WnmNP
         RMZ/QZspHZe1MXTb665hjxfds8KG5J374vTfE08OejSxiFpPrvoHGPI4TEizrLgf+W0x
         UcUA==
X-Forwarded-Encrypted: i=1; AFNElJ8fpdNamiLBWCsDRCj3kB/ML8eAVFw+hG8EyxQaBPz/ysm2Y4rXWTely5PutHqhMaZcvveI0gCDjRdZvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySCk2TYt5fFJKHhSwKQm9Ac4SYq/tRsqRZB9F/NCfwq81OZ/3j
	MjYw4rxk12TKEuCr0BeAEy960Hz0A+BfErkZHTbdPDIck8La0WxbnAXW
X-Gm-Gg: AeBDieu4g8M6dfeBOERx8ZlXVyuhRdbTKtFByjyyoAcV/k6HAhK334JGssVw83s7QYO
	GBrmf4v6CgdV8Ayrz10AJMqo0sCCyRHlE6ZJh8LfRKTpMj6lgIT3OWpw3xmh4h8/WLWp0Kl79td
	ybFCHnPZNCzH6QhXiIATiDKKCsjg4uy+UT9X0ZM9XrPa1oFsVPFosvS3PXKf0r18eGmtToNH2dI
	i/V7xozIuR9mVGRm+8pqeZkhJ0jc1kJ3qcS5Mcha8lDJrsAKR09gp1+YSDAq3Buy2Mhp2FG9ZVJ
	RmYNd39/WAl6pkH+h91aMJ3k6vqeeyJyBcBYgy4gF7irCdmkiW02WmDq5P91QeZmnEgqF4vSAol
	+QqFPAvRGpEHtgtgvUrrE5x411Z4VU8o/mWkyumiuZiDxG6mytPoLcHqLoW4ZS/el72JTcPlLzU
	B9YEC/P86PdUB8+s9g1RpdsVE=
X-Received: by 2002:a5d:5f46:0:b0:43d:761d:5423 with SMTP id ffacd0b85a97d-43fe3dcc03bmr63701741f8f.16.1777273420045;
        Mon, 27 Apr 2026 00:03:40 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/7] memory: tegra: Implement EMEM regs and ICC ops for Tegra114
Date: Mon, 27 Apr 2026 10:03:07 +0300
Message-ID: <20260427070312.81679-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
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
index 02dd4e26288a..2cb153091228 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/device.h>
 #include <linux/of.h>
 #include <linux/mm.h>
 
@@ -1101,6 +1102,195 @@ static const struct tegra_mc_reset tegra114_mc_resets[] = {
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
+		ndata = kzalloc_obj(*ndata);
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
 static const struct tegra_mc_intmask tegra114_mc_intmasks[] = {
 	{
 		.reg = MC_INTMASK,
@@ -1116,11 +1306,14 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.atom_size = 32,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra114_smmu_soc,
+	.emem_regs = tegra114_mc_emem_regs,
+	.num_emem_regs = ARRAY_SIZE(tegra114_mc_emem_regs),
 	.intmasks = tegra114_mc_intmasks,
 	.num_intmasks = ARRAY_SIZE(tegra114_mc_intmasks),
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
+	.icc_ops = &tegra114_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
-- 
2.51.0

