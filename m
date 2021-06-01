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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338BFC4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 19:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 028B960233
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 19:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhFATjE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbhFATjE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 15:39:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC69C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 12:37:21 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 131so20832289ljj.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cSp5hqs05XXCNNTPSjQORzjPnTTrYdZbLYUgEXSEK6I=;
        b=kcHattntPKB/qfuChWQei6NE+1nkXOSzUJnjyqPiDC9YAoZPyJJe+3+P2EYIlb+l93
         WVqftkRasLe2dgEVl2gYdN/vW94FRK+Xd1CMe8O2Kp1ItZ792SRHcS64kSkvXJCJFw1F
         0baTqCxKCb85fPdXT2AXQdmZ4fdZajploLfwXYsUvJuULsLCKnt4tFUILU2vIH+rp82q
         J91pVY7bztlGC4WXQtMAoxLQzjp16I/CLdL1Bo8CjRc7ZWgCeU+rQEG4jsjkL/PbiMpT
         ZrJIPUA9DRKxHiEw2AfEW18ecy+2AzTa+vH9Re1hZFuzG87Q2q9pBIPIL2cZ7q+9I0u1
         4/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cSp5hqs05XXCNNTPSjQORzjPnTTrYdZbLYUgEXSEK6I=;
        b=XTBpI/Z8JvblD8DGkcTunzOLy+cDDyvPo8980JrmxMrlHRX2fZh143f8Y5/jALGJAJ
         ybadhJijJXw0+jGmV/qjbefBNdjYcFsa58vIN9AN006ih2ixdmLgkBHzYo8MOTLcnbrK
         +/S+iJBT5qbu4QSwWVi2jbfMxYM0BWIwWNA9Zadfzi2epTWdDRA+q1lI/zmhUAaiqw5n
         oeweAzBF2Gt0zaEVaKet5S1TFXVTW52E7Enr5hzrDoWbsVbGoP/xF58Q8XZDbcQE6+0c
         gfNJWp0sOq05q2QeCDXl8Ut9MfWPhTD+VTfYUYNdInUZgLlDdCKLmSnjyU4NEKXNMSgj
         v5xg==
X-Gm-Message-State: AOAM530J5YWIBC5sOixCLYAxGME7fKZvHifhyVNSO2k4kBETiHpdMkwx
        XU0fNGXeo8wOedObD3ozHgY=
X-Google-Smtp-Source: ABdhPJw4lu+Ru2YnSZrcQ/DlajkxKUu0OrUW3tbI2XRJHlKGgHJRdXXugEo3679mmbKPTSX6z8Rm7g==
X-Received: by 2002:a05:651c:1189:: with SMTP id w9mr22479145ljo.4.1622576239907;
        Tue, 01 Jun 2021 12:37:19 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id d3sm1760184lfv.9.2021.06.01.12.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 12:37:19 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] memory: tegra: Parameterize interrupt handler
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <20210601175942.1920588-8-thierry.reding@gmail.com>
 <9ce2210f-538d-607a-10e4-802ab849deb5@gmail.com>
Message-ID: <ef9e119a-941a-cb15-0084-137a07cf0cf1@gmail.com>
Date:   Tue, 1 Jun 2021 22:37:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9ce2210f-538d-607a-10e4-802ab849deb5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 21:53, Dmitry Osipenko пишет:
> 01.06.2021 20:59, Thierry Reding пишет:
>> --- a/drivers/memory/tegra/mc.h
>> +++ b/drivers/memory/tegra/mc.h
>> @@ -135,9 +135,13 @@ extern const struct tegra_mc_soc tegra210_mc_soc;
>>      defined(CONFIG_ARCH_TEGRA_132_SOC) || \
>>      defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  int tegra30_mc_probe(struct tegra_mc *mc);
>> +irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
> 
> tegra30_mc_handle_irq() doesn't need to be made global, it's defined and
> used only within mc.h.
> 

You could make this function static and annotate it with maybe_unused.
