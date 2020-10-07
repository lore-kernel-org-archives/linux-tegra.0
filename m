Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AECC4363D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 13:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 070652087D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 13:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llWN+f8r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgJGNx6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 09:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNx6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 09:53:58 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E9AC061755;
        Wed,  7 Oct 2020 06:53:58 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d24so2371194lfa.8;
        Wed, 07 Oct 2020 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EnbUIab0pYj3aAzSBtZY2agXtCAzcrLIon9nxdJolZU=;
        b=llWN+f8rkHxIFQxWcg0DYAln2ZOyoWvQerYzeZ3n9p8oJZKnYq9SHT9nm9zJWtSS2Z
         yXaGeHRwTJjY0dNdbLJXi56iotltit8GpwvdYYgLyagORc9ZckJhfr3wauMrN7ubeTC0
         F4OaUp38qDgGKpmrAOV2rjm2ghBsqxIX5/H6QlHCzf4RqXNL9vNXQcvVFI3Lf+lj+gdn
         ErNEaiD29/P/r7uNmzra5nyTh63YS2mSuXzqsEh5jiqfiIgDaDg2iWmIfU0yy81suzka
         VgVurY02Oeu/0yTsK3VAB2t6N+F6Zaj0KOxNapyHxKjnguN6lhuDVcLb/uBmOqC+mi73
         /rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EnbUIab0pYj3aAzSBtZY2agXtCAzcrLIon9nxdJolZU=;
        b=mOSjL32Oh8CSCSwHYhGzsZux9qeNXsJGtADAqIyby8+6CN+ZCcedJpH9kjZqoxoZZI
         5vhAb37RN+JoHuYRF0+diG61fi4asvC61gxMVZy+aZYkIqdazB83GgVz9dq4GdXdkcfr
         S4UHhfxw8mAoTdPWwBRdg0JzDDAePHV9TR4WmbEjOPx6c8cp5ZzsV/a+FCfEaBbrnKLz
         mRICJsPcQRNaf5gEog4ZemB7wive2JMd5fFGsaVi8OBBHNOnsWFKVGwF0wTfWyUQEuF9
         me4TMdeMZm+RUbu4Ykk6xrgZLu86j9jGLu4/ysY/5hJGJt7A5jeyfjYgXPe5g4y4Fbzk
         ZXsQ==
X-Gm-Message-State: AOAM533/fVs+koezyr8vtTHRrBppoccVwyrwVQOMx5wcwr18rmcpx9QG
        3P+4F+44leN4AZqXKz1iB42cNO/jEeM=
X-Google-Smtp-Source: ABdhPJyXeNXUZE5NZGhuL6kiCs9qa+F8j9F1KpEF6LIoHrTjyss/5/TT1mbdbsHxAnuNA3P+3/Qufw==
X-Received: by 2002:ac2:4896:: with SMTP id x22mr1124977lfc.286.1602078836441;
        Wed, 07 Oct 2020 06:53:56 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id i11sm364931ljn.119.2020.10.07.06.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 06:53:55 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
To:     Bob Ham <rah@settrans.net>, Stefan Agner <stefan@agner.ch>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukas Rusak <lorusak@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
 <4d3eb998-045b-f288-7a9c-aaa620c38bff@settrans.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
Date:   Wed, 7 Oct 2020 16:53:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4d3eb998-045b-f288-7a9c-aaa620c38bff@settrans.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.10.2020 16:36, Bob Ham пишет:
> Hi all,
> 
> The Bluetooth controller driver sent to linux-input by Lukas Rusak
> (CC'd) is a bit of a concern.  Here is the original driver:
> 
> https://github.com/ouya/ouya_1_1-kernel/blob/master/drivers/hid/hid-ouya.c
> 
> and you can see that there is no SPDX header, no license information and
> no MODULE_LICENSE declaration.  I'd previously noticed this as a
> possible cause for concern in upstreaming the driver.
> 
> Meanwhile, Lukas's driver is clearly derived from the Ouya Inc. driver
> and even retains the Ouya Inc. copyright notice line.  However, Lukas's
> driver now has a MODULE_LICENSE("GPL") declaration added.
> 
> Lukas, did you get clear permission to license the driver as GPL?
> 
> Alternatively, kernel developers with greater legal or Ouya knowledge,
> is this actually a concern or is it nothing to worry about?

Hello Bob,

That can't be a problem because:

1. Ouya Inc. doesn't exists anymore.

2. If code was officially published, then this implies that it can be
derived.

3. Ouya's driver uses kernel symbols that are explicitly marked as
GPL-only, see hid_open_report for example. Hence Ouya's driver inherents
the GPL license.

4. Lukas's patch doesn't remind the original code at all.

5. In practice nobody cares about legal much if money aren't involved.
Even if it happened that driver was 100% violating some copyrights, then
it either won't be accepted to upstream or will be removed by request
from the copyrights holder.
