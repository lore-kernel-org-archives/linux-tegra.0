Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6405C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 14:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E1776137A
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 14:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352001AbhI3O5n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Sep 2021 10:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351985AbhI3O5n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Sep 2021 10:57:43 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60399C06176A;
        Thu, 30 Sep 2021 07:56:00 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g41so26407732lfv.1;
        Thu, 30 Sep 2021 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uaAT5wob0YiOJmkWdlUFhs2KZnxNPqhCjHclKoH74vs=;
        b=M6M4cVtrgzJCn3k1Nx3Js2ddtxJSAL5FKq0toORwn5TSYaQJo4j+glrjZH0j1AkKjC
         Nr0C/u3n/0g0kgj8dViKf+o1Do2dyB4FtAh8knqyaWQlQIiNg/uMsi3gT0TVFUQtC1WF
         ZPYk8lJJJYxdD/OpZ7oF9y//oLSSyTY6JPipc94TpMGO2BwVchhCWY929/aTSLyhhFtP
         8M040RATCSTsG9Y5mPSe7DPmhgHmNl9OoGzadsiG2NLUUB9FmyKbzTPeKmNxKqnFB53/
         iQkSw6y0glt88aWPg9gVW4GyMt1VUvsdkkF14/j0BbRtXjJBGq8K2YWX2lZ6sywuWhOs
         naNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uaAT5wob0YiOJmkWdlUFhs2KZnxNPqhCjHclKoH74vs=;
        b=TbTb+auJNUZQ/aBNA+ggy9oEuSuK4h60dsGrFdfK4nDBpJQ6cRBDOcOR6CBYr0W8L4
         ykEmQs8e78Qn6vliQNRcD7zRK1mRZoaiU6AV2xQ3X9zqlwbJN9CkRl5GZNwbHmHpOs4z
         Pru+0AkaASsR0PbRGrngSlVW3Cy8i+XSIBkWBVI2R6R0ckjZzErwbKKq05kguxH42x82
         5Ht0rpAbd6AMQsaQi9unas9lrVKgeGtjoTq0lBwKheWNHDjkGFldcz3E5ea5vV+CuQuC
         s7J2SetzmkcVqUg1pNztuHeXTLLrYWnkriLr+2FwLX4CRz3tviI5fjJT8vPRgvsKJV01
         WgcA==
X-Gm-Message-State: AOAM5314fzCo7XBTeJQfKqMwqK1OMoC7ELEe6yZ13bLTaxPm8tL2G+y+
        7HF1OgnnUipXuljWUxC8LHskmFATNwc=
X-Google-Smtp-Source: ABdhPJztldcpWswKHWSNTSLhS+h7rgGDHOMYE8V6m4YP8LB2puVHqMF8A8QSLxInr3/kKXcryoWeNg==
X-Received: by 2002:ac2:4896:: with SMTP id x22mr6592226lfc.257.1633013740388;
        Thu, 30 Sep 2021 07:55:40 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.googlemail.com with ESMTPSA id x128sm396434lff.102.2021.09.30.07.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 07:55:39 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] dt-bindings: memory: tegra20: emc: Document
 optional LPDDR properties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210929200305.4245-1-digetx@gmail.com>
 <20210929200305.4245-2-digetx@gmail.com>
 <2df06f23-1a5e-f6e9-8e2c-0bb4c93fe23c@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4309371-fac4-00dc-418e-86c2cf8a8902@gmail.com>
Date:   Thu, 30 Sep 2021 17:55:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2df06f23-1a5e-f6e9-8e2c-0bb4c93fe23c@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2021 09:54, Krzysztof Kozlowski пишет:
> On 29/09/2021 22:03, Dmitry Osipenko wrote:
>> Some Tegra20 boards don't use RAM code for the memory chip identification
>> and the identity information should read out from LPDDR chip in this case.
>> Document new optional generic LPDDR properties that will be used for the
>> memory chip identification if RAM code isn't provided.
> 
> Please mention how they are going to be used. Naively I would assume
> that these new properties describe the RAM you have. However it seems
> you do not use them to configure the device but to compare with the
> device. Why do you need them?

Yes, the properties describe hardware configuration of external DRAM
chip. This information is read-only and it's actually used for
configuring SoC memory controller. This MC configuration is already
pre-configured by bootloader and partially it shouldn't be ever touched
by software. Kernel driver needs to reconfigure only a part of hardware
on memory freq changes. The memory timing data is tuned for a specific
DRAM chip and board, it doesn't include info which identifies the chip.
So we need to read out DRAM config from hardware and find the matching
timing in a device-tree by comparing the chip-unique properties. Note
that only LPDDR chips have that chip-identity info. Regular DDR chips
require SPD or other means, like NVMEM in case of Tegra.

I'll extend the commit message.

...
>> +          - 4 # S4 (4 words prefetch architecture)
>> +          - 2 # S2 (2 words prefetch architecture)
> 
> I think instead you should use generic lpddr{2,3} bindings - have a
> separate node and reference it via a phandle.

It indeed shouldn't be a problem to create lpddr binding and move these
props there.

Extra phandle shouldn't be needed, should be fine to keep these new DRAM
properties within the chip-descriptor nodes that we already have in
tegra device-trees. We'll only need to $ref the lpddr binding for the
descriptor node in the binding. I.e. to make it similar to regulator
bindings where there is generic regulator.yaml + hw-specific properties.

I'll try to implement this in v2, thanks!
