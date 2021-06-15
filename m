Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F65C48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 20:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F2476109E
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 20:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhFOUeU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 16:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhFOUeU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 16:34:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481A7C061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 13:32:14 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 131so535429ljj.3
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8wFEhP3RtxfoxSD9RpFJsXqsCrndSkCzNDUEr2dYMqY=;
        b=aFjSAPtCj3D7zoq/RO/Hp9R5N//xI0eqXcfHrL5DTbq9mvwaKT/9oXsUPAOnrl/wCn
         4i2+1mexcPJv6sbChnEmeY9MOP785LQMuiUD0nLNNqOrkseUw2zXEnBVdfgoJx9SVHTp
         NRou7IysYQPKMtmQW+HbjgWn0LS7p8L4gFn/QB0oN5uNJti8MelxP9EFZm+Fbs+z/Ir0
         qYXJlPtOeoFUdQFme1HJuAuv0IwVhOL9FPM0Wpo7gR3wHfZNi2fXpkLwlbReClxqqDP6
         QmyJXgmHi47a9D4Ti6d9FmEYlVcoQZ7/tFKeDLa3SLshv6hmzMvdM+67NKJBiCfrzpxR
         7dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8wFEhP3RtxfoxSD9RpFJsXqsCrndSkCzNDUEr2dYMqY=;
        b=GMboRMpAE9d6TtEDfEOhb3j+TQYgsAv51gfFrUWgNf44pgLV0ySuc78ZfiI1lxlvg/
         mI3fSCvFkNTw9t7HXA5Ve4FKsGcUkcMJ33tykqqGt33w2TnJODcG8rs0ty7tqt3o5FEV
         Oss94e9fV/Q/iqPeOOLrXpO8Y4TU0voI4wBvaXA3p+9QkmE5wTnqk6o2Gn2wOn5tScNq
         fokrViXJ68rtFUlWsizI1aoNAKgKZgypk2NFktIPa8hVdTUtDO4YQKdWr2wteSyPDMfs
         HXCDGIZp29FbfgYaGEblKM782By+UljU5l5KpPlinZlABv5W+5IdDTA4X8u3/nkoaPGs
         mj+A==
X-Gm-Message-State: AOAM533oW4xFt8VkqED6lW5Z/T5yTcdTk739kEBraRJdgH3sfq9KUQKX
        2s2qnZVxx87C5FLEY8L0jGKNaoL7uRg=
X-Google-Smtp-Source: ABdhPJzoZZyt9KQzwxoqBiGH/6kVvWE3IY4yESCONWdmKrl/Sr4PMxuwrFBoFshuY+1xlyhf9Y2rmA==
X-Received: by 2002:a2e:a490:: with SMTP id h16mr1301782lji.270.1623789132579;
        Tue, 15 Jun 2021 13:32:12 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id 15sm2302920ljr.25.2021.06.15.13.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 13:32:12 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] TegraDRM UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e91d780c-a157-1775-2d60-1379e7684f20@gmail.com>
Date:   Tue, 15 Jun 2021 23:32:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.06.2021 14:04, Mikko Perttunen пишет:
> Hi all,
> 
> here's the seventh revision of the TegraDRM UAPI proposal.
> Only some small changes to v6 here to fix things on older
> Tegras with certain configuration combinations, as well as
> rebasing to latest linux-next.
> 
> The following pieces of userspace have been updated to support
> this revision of the UAPI (unchanged from v6):
> 
> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>   Experimental support for MPEG2 and H264 decoding on T210, T186
>   and T194.
> 
> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> 
> * grate - https://github.com/grate-driver/grate
>   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> 
> The series can be also found in
> https://github.com/cyndis/linux/commits/work/tegradrm-v7.

The needs of the newer hardware are mostly understood now, so it's not
the biggest problem now, which is good. The only part that is still not
clear to me is whether sync points sharing is mandatory or optional
since it's needed only by a proprietary monitoring software.

This is still not a full UAPI implementation and it's difficult for me
to see how this will integrate with the DRM scheduler and etc.

I don't like that the new code is build upon the old troublesome
codebase. The half of it will be removed later on and the other half
will be reshuffled, which is a lot of effort that could be avoided. It's
apparent to me that it should be much better if we could clean up the
current code base first, but before doing it we need to agree on the
organization of the updated driver, which should help a lot with moving
forward.
