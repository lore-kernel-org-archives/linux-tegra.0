Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F81C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E275E6113A
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 18:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239080AbhJFS3r (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 14:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238769AbhJFS3r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 14:29:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A25C061746
        for <linux-tegra@vger.kernel.org>; Wed,  6 Oct 2021 11:27:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b20so14484601lfv.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 Oct 2021 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IDlvGZDQuR/GYFKsZGJADO2TntxwNUfXL/xPWdPIsUg=;
        b=bPQRG2MMIrokrZ17bTXBKjvGpu/gXkVc8DSIVMGkgIocOp2MJLKOcArtWKqKb7ZnaY
         VkBMnTZJ4ENPLNeQQ9yIXgqPgjdxVwdpAXwkYuirkKKvbLSV/jT6/YsX2JmeBTMpLlVg
         Jhzhn3ikjrMWqQGn/mx6SsdddSpitq7CE/EuMW5a5GbCAqGHSVsPIc07bnHXByQhV1Ab
         wogOjx9SPC0whJTKrZiVyeDPoXASyaaGFsCR4L7X0BYlcWCIXHLmjDO9qiT6GOhOlAg9
         mP/+lDo7PnUYBsNjnIgdCfSb0wQu/0qSodo9j7XEZQyQ9oiVTmGcvvPCxIYu3YHK8Xqh
         pj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IDlvGZDQuR/GYFKsZGJADO2TntxwNUfXL/xPWdPIsUg=;
        b=rlwWUWxJmLN3iBpNP+Um/X+UdFQLS538cmFLP/RBp+fkAw8lcx3DfFZZDVNulu/0aO
         uKiETSartKWWOh4BMnXntV1Yckvc6dQgZP1tG1BVNG25FImbsRML2ro32yoI/35q4Nrq
         FGjAtFzS1ecwTOAEF3qQCsHNis4TqGBdxer0lT2C0AaBo1ufkW3VRy6g3hHdHmNq2z21
         4Se+ng5+V6TCsrqr5C5YyP3yVCYNGr6H6obGeSDcFF6bFo9lupI7D5GzXcNHGz8k8xA4
         MqKy9xqsdsfJEfZY7TfyXqqDQ4aeInTTekcj26qFcFbH2kPkMvUG7Aask6IWj8qXZvnw
         ARyA==
X-Gm-Message-State: AOAM53229+1mBQgBW+pyQVrswP1qPl4yOMPtdjWBhkFzw83558uTp/83
        BYlN5IS4XQ0ZDxRaJZxyRko/8I+lLTc=
X-Google-Smtp-Source: ABdhPJwYVM5BtfJ+DbI675xHRlMlHS+vnmoHPOiyW0NMw96E7yu8uBeibCGOYaYVP0xDa/2OdFb4Dg==
X-Received: by 2002:a05:651c:4c7:: with SMTP id e7mr31268390lji.386.1633544872713;
        Wed, 06 Oct 2021 11:27:52 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id d27sm2357848ljo.119.2021.10.06.11.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 11:27:52 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com> <YV3nQuo7eG6dkl0f@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b858348a-698e-c22b-da9a-83cd2f00e668@gmail.com>
Date:   Wed, 6 Oct 2021 21:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV3nQuo7eG6dkl0f@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 21:13, Thierry Reding пишет:
> On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
>> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
>> bridge that requires a precise clock rate in order to operate properly.
>> Tegra30 has a dedicated PLL for each display controller, hence the PLL
>> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
>> output. Configure the clock rate before display controller is enabled
>> since DC itself may be running off this PLL and it's not okay to change
>> the rate of the active PLL that doesn't support dynamic frequency
>> switching since hardware will hang.
>>
>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>>  drivers/gpu/drm/tegra/dc.h  |  1 +
>>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>>  3 files changed, 65 insertions(+), 12 deletions(-)
> 
> This seems overly complicated. I especially don't like the way how
> clocks are looked up with clk_get_sys() and then used in the comparison.
> Could this not be achieved by using assigned-clocks and friends
> properties in DT?

Assigned-clocks have nothing to do with this patch. We need to check
whether PLLD *is* already pre-assigned as the parent.

Adding properties for describing the clk parents is overly complicated,
clk_get_sys() is a much simpler solution that doesn't involve extra DT
changes.

BTW, assigned-clocks can't be used for display controller  because
controller is usually turned on during boot and reparenting of active DC
will hang machine.
