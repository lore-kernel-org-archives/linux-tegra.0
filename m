Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18F8C43334
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jul 2022 10:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbiGTKZq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jul 2022 06:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbiGTKZp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jul 2022 06:25:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD962C65B
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jul 2022 03:25:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id h8so2748698wrw.1
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jul 2022 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z3jJrPCyTzgDwtpGSTySZxdrcJyisqv97waetDyPkCQ=;
        b=sCjSMvoF3N/YhfKOZGtrMzIcX8cxlimIX+SK+xYqEKXCgqRBkY6lqsBsABZeIzh+yO
         fs7bpLWl5dF11SXyxp2l2ky/YDoitDwkLXSzsJXTdFeDqwELcxATYktrzyTS/C4/T4IY
         JgsT1ntJ1QXffjy2ODz6SR4YXqq7KNb8YHpj+he7lVSwm4iLYPRECN5eeo7ro1o3nPP/
         PZbXUiLkskZo57ZubzaNZXg7QXwDE0omfYBWo9GiMjC6t317K8u0L34/Sc72s53X8OIQ
         e6UI8uTxSO1TjumE2XjVAOID5Hi/NA/DOlLZ9zNnpqDsRvdwG23Di8YOItQGQp4620NZ
         wLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z3jJrPCyTzgDwtpGSTySZxdrcJyisqv97waetDyPkCQ=;
        b=6EHiYztU9Qz851Rs5hvN+Ob3nVfyyLLniCe9or24kNc8RmFvkONb58crQqpvpHPdeu
         e5VxFEQB1XnHv3E+NnWRVjDNB4kp3QFq3PHruchvYdvYCLGOOowDX3UdZ9eq5mdGBEca
         ZoBi9qbVdONSys2t1qT2kmR0A9mj0Z3wLEvgQZofhGpAHWI99L92abcJOju6TG4WW4vg
         oeNdRM0gwWZMVuXJoGfwxgFD18t6O24Y+UtHoJJadAjd1mEsED5ZPXSN/AD28kRgfk/K
         XrzBUjviOz1xOcpxg5knBh2Isr+XJnfS+3FQBhdHclwYW8/mhlfPJeAb563cbNx6JG4m
         LPWA==
X-Gm-Message-State: AJIora82baTaWkPLx8NQOl20YjvFBywhoDoiPAjEoko0IAALpbhB5hWZ
        7dqyIbCQC+n69nxL8IyASpGyKg==
X-Google-Smtp-Source: AGRyM1uyrwWzo5MmrGdZYIEhYMnIovU4xFppY+X/ePoCuDLQGMqHhKKIOZHt43U5jzpCtuBuuiuoBA==
X-Received: by 2002:a5d:598e:0:b0:21d:869c:f6b5 with SMTP id n14-20020a5d598e000000b0021d869cf6b5mr31135914wri.399.1658312743177;
        Wed, 20 Jul 2022 03:25:43 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b579:e7b5:219d:267c? ([2a05:6e02:1041:c10:b579:e7b5:219d:267c])
        by smtp.googlemail.com with ESMTPSA id o24-20020a05600c379800b003a327f19bf9sm1890514wmr.14.2022.07.20.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 03:25:42 -0700 (PDT)
Message-ID: <e35a741e-0d90-9aaf-5563-9721648dfc11@linaro.org>
Date:   Wed, 20 Jul 2022 12:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] clocksource/drivers/tegra186: Put Kconfig option
 'tristate' to 'bool'
Content-Language: en-US
To:     tglx@linutronix.de
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, kkartik@nvidia.com
References: <20220718213657.1303538-1-daniel.lezcano@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220718213657.1303538-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/07/2022 23:36, Daniel Lezcano wrote:
> The clocksource are built-in, not as module. We don't know if the core
> time framework is ready for that.
> 
> Revert back this option to 'bool'.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Applied

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
