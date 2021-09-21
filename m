Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD81C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F15861184
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhIULgE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 07:36:04 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40248
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232394AbhIULgD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 07:36:03 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1EC1F4019A
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632224075;
        bh=zp2By6sGexWtGpbtuPzQQjvZBN+ptCF/Bgy4OAUD3Kc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=vfqHIrviUFK9c+QNCmt23HhzG33NgqcYuasEyb1QDh+AQt2mz6AHPr7KnnPAvTECw
         13OH+2CgLsrguAH7XwM1qOPK4e7Fav/3K7WjUJxwSXx+/qvdWt0yjRH6lAdGgQmG5/
         kWhTUyCQxmnOUBo4zrkO3OABzitQ9cHyLZeX06ZdmS/L8a4XN506Mh7vUrV1Ah8d95
         gJ7oZI4SMhwkHMigxKio7iTc2biIEIgdhwuIFh01M9WjBxTqXMBvsbIHKZQ06gAwSt
         RWSSPNucWQx5+b0leBSYEQoQrkCxnv8EgMo0rUPzp/itr8DXaTpInM+X5ov3ilxHfH
         FVbqqU994573A==
Received: by mail-wr1-f72.google.com with SMTP id s14-20020adff80e000000b001601b124f50so1735724wrp.5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 04:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zp2By6sGexWtGpbtuPzQQjvZBN+ptCF/Bgy4OAUD3Kc=;
        b=UgQh4IT4AtdrP5N87GsHdyM0Lm3x8Xv8Tz3TpbxBBjFjO1odDuLFt60DPOQnyJbwwq
         BML7TvBLtxYKq0vFlbuugO+NGX08pb93t0zm4JFUDHsUz1GcFBde65a2nK4map2jQf08
         dreLnTUq6ZmjoEpHfAWj9L0hDGoZIxYP0JIIlzIj0S/f8W8NzkssQXAiFr4INy/Anoka
         e7INfVnDLlsZB1Uvq0Z0a3EmEbMVBCZYgWWXwd7bZJz+ndb1eAF1nVjzAbbibtGiL37P
         FF1BMyY2gjuBV6h9PtfY8SizMcDrHE2gHu8OdDNOKiV1M+NgFignpZYRsGqQK/SVMXB8
         OvCQ==
X-Gm-Message-State: AOAM531j2ZlPDuhAZSNNTcNPdE6XLuwtgIlc6sIYFhlSHTOeGWtGQ5l7
        wILRe1ndUxC4nDxrNJG4SqGVaa/GUh2DcTyKMNNubtmuUgRx7K7567y90Ay7p8a03ziuUPs5FJo
        BI2HHqthltFC/kX8UVaw5oxzEe5+d+vQzsPTvubBZ
X-Received: by 2002:a1c:2313:: with SMTP id j19mr3965528wmj.189.1632224073871;
        Tue, 21 Sep 2021 04:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykWXjszEYz06lQKp1hqKp6FQVhmCuATI+PXjITd/ZFG6FW/H9UPP+5M1aavL3U7syPXCMLjw==
X-Received: by 2002:a1c:2313:: with SMTP id j19mr3965511wmj.189.1632224073688;
        Tue, 21 Sep 2021 04:34:33 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id h18sm2630388wmq.23.2021.09.21.04.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 04:34:30 -0700 (PDT)
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
To:     Bitan Biswas <bbiswas@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        rostedt@goodmis.org, mingo@redhat.com, jassisinghbrar@gmail.com,
        p.zabel@pengutronix.de
Cc:     skomatineni@nvidia.com, broonie@kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210921112716.3007-1-bbiswas@nvidia.com>
 <20210921112716.3007-2-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8c73dbc0-2678-9c9d-dc29-d4bece29fd08@canonical.com>
Date:   Tue, 21 Sep 2021 13:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921112716.3007-2-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/09/2021 13:27, Bitan Biswas wrote:
> Add Dual licensing SPDX license identifier for tegra186,tegra194
> memory and bpmp-thermal headers.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra186-mc.h            | 1 +
>  include/dt-bindings/memory/tegra194-mc.h            | 1 +
>  include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 1 +
>  include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 1 +
>  4 files changed, 4 insertions(+)
> 

Hi,

It seems you sent the same patchset twice.

Best regards,
Krzysztof
