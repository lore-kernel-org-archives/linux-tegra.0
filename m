Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53310C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 09:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 158BE60FEE
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 09:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhDZJBp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 05:01:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42815 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZJBo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 05:01:44 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lax70-0005zT-BT
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 09:01:02 +0000
Received: by mail-ed1-f72.google.com with SMTP id n2-20020a0564025142b02903875396c18bso3375293edd.14
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 02:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jP7slMkwfIW52m4Rjm3eqqlgC3UiouqKGVzE0HO4s/4=;
        b=Zn1/orW1qO2KVuTWRK8ePKaOj0IvW2IXDViY6jrNBHxP/ef5BAI+ZziOyztCBYEE6A
         q6wEywaiS6hGtyfjTgn1BPeVCCi3wZ2b8wmmv5SHFbKXhsFEJmymrreg8hl2YV6lYSQt
         B7T6qjFyWCdesbJ9Ag0azkrf3TzoWhyvaAQS2aNkQJwTQfLiz0CBLZBPYkRHbXq1gSFa
         4qGiRvkQ5Z6J2rnwYd8GTQQSWDjY66Bw54uBb/vOtKp2UO0L8Yy6YkZCRo8qO9v677tL
         0XyIv23N7jGqThVh6pnJGXSKrvE5bp7Nhp3rliadXY3mS6mi1AoXR4iMvnuE1zPrzfIv
         jUtw==
X-Gm-Message-State: AOAM532qUm6yPYhsP5v8C6U0pWqCgbfOry2mOicbQKsGLhyT4mylbBQy
        sYh6jiZgmwJxRAsYYJKL6ysOwdh0aWz6CMuVdUfsT4qUFgB5DEBcKcZmWb9CNRw2p1UNHw91x8x
        H+9M4YWTHENYI6RsjMw3dx7y9I3+FQeseelNyXkd2
X-Received: by 2002:a50:fc02:: with SMTP id i2mr11153268edr.320.1619427661787;
        Mon, 26 Apr 2021 02:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Qc8iGpQjt0mjLFaxb/QNjazm1Sh9sMvanT09eG5Oip5/eNlBXoxI0QTK9ffx2r13HLC1jw==
X-Received: by 2002:a50:fc02:: with SMTP id i2mr11153251edr.320.1619427661693;
        Mon, 26 Apr 2021 02:01:01 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id mf25sm5938616ejb.101.2021.04.26.02.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 02:01:01 -0700 (PDT)
Subject: Re: [PATCH 06/10] memory: tegra: Parameterize interrupt handler
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-7-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <aa5d7581-0cda-596f-8929-ba0dbd8155d1@canonical.com>
Date:   Mon, 26 Apr 2021 11:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/04/2021 18:52, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra20 requires a slightly different interrupt handler than Tegra30 and
> later, so parameterize the handler, so that each SoC implementation can
> provide its own.
> 
> While at it, also make IRQ support optional, which will help unify the
> Tegra186 memory controller driver with this one.

Please split making it optional to separate patch. Looking at the code
should be possible and not affect bisectability.

Best regards,
Krzysztof
