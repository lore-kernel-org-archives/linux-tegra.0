Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4C8C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhLIUEr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhLIUEr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:04:47 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54063C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 12:01:13 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c32so14180041lfv.4
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 12:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLaS7UAlCpNsIEJD/xgeZ3+kfewKd2EHdr+/RAxjIPE=;
        b=VP+VK1PWHYI2i1fNIPglPEtd6jG4sNH0OW/5LDZvizmUK+QiFu/NXJApGIv8gsGTlx
         fMBTeUjlipC50AYwvQlreVtvEikATZay3/il1b+JJOHKeI+veXsVU5ETOIiP/HLhJiHT
         aXWctliFCMz1EUPh08Xi2K5sxl+VUx+bknaa9KNTyj66bU9+ZSL0W5L90+hi4aJRuuQw
         y3EhEgV+bSS8HSD86cVsOUzkcUCCaoWM3/i2cqC+38XRZRbYVWbqTt2lS+u9gcMVClIO
         2TkeTJvkgVleoyaQYnmq3QcPeyrSSaArx+Q4F5Qwy1PQD5/ED8lguRRHqbk3C6lrMIBY
         7dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLaS7UAlCpNsIEJD/xgeZ3+kfewKd2EHdr+/RAxjIPE=;
        b=1mLyb/2W1XGOrw6gZqmtwaxW0FSPEroH/QfdNSbL6vt2bxnPcHzpDORG92UwIN76VW
         7ztIDB7ASRh2FG8bhRCcAd6pWps7vZbela/bhbhG3y98xIou4vUQslNVDZpYMCSDbrWh
         0ioQXoNoqq2UnMavf4Yc1CiwJDVCK0KQnnQInAY5ICfsPbGz+Gkl7crFZkgJ2thcYvGA
         QyNgwAO7qOxu6yjv23B3OG0mu1zayvIGR5HmpehTXwP5xqRubPM7BirFzpkUKo6CnFqS
         i08FFDMdVS7/wPB65EblV/PywAw5ZIg4sLrw3nC/dden1lQdr7mouk7xopFDqBSHubCB
         NWIA==
X-Gm-Message-State: AOAM530ECuD/zXda7h31G/iIe2kbD8CE0PX+Mby9P0K039rVDZvBhS0M
        pBBSU68XGh8z7vZP4B6tXDSQc/ipWyQ=
X-Google-Smtp-Source: ABdhPJzNEkuPafN6AUpsxFDm9sdyjsBBRcD9FSqAghYJ3Xv1GKwQDlzF2OjDsbAypXXqajM5PIlp8w==
X-Received: by 2002:a05:6512:2350:: with SMTP id p16mr8154054lfu.482.1639080071335;
        Thu, 09 Dec 2021 12:01:11 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id c37sm86019lfv.152.2021.12.09.12.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 12:01:10 -0800 (PST)
Subject: Re: [PATCH 01/25] ARM: tegra: Clean up external memory controller
 nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ec912e49-5ac6-476c-903e-cf1ad08e62bb@gmail.com>
Date:   Thu, 9 Dec 2021 23:01:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The external memory controller should be sorted after the memory
> controller to keep the ordering by unit-address intact.

"sorted after the memory controller, I don't understand what this means.
Please clarify.

> While at it,
> rename the emc-timings and timing nodes to avoid including the RAM code
> and clock frequency in their names. There is no requirement to do this,
> so we can use simple enumerations instead.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |  483 +++--
>  .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  699 +++---
>  arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  | 1918 +++++++++--------
>  .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  639 +++---
>  4 files changed, 1900 insertions(+), 1839 deletions(-)

It's very suspicious that you changed only T124. This all doesn't look
good to me.

Please either explain it all or drop this patch.
