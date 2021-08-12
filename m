Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CD3C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 16:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EAD56103E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 16:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhHLQQN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 12:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhHLQPh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 12:15:37 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1688CC0617AE;
        Thu, 12 Aug 2021 09:15:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id n7so11429648ljq.0;
        Thu, 12 Aug 2021 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q1kP8IDfWs3KYwhhLGYrvublLDH8i7aJatyFRJI0aDQ=;
        b=O2nG2V6paudkRTLvKKBvSW4Vzfdiqn7OBX0xqWqsk4KJFuZFlfV7qIIY0RnpjQspV6
         JZxD+D1sXcF6B9cBMHcrG+rtbo1eaHJg5+u6FtbJAAMt1+EHhPEAfIrGS2baPavi2ULQ
         gJFy+ugYFJ2KAZWQsUZk5Vrp3wH22DbiT0nIOETuFQQ7n5MZbVzwWTeqxx5RU+nBVD0m
         6T3kMvrUIrGLrwvjCgwAY7o6OwaTJ/XgC960HZiZEU3RhGJmh3kN2/+9zYhSYhCncceh
         o0ThDntonzjPShFU3ywxcfVh01s8IN4VKcGxR/T/ouSZRB6o5VEoNG1XqXjaklAZ0F1D
         Tx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q1kP8IDfWs3KYwhhLGYrvublLDH8i7aJatyFRJI0aDQ=;
        b=QT6GiEIPhqLZsuNKTIk3BZSR2K3/Gst5CTc6FcomzTeQZBclnlPS1tt4kEphl7UN2e
         awTOLTozsN0J89sMabuH1vbntzu4aKM2/Vwk/eQxmMT8xNptYMPawbF14HrmG3fc5M2/
         Bkm6Zc6N/2F1Dm+eyN5I3/oPpWxft7w7dc1iDqDXKmx36hk/wikyxwQRABYwYoNj2o7+
         ARKoy8oHZfEWNOY5RAdQ9DL36JWJpyftkInEB3+8VBqkF4DmfFE0bVoUGBAkHcrSC9Cw
         tSqThsMtbp2fnHUh4z+cXBbh3Qr7sr+OKHVaT6taYYsXsvCuTjOCsGcbpdsB1k0iUmpH
         Ocrg==
X-Gm-Message-State: AOAM5311y6TQfNp/hNA600LjxWF9QQG7o/1TCdagiCYC2bzZ7qiw/wTB
        WbphlwXvhWaQ7RztTgMf7xc=
X-Google-Smtp-Source: ABdhPJw8Y+4oboFgVDcsxDZ5DafHZB6Fmy0rHyftgqwU1KidVKdYV7L6Oq0+j6F4JOqgaGTP6nwKjw==
X-Received: by 2002:a2e:a70f:: with SMTP id s15mr3366180lje.343.1628784904468;
        Thu, 12 Aug 2021 09:15:04 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.76.126])
        by smtp.gmail.com with ESMTPSA id d17sm346650lji.102.2021.08.12.09.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 09:15:04 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] usb: gadget: bdc: remove unnecessary AND operation
 when get ep maxp
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        Al Cooper <alcooperx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Eddie Hung <eddie.hung@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628774283-475-6-git-send-email-chunfeng.yun@mediatek.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <4e751ea2-7e42-3378-397f-7bf913752da2@gmail.com>
Date:   Thu, 12 Aug 2021 19:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1628774283-475-6-git-send-email-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/12/21 4:18 PM, Chunfeng Yun wrote:

> usb_endpoint_maxp() already returns actual max packet size, no need

  "No ndeed to", perhaps?

> AND 0x7ff.
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
[...]

MBR, Sergei
