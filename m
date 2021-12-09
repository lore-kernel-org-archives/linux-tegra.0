Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6234EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 18:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243312AbhLISaj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 13:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243257AbhLISai (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 13:30:38 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14DBC061353
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 10:27:04 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id b19so8524061ljr.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tDVMdOHm2WBzCO5eA3ps3knQU6IIWilk5qBpy5I5Fr4=;
        b=cLzG7B+qdErGisW3beLWRE8cSbJpWqlsiBUd5/o9hocM28FN1/sJKybkD2njoxFVDQ
         J6AWUg8nK/TaVY3mvRtzHIy3Z47ks4UpPUs/kg4emiEqQoVVFC0Tif3tLmedjCRlUlcr
         HV9o1nz79pnsPKk/yVmyv5zPlKNGLOv/4gAZioZC0XDtbouxHn2V7UtnzvAPS6BfE6V1
         xWcmla97/fEaHjJ2KfVM1P6uVXXr0ftx/uzB5X1GLGGXNCN2EA5Cru4jfwbRwQrOZ1h6
         8+Hrd3ff+aY3FCSPsmrrNenK8cjK8d2ZCdn1tBRz7AQr4AXtOdfzN9i+fgI4ZCkmgJ9O
         +6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tDVMdOHm2WBzCO5eA3ps3knQU6IIWilk5qBpy5I5Fr4=;
        b=H9rB4IZNExRpqOvBXHz3WKB6Je16PLzTX6q959t6peb06uq3GARlCHMvKpLz7roVG/
         xFHjagLJbm4XgDNh6ZWEUa5N5HQvlShbR3wRuVavxgkRevvOjudXoZuvn15LsM0bmeLw
         bB8r1ZpKGf0KyIUZP4a7T0SikOG84gqTyWlane9v8XXSimrNb0b7HrntX4qInUy93CoL
         4WWsMaf+D5D9Vi2oR0W5kqxEOaQMjWuhMrsQLjvHmg2jg16/t1a24+xYLLTVLqOunwJi
         bsOYKRDreawl6sovEZiFM8438QuQIoSZO0KERvmXWFzy9Ze+/tmfwwZ59qyMD6o3eHG8
         KVuQ==
X-Gm-Message-State: AOAM5325OyXot6gSVzkXe6YWC6C4/C8IHahqF7HFIbzBLJf/Rg2XdaBg
        bsaUU0xaV7aWYZ1C3NG4lcBMZryp+to=
X-Google-Smtp-Source: ABdhPJzNeHGJe+gLpGfmSJC/csIrBX9tPdiba3J6zUVsPb65U+OGmI73qwQjvtiHqUSOPHufZpj3YQ==
X-Received: by 2002:a2e:b171:: with SMTP id a17mr7800533ljm.56.1639074422803;
        Thu, 09 Dec 2021 10:27:02 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id f14sm63390lfv.180.2021.12.09.10.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:27:02 -0800 (PST)
Subject: Re: [PATCH 04/25] ARM: tegra: Rename top-level clocks
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-5-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d545f269-7d99-f126-0ace-b1a5cffe3ab2@gmail.com>
Date:   Thu, 9 Dec 2021 21:27:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Clocks defined at the top level in device tree are no longer part of a
> simple bus and therefore don't have a reg property. Nodes without a reg
> property shouldn't have a unit-address either, so drop the unit address
> from the node names. To ensure nodes aren't duplicated (in which case
> they would end up merged in the final DTB), append the name of the clock
> to the node name.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts                    | 2 +-
>  arch/arm/boot/dts/tegra114-roth.dts                       | 2 +-
>  arch/arm/boot/dts/tegra114-tn7.dts                        | 2 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi                      | 2 +-
>  arch/arm/boot/dts/tegra124-venice2.dts                    | 2 +-
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 4 ++--
>  arch/arm/boot/dts/tegra20-harmony.dts                     | 2 +-
>  arch/arm/boot/dts/tegra20-paz00.dts                       | 2 +-
>  arch/arm/boot/dts/tegra20-seaboard.dts                    | 2 +-
>  arch/arm/boot/dts/tegra20-tamonten.dtsi                   | 2 +-
>  arch/arm/boot/dts/tegra20-trimslice.dts                   | 2 +-
>  arch/arm/boot/dts/tegra20-ventana.dts                     | 2 +-
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 +-
>  arch/arm/boot/dts/tegra30-beaver.dts                      | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
>  16 files changed, 17 insertions(+), 17 deletions(-)

This and the next patch duplicate the preexisting patch [1] that you saw
and skipped previously. It looks odd that you redoing it on your own
now. This is not okay to me unless you talked to David and he is aware
about it.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.4064-20-digetx@gmail.com/

