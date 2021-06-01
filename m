Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E80C4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 18:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8484613BD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 18:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbhFASze (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbhFASze (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:55:34 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8332C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 11:53:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a2so23370274lfc.9
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H7SxkImpqjj3z3YdGpQXt/B5fzGnAypCUgNutEy7Lz0=;
        b=mObZXlotTjUsvhFT4nnIwWPsmM9JkLNDbeSBYuMwplqPFfdTtCDh4SFVIM6svoTk3F
         9cHQFE0yC1px1z2aWNmbpAxBksJ9yuBitTtVqHp+fqMZmhY4hOxq+NWTHT92qLdMcJyq
         BEwae3yc3JFUnu8akSKntE7Wg0O91T+eScUmjzX0SUnPj5v/cDwGQ//4S8Opl7ms6rPX
         UechJivn9Ilhw0s8YdfWrVT+PXS7uxKdltEZqj5LOe8WJcFHUpQFsvEba2Hv/r1tH4q6
         rYITsbsOGwWdaexFJttFZ12mRPWuZSscXoxszECcgaKixVRTN+h9XbMY9PJ/rI49tl9e
         iQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H7SxkImpqjj3z3YdGpQXt/B5fzGnAypCUgNutEy7Lz0=;
        b=XHOLGAIbnx432f2HnYbesWkQwczZJMMu8BQw4+WqVUimrmfLuZbvZ9cUrWEl7yEuZZ
         cB7fsLJdoIqbbnNRCI37+ai315awiRIDkUpzfEQfshdCKim/gj5eFu/3nT1acVkLD+Ua
         qLBTtMlC36LgBdx/7nNLYw1fPvHC355ySCLYHEHcxiDkt2jOxeYgjf3xmNQD20kFYJwO
         JUX8M6WHHI8YVfKqkSdQd38NzEeX1IujvyMt+2ZqBaKQ32PvNQhbW5OuHozd1TZZ+WO1
         Giidc9k1fMhoJCdR8ITx+YYqAT4q96ic0ph0W9n02pAIQBzk60Lfka+jesdoweci9AcO
         XlSg==
X-Gm-Message-State: AOAM532Ab9XZzO+ELMVylvLRafM2+d8siuYTxSXDdNv9M6UPUu0aU7NX
        7ygJNnDAcTO9z2r/toWQEbU=
X-Google-Smtp-Source: ABdhPJy/Mkq/ISz0SlrS+V4d6CDL7R83HblP4DpOWHRS4jrYOuCMxJDDH9oTEglQvNrNXjjBg8NiRQ==
X-Received: by 2002:a05:6512:6d3:: with SMTP id u19mr20390771lff.236.1622573630164;
        Tue, 01 Jun 2021 11:53:50 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id e8sm1364465ljj.28.2021.06.01.11.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 11:53:49 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] memory: tegra: Parameterize interrupt handler
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <20210601175942.1920588-8-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9ce2210f-538d-607a-10e4-802ab849deb5@gmail.com>
Date:   Tue, 1 Jun 2021 21:53:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601175942.1920588-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 20:59, Thierry Reding пишет:
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -135,9 +135,13 @@ extern const struct tegra_mc_soc tegra210_mc_soc;
>      defined(CONFIG_ARCH_TEGRA_132_SOC) || \
>      defined(CONFIG_ARCH_TEGRA_210_SOC)
>  int tegra30_mc_probe(struct tegra_mc *mc);
> +irqreturn_t tegra30_mc_handle_irq(int irq, void *data);

tegra30_mc_handle_irq() doesn't need to be made global, it's defined and
used only within mc.h.
