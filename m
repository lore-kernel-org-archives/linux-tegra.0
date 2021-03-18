Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591E1C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 16:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 179DE64F11
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 16:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhCRQTP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 12:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhCRQTB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 12:19:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F253C06174A;
        Thu, 18 Mar 2021 09:19:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w37so5478854lfu.13;
        Thu, 18 Mar 2021 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B2DKBV/YowZ10akPq9567XaK/11k1NIOZ6i0V3sJmGA=;
        b=rKg54RKbNtxxuuUeZnbgaWN9JwqMjSXa5hBgK2uVL/0gwNgcKdceUw1MCiPHXkcZWu
         oBTNgSy6kZG4BaspjRe23U6Et1qd2uhdfditguaf7enV5l71R5rsjzy4NK6goULraKsj
         XE4vibMAoRW8Kj8mRMi3jvl3fMNx3/NV4KhTT8y5C/fTHvsWVUeoeGkS9GeaLPw6vxif
         S+BbMAsNy97/cTw/RznY3Kz3Nu+063BbFpKNfuNKXXFvMslj6lLj1U/5++pcDQ9kK00w
         MgJP2GcgIz7uhovKx6mz5pF5FFnY1ZyqfbkPN+Usw2rw76UsD9CikpCDcv8DU2AIILAt
         mGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B2DKBV/YowZ10akPq9567XaK/11k1NIOZ6i0V3sJmGA=;
        b=NxHYIAJMSmXWOE/I1zX/n2+IpTcp+2hMfA4GnOJout6Q8X6eYOoTZTpl0V1B59T9J9
         4y98cezBjt1VE4DB82LHrEGRCW7Oz9fMeBmz9HSkNN81pR7TB/dc0unTmw1SqvlbrgNC
         tYP4lukPNdib/WhkWVQSY6WY/GBwXlbMbcX6iFVQNrRMvJVdjgBpAyQlfcfBz0qSYWp+
         XBcxSFO2OW4FgqSyZltA1J+e6Mqsbbz5Bwz0InoeftMZ1e35o8fVugFEA/I90ZrRAwkr
         2RBu3FY2tQE4JQ0o4RwA+mKmKPoFlDC7UinVojn6703PWX9e7g8yZEvWqaVdKIO/cA86
         rTUQ==
X-Gm-Message-State: AOAM530+tRtLDNzACk9FsMe+RTSLXoU4aCVaIR6autV+pYmqXP9TKURV
        p5OO4brp+qXs9JHY4uLmEdWTkPUkqUs=
X-Google-Smtp-Source: ABdhPJzO+nJKWWoca/WUXHaTok8u8AjK6PXOTVy0BMilZn0ONZ3+9UReuU/8lomSMnBe/CSJBM8u9g==
X-Received: by 2002:a05:6512:4c6:: with SMTP id w6mr5934656lfq.258.1616084339310;
        Thu, 18 Mar 2021 09:18:59 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id d4sm276829lfs.45.2021.03.18.09.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 09:18:58 -0700 (PDT)
Subject: Re: [PATCH v1] memory: tegra20: Add debug statistics
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210318115556.22792-1-digetx@gmail.com>
 <acdbd1e3-8f38-1ee6-0980-3699df9e4375@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <26ef74e0-67ff-77c4-1682-8f8261b71463@gmail.com>
Date:   Thu, 18 Mar 2021 19:18:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <acdbd1e3-8f38-1ee6-0980-3699df9e4375@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.03.2021 18:23, Krzysztof Kozlowski пишет:
...
>> +	mc->debugfs.root = debugfs_create_dir("mc", NULL);
>> +	if (!mc->debugfs.root)
>> +		dev_err(&pdev->dev, "failed to create debugfs directory\n");
> 
> It's error pointer, not null, but anyway there is no need for handling
> debugfs error. See Greg KH's commits like "remove pointless check for
> debugfs_create_dir()".

Indeed!

>> +
>> +	if (mc->soc->init) {
>> +		err = mc->soc->init(mc);
>> +		if (err < 0)
>> +			dev_err(&pdev->dev,
>> +				"failed to register initialize SoC driver: %d\n",
> 
> "failed to initialize SoC driver:...."

Good catch!

>> +				err);
>> +	}
>> +
>>  	err = tegra_mc_reset_setup(mc);
>>  	if (err < 0)
>>  		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
>> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
>> index 29ecf02805a0..513c07104296 100644
>> --- a/drivers/memory/tegra/tegra20.c
>> +++ b/drivers/memory/tegra/tegra20.c
>> @@ -3,6 +3,8 @@
>>   * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>>   */
>>  
>> +#include <linux/bitfield.h>
>> +#include <linux/delay.h>
>>  #include <linux/of_device.h>
>>  #include <linux/slab.h>
>>  #include <linux/string.h>
>> @@ -11,6 +13,77 @@
>>  
>>  #include "mc.h"
>>  
>> +#define MC_STAT_CONTROL				0x90
>> +#define MC_STAT_EMC_CLOCK_LIMIT			0xa0
>> +#define MC_STAT_EMC_CLOCKS			0xa4
>> +#define MC_STAT_EMC_CONTROL_0			0xa8
>> +#define MC_STAT_EMC_CONTROL_1			0xac
>> +#define MC_STAT_EMC_COUNT_0			0xb8
>> +#define MC_STAT_EMC_COUNT_1			0xbc
>> +
>> +#define MC_STAT_CONTROL_CLIENT_ID		GENMASK(13,  8)
>> +#define MC_STAT_CONTROL_EVENT			GENMASK(23, 16)
>> +#define MC_STAT_CONTROL_PRI_EVENT		GENMASK(25, 24)
>> +#define MC_STAT_CONTROL_FILTER_CLIENT_ENABLE	GENMASK(26, 26)
>> +#define MC_STAT_CONTROL_FILTER_PRI		GENMASK(29, 28)
>> +
>> +#define MC_STAT_CONTROL_PRI_EVENT_HP		0
>> +#define MC_STAT_CONTROL_PRI_EVENT_TM		1
>> +#define MC_STAT_CONTROL_PRI_EVENT_BW		2
>> +
>> +#define MC_STAT_CONTROL_FILTER_PRI_DISABLE	0
>> +#define MC_STAT_CONTROL_FILTER_PRI_NO		1
>> +#define MC_STAT_CONTROL_FILTER_PRI_YES		2
>> +
>> +#define MC_STAT_CONTROL_EVENT_QUALIFIED		0
>> +#define MC_STAT_CONTROL_EVENT_ANY_READ		1
>> +#define MC_STAT_CONTROL_EVENT_ANY_WRITE		2
>> +#define MC_STAT_CONTROL_EVENT_RD_WR_CHANGE	3
>> +#define MC_STAT_CONTROL_EVENT_SUCCESSIVE	4
>> +#define MC_STAT_CONTROL_EVENT_ARB_BANK_AA	5
>> +#define MC_STAT_CONTROL_EVENT_ARB_BANK_BB	6
>> +#define MC_STAT_CONTROL_EVENT_PAGE_MISS		7
>> +#define MC_STAT_CONTROL_EVENT_AUTO_PRECHARGE	8
>> +
>> +#define EMC_GATHER_RST				(0 << 8)
>> +#define EMC_GATHER_CLEAR			(1 << 8)
>> +#define EMC_GATHER_DISABLE			(2 << 8)
>> +#define EMC_GATHER_ENABLE			(3 << 8)
>> +
>> +#define MC_STAT_SAMPLE_TIME_USEC		16000
>> +
>> +/* we store collected statistics as a fixed point values */
>> +#define MC_FX_FRAC_SCALE			100
>> +
>> +struct tegra20_mc_stat_gather {
>> +	unsigned int pri_filter;
>> +	unsigned int pri_event;
>> +	unsigned int result;
>> +	unsigned int client;
>> +	unsigned int event;
>> +	bool client_enb;
>> +};
>> +
>> +struct tegra20_mc_stat {
>> +	struct tegra20_mc_stat_gather gather0;
>> +	struct tegra20_mc_stat_gather gather1;
>> +	unsigned int sample_time_usec;
>> +	struct tegra_mc *mc;
>> +};
>> +
>> +struct tegra20_mc_client_stat {
>> +	unsigned int events;
>> +	unsigned int arb_high_prio;
>> +	unsigned int arb_timeout;
>> +	unsigned int arb_bandwidth;
>> +	unsigned int rd_wr_change;
>> +	unsigned int successive;
>> +	unsigned int page_miss;
>> +	unsigned int auto_precharge;
>> +	unsigned int arb_bank_aa;
>> +	unsigned int arb_bank_bb;
>> +};
>> +
>>  static const struct tegra_mc_client tegra20_mc_clients[] = {
>>  	{
>>  		.id = 0x00,
>> @@ -356,6 +429,274 @@ static const struct tegra_mc_icc_ops tegra20_mc_icc_ops = {
>>  	.set = tegra20_mc_icc_set,
>>  };
>>  
>> +static u32 tegra20_mc_stat_gather_control(struct tegra20_mc_stat_gather *g)
> 
> "g" looks like pointer to const here

I'll add couple more consts to the code for consistency.

>> +{
>> +	u32 control;
>> +
>> +	control  = FIELD_PREP(MC_STAT_CONTROL_EVENT, g->event);
>> +	control |= FIELD_PREP(MC_STAT_CONTROL_CLIENT_ID, g->client);
>> +	control |= FIELD_PREP(MC_STAT_CONTROL_PRI_EVENT, g->pri_event);
>> +	control |= FIELD_PREP(MC_STAT_CONTROL_FILTER_PRI, g->pri_filter);
>> +	control |= FIELD_PREP(MC_STAT_CONTROL_FILTER_CLIENT_ENABLE, g->client_enb);
>> +
>> +	return control;
>> +}
...
>> +static void tegra20_mc_collect_stats(struct tegra_mc *mc,
>> +				     struct tegra20_mc_client_stat *stats)
>> +{
>> +	const struct tegra_mc_client *client0, *client1;
>> +	unsigned int i, clienta, clientb;
> 
> Define the clienta and clientb inside the loop, to reduce the scope.
> Unless it is used between the loop iterations?

okay

>> +
>> +	/* collect memory controller utilization percent for each client */
>> +	for (i = 0; i < mc->soc->num_clients; i += 2) {
>> +		client0 = &mc->soc->clients[i];
>> +		client1 = &mc->soc->clients[i + 1];
>> +
>> +		if (i + 1 == mc->soc->num_clients)
>> +			client1 = NULL;
>> +
>> +		tegra20_mc_stat_events(mc, client0, client1,
>> +				       MC_STAT_CONTROL_FILTER_PRI_DISABLE,
>> +				       MC_STAT_CONTROL_PRI_EVENT_HP,
>> +				       MC_STAT_CONTROL_EVENT_QUALIFIED,
>> +				       &stats[i + 0].events,
>> +				       &stats[i + 1].events);
>> +	}
>> +
>> +	/* collect more info from active clients */
>> +	for (i = 0; i < mc->soc->num_clients; i++) {
>> +		clientb = mc->soc->num_clients;
>> +
>> +		for (client0 = NULL; i < mc->soc->num_clients; i++) {
>> +			if (stats[i].events) {
>> +				client0 = &mc->soc->clients[i];
>> +				clienta = i++;
>> +				break;
>> +			}
>> +		}
> 
> Could all clients have 0 events ending with "clienta" being undefined?
> "client0" would be non-NULL because of loop before.

As per 6.8.5.3 of C99 standard, the declaration of a for-loop "is
reached in the order of execution before the first evaluation of the
controlling expression".

http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf

>> +
>> +		for (client1 = NULL; i < mc->soc->num_clients; i++) {
>> +			if (stats[i].events) {
>> +				client1 = &mc->soc->clients[i];
>> +				clientb = i;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!client0 && !client1)
>> +			break;

this means that both client0 and client1 are set t0 NULL here if all
clients have 0 events.
