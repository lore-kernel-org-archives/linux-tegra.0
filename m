Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5F2C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 22:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BAA661351
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 22:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFOW0i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 18:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhFOW0h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 18:26:37 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C75BC061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 15:24:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h4so751314lfu.8
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 15:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nhjOizUTbckzYteuZLHk6CVgBEQfJtYD7kitJqqzHBQ=;
        b=sD5qq9tYIelkWooFfX83VvAnGZlQrJ1mLo7UjV7IwGP6B+N9LvHIDaBgcCXc5vOdbu
         nZ3gkpLjGSjdtN1lu5EF6hLoh07Z5Jfdxg3dS2hbxkfGWKiG3vjZIJ6v++SO5vtvO88i
         osxWStClApdxIYy3SkAIUp/nDDNfpp1iCRMGQcItUlqAVgSrpVKwMdb3qLzu3X647ZXc
         zCEBztBzKGwlPFsPPYgWd3eKdlAN4Sw7uGjniXOc9Qmik34WYutXcAnDijgrTsuiNZIA
         83xx5N1G0WKXhVco87L0zNsGoqvx6IqrMl+b5g9ig5+XoY2I0UbBFU0g/Ey1AiK5vp9g
         sfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nhjOizUTbckzYteuZLHk6CVgBEQfJtYD7kitJqqzHBQ=;
        b=J7LYtxWwl00D8o7owHcEYkXbyPI0zC2gi8eSJVFE7CCuFGykw+QN3CSUNI81WdvbCM
         9vyBVdD7nUXK20a0dY+sRT6R/C6tCMBxjiiNlCamUYNfA0OAjV9dy20DNUj84dO09mwX
         OtJZ99nrS/RvW+RYBr/rhvTsJB0zg5eYG56dg7sqiFylK38HUC/kyAnNg6BvExeV9SwJ
         eF3D/PTt7/vX9sQwtaRwD7onCql4D9KAtk02IFo/jW5/dh+BJQeyXldsbpOo7ZHNjykx
         OxMSmx0pd8+zRTe8JbvvMY9yVLbYWYELVCBQ9d9mk2Q65Vm2TFBNpsGGX+Y/S8YHIuk5
         VCVQ==
X-Gm-Message-State: AOAM532fBhKycxFaWB+SmCGmddN/+7gaQ+yuyVxDyXMWVMeGnEduCGmq
        EbqmNUwITUerQUXgzaVwEH/8hRcJZXw=
X-Google-Smtp-Source: ABdhPJzqIuvzdDhYKwforGWpDUyz9K1lKGQJDQFjTUi+Vy02YbelkVv3YZ47tpiXpNCfltmIu6EWzA==
X-Received: by 2002:ac2:44c2:: with SMTP id d2mr1132422lfm.337.1623795868885;
        Tue, 15 Jun 2021 15:24:28 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id c9sm14361ljb.22.2021.06.15.15.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 15:24:28 -0700 (PDT)
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6651a3e-1e63-16a9-570a-1b8b09062f03@gmail.com>
Date:   Wed, 16 Jun 2021 01:24:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-14-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.06.2021 14:04, Mikko Perttunen пишет:
> +drop_refs:
> +	for (;;) {
> +		if (i-- == 0)
> +			break;
> +

while(i--) ?
