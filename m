Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C37C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 16:47:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BB8964E04
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 16:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhA2Qrd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 11:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbhA2Qqi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 11:46:38 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29A3C061573;
        Fri, 29 Jan 2021 08:45:58 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id a20so6092378pjs.1;
        Fri, 29 Jan 2021 08:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ueX9Um5yYkNpG5ArDobqaS76e8j9PN3Jhag3IDVGSqo=;
        b=MXicy9RMRZXaAEs82DEwpCjoa87oxUSwaCjSgZSBNDy5p+ZAqEORXYjYos7z+2w5i3
         za67Yk84MaWfVjnbeR7oWVbiunMBvUPvV8JiXyeVa/1BY58uHh+onL3WANB8dKMPintZ
         w3HpzwiGdH+sPMCo1anYTvnNlPhETp2guHoMIH9LKMY03ZBpCD5bMePsUE6xu9IIglG3
         jPE5dC7sh5D6W+jnamDULEiNy1pLHfWwq3R/DtBwHHSUOoDeC4vbG5/8O3qhj7bHLfVM
         +D/bmPOyNAKUC9dFMqRAHfNu317gbcC31D5bCLo/V82wNtdyV9I+uubHTq+wT6J8i2nx
         tnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ueX9Um5yYkNpG5ArDobqaS76e8j9PN3Jhag3IDVGSqo=;
        b=r6lBqq+Vz+550gkQmdg3Fm8ZMl0VO8XSsljyWtyHiS86/DZ38UHvmEAwzgp5sO0lVw
         va8FpzHBIXiXQPMfmaLUoNobXXyxh+t13Uiq2VSihctanE3f4XXR28h6rABWwbV0j7Dc
         3cx2s9aUm3EDBJrECWxrwt3XIwx6djnTV9vQMPbqgyVTYeTHYzrQxsWPqc2ZmqTyKcve
         yYRtxwDksidNckXBAyOf0toeOnZrvRscP5KgDVjJvZoJlAG8qpv3sQ64emQhJG6uZAwv
         KRfiwTWu5iK3EL9NZRLbG4d9+eD+4zIShkix9fMlEKuGiWhNBBsghioVKGxFvUyDk2C/
         0I3w==
X-Gm-Message-State: AOAM533XXB8TiEPrX61gFXMToKlqP38l2Q9aBeWqVDqjrnyuZkdlEyYt
        8zNGT75YPbHHIU8Jo3WiC7yzjS9FJ9b6Ng==
X-Google-Smtp-Source: ABdhPJz2lT0niz+OSrRLRJ+zNW5FyO5kAwLT8XnILiwK0qAefHPYttQUoqZpl7fWqOndnn2x7+uewQ==
X-Received: by 2002:a17:90a:b703:: with SMTP id l3mr5148638pjr.60.1611938757741;
        Fri, 29 Jan 2021 08:45:57 -0800 (PST)
Received: from [10.25.100.162] ([202.164.25.5])
        by smtp.gmail.com with ESMTPSA id y4sm8660611pji.34.2021.01.29.08.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 08:45:56 -0800 (PST)
Subject: Re: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
To:     Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        robh+dt@kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
        thierry.reding@gmail.com, linux-tegra@vger.kernel.org
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
 <1611920470-24225-5-git-send-email-spujar@nvidia.com>
 <20210129124454.GB4560@sirena.org.uk>
 <d6cb9252-246e-d6c7-7500-5f1d1823325c@nvidia.com>
 <20210129154858.GE4560@sirena.org.uk>
From:   Sameer Pujar <dev.spujar@gmail.com>
Message-ID: <a5a8df4b-21d1-0a12-df7d-9e94c353e2b5@gmail.com>
Date:   Fri, 29 Jan 2021 22:15:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129154858.GE4560@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/29/2021 9:18 PM, Mark Brown wrote:
> On Fri, Jan 29, 2021 at 09:02:52PM +0530, Sameer Pujar wrote:
>> On 1/29/2021 6:14 PM, Mark Brown wrote:
>>> This is a generic device, not something specific to Jetson, why force
>>> on a driver that may not be required on other boards using this driver?
>> Yes specific boards using 'SND_SOC_TEGRA_AUDIO_GRAPH_CARD' may require
>> 'SND_SOC_RT5659'. But there is no platform specific config. Is there a
>> better way to enable config 'SND_SOC_RT5659' conditionally?
> If the user wants a given CODEC driver then they should enable that
> driver.

Above card driver is intended to be used on multiple platforms. DT has 
already a way for user to describe the CODEC connection required for 
specific platform. So idea is enable these CODECs from driver point of 
view for this card driver and platform DT can use what is required. Also 
the CODEC driver will be a loadable module here.

If above does not seem fine, alternatively can I just enable CODEC 
config independently from defconfig?
