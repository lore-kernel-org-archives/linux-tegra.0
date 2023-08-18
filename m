Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20F1C678DC
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Aug 2023 10:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244622AbjHRKQc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Aug 2023 06:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358628AbjHRKQZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Aug 2023 06:16:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C182F30C2
        for <linux-tegra@vger.kernel.org>; Fri, 18 Aug 2023 03:16:23 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fed7c2ec92so657155e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 18 Aug 2023 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692353782; x=1692958582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXTabiaJxmNJ9oq0XkR6nAkvHWMygGA5C17EAhns0wg=;
        b=Re1LexwemUlpCxdH5CwQry+LacDXBZ3xU8v+wzoqheIa2Cq6/9Yk9uMG87xllqHH7X
         wmQ+4TJOo0skEVkVECkUA55wgxIX/sfKRdWuJ9J5zC2fzQLGdFx9CpwGc1/wXSwhuQLC
         MU9sAwriA9fuaSCfYSZJKABxo/VPxIxWmxn+6Go27BgmDd8QSW5IbS0RIyOLM0pABZju
         tj/gKtz5JpB2OkFOhwcxkREeaTyRQmZAZzaeOFINxEF+otVLfdWEh4kkEzhTkf+Fcfnd
         GU3IVtc2KWbP3mHmfnaama0dLjKMyakYLdqni4hZYjZoCcAcBFJEb0um3Z8Hxr+7iEom
         blTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692353782; x=1692958582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXTabiaJxmNJ9oq0XkR6nAkvHWMygGA5C17EAhns0wg=;
        b=bEceM0TKC8zZTQqohn61JqXgy2RLBkX+kVOm9GwKTvc2hUjfrVBlYHvBBIso1FzF4e
         C+H/nYT4+3fZ4YDxHhyOLiZHEjXwGjOTiuQ8vHznfc/NrAmHojgdSpoUzrZ+WJAxWGfY
         mR0RWYfxbrEhqodggUUrLbs9ETdAzjyv1cp2ZWCSFMnQX4Xpdv/w/K6vopzbrid5T35C
         fkUKvYsAmQPIbvcEgYlJQu/TMjaabBXmtk40dSe6Y4L40ASj5ZQ7ZPmiTL40Ha54fNrE
         kWbeK2ipyM7U9Yl/YrfzM1d/eiWWMy60vhrKHuqE1KJ18A7Qwt6yeKk2CM8AbIKbzXH4
         pOSA==
X-Gm-Message-State: AOJu0Yxu9O2vOH7DcF8aTPJn96moYNp9r2GxrnI1qQQtHXEFGq+GyXW0
        QXkdcn+e6TlobFwzqDtLSiosOg==
X-Google-Smtp-Source: AGHT+IF0yzR5wFadKQBSeUgKZJ0RQXMaeexJUOe03PNuqST7rF77V1m15KKYyPooKo53sQenEX6Brg==
X-Received: by 2002:a05:600c:5111:b0:3fe:1c57:3be with SMTP id o17-20020a05600c511100b003fe1c5703bemr4769676wms.8.1692353782169;
        Fri, 18 Aug 2023 03:16:22 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id c15-20020a05600c0acf00b003fbc9b9699dsm2303355wmr.45.2023.08.18.03.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 03:16:21 -0700 (PDT)
Message-ID: <cb967ebc-0e15-b0e6-badb-4f9d2ba09178@linaro.org>
Date:   Fri, 18 Aug 2023 12:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] clocksource: Explicitly include correct DT includes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michal Simek <michal.simek@amd.com>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230714174409.4053843-1-robh@kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230714174409.4053843-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14/07/2023 19:44, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

