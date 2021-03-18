Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED75C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 15:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A240264F38
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 15:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhCRPXW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 11:23:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42167 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhCRPXI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 11:23:08 -0400
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMuUN-0002Qo-8W
        for linux-tegra@vger.kernel.org; Thu, 18 Mar 2021 15:23:07 +0000
Received: by mail-wm1-f72.google.com with SMTP id n22so4213641wmo.7
        for <linux-tegra@vger.kernel.org>; Thu, 18 Mar 2021 08:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D3eo3eUVaMZCtGRKiq/Bzn1jfXcb23nythq2B4B0dbY=;
        b=TvSwnl2wqkFR1ZreeAVu9rza3lHKNOQKEbNVanMQ4bfxuSGlkyWF1s4MFuIKc/wJeX
         +Od5yAm26xqbMpbTzZaexQ0IaeiodUIt7MkTLSiWD4p1vFgv9EbhPUKsRfjkd/D5gtg6
         Lu1ZOkwcNFnuAfzMp5LlRy3uCCrJfr0asAIo6G+asDb6oNQ2Y4dqvE2CeUfl7odBpbYP
         tIxhfsabqYy/YGPjfJc13ggV1NPt9tskMuSf/e+RFu7baGQ/Be069RU6CWxBYi0QFmJ0
         FvRGTLGqR0LBo2h5d7g7/1+dGJlNG72iw2XAvYBOv9LWWkp8abdRfcxDcvspKV7s0lbG
         BC9Q==
X-Gm-Message-State: AOAM5329Td9jxpc5j14AhGrkf7aht+X8vDtCCumXeG0zQgIzHHMzgxvN
        SKWOtR3fbjn4m59FAH8eZzAiMUlZyv6xe432WGiPsSlU6rTCNgkidq4TQVEqcY7PY+V2M25ACI3
        L+tFxkNukPphfpJ+hsCNWsgBRYS4Kl5lvU9np40XT
X-Received: by 2002:a1c:a791:: with SMTP id q139mr4124817wme.20.1616080986516;
        Thu, 18 Mar 2021 08:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGSvqrbHv+6oXTYTYQwHiJAxhapYEWvi7Vd/1kpecQ4fQ62zEPFja/+C6mGLJ8981cw/CLhg==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr4124781wme.20.1616080986157;
        Thu, 18 Mar 2021 08:23:06 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id q19sm3427881wrg.80.2021.03.18.08.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 08:23:05 -0700 (PDT)
Subject: Re: [PATCH v1] memory: tegra20: Add debug statistics
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210318115556.22792-1-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <acdbd1e3-8f38-1ee6-0980-3699df9e4375@canonical.com>
Date:   Thu, 18 Mar 2021 16:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318115556.22792-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/03/2021 12:55, Dmitry Osipenko wrote:
> Add debug statistics collection support. The statistics is available
> via debugfs in '/sys/kernel/debug/mc/stats', it shows percent of memory
> controller utilization for each memory client. This information is
> intended to help with debugging of memory performance issues, it already
> was proven to be useful by helping to improve memory bandwidth management
> of the display driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c      |  12 ++
>  drivers/memory/tegra/tegra20.c | 342 +++++++++++++++++++++++++++++++++
>  include/soc/tegra/mc.h         |   7 +
>  3 files changed, 361 insertions(+)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index a21163ccadc4..85c3364ebf26 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -827,6 +827,18 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	mc->debugfs.root = debugfs_create_dir("mc", NULL);
> +	if (!mc->debugfs.root)
> +		dev_err(&pdev->dev, "failed to create debugfs directory\n");

It's error pointer, not null, but anyway there is no need for handling
debugfs error. See Greg KH's commits like "remove pointless check for
debugfs_create_dir()".

> +
> +	if (mc->soc->init) {
> +		err = mc->soc->init(mc);
> +		if (err < 0)
> +			dev_err(&pdev->dev,
> +				"failed to register initialize SoC driver: %d\n",

"failed to initialize SoC driver:...."

> +				err);
> +	}
> +
>  	err = tegra_mc_reset_setup(mc);
>  	if (err < 0)
>  		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
> index 29ecf02805a0..513c07104296 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
>  #include <linux/of_device.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> @@ -11,6 +13,77 @@
>  
>  #include "mc.h"
>  
> +#define MC_STAT_CONTROL				0x90
> +#define MC_STAT_EMC_CLOCK_LIMIT			0xa0
> +#define MC_STAT_EMC_CLOCKS			0xa4
> +#define MC_STAT_EMC_CONTROL_0			0xa8
> +#define MC_STAT_EMC_CONTROL_1			0xac
> +#define MC_STAT_EMC_COUNT_0			0xb8
> +#define MC_STAT_EMC_COUNT_1			0xbc
> +
> +#define MC_STAT_CONTROL_CLIENT_ID		GENMASK(13,  8)
> +#define MC_STAT_CONTROL_EVENT			GENMASK(23, 16)
> +#define MC_STAT_CONTROL_PRI_EVENT		GENMASK(25, 24)
> +#define MC_STAT_CONTROL_FILTER_CLIENT_ENABLE	GENMASK(26, 26)
> +#define MC_STAT_CONTROL_FILTER_PRI		GENMASK(29, 28)
> +
> +#define MC_STAT_CONTROL_PRI_EVENT_HP		0
> +#define MC_STAT_CONTROL_PRI_EVENT_TM		1
> +#define MC_STAT_CONTROL_PRI_EVENT_BW		2
> +
> +#define MC_STAT_CONTROL_FILTER_PRI_DISABLE	0
> +#define MC_STAT_CONTROL_FILTER_PRI_NO		1
> +#define MC_STAT_CONTROL_FILTER_PRI_YES		2
> +
> +#define MC_STAT_CONTROL_EVENT_QUALIFIED		0
> +#define MC_STAT_CONTROL_EVENT_ANY_READ		1
> +#define MC_STAT_CONTROL_EVENT_ANY_WRITE		2
> +#define MC_STAT_CONTROL_EVENT_RD_WR_CHANGE	3
> +#define MC_STAT_CONTROL_EVENT_SUCCESSIVE	4
> +#define MC_STAT_CONTROL_EVENT_ARB_BANK_AA	5
> +#define MC_STAT_CONTROL_EVENT_ARB_BANK_BB	6
> +#define MC_STAT_CONTROL_EVENT_PAGE_MISS		7
> +#define MC_STAT_CONTROL_EVENT_AUTO_PRECHARGE	8
> +
> +#define EMC_GATHER_RST				(0 << 8)
> +#define EMC_GATHER_CLEAR			(1 << 8)
> +#define EMC_GATHER_DISABLE			(2 << 8)
> +#define EMC_GATHER_ENABLE			(3 << 8)
> +
> +#define MC_STAT_SAMPLE_TIME_USEC		16000
> +
> +/* we store collected statistics as a fixed point values */
> +#define MC_FX_FRAC_SCALE			100
> +
> +struct tegra20_mc_stat_gather {
> +	unsigned int pri_filter;
> +	unsigned int pri_event;
> +	unsigned int result;
> +	unsigned int client;
> +	unsigned int event;
> +	bool client_enb;
> +};
> +
> +struct tegra20_mc_stat {
> +	struct tegra20_mc_stat_gather gather0;
> +	struct tegra20_mc_stat_gather gather1;
> +	unsigned int sample_time_usec;
> +	struct tegra_mc *mc;
> +};
> +
> +struct tegra20_mc_client_stat {
> +	unsigned int events;
> +	unsigned int arb_high_prio;
> +	unsigned int arb_timeout;
> +	unsigned int arb_bandwidth;
> +	unsigned int rd_wr_change;
> +	unsigned int successive;
> +	unsigned int page_miss;
> +	unsigned int auto_precharge;
> +	unsigned int arb_bank_aa;
> +	unsigned int arb_bank_bb;
> +};
> +
>  static const struct tegra_mc_client tegra20_mc_clients[] = {
>  	{
>  		.id = 0x00,
> @@ -356,6 +429,274 @@ static const struct tegra_mc_icc_ops tegra20_mc_icc_ops = {
>  	.set = tegra20_mc_icc_set,
>  };
>  
> +static u32 tegra20_mc_stat_gather_control(struct tegra20_mc_stat_gather *g)

"g" looks like pointer to const here

> +{
> +	u32 control;
> +
> +	control  = FIELD_PREP(MC_STAT_CONTROL_EVENT, g->event);
> +	control |= FIELD_PREP(MC_STAT_CONTROL_CLIENT_ID, g->client);
> +	control |= FIELD_PREP(MC_STAT_CONTROL_PRI_EVENT, g->pri_event);
> +	control |= FIELD_PREP(MC_STAT_CONTROL_FILTER_PRI, g->pri_filter);
> +	control |= FIELD_PREP(MC_STAT_CONTROL_FILTER_CLIENT_ENABLE, g->client_enb);
> +
> +	return control;
> +}
> +
> +static void tegra20_mc_stat_gather(struct tegra20_mc_stat *stat)
> +{
> +	u32 clocks, count0, count1, control_0, control_1;
> +	struct tegra_mc *mc = stat->mc;
> +
> +	control_0 = tegra20_mc_stat_gather_control(&stat->gather0);
> +	control_1 = tegra20_mc_stat_gather_control(&stat->gather1);
> +
> +	/*
> +	 * Reset statistic gathers state, select bandwidth mode for the
> +	 * statistics collection mode and set clocks counter saturation
> +	 * limit to maximum.
> +	 */
> +	mc_writel(mc, 0x00000000, MC_STAT_CONTROL);
> +	mc_writel(mc,  control_0, MC_STAT_EMC_CONTROL_0);
> +	mc_writel(mc,  control_1, MC_STAT_EMC_CONTROL_1);
> +	mc_writel(mc, 0xffffffff, MC_STAT_EMC_CLOCK_LIMIT);
> +
> +	mc_writel(mc, EMC_GATHER_ENABLE, MC_STAT_CONTROL);
> +	fsleep(stat->sample_time_usec);
> +	mc_writel(mc, EMC_GATHER_DISABLE, MC_STAT_CONTROL);
> +
> +	count0 = mc_readl(mc, MC_STAT_EMC_COUNT_0);
> +	count1 = mc_readl(mc, MC_STAT_EMC_COUNT_1);
> +	clocks = mc_readl(mc, MC_STAT_EMC_CLOCKS);
> +	clocks = max(clocks / 100 / MC_FX_FRAC_SCALE, 1u);
> +
> +	stat->gather0.result = DIV_ROUND_UP(count0, clocks);
> +	stat->gather1.result = DIV_ROUND_UP(count1, clocks);
> +}
> +
> +static void tegra20_mc_stat_events(struct tegra_mc *mc,
> +				   const struct tegra_mc_client *client0,
> +				   const struct tegra_mc_client *client1,
> +				   unsigned int pri_filter,
> +				   unsigned int pri_event,
> +				   unsigned int event,
> +				   unsigned int *result0,
> +				   unsigned int *result1)
> +{
> +	struct tegra20_mc_stat stat = {};
> +
> +	stat.gather0.client = client0 ? client0->id : 0;
> +	stat.gather0.pri_filter = pri_filter;
> +	stat.gather0.client_enb = !!client0;
> +	stat.gather0.pri_event = pri_event;
> +	stat.gather0.event = event;
> +
> +	stat.gather1.client = client1 ? client1->id : 0;
> +	stat.gather1.pri_filter = pri_filter;
> +	stat.gather1.client_enb = !!client1;
> +	stat.gather1.pri_event = pri_event;
> +	stat.gather1.event = event;
> +
> +	stat.sample_time_usec = MC_STAT_SAMPLE_TIME_USEC;
> +	stat.mc = mc;
> +
> +	tegra20_mc_stat_gather(&stat);
> +
> +	*result0 = stat.gather0.result;
> +	*result1 = stat.gather1.result;
> +}
> +
> +static void tegra20_mc_collect_stats(struct tegra_mc *mc,
> +				     struct tegra20_mc_client_stat *stats)
> +{
> +	const struct tegra_mc_client *client0, *client1;
> +	unsigned int i, clienta, clientb;

Define the clienta and clientb inside the loop, to reduce the scope.
Unless it is used between the loop iterations?

> +
> +	/* collect memory controller utilization percent for each client */
> +	for (i = 0; i < mc->soc->num_clients; i += 2) {
> +		client0 = &mc->soc->clients[i];
> +		client1 = &mc->soc->clients[i + 1];
> +
> +		if (i + 1 == mc->soc->num_clients)
> +			client1 = NULL;
> +
> +		tegra20_mc_stat_events(mc, client0, client1,
> +				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
> +				       MC_STAT_CONTROL_PRI_EVENT_HP,
> +				       MC_STAT_CONTROL_EVENT_QUALIFIED,
> +				       &stats[i + 0].events,
> +				       &stats[i + 1].events);
> +	}
> +
> +	/* collect more info from active clients */
> +	for (i = 0; i < mc->soc->num_clients; i++) {
> +		clientb = mc->soc->num_clients;
> +
> +		for (client0 = NULL; i < mc->soc->num_clients; i++) {
> +			if (stats[i].events) {
> +				client0 = &mc->soc->clients[i];
> +				clienta = i++;
> +				break;
> +			}
> +		}

Could all clients have 0 events ending with "clienta" being undefined?
"client0" would be non-NULL because of loop before.

> +
> +		for (client1 = NULL; i < mc->soc->num_clients; i++) {
> +			if (stats[i].events) {
> +				client1 = &mc->soc->clients[i];
> +				clientb = i;
> +				break;
> +			}
> +		}
> +
> +		if (!client0 && !client1)
> +			break;
> +
> +		tegra20_mc_stat_events(mc, client0, client1,
> +				       MC_STAT_CONTROL_FILTER_PRI_YES,
> +				       MC_STAT_CONTROL_PRI_EVENT_HP,
> +				       MC_STAT_CONTROL_EVENT_QUALIFIED,
> +				       &stats[clienta].arb_high_prio,
> +				       &stats[clientb].arb_high_prio);
> +



Best regards,
Krzysztof
