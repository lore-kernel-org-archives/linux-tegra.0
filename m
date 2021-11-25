Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0F2C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 13:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355235AbhKYNrz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355301AbhKYNpz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 08:45:55 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645ADC0613FC;
        Thu, 25 Nov 2021 05:36:06 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id t11so12564650ljh.6;
        Thu, 25 Nov 2021 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1aDhKAkGw4wZ6NAcrIuNHy3/tUUw7G2pDuc4j6zpXek=;
        b=ab7vU2PrSnZcW5Lt23jt2x3KHTBi1zjV9RDh4+db+RcX+XbOqx2hj8Nw5hhuiL+nbO
         bQNFw5mtbsmO2cR3hEZ02xMDm3DScIRqA2wHWwbGxq+bNvpPwgdUIYHVsAlWPs9fbddR
         iFaawTWHEKBNzd3AHTiL8FM3PZ24Ttp+9xpQ46cXX4czzAubJ3YkuBtMJQnMscmVMlXf
         Ohwu3Q/BUKjgmE9i0kwyj8MeY7zYhz+6aqJBc+G6xnzweTiuNLe7qieltqfXiVzh3x1O
         3XxTBmPHVE+j6ffxByY9Cwg3nvUA/4TM0O0icjuLrb8vCAaiYztODZQoJMrwS6uvXlrL
         THWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1aDhKAkGw4wZ6NAcrIuNHy3/tUUw7G2pDuc4j6zpXek=;
        b=amzCQLoUmVb10KltXMW3awXtDhraa6VM5ex3uDXwDTvUTvi3P4QoU5DHc9VC/TzwVs
         CuUk+zTt84yrPilCC18S3SHrfrVHwZMYYpqwjn+RMRybnRTUmxmd23UXvFb9iHtaAcSK
         tg+6QAapKibVX6wtO4qq/tl1xmHArSqybrb+8UnX0ga93YDfoxKEemsZULLjNfsdfqLE
         xeTFiwQm0ydG7VGzEN//RRTytYhRVdrzu9JU8c9LTfDsbbIUjX54ahaCtMNjdfYlSyZL
         hQznYjI3n/z+FPFZ90wnbTHaNpZTQKaJlPdD6F8OcfwJZNPElwWV6f1R6S9Qn4QEb9do
         j5ew==
X-Gm-Message-State: AOAM533SUbWTnAeQ43fAIGhBsEGfJEbb2t5lWMYLjqdXkNfi9JjkkLtr
        hXXar0KXackQqyZs9QQl3MxEUb82nlo=
X-Google-Smtp-Source: ABdhPJzj6H/14t2w1E6YXs0IJStRjhS9UE40vBTefi2svIoBYbe/BmV1uhLJ+ysOYxj2eWFChxx/oA==
X-Received: by 2002:a2e:2ac1:: with SMTP id q184mr24595407ljq.420.1637847364540;
        Thu, 25 Nov 2021 05:36:04 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id h24sm224319ljg.106.2021.11.25.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 05:36:04 -0800 (PST)
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
To:     Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com> <YZ97Qo500CrSmhXu@sirena.org.uk>
 <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
 <YZ+BZRB0sUC08lCs@sirena.org.uk>
 <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
 <YZ+NF8zHqGYfL9eF@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <184c2f65-ae49-bb7d-345f-091a29033b7b@gmail.com>
Date:   Thu, 25 Nov 2021 16:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+NF8zHqGYfL9eF@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2021 16:18, Mark Brown пишет:
> On Thu, Nov 25, 2021 at 03:53:52PM +0300, Dmitry Osipenko wrote:
>> 25.11.2021 15:28, Mark Brown пишет:
>>> On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:
> 
>>>> This driver never worked before this patchset, hence there is nothing to
>>>> backport, this is explained in the cover letter. But in general you're
>>>> correct.
> 
>>> That's not going to stop the stable people backporting things, and I'd
>>> guess it might've worked at some point on some systems - I'm not seeing
>>> anything that jumps out as making the driver completely unworkable in
>>> your patches.
> 
>> I can change commit message with the "fix" word removed, this should
>> prevent patch from backporting.
> 
> I wouldn't count on it TBH.  In any case, definitely no need to resend
> for this alone.

Alright, I'll keep this in mind for a potential v2. I guess Rob may ask
to remove the assigned-clocks from S/PDIF DT binding because I just
found that there is no needed to specify that property explicitly anymore.

>> This driver never worked in mainline because S/PDIF device was never
>> created, thus driver was never bound. Driver doesn't work properly
>> without this patch. Nobody used this driver as-is before this patchset.
> 
> Someone might've been using it with an out of tree board file, I guess
> on an older stable at this point.
> 

I'm very doubtful. Still, this patch could be easily backported because
all code refactoring changes that potentially may cause merge conflicts
are made after this patch. Ideally, if we really needed to backport this
patch, then it should've been one of the first patches as you suggested.
