Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C52C433E2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A90EC216C4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD1KM/5v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgIICUI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 22:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgIICUD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 22:20:03 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F35C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 19:20:03 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d15so718368lfq.11
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Q2+kiu4EfZjMBUp16jDvji+ladlLRHIFkYixQGK8qs=;
        b=OD1KM/5vuuzXIdr/q6koklfVPGNZw81Na0cNlV+LKaBlN7D+c8w8Lo0HadgpmKdD1K
         5Hk0yIGRsQo+0m29qHtHRcmlDoefR5DMYp7JUQvpPbzmodCZ8YMyuKF+PlCDY5ako87B
         +N7hIrafYNITNUl2Umcde00tWfBACir9a8KN994KJVhjf7dHysKIt41sVWaONS6gjJyM
         Zm1mbhJH9aFyFAGZZA7No+JrDrd57mw4+0B/9fn+SBB18KVGl/fgcGgGDkyG2JAJ7IN5
         LR5iqQaLjurxWYlMtVVJOuFb6m80z9Wxf5E+P1EI5Ja0sZyMP03u9jJe1OBOd/7gLN4x
         hELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Q2+kiu4EfZjMBUp16jDvji+ladlLRHIFkYixQGK8qs=;
        b=dCgIK/fyMMdfmVyqEXQ2weh3pNbOmNZkP96SSU52Na02xTSN7dMQTU/PbiqV5/j02V
         PU23ebW2m94e/TeJn4UDSzsYpBA84fmYb7rDPCaMQPWjXCHZkisBDUAyublxxl/1ZMP6
         dYxx3r8HflHHITT4VMhy9TeANL2yHTA968mEK0dS2Vekg5A6+zh0YBYaaDpXM2KovvfH
         4d4pwVY/KgmwMV3qqj9LIZ4hAUGhUQIwP3mExeQJxGsTxEOaL6inWYFUxjIocFWpuhz4
         ykRjH7UAMHK/lK0MnlNNqSzeNdtQLwa2xN7FDe9LoqHACHkUIjzQdn+4T4srTM6/bt98
         bw+w==
X-Gm-Message-State: AOAM530bZCqnyjGWfnPi5Db1Ev3sH9j2NaECEhEpcEiW00oI0JN1/R+1
        iNRGo8sSg5xVXTmDXdYnnJ0=
X-Google-Smtp-Source: ABdhPJwzmNvEnX58PSsyVxtoj9TlEeeFHguJqsfbPwv8QpfV+EO7XJeopfJVlkSGo6sE1yxSK5Ezeg==
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr838381lfh.86.1599618001679;
        Tue, 08 Sep 2020 19:20:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id z10sm260472lfa.10.2020.09.08.19.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 19:20:00 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
Date:   Wed, 9 Sep 2020 05:20:00 +0300
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
> 
> * Relocs are now handled on TegraDRM side instead of Host1x,
>   so the firewall is not aware of them, causing submission
>   failure where the firewall is enabled. Proposed solution
>   is to move the firewall to TegraDRM side, but this hasn't
>   been done yet.
> * For the new UAPI, syncpoint recovery on job timeout is
>   disabled. What this means is that upon job timeout,
>   all further jobs using that syncpoint are cancelled,
>   and the syncpoint is marked unusable until it is freed.
>   However, there is currently a race between the timeout
>   handler and job submission, where submission can observe
>   the syncpoint in non-locked state and yet the job
>   cancellations won't cancel the new job.
> * Waiting for DMA reservation fences is not implemented yet.
> * I have only tested on Tegra186.
> 
> The series consists of three parts:
> 
> * The first part contains some fixes and improvements to
>   the Host1x driver of more general nature,
> * The second part adds the Host1x side UAPI, as well as
>   Host1x-side changes needed for the new TegraDRM UAPI,
> * The third part adds the new TegraDRM UAPI.
> 
> I have written some tests to test the new interface,
> see https://github.com/cyndis/uapi-test. Porting of proper
> userspace (e.g. opentegra, vdpau-tegra) will come once
> there is some degree of conclusion on the UAPI definition.

Could you please enumerate all the currently opened questions?
