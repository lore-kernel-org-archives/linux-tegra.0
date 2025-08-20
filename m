Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28336CE0B;
	Wed, 20 Aug 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702831; cv=none; b=Wc1Mi1uKZw6JEgwuZtFpjvx+oVdKX0gJldynSdMZm2cxoJC3z4Ts2TOzQc30edO++QVQTVjaimdYVDE2FTi2tCJfJzw8oVyd7XS8fPZA7sF8gOBvpDxcj9Sfmy0/b5zyHBPXNiRUHv1KeGhrBGRNH1LDmPcm9TTRYmAoAql/vV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702831; c=relaxed/simple;
	bh=ye9UTh3DGTIR2GXSy9SPAJZIcahY1wHdNVmZ/3VEzHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3otSYDp62XPnhWycNCwIp1gu5Y4wwdFgzKfiMoUR00sSR9Wqv9k+j2ovlEQN0BLPWGULPuiZEDpvjS1uACcfMPexQypN0T1bh+7HzRgFUpSJxDs6TkWyj5QvIYTDrBa1uj0JbJJDCMG5r0m8y+9tYMSSEoPpIaUdb/qkpcygMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Haju4B1H; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Haju4B1H"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7ae31caso1202773766b.3;
        Wed, 20 Aug 2025 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702827; x=1756307627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATEPApqyTT3jVHOmbw/KgRu7Cv8Hn9TFPWpJMkbUBLE=;
        b=Haju4B1HrvRa9XPuEjqz4w4z6S/UhUrcwdjFNeof+MO6o2I0QkgZdBjGyOig3b+Q8/
         zPn4udRNYRvLQ18R07frE6jaBlxarTDsZHxLdKvXX5pgmfFo6hZV7XVq5mEJWg8BRcml
         +/J++Gj8TohXL17P69bJDuJqkBOvQVp8Wj7PpGzUIqoF91ASUy86ZtgvX6nwVGsijOe/
         DAoEwgztRDo0CYpFLVLGXwGj0uAaLA8oQLho5KHC34BNI6DkZGiz6nql5ws9QqLIxllj
         wWGM5fjci1x0kTj0CSoTdHinBjcIU8165a0+kA+cxO/+IYOvBfRm1OL+FrnWWOieGX3e
         YsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702827; x=1756307627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATEPApqyTT3jVHOmbw/KgRu7Cv8Hn9TFPWpJMkbUBLE=;
        b=wGjhhikuMoBBY1w52+4soju9JNVUANSFS0zxFk91gStK6POA4pgiavl/loe+2XIUQ1
         GksbW/GzkYIbPDUnnR9uavxigViVdbqPyujlCrwI5I28bjM4FNYOVfvkmSiac08WupEA
         P1SdduTAm8V7kYkXwk4oKBpJlfP1JZR1+A7QJ+OnViCCpK3P8wiKYjR5AN9zSv4E4pWm
         5YmcSsckY80/oy36BbEXaotLw4zj8agj3tmCGwZcmc92Rg1p2TjqrQScRICMTvsA94F6
         coY/C55lDsvXcaJHqGK04JZ9v2knJ04GsbC8K6nHKAyUl+tal8ujR4dDka/HD65Xk+Ba
         HGOA==
X-Forwarded-Encrypted: i=1; AJvYcCWNHSi8fhsEEJCbBbP23RSc8fSIpWx5i+Qe7NIDqS9vkxN7Cpuo3P0CPGktung085MK48R+APQM4Ktx@vger.kernel.org, AJvYcCXf4BodJqz0SXVqOzhtB9og1/hpDnwhcZQJ+s2aPZikEf18PV2vFixYOvLNVqLGKoEfam3HyUtQcEVE+KI=@vger.kernel.org, AJvYcCXtmj+Kk4zkNtp1x9qrljQ3RX9FmW1H6dY/x6MqSg9G7lUjCzlJgQHfwSHLZzVwFNQvqhlTN7SbMpT0@vger.kernel.org
X-Gm-Message-State: AOJu0Yza88UHb5TrJUPrH1LzhEb4zvTM9l6xXEvWqkkEBoXkR2QAYl3h
	TY5NhpbOw2B8jY2ern5OL6vvZW23EMnP6Q6n9GpybGzt5BAkWOXdS4T/
X-Gm-Gg: ASbGncsAWDdebVaZXhxq3pa8BIyuOtlLRexi6Be8Odlx+h+92K/Bpz8TfDV5kjaV+lL
	LNSMvF7lTx0PohN9yaZeZc9VzA9KF/u0fZYj+hqNikn2mA7+t7aqfhiMSAzg4zqDUoLpUZdUsec
	d8dOTwtFO4sNWijODBZmy+hPN84TVP7hw2bY4G9VWrRe0fDAs6G/C9K74TAK6JKoyEuNaTDzZ6m
	EZC/LQhZpGSkRsZylEBD+NF3OsZW+WYZOxK+e5smz4XqCPfINQMz0Do91jTyrfYf3MF9zxK1XDL
	Ntt3hCM0dRMUdAiBHPEmPW9bHdbvNIjDPpC4nNi6fc8hnr41Ow6Oy3kr1I25W0fPU2wTkf58FV/
	ZoyksyimrnMGG9A==
X-Google-Smtp-Source: AGHT+IFN7gSZWB84hQdS1pDJn8RQ3gFn/4tSKoO3g34CWmTR/xo6F/p9R12ZxIW3T5Hl/6sXsYAZSw==
X-Received: by 2002:a17:907:3c88:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-afdf020be4bmr325521566b.31.1755702827320;
        Wed, 20 Aug 2025 08:13:47 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 3/9] memory: tegra: implement EMEM regs and ICC ops for Tegra114
Date: Wed, 20 Aug 2025 18:13:17 +0300
Message-ID: <20250820151323.167772-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
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
2.48.1

