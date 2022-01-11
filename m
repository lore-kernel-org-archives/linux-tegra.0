Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6EEC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 11 Jan 2022 20:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbiAKUaC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:30:02 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38902
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230469AbiAKUaC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Jan 2022 15:30:02 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4C44D4001E
        for <linux-tegra@vger.kernel.org>; Tue, 11 Jan 2022 20:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641933001;
        bh=CKTP4p5lODINceD9QcpC5IgySAHEx93ke4CpXm6ZAAY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gpt25tHmfxDZIhPFFakgK7YDhzTr1GM5DLGbsxzUz82GXSLu3ovpUGfeDmCYpc25+
         DeiyB8UA8T6uW4d49ZntgMpHqPPTFmAQ86CkwTye5CM2gM/DBSg5nI1WjZaqgWnKHp
         +wG/53ouu4LIqEcLVZ7S/QCqRLAVU9Yth+ptUJVj9nJqoFFVwY6IJlnU3kkDnmTZxz
         ALz3CiwC+rxb6vP6Ry/HhSbK8lMPt68pB+5wVGrIFbKG2fVcZhnXW2wLyjCDBJsaT8
         l+gJyBHZHETxWS9EZayZxAWyXDBl0PYjmVFvl2WU5bCfs8/xx7CQcDJ4F33BBBlRcG
         kU/Xml8WFHOsQ==
Received: by mail-ed1-f72.google.com with SMTP id b8-20020a056402350800b003f8f42a883dso194982edd.16
        for <linux-tegra@vger.kernel.org>; Tue, 11 Jan 2022 12:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CKTP4p5lODINceD9QcpC5IgySAHEx93ke4CpXm6ZAAY=;
        b=zONxcdIZEatd8ea6F9jK1Zf0eMFQHl/qaJLjO2PYSd/iNnut7hpoL0X6AQs5eiLg6+
         OzhSVbSxizSGTH8h60RLvnv1ACPA5+QN9DtvTyTX7ySCfal4crfs/gsUk560QItVfE/t
         CKtBBcc8UsiH+YBeyi+O+H8JS8ZD5hHvWbv1jnuz1vNjqEQziSRkBmUUT5t89ITASovv
         IKqOQv+0B5u8rdqXM4oaic33zihHYGdy8eA3+0wWC3S/B1hLP+0aYzxZCMMZ9/rF06TZ
         6sqmqxoO4tul9M030lN+m1ZI6tudIyCoxLPiB2z6GYpZTFgeTOFIzVXJN5ubLdfY9PvL
         EpJQ==
X-Gm-Message-State: AOAM53104tqOV09oEJQkk2IwUbMWE0OhsEUNDqlosCb/NRNcYceZab1w
        z2q0T4cm2guGslzFJFNUakBrhzQ+pEAlBKPssq4WgVtyqv/Vdw2MlXj+JwQhToZjUtsp3mwJ5mw
        XaiHLhKcH8kNrJ3vlB36vp5Hm7sP86IAtuOix+Coo
X-Received: by 2002:a17:906:7307:: with SMTP id di7mr4873909ejc.516.1641933000953;
        Tue, 11 Jan 2022 12:30:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzLNnL2OVU/iajkRhtGdk6AJwVnE1QBwlSx7fu8yVqXILHBQvXFbDwXh8xzUICR8K3JFlGJg==
X-Received: by 2002:a17:906:7307:: with SMTP id di7mr4873901ejc.516.1641933000810;
        Tue, 11 Jan 2022 12:30:00 -0800 (PST)
Received: from [192.168.0.26] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g9sm3866418ejo.222.2022.01.11.12.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 12:30:00 -0800 (PST)
Message-ID: <c71e09a8-0170-ce05-3fef-3e32c990b377@canonical.com>
Date:   Tue, 11 Jan 2022 21:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Patch V1 1/4] memory: tegra: Add support for mc interrupts
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Snikam@nvidia.com, vdumpa@nvidia.com
References: <1641926750-27544-1-git-send-email-amhetre@nvidia.com>
 <1641926750-27544-2-git-send-email-amhetre@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1641926750-27544-2-git-send-email-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/01/2022 19:45, Ashish Mhetre wrote:
> Implement new structure for function related to mc interrupts.

s/mc/MC/

> Move handle_irq into this structure.
> Add support for clearing interrupts.

The subject says you are adding support for MC interrupts, so before
they were not supported at all?

Here you also mention clearing of interrupts - another new feature. One
commit for refactoring (adding new structure) which does not change
functionality, second commit for adding new feature.

Different question - why do you need new structure for just two function
pointers? Why these different IRQ handling functions cannot be in
tegra_mc_ops? To me, it's unnecessary code complexity (plus performance
impact, but it's not that important). If this is really, really needed,
please describe the rationale in the commit message.

> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       | 14 +++++++++++---
>  drivers/memory/tegra/mc.h       |  1 +
>  drivers/memory/tegra/tegra114.c |  1 +
>  drivers/memory/tegra/tegra124.c |  2 ++
>  drivers/memory/tegra/tegra186.c | 14 ++++++++++++++
>  drivers/memory/tegra/tegra194.c | 12 ++++++++++++
>  drivers/memory/tegra/tegra20.c  |  6 +++++-
>  drivers/memory/tegra/tegra210.c |  1 +
>  drivers/memory/tegra/tegra30.c  |  1 +
>  include/soc/tegra/mc.h          |  7 ++++++-
>  10 files changed, 54 insertions(+), 5 deletions(-)
> 


Best regards,
Krzysztof
