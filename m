Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DCCC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 18:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhLITAp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 14:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhLITAp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 14:00:45 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA86C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 10:57:11 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k37so13870082lfv.3
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 10:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4CE/sx22StZXeflrS951Nij0oHEVsPcaE9czARPCPqg=;
        b=UUDH7/ucikj9DRkKPXeYcTY/ZIUPNrHEZfExfx6Bw/KrRIL6ox1N7QFMqObjI1R0/T
         eAJj7W8WTm7bn5xGQXsGHuwTyxupjuW2MBd9BHjDPTOoWPU+H4mA0GUk7wo3jL8OfhUG
         TbYSe5g4Ldqg+Ioz2WQTdyktJkRJMzl5lq5euzQibucq+KQ+F1wfsnV41DhcEljqz/0g
         mvxMjOmH1nkF3cD6+8ZLxtA7/R8ivELQNfedU94mCwRxYkcUkuAzxwFWFZWsGm9ziyGK
         YczuxDYlWQtq7L5jL1SIFdemVpH1eQ7UhnMzKfxAEEu1i/Y2xw7V6SlGgZBNGPOI+Eh2
         pdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4CE/sx22StZXeflrS951Nij0oHEVsPcaE9czARPCPqg=;
        b=O5TSHwN81eIaA20X8iLGYxFaZDeIZY/uaF8lOMiilXKrN6/tR+MmJYuEg2z8DWjOuY
         pTe3oxrEDiq59nS9JH391BBamlyYbZnd1wf0aRFCwkwf2EXVj0pG6E4XcUd2LbpjNOpT
         aYgaP6onUECceWlXivIxVG0h2l5mKrL9lOwCYVHJxRRqBd2DEoAGbz9kXVGtBpcVnPqq
         WP6cwQCIn1uHkslETSa7qu/J0z9bankq96KLWvcWElqMg5R0bO6HJPwvWW4s/i5hRWxP
         h5n3GKrR9e7g/4FtUiNCKwDtJnguUQRuuUBw1SYLwYjYKdpuik2KvqW+jiwUXq5yfrhO
         MmLQ==
X-Gm-Message-State: AOAM53323Tl03nft0xURdZEGauwaFDLXQ7p4BhPLcUMBA5pwAYbRaz2X
        roItV7ZIKNWvUwj/RINY9p1JMGidpB0=
X-Google-Smtp-Source: ABdhPJyphS4MnDKCXAbOhCch9beBp8KV5CXBe/GjVuXgQH01/g1hNvtflXdyuJdHxpknHP2Y9u/bsw==
X-Received: by 2002:a05:6512:128f:: with SMTP id u15mr7651205lfs.92.1639076229360;
        Thu, 09 Dec 2021 10:57:09 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id s4sm60676ljp.73.2021.12.09.10.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:57:09 -0800 (PST)
Subject: Re: [PATCH 22/25] ARM: tegra: Move I2C clock frequency to bus nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-23-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4865a5b6-c841-99c6-f132-24967a349f9b@gmail.com>
Date:   Thu, 9 Dec 2021 21:57:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-23-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The "clock-frequency" property for an I2C controller needs to be
> specified at the bus level.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 3 ++-
>  arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

The clock-frequency is specified in the parent-common N7 DTSI, NAK.

There is already patch from David that removes the clock-frequency from
NFC node [1], please use it.

Please never again rewrite the preexisting patches, this makes you look odd.

I suggest to collect *all* patches (not only your own) into single
for-next branch, resolving all conflicts, making sure that you don't
duplicate the effort and letting it all to be tested before it will hit
the bus.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.4064-21-digetx@gmail.com/
