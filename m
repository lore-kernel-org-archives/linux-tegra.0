Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C680C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:58:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5C63611AB
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbhDZI7L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 04:59:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42747 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhDZI7K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 04:59:10 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lax4W-0005qV-WA
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 08:58:29 +0000
Received: by mail-ed1-f69.google.com with SMTP id f1-20020a0564021941b02903850806bb32so16696923edz.9
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 01:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gDlJPJGzX9vSMy8Pes/qd6dYvuVvFjrITSzsxZ/Yj54=;
        b=t/Pdi+wcCrpQs3S2NqmtfHMQdQ+f3La4I0LWqS+0kMj9rrtd0a4n1rYd3ntpp7DCip
         kMqTwDSRob4muEgM7tI/rrMdKscoeKtEQl1LcKvOFjIoVxyrAQwTtpTTpntN0zYHagGA
         RjxdyFguzaCW5wYvaX716ejeIGvHxBn7u9IqT/zG94daqIWr8iTX7PzD7zmLt9ex8SXc
         metO7tKiYGJumX8OpKdH8NjHK0FCWYV/anUimM6paTVRS9cdVbfT3pmT4HoxdoSel7us
         eoTm21ovWfcJgGzECs1wV6vuCahkIFR1fCi116Bp1iJ5o7ysENXyhpWsJn47iTNwaDMp
         0xTw==
X-Gm-Message-State: AOAM532U88lRcquC3xxa+4F3IVGObC6aMORZaXU5xt+AzxKsJ/5Aa49p
        g3p1Np9OQOMb+8pPPErjvQ/yKKczRCMWNL59UO+vhKbUAKxgTw1LdCBQn/jHJEpmtCxlnnlV3bT
        owhhsLWBirrQr0ndlWW8w6LJnNP48c7RsqDrnSHaV
X-Received: by 2002:a50:fc91:: with SMTP id f17mr6669718edq.23.1619427508763;
        Mon, 26 Apr 2021 01:58:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl60bNGJNSiCfmUEEVcMzmxg0gDLBTNMs0zvSqpio5UZe6d1BOBVDCt2rro0JbzwUANM4J7w==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr6669708edq.23.1619427508673;
        Mon, 26 Apr 2021 01:58:28 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id hc43sm11366421ejc.97.2021.04.26.01.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 01:58:28 -0700 (PDT)
Subject: Re: [PATCH 05/10] memory: tegra: Extract setup code into callback
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-6-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <25ea4721-f9d3-ae4e-6310-73182ad43d8f@canonical.com>
Date:   Mon, 26 Apr 2021 10:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/04/2021 18:52, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Separate the setup code for Tegra30 and later into a ->setup() callback
> and set it for all applicable chips.

I assume the code is functionally equivalent - the same
tegra_mc_setup_latency_allowance() will be executed on all these SoCs?


Best regards,
Krzysztof
