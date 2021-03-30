Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E22C433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 21:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4C16619CA
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 21:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbhC3VMi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 17:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhC3VMX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 17:12:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE66C061574
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 14:12:22 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s17so21450587ljc.5
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 14:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=txu5B3L7eP4j1N+cIql31D7dSawJ91f2aT78Kr4BqJo=;
        b=WoSJr6x1WghvNNJvOK+/G4gU9L6G25yzlwxCHbTdAnjh/grTv28MleTfUTuvApL1Kk
         l7e2p4TeoThi6NZSLvqqgXGWHRnRxniAlPOnhJH4kibG9S6de5iaVUXFhx6PpvoDDpZ+
         aDKzYYZvascaVa01OzxEoWfZQkmAwKSDSC19X3eMM2jZcw++M3sSwd13hwbCgb+ZdImg
         Mjt731XJ9TJrcF8QGt3tCuVT/GWixmMPmtIsq+dBYOyZOrmUt5ghXt1g+ebXAzDbSQvK
         uPSrMSp5JhlaMcylAOU/jU8mu3ian4eiSg+3GPbzPdPFvP4+dYY5FkvfkaCAXskFLQ1H
         GLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=txu5B3L7eP4j1N+cIql31D7dSawJ91f2aT78Kr4BqJo=;
        b=cIvlybiO0gt2GiU5KsJDuUNi9HIR+lTE9uchc03q2bzBOFFQ1R6DO1eMUDIYTXGWxe
         jRVNcb2mtLTDZ7ezkgkY9IQuNi5Po1KJQWSy4Sa9S9BE4wlr/ftRgwiwr2ittWwamWqE
         9vxbuacGGa1LjDQKbwd0Y4TtEYlIvKf2db9w+QlhLlcxumW48hXmJ3fXPVC10mT0yHVJ
         jOu8bXqSStTrbBmw7iA6OPIe6gwqMBMQaOv25JXyLHeHCKebD2Wr1LejTaHuG7bfGrUf
         +ALCfL+0tJUOWnuNDnyoaZZOAeNEADaz7s3iJg7NCwZu0lkyDlApsEINo1uU9kA5rKaC
         sZFQ==
X-Gm-Message-State: AOAM531Wu+fJWJ64v+5sN1Twh7Lw8lEbQeUBs9uoskFFm/vPGAu3EhTa
        nEWkIjJhsBpK5oro8JNv1ls=
X-Google-Smtp-Source: ABdhPJw8qo2aRrzetMrR0iXScpsd9j7WHeMPS5ueABHKr08dQHrWy9prL/yRc6Zn//UEXUEg6AliaQ==
X-Received: by 2002:a2e:9bd0:: with SMTP id w16mr58429ljj.465.1617138741316;
        Tue, 30 Mar 2021 14:12:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id f17sm2748lfh.21.2021.03.30.14.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 14:12:21 -0700 (PDT)
Subject: Re: [PATCH v6 03/10] gpu: host1x: Show number of pending waiters in
 debugfs
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-4-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ecc00d79-6963-c18b-36df-c8c57e2824ea@gmail.com>
Date:   Wed, 31 Mar 2021 00:12:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-4-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.03.2021 16:38, Mikko Perttunen пишет:
> Show the number of pending waiters in the debugfs status file.
> This is useful for testing to verify that waiters do not leak
> or accumulate incorrectly.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/debug.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> index 1b4997bda1c7..8a14880c61bb 100644
> --- a/drivers/gpu/host1x/debug.c
> +++ b/drivers/gpu/host1x/debug.c
> @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
>  
>  static void show_syncpts(struct host1x *m, struct output *o)
>  {
> +	struct list_head *pos;
>  	unsigned int i;
>  
>  	host1x_debug_output(o, "---- syncpts ----\n");
> @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
>  	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
>  		u32 max = host1x_syncpt_read_max(m->syncpt + i);
>  		u32 min = host1x_syncpt_load(m->syncpt + i);
> +		unsigned int waiters = 0;
>  
> -		if (!min && !max)
> +		spin_lock(&m->syncpt[i].intr.lock);
> +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
> +			waiters++;
> +		spin_unlock(&m->syncpt[i].intr.lock);
> +
> +		if (!min && !max && !waiters)
>  			continue;
>  
> -		host1x_debug_output(o, "id %u (%s) min %d max %d\n",
> -				    i, m->syncpt[i].name, min, max);
> +		host1x_debug_output(o,
> +				    "id %u (%s) min %d max %d (%d waiters)\n",
> +				    i, m->syncpt[i].name, min, max, waiters);
>  	}
>  
>  	for (i = 0; i < host1x_syncpt_nb_bases(m); i++) {
> 

Tested-by: Dmitry Osipenko <digetx@gmail.com>
