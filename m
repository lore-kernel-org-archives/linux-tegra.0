Return-Path: <SRS0=mK2W=CR=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B85AC433E2
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Sep 2020 23:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B29FE20EDD
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Sep 2020 23:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKvVdr62"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgIHXg7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 19:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgIHXg6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 19:36:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3673C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 16:36:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u4so1071262ljd.10
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 16:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rDZ8rOIcndqB1/SMUGVo/U3Os5v12RouimNmvPxV4Xw=;
        b=GKvVdr62U4pfIktgOyS+3+xkZ2rmdRFti+rnRYXA4C9+tXCOZ72hAA236ivvM5ej9k
         1yqgsSCodSkObycuxmdYdarWJsx9+hBgI69RX3gg09xR/aiIGAVy5qyiNR7sECHzGYTX
         msPbD/QedNeYkEdJEloVUjjmMXBNPIFoTaTl4YJ2nl441K2Gm6xPE2Qnulu4+++G5y+B
         oLHBXM8k/jy1TNabj1kJHAEQtSbh1z5iiKVbSGP9RnNwS3UJ3vdO0pSLv+Qyi03fqIyu
         7B4WKj0A0HSicLnDNSqOTlYXVd1AdumqLoJ02fpU/aTiiMQNwmwiv7s7HUhg8OMDt8+p
         H/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rDZ8rOIcndqB1/SMUGVo/U3Os5v12RouimNmvPxV4Xw=;
        b=nPSWUWzFkW9Z+NIWKq/71E3pxFvmRehUZehC33/uSGT3pMd0suKAPF5CVC9LigtwEr
         KQWlo5kOxj8h+au1L3/DrZ92Oa16HVxhmFx5LFMTlW3USHAPe2hK3Lomf6g/kdvStEic
         BjmDEP3vFP8ER+pfbMb4PsTkMwNdyxsklMH0JA9u/R7YP8jAaiixi4ArN3/OSs+J5lqd
         GhvPAFhQ9zUebDUWte3Pxcir30fJUQSwXcaOktvaLNpP/cmhLP3sWFWdRmdo5/ClgZhS
         DYk7d+LCzKVKX9ICQf6Jivc/YhByuuZ86+N9M5Kr7iMdUryHXfREymWPL/ftKca5ObCR
         k1JA==
X-Gm-Message-State: AOAM5322gOGGyorahdWEEsCfumaKE2Q/ebgrSD7EvSZUiD8I2NCRel2s
        4BnYh1qM/ZQLKNB1I3na3PM=
X-Google-Smtp-Source: ABdhPJwwyI61fyaloH7zxC+FXApjvP+fbC6sWP8BaXoWryLhofJpYHodyvO+esrugOwEnSpa2zFBcw==
X-Received: by 2002:a2e:3506:: with SMTP id z6mr434251ljz.418.1599608216322;
        Tue, 08 Sep 2020 16:36:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t4sm276971ljh.122.2020.09.08.16.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 16:36:55 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
Date:   Wed, 9 Sep 2020 02:36:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
> Hi all,
> 
> here's a second revision of the Host1x/TegraDRM UAPI proposal,
> hopefully with most issues from v1 resolved, and also with
> an implementation. There are still open issues with the
> implementation:
Could you please clarify the current status of the DMA heaps. Are we
still going to use DMA heaps?
