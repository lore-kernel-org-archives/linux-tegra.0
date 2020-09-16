Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61764C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 18:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 156A420872
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 18:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvqYVCPN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgIPSId (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbgIPR6d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:58:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEACC002183;
        Wed, 16 Sep 2020 07:17:29 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b19so6037201lji.11;
        Wed, 16 Sep 2020 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HKFjjXX/Fu5zjF0HZ6s7EvKUrOD09AhmACAgWHR4WJc=;
        b=mvqYVCPNof43k9goSUMLYsmddY1xjRWfLRyPyXaME3y2bs6i0ZkqWvjlSeIWhHMfaQ
         9zMlCWy4xcHiWIksv02XJmn2dTAsFIqYLNfQTEhvSa6LYRoQL0Fj/oAgFZett2tq1N74
         dozIWdEDVJH3+NP1fuu4vjT/VhSSEkJgNP3HxbUX4n3k1Tt37V5Z65FBlIEngHM9iIT/
         wTky7fwT5+avJFvbMXDANHlNSqHC/ZmDUJA36NskKlzslATW49ZCqI0B5G/0/F/jHkUo
         jQV79g7kxbs+TxCNRO9kt6/DW8vAdwh8MF5fwx9TTlczoxlRcGcgCRWQOpaRRrVGiYYV
         WhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HKFjjXX/Fu5zjF0HZ6s7EvKUrOD09AhmACAgWHR4WJc=;
        b=AULLrlWHiPc4LLB1wzSnCh1imXMXE7BN2QLfj+8HjM1+SkmUVURUFwndPmGEsla9M7
         xX+Oeg8W21TSrxsypGahVtjKN++vI8phueEHDnUUZc0x0V8H+qoH6kdxKg4AAYHisYEk
         lis8r6uOtIx7awQsWvoCktr+eG8JooE1YcXf6YF4dT3vJSZLTf9Kzwhw89bGtdS2uy4z
         HliIRorw+yGGASmXA3fiMRN7CJWynNNUnAPx0CJJWtzSUluSzcMQbpV9xFkHPWSvElB0
         vM7zb2rGlyeJ8Cb0EyNV3dN1qE3kUUsxnSAcwKvP3mHc/f1QoeSQwFnTR2/V6vco2+3N
         P4Ag==
X-Gm-Message-State: AOAM532/scEaEzY2KO2VJLXfxLT3zEBq8y9WPKP2/VRM5IgwWUhi8rQ7
        M+2hnlECN5FyBN80wMRdZb2ZjNEq1dw=
X-Google-Smtp-Source: ABdhPJzOWf6bO6BJSSKVvsY8LHw/SdhBM4Zq10+VY39wg1d+t9a6mejTf8wlO11e4etxzPRQ/tEJkw==
X-Received: by 2002:a2e:b813:: with SMTP id u19mr7881504ljo.396.1600265847640;
        Wed, 16 Sep 2020 07:17:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c28sm4626382lfh.98.2020.09.16.07.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 07:17:26 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200916122247.534374-1-pgwipeout@gmail.com>
 <20200916122247.534374-2-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3cdcb877-e4c7-aab8-b7f9-0c88f2247d03@gmail.com>
Date:   Wed, 16 Sep 2020 17:17:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916122247.534374-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.09.2020 15:22, Peter Geis пишет:
> The Ouya was the sole device produced by Ouya Inc in 2013.
> It was a game console originally running Android 5 on top of Linux 3.1.10.
> 
> This patch adds the device tree supporting the Ouya.
> It has been tested on the original variant with Samsung ram.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile         |    3 +-
>  arch/arm/boot/dts/tegra30-ouya.dts | 4498 ++++++++++++++++++++++++++++
>  2 files changed, 4500 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts

Hello, Peter! Very nice work!

Could you please clarify how many variants of the board exist?

What are the differences between the variants?

Is this device-tree suitable for all variants?

How user could determine the board's variant?
