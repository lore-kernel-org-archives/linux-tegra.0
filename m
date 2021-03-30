Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE959C433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9CEF619D4
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhC3Pcs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhC3PcX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 11:32:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEF7C061574;
        Tue, 30 Mar 2021 08:32:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so24360738lfl.1;
        Tue, 30 Mar 2021 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c2IZxiP/PHTUNylXu7cGThAF7WUnRTJb00OUl3ALDOE=;
        b=V2WsCB9e+V4zvZcDi+ZiIVqL966DXzs5U1s6M1jZTGaLKgvlC4B/LL1fIdX3obzY5W
         v4v0f+gQGfhvbjdqAgdmMnbQZf+8dKGXGlHa/ka+pQ9QgXqrDExWLpyiw6e0GiOzcEh1
         ME0gJCTG+4vRvTSzZEqoq4l0W7gHBxSg6pzf9fGVt0bl6Du0r4Xy7mOpqtxDuOLN5TUz
         ImgQ48ySQElZD0rVxrIn7Otmrceu+MzNz46m+b94mRa/tPr8IBXnOam6VeBNOV7M/tXl
         SrqaffD19nG6GxBYX/ayZMP6/B3irEi+NYyWYvORNr5IXiKuGFIlXqdXf0eW1QZc3Bj4
         GDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c2IZxiP/PHTUNylXu7cGThAF7WUnRTJb00OUl3ALDOE=;
        b=WcXJ+ABgCbuU25VTcENvVpyVq5KS9trgMne+AIkYKskk32tFumSvT9J8gXeJq4avSu
         qhqf8UV79eBMHYP+zHyTAPCA3jOcoXq2Acer4eDyRCPN27bb4hxOusxxk6x1V/hZYby8
         d53CVgl+xKYCX7mu2I+htcamQTjHX4rFBXsKJoCbc2p0ZEkDps95GwnQCJvw73GF0BqW
         0QgYy9AXZh4vRII1f7X9TedtigFjdmGDxYbqOZZHVFZLsIzlbyt4/HxJLZVAGrVaQOS6
         PCYhUU/j14U6nPvZ3N6DD4PzXTDTJTjWImwatNnhBU4VyczqB9dvD8SekvbSJMh6+lIq
         VywQ==
X-Gm-Message-State: AOAM532R1zYxEOk7K2Rbhi4sSV7q83BDbVc9xQCpx5HksdWCCCGDNOv8
        UG7BIoO76taZWvTeU+h1tDe2ZQvfuks=
X-Google-Smtp-Source: ABdhPJzl+nrn7AEc/akvrf/8yMHU22UkGVLpS22NsjqkyIingW81F7l/JaMXP09VghP8+TQqhk8mfQ==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr16310671lfq.164.1617118341879;
        Tue, 30 Mar 2021 08:32:21 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id j22sm225899lfh.31.2021.03.30.08.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:32:21 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-6-digetx@gmail.com>
 <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ded3a2d-6487-6e6d-d211-0cae45f4f948@gmail.com>
Date:   Tue, 30 Mar 2021 18:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.03.2021 11:48, Krzysztof Kozlowski пишет:
>> +  nvidia,use-ram-code:
>> +    type: boolean
>> +    description:
>> +      If present, the emc-tables@ sub-nodes will be addressed.
>> +
>> +patternProperties:
>> +  "^emc-table@[0-9]+$":
> This might not be easy but you should add constraints when emc-table and
> emc-tables are expected. The schema should check if proper node is used
> depending on "nvidia,use-ram-code".
> 

I'm afraid this is not doable. If you have an example how to do this,
please share it with me.

I see that there is a "dependencies:", but it doesn't work with the
patterns, IIUC.
