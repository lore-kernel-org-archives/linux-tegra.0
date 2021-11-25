Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760ECC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 12:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239562AbhKYMJ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 07:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbhKYMH4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 07:07:56 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC6DC0613F2;
        Thu, 25 Nov 2021 04:04:38 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id k2so12096730lji.4;
        Thu, 25 Nov 2021 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dajSJL2fZtLi5NwVIW2TcRVR0GBQv6qB26CeFV3A/9o=;
        b=k7p0sOek+og9TGjXEoBXXqgB3oB9482RgTqARUs+GsgBLsbulenP2+G6gWFSXKRxCb
         r0H0jd6hVhMYXzaw7wN9l+17TgxuMlrdVCAXJVp/lOCQxN7rbs/Od5L4fuN/zVsJ8PSq
         0rAwqTkn9+I/iCOgHt9vlQNOvS5iEeBNJwNwsHGe+Nj3Ey1QG/0+31BJfml3CQ/+xAVt
         60cF4P9kO++p9I4QoY74Js+pS83BKbhM8nDeTK1zI2botuaY2G9IOyFVPeSlGMosMw6l
         1V5d1ctNR5JvNFzP70okvo6PCQ2W169AZHBQb0I0VpMDit/95ZSzNqperdBTkc/c4AO0
         nABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dajSJL2fZtLi5NwVIW2TcRVR0GBQv6qB26CeFV3A/9o=;
        b=YnFMBY83bkyXiWj08krk9V7ZUf5lHaXuF4f6wwiNrCzveMwYMaOcawsowEAUORvOP9
         g2OxJg1P41HBzHh6jHlpp+pMUKH7AZkStIwKqlNqBxCOHT0yb3SnAxk1BWKxXSbVCefK
         3HD5gCAjfeoGK6+vt+YNh1Tgz7RGa++siqEWdfudMaZaLWdHMaydu0Dxgwhi91yZMwHF
         6zFUNlxJNVzxjea9xZaUG14EUB4UTgooJv6PDSDJLHi6w+w+zwmItl+I2qygh65aTwxO
         1IHjZKYenz8p2sDonsdEUEUrZdi+TFeUkPfnF+s4HgyurttpJzeRdMDx4jVlPvbvuhs2
         Ozxg==
X-Gm-Message-State: AOAM530WQdeCpHMBzOj0ih1/7exRGUvYlzc6JQyzwY/trHp1tbjBjbH1
        RJ95XDvrEVbuHAjsU9z+pmCxXHxjJ3g=
X-Google-Smtp-Source: ABdhPJy1UVNC2RhQ9CUCpauoPZ7aE2RAQm+eLY8TuAp5Vyn0MlWD9R+0VLgXkA+9rzljSvryPXk5xw==
X-Received: by 2002:a05:651c:c3:: with SMTP id 3mr23554866ljr.170.1637841876825;
        Thu, 25 Nov 2021 04:04:36 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id m28sm247485lfq.189.2021.11.25.04.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 04:04:36 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
Date:   Thu, 25 Nov 2021 15:04:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ97Qo500CrSmhXu@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2021 15:02, Mark Brown пишет:
> On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
>> Program FIFO trigger level properly to fix x4 accelerated playback.
> 
> Fixes like this should really go before any new stuff so they can be
> sent as fixes and backported.
> 

This driver never worked before this patchset, hence there is nothing to
backport, this is explained in the cover letter. But in general you're
correct.
