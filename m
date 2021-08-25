Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E6BC4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 10:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 193DC60FE6
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 10:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238820AbhHYKYs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 06:24:48 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52256
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237180AbhHYKYs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 06:24:48 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D01AE4077E
        for <linux-tegra@vger.kernel.org>; Wed, 25 Aug 2021 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629887041;
        bh=qYITTzx6yoJ6ZEWqnLVDWr60hdYOB+VLMXO/GfrPW6E=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=bBDFlLh/FVbPtyzH626a+rWYco4PA6F+ggcREJ3813qbh8SND9LZKTWK4u9UkZjVm
         XINbDuaR6aFZc6qVYGbcLrKo8wL183daMaoDXfuK7CjCwFpvcqafckSzMs/2DyelyH
         l4rOEV1hkmBbbEF2710698QHWMjn15+yOtKy+JDt8HLjHI8KWGr5ZrttLzmBU6HBu/
         +Z3cwp+ckMu5oJOrkzOBfGl5fWRSOaVUt8nEunh7xIYwDZLZ+GDaSbwhDcQIqDrU8l
         mTqeuYLZwj2KEZA+s0O03x6JkUoEHR8LO8hE5CyMf/+auWkNt3lsiWzF/sY1ANW/F5
         5Bp2+zaoO5h7g==
Received: by mail-wm1-f72.google.com with SMTP id y188-20020a1c7dc5000000b002e80e0b2f87so2659986wmc.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Aug 2021 03:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qYITTzx6yoJ6ZEWqnLVDWr60hdYOB+VLMXO/GfrPW6E=;
        b=gcvnGYo1eRluruV6UhxZmrs+qUEAlHgvYRh7ygHyGk0/JMRrQTsGGQ9I2m7b/83+qO
         hAc104li5H4fIHXSv6Vd2C0BaItsdTlr1NCcu+MUE6g1kSXuTD7rS3iCfydG7E2IbhhV
         +6Kx7ncQmdwtM45QPbJHxaTob3Kp3rLYgkeTzN21OVTb/FsxeYP+cSC39zUX5QVRKdpy
         b7IixV6mJU29BXdcLMNvUWM6SJxjenA/ucDyZs+Ub2TclI7QCUMDADVil9zcNRWAbSXH
         CC2UVy53+NEtmpt60lZu4u/lW3D5W66nzedhwgHJwdwrYU88zLdZqmfxBwUcBbLt1JkN
         9Lfg==
X-Gm-Message-State: AOAM532HciAQvTmtjVmKE4nagBnd13dvWUjcAA8zy1K8wG0ShLE2z9AW
        R2cx5IbMcCBILdBat8vbc8zcW0ghBqQYqf0pjYor+n2dXyvrUvNHm7V+0pMcwLvT/Elj8WHOxY0
        33xaqzwRtLvG6UNX/5GbOWBDXGBXRvKdNAW76srSA
X-Received: by 2002:a05:600c:2186:: with SMTP id e6mr8343928wme.71.1629887041300;
        Wed, 25 Aug 2021 03:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZl4aXEEOHtVrDkJpoJdrZEGBLxXtojjTiCSLJimIRXhBRaRAZsLhEFLPW4n3A7i3jPsLicw==
X-Received: by 2002:a05:600c:2186:: with SMTP id e6mr8343908wme.71.1629887041135;
        Wed, 25 Aug 2021 03:24:01 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.15])
        by smtp.gmail.com with ESMTPSA id o21sm5225953wms.32.2021.08.25.03.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 03:24:00 -0700 (PDT)
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     CGEL <cgel.zte@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jing Yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
 <344b7b12-4134-883c-1e0a-cdab7800067f@canonical.com>
 <20210825100149.GR7722@kadam>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH linux-next] memory:tegra210-emc-core: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <b6d32023-e3ac-3ccc-e683-076768124bde@canonical.com>
Date:   Wed, 25 Aug 2021 12:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825100149.GR7722@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/08/2021 12:01, Dan Carpenter wrote:
> On Wed, Aug 25, 2021 at 11:45:58AM +0200, Krzysztof Kozlowski wrote:
>> On 25/08/2021 08:37, CGEL wrote:
>>> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>>>
>>> Fix the following coccicheck warning:
>>> ./drivers/memory/tegra/tegra210-emc-core.c:1665:0-23:WARNING
>>> tegra210_emc_debug_min_rate_fops should be defined
>>>  with DEFINE_DEBUGFS_ATTRIBUTE
>>> ./drivers/memory/tegra/tegra210-emc-core.c:1726:0-23:WARNING
>>> tegra210_emc_debug_temperature_fops should be defined
>>>  with DEFINE_DEBUGFS_ATTRIBUTE
>>
>> Thanks for the patch.
>>
>> One error message is enough. They are the same.
>>
>>>
>>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>>
>> Where is the report? We work here in a public, so if there is a report I
>> assume we can reach it? In case the report does not exist, anyone can
>> run checkpatch, coccinelle, smatch and sparse, so how does this differs
>> from me running checkpatch?
> 
> Someone asked for these tags when it was Huawei sending patches from
> the Hulk Robot so no everyone adds them and Hulk Robot is the #1 bug
> reporter.  Hulk Robot just crossed the 2000 tag mark recently.

Yes, I know, my questions where rather rhetorical. :) Hulk Robot reports
are ridiculous, in my opinion.

The tool (checkpatch) used to detect warning is public, so from
community perspective this does not differ from John Smith sending a fix
for a checkpatch issue.
However I do not expect tags like:
  From: John Smith
  ...
  Reported-by: John Smith
  Signed-off-by: John Smith

How does it look? Neither I expect some unknown, hidden, secret reports
like:
  Reported-by: foo bar
  Signed-off-by: John Smith

Simply the credit of running the tool (e.g. checkpatch) is already in
the patch authorship. The Reported-by is for crediting additional work
related to the report.

No report, no credit. Otherwise the value of Reported-by cease to exist...

Best regards,
Krzysztof
