Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1A3C4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DC9561027
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhFAR4Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhFAR4Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 13:56:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE081C061574;
        Tue,  1 Jun 2021 10:54:40 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s25so20402063ljo.11;
        Tue, 01 Jun 2021 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=co5+HLp/gGoGl+hC9bP8ePh5EDsEzObjUAuxi+JiSMw=;
        b=bY/ks8iMoG7dhJCPoIYPsDKYlkSvKwltmR6U4OgH/p7D3X8ggEjECTR3gtLJZG1jsP
         KGiISsR//WDSvLOLEn7SstqTOosy0SHzzwto05vv5PEoT4lo7qCURil3+L9gb0eqxXOA
         lNKyt7YV3HhPSIHKBaBlbg85u7JpXaBDF2Z7ymfzW7eY+CX1rMGqdEzD2p4IHmwEN0Ax
         94f+ExgGorYVzPERp1RMMMnGp+9vx4Srgx+f9Ey9At4sANopcD+5ZGC2TI37Uwz8VRvn
         I6p+MUG3WGeec2H78RtT0iL3ebWBQcwUcYo9XBkQT9Jjxo8e6+FGOYTfeCZwuzSDvzyc
         pnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=co5+HLp/gGoGl+hC9bP8ePh5EDsEzObjUAuxi+JiSMw=;
        b=jjGzVunlxThmpnu31mion8b0c2AgIUIXwT72tS8l56WLfXAha4ahm1SypkFwH6qMhy
         dmcjjfP9nRKqP9P2ChnhCiDdlKycX+b7++kZvG0+FtxmAlKBmu5Ypz6cysTZu/kEROnF
         LT2Kpxp0qPvAwa9nnji6zaVyBOGXZkAx8Q/MJbm+2hmjTA6U9TE+Ax2fQIOcauj8AUNQ
         MPPxUTsZok/3+7Pj6sJP+gNiuRKDYXuSdYMiQC6oFG78aA2iil2nEEI55tnNyxhQKqEs
         ewmRyeGS9ML8kS7qc116v4jTQOlAFsv6VFh+HqyqeQzP4hq/54aoPTZZ5NQkEMWGtSXh
         yh6Q==
X-Gm-Message-State: AOAM530UDe0FJ1hJUvwwBpScGQeRjXCPBfMeBu4eiWYmYlspCJKJchcr
        hbLXEFw/Ez0vgdCbvP3xkptPKcivQvE=
X-Google-Smtp-Source: ABdhPJzXpy44eUncpYfi245RJRDP9uSQ5V7b7NmAgjbKdzYRfAlt5/h/OAAXbIDc6JxSpw1jCM5gRA==
X-Received: by 2002:a05:651c:289:: with SMTP id b9mr22074537ljo.398.1622570079054;
        Tue, 01 Jun 2021 10:54:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id d19sm2083528ljg.52.2021.06.01.10.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 10:54:38 -0700 (PDT)
Subject: Re: [PATCH v1 04/10] ARM: tegra: Add reg property to Tegra20 EMC
 table device-tree nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-5-digetx@gmail.com> <YLSpCXNtut3z8U9a@orome.fritz.box>
 <1ab11cc8-b45a-0c2d-c0c4-fa5779756c05@gmail.com>
 <YLYZHPpjZB9amRBW@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e69a991-e5d3-fcad-6b7f-75b9953a8493@gmail.com>
Date:   Tue, 1 Jun 2021 20:54:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLYZHPpjZB9amRBW@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 14:25, Thierry Reding пишет:
>> The TF101 support mostly in a completed state now, we still need to try
>> to figure out why upstream kernel doesn't work using a stock Android
>> bootloader, so far bootloader replacement to u-boot is required.
> I think it's fine to merge support upstream if there is some sort of
> bootloader that it can run with. If that bootloader is open-source like
> U-Boot, the better, but I don't think we need to set the bar as high as
> being able to boot with any available bootloader. There are all sorts
> of reasons why the Android stock bootloader may cause things not to work
> and there's probably no way to get it fixed anyway. It's similarly
> possible that the kernel may need some outlandish quirk to accomodate
> for that breakage and we may not want, or be able, to upstream such
> quirks anyway.

Lots of devices with Android bootloader have odd limitations in regards
to kernel zImage size, this is the main culprit. Nothing we can do about
this in kernel code, but at least we may know how to prepare kernel
config properly to make it working.

> So if you want to pursue making upstream Linux work with the stock
> Android bootloader, that's a fine goal and I won't object, but it's not
> a requirement that I will insist on before merging DTS files.

This is indeed not a blocker for the device-tree. We will probably send
all the transformers together once they all will be ready.
