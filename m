Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BD5C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Apr 2021 23:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AFA7613D7
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Apr 2021 23:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242491AbhDUXeC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Apr 2021 19:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234681AbhDUXeC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 19:34:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0154BC06174A
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 16:33:28 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id h36so15123099lfv.7
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e6EH0xRo04NgBzgtXB3b7oeb+R442Tw23QSfh3nfOfQ=;
        b=JYzToSwrmOzuuudH0QGYpDFqzoYWbWq6SJm+k14NWhber/9sI3QORtFuxDLXhV/vue
         o55bAM9YpiN0F6l41f2AvUL3BSrPg7zbN759RsGCzhw0uRDyj5ZF/jRSblAj3kDTxqxk
         g8VsoR64h5+26f+3y46z0CnHEokcW+0TRliuzxehgxGvqiETJaelkFNvaBeQPIsBl+pT
         7wQwOs6cYFyCNGGQPd1KH9LzGJ//oQ3KRuwwrlLQCd8P08euJmCbN//3LfCQW9cmErDl
         Bk0WlnaUuSMEjsuufDTr44Mfecu20L0B3+/QV0SjVUwNfzyonYuXkQd/MyN2Z3M9maUf
         23Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e6EH0xRo04NgBzgtXB3b7oeb+R442Tw23QSfh3nfOfQ=;
        b=AvRBDex8ZSy1RVudIhnhR35jPAztRXI6Fe01gaG0INy6QxqUK5XpvnsPODFOCFqEkM
         y0i7cVHUySDg1i86ooWVkMp+H2w/Osl+VvJQAgNxQpWXTTtMdxsbA/04VRzIFM/rzoEk
         DuVJHDIKAERIxkKVwzxkEgt6CIFJi94b0aQE4ZlKMvxcFIu6gq55z0Yy20OalBdkK4iI
         i3kdX6MWmeA2Ko3aW9H+oF0ftE5y5fU+amUr8AChHZ2cFN/0QTR5syhAAcWvGJBznAC0
         V2PsLwyl/y38Gek6cC7O43FPAvU9QZMnQalGv6Hw3ZelL7KIFAp5wXqPHOySxNlWyqb3
         RkDg==
X-Gm-Message-State: AOAM5330FznQOyelSwXoQ/DKByGvmCCLjB15NmyD1ShDdt87MvJFCnHt
        ne/ShHXcsqtMJwpTBO/yAlY=
X-Google-Smtp-Source: ABdhPJxsK/5csxgiYQ7pJhcu2s+lCyfc+/NOLed586o2XDFUQ1/zL4P3jCF7Jw3NQVMlQn+5qCBSGA==
X-Received: by 2002:a05:6512:39c9:: with SMTP id k9mr455290lfu.14.1619048006528;
        Wed, 21 Apr 2021 16:33:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id n3sm92520lfe.77.2021.04.21.16.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 16:33:26 -0700 (PDT)
Subject: Re: [PATCH 06/10] memory: tegra: Parameterize interrupt handler
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-7-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0f7359c-4633-986e-be2e-63d47384df11@gmail.com>
Date:   Thu, 22 Apr 2021 02:33:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.04.2021 19:52, Thierry Reding пишет:
> +const char *const status_names[32] = {
> +	[ 1] = "External interrupt",
> +	[ 6] = "EMEM address decode error",
> +	[ 7] = "GART page fault",
> +	[ 8] = "Security violation",
> +	[ 9] = "EMEM arbitration error",
> +	[10] = "Page fault",
> +	[11] = "Invalid APB ASID update",
> +	[12] = "VPR violation",
> +	[13] = "Secure carveout violation",
> +	[16] = "MTS carveout violation",
> +};
>  
> -	return IRQ_HANDLED;
> -}
> +const char *const error_names[8] = {
> +	[2] = "EMEM decode error",
> +	[3] = "TrustZone violation",
> +	[4] = "Carveout violation",
> +	[6] = "SMMU translation error",
> +};
>  

These struct names are too generic for a global names, what about
prefixing them with tegra_mc_ ?
