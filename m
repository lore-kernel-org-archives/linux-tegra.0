Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E44EC433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 11:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E9FB64F59
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 11:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhCRL4o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 07:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhCRL4V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 07:56:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF087C06174A;
        Thu, 18 Mar 2021 04:56:20 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z8so7073524ljm.12;
        Thu, 18 Mar 2021 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nR2PlPdcJnXA/jdyDH6CQScWuBaMfmwsZQIwLWoVa8=;
        b=ERhCusspTwtSkAnsii1VcwrOtkcwMZsAKQAMw3cmxRseidbu9XYh7i2wKR5VTRTzk0
         4k0tNCOwJtFP8C+jo3oWu6AFlNIv4OXh6rAe3s0Uf+dz1p5soSSkfR5UxNWB6pJk7qtd
         c/BL9A8Hm57NmB6el2eYe81e+jA2Hq6pX3ScoF1GiPJf9ku9VOiakkRPVdzH3fqj+KPU
         Pr4dm+JolYt7aqYS1zamHUMUo8tKfECDO6wGVyxdAzOSgPp0/DoWSFRGrKQu8/ZkeUZU
         64DKvilMh5WhSax5DLcqkatyD+NKx+zpfwZbA2UE+i+IFlRZMXCgued14IEWAVpHH9lp
         Ox2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nR2PlPdcJnXA/jdyDH6CQScWuBaMfmwsZQIwLWoVa8=;
        b=fpyDSi1Z19HZSsmCCDpL9sDASbm6UCzQgjgzXwKdzoeZBn5s0FB9fjZhpyJ0iT0q1B
         raD04qpc6AUKyBUU17Xr/RbisESqmqYY3niWkyzAh39PSMSTOruXC9sOHg7kl8h2VQim
         T/v6rBp3Qs/M0mNpA4q0vtwmWZoBWlYx24qchsOXE0WrzClYjh80AMkNYrA0AzCFvnnt
         MIcm/PtPJ6ZapEsOUXW+Es6YO5QjM6SgHzU2fBxRrvBWqMne14dLfb1UiSCio95x9NuM
         xsgI9gqvx0NOVlt7HWZdsUkTA6C9YbGqnKHIYRPVHKInOUuXc79LhWwzvcD0hnxs6ouj
         ZNMQ==
X-Gm-Message-State: AOAM531Zz1XuCtdGpkcmY7LT1Nj5M5xY+8Ka1v9ZKhlJVVwp9+e7Gym1
        4smbmbOKFCmAknktSpTFYs4tHt3Mbrw=
X-Google-Smtp-Source: ABdhPJxOSJw+11S+hSTesLXj3rLusyHUtAZ0zxR0cv7SOt0OIhp8TfkxmlJBwagTL0CzXE3JUYRwVw==
X-Received: by 2002:a2e:5757:: with SMTP id r23mr5127238ljd.305.1616068579377;
        Thu, 18 Mar 2021 04:56:19 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id p9sm212131ljn.16.2021.03.18.04.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 04:56:18 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] memory: tegra20: Add debug statistics
Date:   Thu, 18 Mar 2021 14:55:56 +0300
Message-Id: <20210318115556.22792-1-digetx@gmail.com>
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
 drivers/memory/tegra/mc.c      |  12 ++
 drivers/memory/tegra/tegra20.c | 342 +++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h         |   7 +
 3 files changed, 361 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a21163ccadc4..85c3364ebf26 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -827,6 +827,18 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	mc->debugfs.root = debugfs_create_dir("mc", NULL);
+	if (!mc->debugfs.root)
+		dev_err(&pdev->dev, "failed to create debugfs directory\n");
+
+	if (mc->soc->init) {
+		err = mc->soc->init(mc);
+		if (err < 0)
+			dev_err(&pdev->dev,
+				"failed to register initialize SoC driver: %d\n",
+				err);
+	}
+
 	err = tegra_mc_reset_setup(mc);
 	if (err < 0)
 		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 29ecf02805a0..513c07104296 100644
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
+	struct tegra_mc *mc;
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
@@ -356,6 +429,274 @@ static const struct tegra_mc_icc_ops tegra20_mc_icc_ops = {
 	.set = tegra20_mc_icc_set,
 };
 
+static u32 tegra20_mc_stat_gather_control(struct tegra20_mc_stat_gather *g)
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
+	struct tegra_mc *mc = stat->mc;
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
+static void tegra20_mc_stat_events(struct tegra_mc *mc,
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
+static void tegra20_mc_collect_stats(struct tegra_mc *mc,
+				     struct tegra20_mc_client_stat *stats)
+{
+	const struct tegra_mc_client *client0, *client1;
+	unsigned int i, clienta, clientb;
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
+		clientb = mc->soc->num_clients;
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
+static int tegra20_mc_stats_show(struct seq_file *s, void *data)
+{
+	struct tegra20_mc_client_stat *stats;
+	struct tegra_mc *mc = s->private;
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
+static int tegra20_mc_stats_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, tegra20_mc_stats_show, inode->i_private);
+}
+
+static const struct file_operations tegra20_mc_stats_fops = {
+	.open = tegra20_mc_stats_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void tegra20_mc_debugfs_init(struct tegra_mc *mc)
+{
+	debugfs_create_file("stats", 0444, mc->debugfs.root,
+			    mc, &tegra20_mc_stats_fops);
+}
+
+static int tegra20_mc_init(struct tegra_mc *mc)
+{
+	tegra20_mc_debugfs_init(mc);
+	return 0;
+}
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
@@ -367,4 +708,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
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

