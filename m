Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04399C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 19:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAD86619F9
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 19:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhCZTLU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 15:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhCZTKy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 15:10:54 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7B3C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=erHlh/QTqIRNBeQcZ402/xZoPrZyyfh2s9Bmv0LbzRc=; b=idQ0hJQEM20zC1tvjCOgiHa/ax
        CYh5nEMkxBgbvHOBb0xNt7iA3W2YXioVGjSD4HwA+WOV+tY/57gRlO95JMJEtJKNKSGEUlrP5cAQQ
        eyCa6uR/9Ia9CG3IZHbz8yF561S1cuPbLEqgedCRoVum7wobkpvosK5IT1JlV1KsVdWt8gWVajX/8
        hIDW1BvMTwl50PVaDaIdlULeJ+O9mZS2960H8ArrsliQlG4FTamqKZbklrlP1G3uD6QkhUVtMwsC/
        b+M7x5sOKMaTu7xxqhjTxOPDuXmZMyvyH4wwYFci0IZLoVmK4kpK2eO9Cv3WcxUNMrNrJvl0kFzMK
        eMa8NJCw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lPrr6-0002vo-DZ; Fri, 26 Mar 2021 21:10:48 +0200
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
 <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <48367008-1786-6cb6-15a0-03b526f53fe9@kapsi.fi>
Date:   Fri, 26 Mar 2021 21:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/26/21 8:31 PM, Dmitry Osipenko wrote:
> 26.03.2021 17:54, Mikko Perttunen пишет:
>>
>> Lockdep doesn't seem to be liking dev_name() for the name, and I think
>> allocating a string for this purpose seems a bit overkill, so I'll keep
>> the lock name as is if there are no objections.
> 
> What does "liking" mean?
> 

kernel/locking/lockdep.c:894 (on my local tree):

                        WARN_ON_ONCE(class->name != lock->name &&
                                      lock->key != 
&__lockdep_no_validate__);

Mikko
