Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F067FC47080
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 20:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C48AA611CA
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 20:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhEaUrF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 May 2021 16:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhEaUrE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 16:47:04 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DCCC061574;
        Mon, 31 May 2021 13:45:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x38so18385737lfa.10;
        Mon, 31 May 2021 13:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YpLgNIlN9zUDIYH0mV8WgJZT7MsWTFoWZDLaovOIqJI=;
        b=S3Ha6nVeIUHrpIvzMzZE+KBEp/ZIjHOJdYjZf0oOdOadt6nYTYFicrxq5so/PkOiqu
         flFInMfV4xzQ5ju9Z8ELg9aF/U/VtLBllv6HU49dUyZ4HvJzMbpFHqaKEgMcerTTupUK
         mBDGECeqG/cT/D5Nwm6+v8R8+3dK1SRC1Evgj7sy3p1y24Y2aCscaAkwsqiaXGrDwdyz
         98w8gdsHQL0p3B2acrwOfQE4jFw5ioCbtkl9EaRHLUHqZzejnAING/dVsLPKgUBREdF7
         qRSk7MRpqpE0ipna5xUuloWjI8W81FGymYe3zlt8vmxn+b/Y63tKd4Qpu+ZqmIOQE/eU
         YF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YpLgNIlN9zUDIYH0mV8WgJZT7MsWTFoWZDLaovOIqJI=;
        b=E2bChE4KEBIIEuap7pTVZ/sew0cbUgwAypbxyZ7Y7OLB1/eLXXGkuENMnuPaIA5I20
         b/ZWVFk5O3ojDu5SZ5haDT/Kjj6f55shQKFfhbxS8EVgRfW39vltnykwOwUM/Oc7uao7
         Td1RoIN6V7n9BsCfifKElGcqNb9osUdS2D1Uk0vgE0uaiefL3sQE5sCc0TTQSln/3Pxv
         XfYtux8hgIAJMfkAhX0UuX9lzHyO/TyU/5UD53BIIQ8FIBrgzB1qZbRwrOPP/MzkWC9N
         GrbARIdbNVzPOFSNw09mUaf9lyNtVvZkAvrJ/sjqvs+HhEPPCTVf5TJYpyv52iH+CumM
         KPXg==
X-Gm-Message-State: AOAM533ZS1VFlyNfngT1p2s0vn2QcEF2VDHJVLWqs6owZIXKlwa2JJeD
        CD2QDjhSV516jvJB3SAGYUypYzS+NJ0=
X-Google-Smtp-Source: ABdhPJxmIIxwpw1aitfI+vqs9IcP0Vp3iCoqAkkJhD3SyeEGhAaOOYRb0bN07pTTz+TonUK9HthIZw==
X-Received: by 2002:ac2:4ec6:: with SMTP id p6mr15637151lfr.645.1622493920577;
        Mon, 31 May 2021 13:45:20 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id c9sm1448651lfb.207.2021.05.31.13.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 13:45:20 -0700 (PDT)
Subject: Re: [PATCH v1 04/10] ARM: tegra: Add reg property to Tegra20 EMC
 table device-tree nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-5-digetx@gmail.com> <YLSpCXNtut3z8U9a@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ab11cc8-b45a-0c2d-c0c4-fa5779756c05@gmail.com>
Date:   Mon, 31 May 2021 23:45:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLSpCXNtut3z8U9a@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

31.05.2021 12:14, Thierry Reding пишет:
> On Mon, May 10, 2021 at 11:25:54PM +0300, Dmitry Osipenko wrote:
>> The reg property is now specified for the emc-tables nodes in the Tegra20
>> device-tree binding. Add reg property to the EMC table device-tree nodes
>> of Tegra20 board device-trees in order to silence dt_binding_check warning
>> about the missing property.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
>>  arch/arm/boot/dts/tegra20-paz00.dts             | 1 +
>>  2 files changed, 5 insertions(+)
> 
> In retrospect we should've just used "reg" in the first place rather
> than adding the custom "nvidia,ram-code". It's a bit redundant to have
> both of them with the same value. I wonder if we should deprecate the
> use of "nvidia,ram-code" and at least make the code look at the "reg"
> property first and only fall back to "nvidia,ram-code" if "reg" does
> not exist. We probably won't ever be able to get rid of the fallback
> for backwards-compatibility reasons, but at least that would make the
> intent a bit clearer.

This may be not doable. We have Asus TF101 which doesn't use RAM code
for the memory identification, instead it uses LPDDR chip info [1]. I
will send the LPDDR patches later on.

[1]
https://github.com/grate-driver/linux/blob/master/arch/arm/boot/dts/tegra20-asus-tf101.dts#L1115

The TF101 support mostly in a completed state now, we still need to try
to figure out why upstream kernel doesn't work using a stock Android
bootloader, so far bootloader replacement to u-boot is required.
