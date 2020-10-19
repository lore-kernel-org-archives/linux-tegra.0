Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11B4C433E7
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 17:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51ABA22282
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 17:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuHwrOeE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgJSR1M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 13:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgJSR1L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 13:27:11 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E24C0613CE
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2020 10:27:10 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id l28so406359lfp.10
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2020 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QUbOMORup/wBr0FxbJpx7sQZqNNI1fgY9QgZgYIF3Ak=;
        b=iuHwrOeETUm3YA3tHGnV0uBTBYkCYjRjqMskaQovMGtcm+TNNcAl+1CfHDojEyxJba
         3+ef9vBK/d7DDNO+QzyMvhTaBzS9nFalndLgTzLxtNoC706XJRnigZDT6iuV6NRijH/r
         TypvdkWtr0STDSLO8BlhMAbULFKn+6Vu+r3ROznZbZyfCmyvGGI0NPdEbMSX8iijzGMq
         fx6k1vwmU9fz7pxQ3yZvfrIsKAv1sl8/RJcxW5w7R1QZK+3anTZ8FedpkJCZvXJbl5P/
         eUiTyyV+QDVflqSAGnFnlrOLSnAfDKFftR5BpeDBeAdhL5PxE4como8fXF6VgRcj4JfG
         8pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QUbOMORup/wBr0FxbJpx7sQZqNNI1fgY9QgZgYIF3Ak=;
        b=IApHKQ8EDL9ZF/lHYrEz3M3KjtzNuvWnTOi6Tknhr5ItOw3hen/eX99DkiecD5mLeK
         zMG22BvLMCyFZ2ieaC3LZ64zLGK9ATwaTXDRQbUZ6v0evEH2k6S0pXXPszRDDlrWR3hJ
         0LZsUZMH93gapxmpvjbc+RYc8c24grGBj2gqR5kHMHcEe6eD3soM1BP/Bc+cKKGCx/WY
         q1KdRdoDJoBNiFSSpW/d2F8rA2o77rSoIlCxluWCPNPZ7moJGhbgkYwVlYqvAsKafWrT
         FOpg02akJ1kaOM6ZExNj1SXBzY8Inn0XpUum7zT608bp3q3l04EHN+LwXOwvCGJqynWD
         n+5g==
X-Gm-Message-State: AOAM532Ug39EDSV/6/pfOf3+09rI7xueIoBFKFwjnLo+y6BWKWPrHm9w
        1UR/1k/WBt1rQ0F5ExJm+RY=
X-Google-Smtp-Source: ABdhPJwh0YAqS5b3rnibvxmXnvulaECI8zYGWV+21DlBeRwCeebnkrkxJ4YuFa0Dx6ju+fsyer40Yw==
X-Received: by 2002:a05:6512:3132:: with SMTP id p18mr226381lfd.218.1603128428559;
        Mon, 19 Oct 2020 10:27:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.googlemail.com with ESMTPSA id x7sm67113lfg.281.2020.10.19.10.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 10:27:07 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
Date:   Mon, 19 Oct 2020 20:27:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.10.2020 11:13, Mikko Perttunen пишет:
> On 10/19/20 5:21 AM, Dmitry Osipenko wrote:
>> 07.10.2020 20:12, Mikko Perttunen пишет:
>>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
>>> +                struct drm_file *file)
>>> +{
>>
>> Hello, Mikko!
>>
>> Could you please tell what are the host1x clients that are going to be
>> upstreamed and will need this IOCTL?
>>
> 
> Hi Dmitry!
> 
> It is needed for any engine/job that wants to access memory, as this
> IOCTL must be used to map memory for the engine. So all of them.
> 
> Downstream doesn't have an equivalent IOCTL because it (currently) does
> mapping at submit time, but that is suboptimal because
> 
> - it requires doing relocations in the kernel which isn't required for
> T186+
> - it's a big performance penalty, due to which the downstream kernel has
> the "deferred dma-buf unmapping" feature, where unmapping a dma_buf may
> not immediately unmap it in case it's used later, so that the "mapping"
> later is faster. A feature which we'd preferably get rid of.
> - because of the above feature not being controlled by the user, it can
> cause variance in submit times.
> 
> On the other hand, we cannot (at least always) do the mapping at
> allocation/import time, because
> 
> - A single FD may have multiple channel_ctx's, and an allocation/import
> may need to be used in any subset of them
> - The import IOCTL is fixed and doesn't have the parameters we'd need to
> do this at import time
> - Overall it's more orthogonal to have GEM object acquirement in one
> step and mapping in another.
> 
> Maybe that's not quite what you asked, but it's some background anyway :)

I'm asking this question because right now there is only one potential
client for this IOCTL, the VIC. If other clients aren't supposed to be a
part of the DRM driver, like for example NVDEC which probably should be
a V4L driver, then DRM driver will have only a single VIC and in this
case we shouldn't need this IOCTL because DRM and V4L should use generic
dmabuf API for importing and exporting buffers.

I'm also not quite sure about whether the current model of the unified
Tegra DRM driver is suitable for having the separated engines. Perhaps
each separated engine should just have its own rendering node?
