Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEE2C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 18:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34BFC61214
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 18:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhIUSB1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 14:01:27 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33322
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231946AbhIUSB1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 14:01:27 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9931540267
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632247197;
        bh=vxTn3AIJPvzmFzuzSalXPUTXovZGNuRBodVQ9rplWBQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ZOQx6/ymu1Q9rft9adUiDale7NFnDUhMukfWpDb34KzA8yz4+CM5VBvpfdx1g1eiI
         yPgoBeFi+cUZLVkiRYe1C5TRDZ52Xf3xVLkwBO0gNShc4rdd3HZm/8Sk9GG4Kp3ASn
         6qSLO6ig6smtvILIRT/LOyzHTpFv6Ky2PL2AhffpItFdGhIAgi/rwfoiL16W/BMKYN
         FuDDjJFzDUYM5bC/qcAmT47c4QabugBWd0mgrdsweEnnGvOOur/4aKB84w3GxDHIqD
         lU5qZ0MR0gzfpnI0jThF+wzDkXh++QDn8cIx6NH4LVdIPnls+fyrlPWINE1ZQj0NDu
         RV+tE34wYkLFw==
Received: by mail-wr1-f70.google.com with SMTP id j16-20020adfa550000000b0016012acc443so4143839wrb.14
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 10:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vxTn3AIJPvzmFzuzSalXPUTXovZGNuRBodVQ9rplWBQ=;
        b=s6vvKSBtwOPZKgmRCJu8CA7RwYZ9+06UEcz1FbZ7H7Grphonp20IbmWXneMAEAWORG
         chzD/sbxQ7Z3wBAp2VKyz6ZmlB5YZHaDnaNcV7r0ux55WVTwJ27dCPe9bCpubWkNztnp
         vHRf0LqcPGIus5XsaCx/QSB+VODhRFxwVxDKmPkLH9QGgpTmCz7GYSDkNTvBj07T5wI/
         4I3VJ4yh8xvcwHZjJDF1bQtKny6llDD03EeXN8TFL87ex7wPixmYNKsgkSy8gHFOjte+
         +M6wN/t1edfsJ8sM+NJFnYukweUsWwVzVNm8+9NBb3+32Ym/FGPkP3ot7V1yLzkIMQ2I
         a/zA==
X-Gm-Message-State: AOAM533FwIFUojR17YuMNWqQ0eKU8BGYpbUYDmIfXkUYc9V3u+Cm4IFt
        ywMCsfmsRrOzpYaGHu813ajGlaJ9pySbiHQr+ErxfJFH0YeIZT6aqpF49UfaNFN6zNN68w89nwS
        6KnHZs+Y4uaBhg0jeIkl257qaCANzuBXNqEg02LJa
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr36975800wrr.371.1632247197106;
        Tue, 21 Sep 2021 10:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxetWpEyd4foGqozh84S/hmjt8R/AjjI8+NlE7R2fWtuMsQjyQTEpWYMzYqt+5l14nTxi03oA==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr36975779wrr.371.1632247196967;
        Tue, 21 Sep 2021 10:59:56 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id u29sm17466170wru.34.2021.09.21.10.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 10:59:56 -0700 (PDT)
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
To:     Bitan Biswas <bbiswas@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        rostedt@goodmis.org, mingo@redhat.com, jassisinghbrar@gmail.com,
        p.zabel@pengutronix.de
Cc:     skomatineni@nvidia.com, broonie@kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210921174434.4839-1-bbiswas@nvidia.com>
 <20210921174434.4839-2-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <195c460c-9fb9-f435-4fa8-6d5632f62a5a@canonical.com>
Date:   Tue, 21 Sep 2021 19:59:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921174434.4839-2-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/09/2021 19:44, Bitan Biswas wrote:
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

Now we got the same v1 patchset for the third time. I think you need to
check your mail agent...

https://lore.kernel.org/lkml/?q=bbiswas%40nvidia.com


Best regards,
Krzysztof
