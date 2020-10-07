Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F347AC4363D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 14:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94DF42087D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 14:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NegKUe4v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgJGOBT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGOBT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 10:01:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6AEC061755;
        Wed,  7 Oct 2020 07:01:18 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f21so2080400ljh.7;
        Wed, 07 Oct 2020 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p4w1MUIs4RUWcNzcHX4loXsqqD0M9IQtrPkj0pOVCqw=;
        b=NegKUe4v809fkivM9n10JdQYRpQf4Shf59uSlB1FR+QPKqeA3X42OXco560uvmyLST
         97narKlpKsTsscAoIKobfAHdJ8ojNpbTV62e7mn136DdvUsBobdJdPg+x/IUjgjG0UXV
         wL9hBjFLQBcgxsv3DQXHVYUgl05+B8O/y4p7ALAADfkF0R+vjoAT3WflC4jsmsuepIQt
         zjTaSly1MWIPK3/wP8NnHagciYKIBFKLhBka4lKrkCGKvFWUuhy5RiAImHnR5HXsVpNN
         Lq8ZeSpC6NA6ej2+BWIy9NfBZCg6HPG8gtZNFoOocfSbLXDA7XfVgArq9w4z1+WRdP8Y
         ib8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p4w1MUIs4RUWcNzcHX4loXsqqD0M9IQtrPkj0pOVCqw=;
        b=pF3dLqB6j1ssIJ8zuBFOa5XkXVekS+053iLauSkwovFvO9MRVcNRaVBzyZLBqFFScf
         5X4KdyF/CfZrcYPIsX0PcJCozQt84wEEdOgqTAi1ns2mRvf11opu0zY983A/9S2Q4qrm
         fntMrH8av38Wve/f14TeoOelAqE8uCDFxdCPKKyfobsUauL5FRGtrUQzbbQL1VgaX9X3
         sa6g6/IPmrppEK/bhXMLcSC6gwjcTS+31UGs03QKb+eGTsWGKT255wpkO2j0ODhRugyP
         cjQUfkndYm5gdICFHNOLXMhCi1NXMRhXZYoIX/lR6UQsKUn7ORryfnz7gqxj2IiA7Yqa
         cPAA==
X-Gm-Message-State: AOAM532IHFoMUcThIoeGs9U1QMjjMytannbDZnLp1nUn/iND2rNUXj9x
        2U1gyZ0rx3+z+zlG56vhFec=
X-Google-Smtp-Source: ABdhPJw4NIW1+yKxv6y49zhcbPaGMoT7Wm/bKX/8sHWjDK8ao0IpO6WxGQJHhkJlPJ2QouukJohxBw==
X-Received: by 2002:a2e:9b96:: with SMTP id z22mr1369530lji.181.1602079277002;
        Wed, 07 Oct 2020 07:01:17 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id f9sm365648ljc.129.2020.10.07.07.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 07:01:15 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
Message-ID: <7bcb700a-75ac-8c50-8391-afcf2ef1d57d@gmail.com>
Date:   Wed, 7 Oct 2020 17:01:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
> 3. Ouya's driver uses kernel symbols that are explicitly marked as
> GPL-only, see hid_open_report for example. Hence Ouya's driver inherents
> the GPL license.

Actually, the __hid_register_driver is a better example because
hid_open_report didn't exist when Ouya's driver was created.
