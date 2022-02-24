Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C29AC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 07:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiBXHaA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 02:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbiBXHaA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 02:30:00 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40716160FE9
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 23:29:30 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 379FE3F1CA
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645687769;
        bh=1laIzS8Hrg3uRlIHve8LHSUfvPW6p3oQblY/GhVjbTE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=JykxPq6nWcJ/grOCjhA+IBSwsuEPgixTBb49kidquodY6dRJ0YGXJUCZKGOD+5ALi
         ziXKvtjVOVuQVu0nLt5vwtE3uSniG7YFTFuZtiq1j2D0NGT0UWVb4C+y+8nwqJXp3T
         SIYd7kmadzNHgbHtAAkQ2Tsmc/VEkjAHROlxeiV6EKuV4FwPGpmM6XhOo0KZ9Vt3lt
         k0VJiWSmQXIMSsnPHrJXa+z1zGfXWBRVCPC/WAdA/FWWQOTn0EYFM/leHTOHMxviGc
         +V3/ORIRN7ZfUPnkzXk8aHEV25dWBiDb+uyTyxv3vCCN6LdeJwks3Y1I8dr9fm7HIa
         PeRpbXEWZN3gQ==
Received: by mail-ej1-f72.google.com with SMTP id qf24-20020a1709077f1800b006ce8c140d3dso781252ejc.18
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 23:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1laIzS8Hrg3uRlIHve8LHSUfvPW6p3oQblY/GhVjbTE=;
        b=cznSpIXlew9N4h4dzcsj8uCpvrTvZKTJa1/cus65KDwfsHgMD9Wemz0FNsJS4SdIrD
         o9Zpi+kHbJnWOk/b+Yz/wdRUuUf9wYzRyLZCoAI8o1uj8nnjdV6OVVo1L1euDv9aX/7b
         NfXxiMVzUq7t2yABshBbBF5Kefiu0igWGrn1coT5SmXxaVEK4g1T8dJwRwMefYLIh6kj
         ybMNFQYNNDpWs0bsxbawqOjR+lJBnYR3ury0juh2KtSzCqUMprnv8FmJ91Cyl7Dhsr7f
         nkxaIEKpWf/UbRi4/KL77FoifoQXkr2eFng6sdBQ/CtO9wzEl/xOSJf/nePQXByYM9Lm
         OfQA==
X-Gm-Message-State: AOAM532PDlueVUcsPFpfvTPKi7os+N7GyMMA9fWAzl3NyGtQmF9kCLP4
        GAOJuXsC8fLPnWq10IZmtXpq2Ac7Vkvocn+DE7yn6uw2Q55fg3pEIGLTM4mDVX2k0LT1obRX5lh
        TJCnTq/KGZ18tcoNpBKT8lFWKgbhV5+rz/DAQNQcS
X-Received: by 2002:a17:906:2a92:b0:6cd:4349:dc1a with SMTP id l18-20020a1709062a9200b006cd4349dc1amr1177107eje.648.1645687768815;
        Wed, 23 Feb 2022 23:29:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcQyzME5WrcWwgAuYq5z/evXLw2LeDvM6ae2sIMB9/BQkttObW5lgeyZo194lQMxlLMlPxTw==
X-Received: by 2002:a17:906:2a92:b0:6cd:4349:dc1a with SMTP id l18-20020a1709062a9200b006cd4349dc1amr1177095eje.648.1645687768567;
        Wed, 23 Feb 2022 23:29:28 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id b4sm862553edu.105.2022.02.23.23.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 23:29:28 -0800 (PST)
Message-ID: <ec0c90b9-58a9-669f-fe4a-73e60df335d5@canonical.com>
Date:   Thu, 24 Feb 2022 08:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] ARM: dts: Update jedec,lpddr2 revision-id binding
Content-Language: en-US
To:     Julius Werner <jwerner@chromium.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20220224003421.3440124-1-jwerner@chromium.org>
 <20220224003421.3440124-4-jwerner@chromium.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220224003421.3440124-4-jwerner@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/02/2022 01:34, Julius Werner wrote:
> This patch updates the tegra20-asus-tf101 device tree to replace the
> deprecated `revision-id1` binding with the new `revision-id` binding in
> its "jedec,lpddr2"-compatible node. This was the only DTS in the tree
> using this binding.
> 
> The revision-id2 (mode register 7) of this memory chip was not given in
> the existing device tree, so let's assume 0 for now until it becomes
> relevant.
> 
> Signed-off-by: Julius Werner <jwerner@chromium.org>
> ---
>  arch/arm/boot/dts/tegra20-asus-tf101.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please use scripts/get_maintainer.pl to get the list of people/lists to
CC. You skipped here Tegra maintainers, so no one would pick up this patch.

I bounced the mail to Jonathan, Thierry and linux-tegra (+Cc), so
hopefully they will get it. If not, series might need resend with proper
addresses.


Best regards,
Krzysztof
