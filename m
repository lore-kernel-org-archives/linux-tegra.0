Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A9DC2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 13:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 642FD2168B
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 13:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBp6M429"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIZNrw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 09:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNrv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 09:47:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9BDC0613CE;
        Sat, 26 Sep 2020 06:47:51 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y2so5939260lfy.10;
        Sat, 26 Sep 2020 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lNbXhJArblGcxeZheeo2BpWV11J4mxo5UBEIbVkUdsg=;
        b=oBp6M429G1+h4azfP/C5b2+24+Fz6tHTQYZXp6E9HDH6MhMFGC5F3sszOUygMDlfpY
         o7y39C4qbqRXeRzLRI4CtYvvsqZNbu0XXOyiAcztl1jFm1Bg8vu5SqNs6FCloMAlF5qc
         8H8rbYed437z7dNLf6t5C7RQr01TEA0Pvklx4UL2QWLMu0KKsKgL7AGQzMjplst9i/ff
         xk1hnZJBY5Hx3UfL3BOqYkQmjSAvN/QlHagqwR1HMDxeJt5dN6hjRmVjBTznWStAAH+M
         F3DY/QCeyFtkVVBtmndIv2Yojumr8pE8mBNZyFtG2Lt46L65OjsijM9YNrFLg3oa6yhR
         QoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lNbXhJArblGcxeZheeo2BpWV11J4mxo5UBEIbVkUdsg=;
        b=jSerRX00QXOTcqlCmnVjragk1DTJIXrVhdtubd1adQXx8Tntnn6/UGdTqlAXe4iP+0
         bPmEB2Y9qfA30tI8wiicHu7PlhJZRBmWFzUfSETqEva1ztW5RWYlrAG2hy/56xayU/vq
         BI3meNueyDKwu4UMvH/IVvpADXBvQMPm6+zeVoZqZtMFl4YulWiH8DHvp1C3Gf659ndl
         8/GcBxKbhMeTMbD7ImbOPMSL05RCc80ZuqjtihLRDPYNJg4PxPbLwtuWvD/7ahKMMpvb
         k3Z7EhhdPJXHRmHgH+QDNPJYL2hu4R/xDxkSXO7E//yMlkdeSq9D159tnQnGpVhrkUx6
         tfZg==
X-Gm-Message-State: AOAM530XhP06Kr8vj+Ls4cl8NyvTYvXT77kdqyKYzQWAEsLXJQQFUQYB
        nsoc57B5POXYMgq1qsYpZ987M7EKx6Q=
X-Google-Smtp-Source: ABdhPJzZAAbv71OtrERAMczlk029GPxqrzyFd4H7DB09Xp64+SklRLmRTHEzBlZkOpogwqAB9GwMtg==
X-Received: by 2002:ac2:51a8:: with SMTP id f8mr1303670lfk.472.1601128069735;
        Sat, 26 Sep 2020 06:47:49 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id v17sm1659052lfr.42.2020.09.26.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 06:47:48 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200923210352.1176386-1-pgwipeout@gmail.com>
 <20200923210352.1176386-2-pgwipeout@gmail.com>
 <df2d6a8d-8a6c-464b-8f35-a7994ea01534@gmail.com>
 <CAMdYzYosBUUudsRnf9RQ1HKYq8cS4uXRm-9Mg1=hZy+v_Q_X6g@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <83a5ee67-e30d-db43-a210-345304ed6edd@gmail.com>
Date:   Sat, 26 Sep 2020 16:47:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYosBUUudsRnf9RQ1HKYq8cS4uXRm-9Mg1=hZy+v_Q_X6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.09.2020 05:01, Peter Geis пишет:
...
>>> +             pmic: pmic@2d {
>>> +                     compatible = "ti,tps65911";
>>> +                     reg = <0x2d>;
>>> +
>>> +                     interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     #interrupt-cells = <2>;
>>> +                     interrupt-controller;
>>> +
>>> +                     ti,system-power-controller;
>>
>> Are the ti,sleep-keep-ck32k and other properties not needed for Ouya
>> like they are needed for Nexus 7?
> 
> Ouya is wall powered, so ultra low power isn't terribly necessary.
> Also with LP1 and LP0 not working, it doesn't make much sense to
> implement this yet.

The keep-ck32 is not about power saving. If PMC is running off PMIC's
oscillator during LP1 suspend, then this should be one of the reasons
why LP1 doesn't work for you.
