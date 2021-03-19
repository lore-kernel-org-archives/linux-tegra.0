Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7990DC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F44364EFC
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCSNKr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCSNKS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:10:18 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E305C06174A;
        Fri, 19 Mar 2021 06:10:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b83so9903513lfd.11;
        Fri, 19 Mar 2021 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/eQpjSxP42GjU/ki5CnMD/P+2xi/NGBw1exMvB8XY+w=;
        b=vf7BmHL8LIpowFPxeQFB1CFOsPmf4jPBvn/YIGOsYxtdacsrwMqcu56n4uQ43Rxv+X
         s/v37wDDmGeOWmCpuI/GcqIW7BfT0WJroP1aA/QyGT1EqWOi6S+xW2SDkq+hHLpfsiaR
         L1hz/3kXT36xrSLFk5hIP4/SVlwQslXNCplEJqT/ZMclqnNWoog1KmLDh30qxmfM8TL+
         9VnwplAF6yWh48cBwSUegQdO/IRzRrUIBXUw+ip/A5v+ygWH7H9rjvE+ok/w4AZyYL7X
         Gw+N6LNw4W/Zha/+25u7lhHxBGOokiScCr6S+eaSAGYaB5HDP8m8E9mminTDoXiEjL43
         jb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/eQpjSxP42GjU/ki5CnMD/P+2xi/NGBw1exMvB8XY+w=;
        b=dnL4N/zLejFuSb3S6ZGL+HAUFW8Pl/f4VUs86oTGkR+MNuYpSWHlmJzvvF1FLBjfW1
         tS2zYnfUppAAAqS/4djZtENDHUqzhNEDxTFO3vVbzFf7WSVBwJyJcpiadmxT0EmukEmG
         6akWxNc9HyK5mD0EhKx3JWZHJ1d1wF63S7iM5rnvsPd+ATdLeokqMJDS4uxvHSMdQ2G4
         nHIG5ErF3HRjCmh9ZhDbrShxT9opwlxwbsDVXzsomup1MyTRKoxe4btbht3e5KmcUwq7
         7ZUcfgZgSP2xdzBLFtZgqTvu5rJr8dwIiKxEAIQFmXaD5yjORs1KKX7fzT4n4Wya+DTr
         AMjQ==
X-Gm-Message-State: AOAM530n36T2TlojxcaPL1rQI94kKvYpbLJJWkeEp9yzx751MdxQnb4i
        Zi5+mnsnKmKfgB/82ELtY6c=
X-Google-Smtp-Source: ABdhPJwPJ/h/+PE8ioHXEMZwdEZcRGX38yPRKUhF5ulDKkjR+Vz+7VjIGmK3SJd2iVBi7DRdDx+DsA==
X-Received: by 2002:a05:6512:ad0:: with SMTP id n16mr760137lfu.205.1616159416471;
        Fri, 19 Mar 2021 06:10:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f11sm615984lfr.119.2021.03.19.06.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 06:10:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] memory: tegra20: Add debug statistics
Date:   Fri, 19 Mar 2021 16:09:33 +0300
Message-Id: <20210319130933.23261-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add debug statistics collection support. The statistics is available
via debugfs in '/sys/kernel/debug/mc/stats', it shows percent of memory
controller utilization for each memory client. This information is
intended to help with debugging of memory performance issues, it already
was proven to be useful by helping to improve memory bandwidth management
of the display driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Removed handling of debugfs creation errors.

    - Added more consts to the code.

    - Reduced scope of local variables.

    - Switched to use debugfs_create_devm_seqfile() helper.

    - Corrected error message.

 drivers/memory/tegra/mc.c      |   9 +
 drivers/memory/tegra/mc.h      |   4 +-
 drivers/memory/tegra/tegra20.c | 326 +++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h         |   7 +
 4 files changed, 344 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a21163ccadc4..e58c3e5baea0 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -827,6 +827,15 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	mc->debugfs.root = debugfs_create_dir("mc", NULL);
+
+	if (mc->soc->init) {
+		err = mc->soc->init(mc);
+		if (err < 0)
+			dev_err(&pdev->dev, "failed to initialize SoC driver: %d\n",
+				err);
+	}
+
 	err = tegra_mc_reset_setup(mc);
 	if (err < 0)
 		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 33e40d600592..1ee34f0da4f7 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -92,12 +92,12 @@ icc_provider_to_tegra_mc(struct icc_provider *provider)
 	return container_of(provider, struct tegra_mc, provider);
 }
 
-static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
+static inline u32 mc_readl(const struct tegra_mc *mc, unsigned long offset)
 {
 	return readl_relaxed(mc->regs + offset);
 }
 
-static inline void mc_writel(struct tegra_mc *mc, u32 value,
+static inline void mc_writel(const struct tegra_mc *mc, u32 value,
 			     unsigned long offset)
 {
 	writel_relaxed(value, mc->regs + offset);
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 29ecf02805a0..14caf5b9324c 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -11,6 +13,77 @@
 
 #include "mc.h"
 
+#define MC_STAT_CONTROL				0x90
+#define MC_STAT_EMC_CLOCK_LIMIT			0xa0
+#define MC_STAT_EMC_CLOCKS			0xa4
+#define MC_STAT_EMC_CONTROL_0			0xa8
+#define MC_STAT_EMC_CONTROL_1			0xac
+#define MC_STAT_EMC_COUNT_0			0xb8
+#define MC_STAT_EMC_COUNT_1			0xbc
+
+#define MC_STAT_CONTROL_CLIENT_ID		GENMASK(13,  8)
+#define MC_STAT_CONTROL_EVENT			GENMASK(23, 16)
+#define MC_STAT_CONTROL_PRI_EVENT		GENMASK(25, 24)
+#define MC_STAT_CONTROL_FILTER_CLIENT_ENABLE	GENMASK(26, 26)
+#define MC_STAT_CONTROL_FILTER_PRI		GENMASK(29, 28)
+
+#define MC_STAT_CONTROL_PRI_EVENT_HP		0
+#define MC_STAT_CONTROL_PRI_EVENT_TM		1
+#define MC_STAT_CONTROL_PRI_EVENT_BW		2
+
+#define MC_STAT_CONTROL_FILTER_PRI_DISABLE	0
+#define MC_STAT_CONTROL_FILTER_PRI_NO		1
+#define MC_STAT_CONTROL_FILTER_PRI_YES		2
+
+#define MC_STAT_CONTROL_EVENT_QUALIFIED		0
+#define MC_STAT_CONTROL_EVENT_ANY_READ		1
+#define MC_STAT_CONTROL_EVENT_ANY_WRITE		2
+#define MC_STAT_CONTROL_EVENT_RD_WR_CHANGE	3
+#define MC_STAT_CONTROL_EVENT_SUCCESSIVE	4
+#define MC_STAT_CONTROL_EVENT_ARB_BANK_AA	5
+#define MC_STAT_CONTROL_EVENT_ARB_BANK_BB	6
+#define MC_STAT_CONTROL_EVENT_PAGE_MISS		7
+#define MC_STAT_CONTROL_EVENT_AUTO_PRECHARGE	8
+
+#define EMC_GATHER_RST				(0 << 8)
+#define EMC_GATHER_CLEAR			(1 << 8)
+#define EMC_GATHER_DISABLE			(2 << 8)
+#define EMC_GATHER_ENABLE			(3 << 8)
+
+#define MC_STAT_SAMPLE_TIME_USEC		16000
+
+/* we store collected statistics as a fixed point values */
+#define MC_FX_FRAC_SCALE			100
+
+struct tegra20_mc_stat_gather {
+	unsigned int pri_filter;
+	unsigned int pri_event;
+	unsigned int result;
+	unsigned int client;
+	unsigned int event;
+	bool client_enb;
+};
+
+struct tegra20_mc_stat {
+	struct tegra20_mc_stat_gather gather0;
+	struct tegra20_mc_stat_gather gather1;
+	unsigned int sample_time_usec;
+	const struct tegra_mc *mc;
+};
+
+struct tegra20_mc_client_stat {
+	unsigned int events;
+	unsigned int arb_high_prio;
+	unsigned int arb_timeout;
+	unsigned int arb_bandwidth;
+	unsigned int rd_wr_change;
+	unsigned int successive;
+	unsigned int page_miss;
+	unsigned int auto_precharge;
+	unsigned int arb_bank_aa;
+	unsigned int arb_bank_bb;
+};
+
 static const struct tegra_mc_client tegra20_mc_clients[] = {
 	{
 		.id = 0x00,
@@ -356,6 +429,258 @@ static const struct tegra_mc_icc_ops tegra20_mc_icc_ops = {
 	.set = tegra20_mc_icc_set,
 };
 
+static u32 tegra20_mc_stat_gather_control(const struct tegra20_mc_stat_gather *g)
+{
+	u32 control;
+
+	control  = FIELD_PREP(MC_STAT_CONTROL_EVENT, g->event);
+	control |= FIELD_PREP(MC_STAT_CONTROL_CLIENT_ID, g->client);
+	control |= FIELD_PREP(MC_STAT_CONTROL_PRI_EVENT, g->pri_event);
+	control |= FIELD_PREP(MC_STAT_CONTROL_FILTER_PRI, g->pri_filter);
+	control |= FIELD_PREP(MC_STAT_CONTROL_FILTER_CLIENT_ENABLE, g->client_enb);
+
+	return control;
+}
+
+static void tegra20_mc_stat_gather(struct tegra20_mc_stat *stat)
+{
+	u32 clocks, count0, count1, control_0, control_1;
+	const struct tegra_mc *mc = stat->mc;
+
+	control_0 = tegra20_mc_stat_gather_control(&stat->gather0);
+	control_1 = tegra20_mc_stat_gather_control(&stat->gather1);
+
+	/*
+	 * Reset statistic gathers state, select bandwidth mode for the
+	 * statistics collection mode and set clocks counter saturation
+	 * limit to maximum.
+	 */
+	mc_writel(mc, 0x00000000, MC_STAT_CONTROL);
+	mc_writel(mc,  control_0, MC_STAT_EMC_CONTROL_0);
+	mc_writel(mc,  control_1, MC_STAT_EMC_CONTROL_1);
+	mc_writel(mc, 0xffffffff, MC_STAT_EMC_CLOCK_LIMIT);
+
+	mc_writel(mc, EMC_GATHER_ENABLE, MC_STAT_CONTROL);
+	fsleep(stat->sample_time_usec);
+	mc_writel(mc, EMC_GATHER_DISABLE, MC_STAT_CONTROL);
+
+	count0 = mc_readl(mc, MC_STAT_EMC_COUNT_0);
+	count1 = mc_readl(mc, MC_STAT_EMC_COUNT_1);
+	clocks = mc_readl(mc, MC_STAT_EMC_CLOCKS);
+	clocks = max(clocks / 100 / MC_FX_FRAC_SCALE, 1u);
+
+	stat->gather0.result = DIV_ROUND_UP(count0, clocks);
+	stat->gather1.result = DIV_ROUND_UP(count1, clocks);
+}
+
+static void tegra20_mc_stat_events(const struct tegra_mc *mc,
+				   const struct tegra_mc_client *client0,
+				   const struct tegra_mc_client *client1,
+				   unsigned int pri_filter,
+				   unsigned int pri_event,
+				   unsigned int event,
+				   unsigned int *result0,
+				   unsigned int *result1)
+{
+	struct tegra20_mc_stat stat = {};
+
+	stat.gather0.client = client0 ? client0->id : 0;
+	stat.gather0.pri_filter = pri_filter;
+	stat.gather0.client_enb = !!client0;
+	stat.gather0.pri_event = pri_event;
+	stat.gather0.event = event;
+
+	stat.gather1.client = client1 ? client1->id : 0;
+	stat.gather1.pri_filter = pri_filter;
+	stat.gather1.client_enb = !!client1;
+	stat.gather1.pri_event = pri_event;
+	stat.gather1.event = event;
+
+	stat.sample_time_usec = MC_STAT_SAMPLE_TIME_USEC;
+	stat.mc = mc;
+
+	tegra20_mc_stat_gather(&stat);
+
+	*result0 = stat.gather0.result;
+	*result1 = stat.gather1.result;
+}
+
+static void tegra20_mc_collect_stats(const struct tegra_mc *mc,
+				     struct tegra20_mc_client_stat *stats)
+{
+	const struct tegra_mc_client *client0, *client1;
+	unsigned int i;
+
+	/* collect memory controller utilization percent for each client */
+	for (i = 0; i < mc->soc->num_clients; i += 2) {
+		client0 = &mc->soc->clients[i];
+		client1 = &mc->soc->clients[i + 1];
+
+		if (i + 1 == mc->soc->num_clients)
+			client1 = NULL;
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
+				       MC_STAT_CONTROL_PRI_EVENT_HP,
+				       MC_STAT_CONTROL_EVENT_QUALIFIED,
+				       &stats[i + 0].events,
+				       &stats[i + 1].events);
+	}
+
+	/* collect more info from active clients */
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		unsigned int clienta, clientb = mc->soc->num_clients;
+
+		for (client0 = NULL; i < mc->soc->num_clients; i++) {
+			if (stats[i].events) {
+				client0 = &mc->soc->clients[i];
+				clienta = i++;
+				break;
+			}
+		}
+
+		for (client1 = NULL; i < mc->soc->num_clients; i++) {
+			if (stats[i].events) {
+				client1 = &mc->soc->clients[i];
+				clientb = i;
+				break;
+			}
+		}
+
+		if (!client0 && !client1)
+			break;
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_YES,
+				       MC_STAT_CONTROL_PRI_EVENT_HP,
+				       MC_STAT_CONTROL_EVENT_QUALIFIED,
+				       &stats[clienta].arb_high_prio,
+				       &stats[clientb].arb_high_prio);
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_YES,
+				       MC_STAT_CONTROL_PRI_EVENT_TM,
+				       MC_STAT_CONTROL_EVENT_QUALIFIED,
+				       &stats[clienta].arb_timeout,
+				       &stats[clientb].arb_timeout);
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_YES,
+				       MC_STAT_CONTROL_PRI_EVENT_BW,
+				       MC_STAT_CONTROL_EVENT_QUALIFIED,
+				       &stats[clienta].arb_bandwidth,
+				       &stats[clientb].arb_bandwidth);
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
+				       MC_STAT_CONTROL_PRI_EVENT_HP,
+				       MC_STAT_CONTROL_EVENT_RD_WR_CHANGE,
+				       &stats[clienta].rd_wr_change,
+				       &stats[clientb].rd_wr_change);
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
+				       MC_STAT_CONTROL_PRI_EVENT_HP,
+				       MC_STAT_CONTROL_EVENT_SUCCESSIVE,
+				       &stats[clienta].successive,
+				       &stats[clientb].successive);
+
+		tegra20_mc_stat_events(mc, client0, client1,
+				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
+				       MC_STAT_CONTROL_PRI_EVENT_HP,
+				       MC_STAT_CONTROL_EVENT_PAGE_MISS,
+				       &stats[clienta].page_miss,
+				       &stats[clientb].page_miss);
+	}
+}
+
+static void tegra20_mc_printf_percents(struct seq_file *s,
+				       const char *fmt,
+				       unsigned int percents_fx)
+{
+	char percents_str[8];
+
+	snprintf(percents_str, ARRAY_SIZE(percents_str), "%3u.%02u%%",
+		 percents_fx / MC_FX_FRAC_SCALE, percents_fx % MC_FX_FRAC_SCALE);
+
+	seq_printf(s, fmt, percents_str);
+}
+
+static int tegra20_mc_stats_show(struct seq_file *s, void *unused)
+{
+	const struct tegra_mc *mc = dev_get_drvdata(s->private);
+	struct tegra20_mc_client_stat *stats;
+	unsigned int i;
+
+	stats = kcalloc(mc->soc->num_clients + 1, sizeof(*stats), GFP_KERNEL);
+	if (!stats)
+		return -ENOMEM;
+
+	tegra20_mc_collect_stats(mc, stats);
+
+	seq_puts(s, "Memory client   Events   Timeout   High priority   Bandwidth ARB   RW change   Successive   Page miss\n");
+	seq_puts(s, "-----------------------------------------------------------------------------------------------------\n");
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		seq_printf(s, "%-14s  ", mc->soc->clients[i].name);
+
+		/* An event is generated when client performs R/W request. */
+		tegra20_mc_printf_percents(s,  "%-9s", stats[i].events);
+
+		/*
+		 * An event is generated based on the timeout (TM) signal
+		 * accompanying a request for arbitration.
+		 */
+		tegra20_mc_printf_percents(s, "%-10s", stats[i].arb_timeout);
+
+		/*
+		 * An event is generated based on the high-priority (HP) signal
+		 * accompanying a request for arbitration.
+		 */
+		tegra20_mc_printf_percents(s, "%-16s", stats[i].arb_high_prio);
+
+		/*
+		 * An event is generated based on the bandwidth (BW) signal
+		 * accompanying a request for arbitration.
+		 */
+		tegra20_mc_printf_percents(s, "%-16s", stats[i].arb_bandwidth);
+
+		/*
+		 * An event is generated when the memory controller switches
+		 * between making a read request to making a write request.
+		 */
+		tegra20_mc_printf_percents(s, "%-12s", stats[i].rd_wr_change);
+
+		/*
+		 * An even generated when the chosen client has wins arbitration
+		 * when it was also the winner at the previous request.  If a
+		 * client makes N requests in a row that are honored, SUCCESSIVE
+		 * will be counted (N-1) times.  Large values for this event
+		 * imply that if we were patient enough, all of those requests
+		 * could have been coalesced.
+		 */
+		tegra20_mc_printf_percents(s, "%-13s", stats[i].successive);
+
+		/*
+		 * An event is generated when the memory controller detects a
+		 * page miss for the current request.
+		 */
+		tegra20_mc_printf_percents(s, "%-12s\n", stats[i].page_miss);
+	}
+
+	kfree(stats);
+
+	return 0;
+}
+
+static int tegra20_mc_init(struct tegra_mc *mc)
+{
+	debugfs_create_devm_seqfile(mc->dev, "stats", mc->debugfs.root,
+				    tegra20_mc_stats_show);
+
+	return 0;
+}
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
@@ -367,4 +692,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.resets = tegra20_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
+	.init = tegra20_mc_init,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d731407e23bb..d2fbe6a8b25b 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -7,6 +7,7 @@
 #define __SOC_TEGRA_MC_H__
 
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
 #include <linux/reset-controller.h>
@@ -175,6 +176,8 @@ struct tegra_mc_soc {
 	unsigned int num_resets;
 
 	const struct tegra_mc_icc_ops *icc_ops;
+
+	int (*init)(struct tegra_mc *mc);
 };
 
 struct tegra_mc {
@@ -196,6 +199,10 @@ struct tegra_mc {
 	struct icc_provider provider;
 
 	spinlock_t lock;
+
+	struct {
+		struct dentry *root;
+	} debugfs;
 };
 
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
-- 
2.30.2

