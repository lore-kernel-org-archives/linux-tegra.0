Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813F3C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 13:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349839AbhKYNDw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354989AbhKYNBw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 08:01:52 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBA4C061756;
        Thu, 25 Nov 2021 04:53:55 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m27so16052079lfj.12;
        Thu, 25 Nov 2021 04:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Co+wBZHiOseLu7CK7UphzK0BLsQ6VV5mZ6eGuslWoqo=;
        b=oktqB96h7vZOItZGklHhm+PkXDcygsJhAUIroFnXj//gvB6OoF/lYcPjatrZAITeRh
         LKYeWYSWoIrkfV/rENrFvRbHWe/jDYBbFmY8tynbUZLFQksZt1svx9n5zfxC+ZzAn69e
         ci+aisbhNDgGnXjzLkpWJ/muy4AL/5Ix4ozfVNPdevB0/qeX0AnSPkif/58dlc0LDf1Y
         TiQX3udryAUjKmlcecArNEm2QqFiXEnALqXo/3XhpCrjg5zk7VT3IAMX0I6TmYfHfdFo
         Lm9c+BHxz6c3e2fp/xEBvQi87aA2LqkXbRHDtKxPfax3KIH6pOHiA2ik4MQhoEXmo4nW
         H9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Co+wBZHiOseLu7CK7UphzK0BLsQ6VV5mZ6eGuslWoqo=;
        b=zgV3fMTRZJ8VBNfOow/epdq5nElY3sAjmmtTeCYy/RJEwlct3oH4EVmdSvGsm1zMFp
         jt+WizfR5hDUJvOSGntfMUTs1Uqfdx1C1pONTk9IQAkZ6T8qYwTC6TWqUAyeLtg+TxNa
         8m/slHNi/0xGkWAN1AADaOXTtaDRAgV6Dkwpi/fdew/cKXvItnsUwVOFRSE4EA5eHtO8
         lmpzYuevog/53NcgwdTPMH3HgFoszG1cp6l3LCcQWfkCiTk0YKOj+5YKbELNC7f9B2x1
         FzETjz+Xs5tB2mQAXlEF6Y9ZQARxABvbhcX68sSprGwGVQARYaGs3qsTFbSdrKPWflzN
         XDcw==
X-Gm-Message-State: AOAM530cF0bv9r+tZgPWvf7tp6NseH3lpqX+PWAmn8MVtKdI5aNF8dJe
        O1sr5teWdCsGbPtoeTXxmJlGtVGpdOA=
X-Google-Smtp-Source: ABdhPJy68jGQks+cI3kMem632OtGqJd3jo9wWEaciMGUlc8Z24BdPeoer1sbsgb8JnhBJSeu3hqFWA==
X-Received: by 2002:a05:6512:114e:: with SMTP id m14mr22880893lfg.418.1637844833711;
        Thu, 25 Nov 2021 04:53:53 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id m9sm233423ljg.80.2021.11.25.04.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 04:53:53 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
Date:   Thu, 25 Nov 2021 15:53:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+BZRB0sUC08lCs@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2021 15:28, Mark Brown пишет:
> On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:
>> 25.11.2021 15:02, Mark Brown пишет:
>>> On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
>>>> Program FIFO trigger level properly to fix x4 accelerated playback.
> 
>>> Fixes like this should really go before any new stuff so they can be
>>> sent as fixes and backported.
> 
>> This driver never worked before this patchset, hence there is nothing to
>> backport, this is explained in the cover letter. But in general you're
>> correct.
> 
> That's not going to stop the stable people backporting things, and I'd
> guess it might've worked at some point on some systems - I'm not seeing
> anything that jumps out as making the driver completely unworkable in
> your patches.
> 

I can change commit message with the "fix" word removed, this should
prevent patch from backporting.

This driver never worked in mainline because S/PDIF device was never
created, thus driver was never bound. Driver doesn't work properly
without this patch. Nobody used this driver as-is before this patchset.
