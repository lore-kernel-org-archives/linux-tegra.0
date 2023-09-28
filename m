Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE0CCE7B09
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Sep 2023 07:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjI1Hih (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Sep 2023 03:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjI1Hig (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Sep 2023 03:38:36 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048DFB7
        for <linux-tegra@vger.kernel.org>; Thu, 28 Sep 2023 00:38:34 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4064a0639b6so19897155e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 Sep 2023 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695886712; x=1696491512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKzzcFRe2VplRfr6R2h6JRusbvnJYPDky4iW2ifDT3M=;
        b=MgrPdD0PkR5oFqdUf2hRFdPWUUs6CtXDzJJ3oBgsrdZSrIiw1/ywZwBvDqGejpEwux
         pcLceDk/80oOX7hCio/sbiBGzsHr/+QGsvSCwHB84EF2hbpM2Q30KWwCwsR4PnuDeZel
         jnt2EKCT1tMm2e6VmwJQOuoLrM4mgyPGKpddWZKOxelvDpYz61fgQT5zxB1ebjspetPg
         cP0iY+JLzqww2Ykco37AS+We4EvSBqt4xeGFx3NCS/VAmWCVKiFEGRqNw0lL/zVSyVc0
         qCuMLYOH5byS/Smlzg8EyFbLA91j6OA25xSyxBE76YS5Tgi/D/79UR7+W71C1AdDaNgM
         j1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695886712; x=1696491512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKzzcFRe2VplRfr6R2h6JRusbvnJYPDky4iW2ifDT3M=;
        b=CTuBndpc5kIy3MQNZW7IcSOnUErCo/Tam51z9vhYwufMR3rRjkcl7FEW0QY/R9pPId
         3mMjQi6v6GzUkJf6HpPY3pp+IB+RxEtOZ5Kl2C0UXYVpStDh0GSpyDyaGtZYdzuYnVmS
         aYMquffmB98Qs1rky3lp9cM9W6ipPjmIqYoHqXAYieyDkwIgFOMRiSJoY25TBVEYppJ0
         5x+beo9mZ6dhRXvCp3rEl+I9NLk2pDFSs6EFPuG2B1qsnFHiZglg35wW8HpVRxU6RVch
         TT4KjuJRrzqNPIJp9XXnUy3+NwNagcgSLwN4Hip8/lZZj1wP+jMZC6Yo5pQcfbdI9hOr
         GdKw==
X-Gm-Message-State: AOJu0YwZJpe8b4zKvH064cCWVrWS8+0s7xgIQ5d9lm3naRTaBM8sJzR+
        579FIr42HWtH7XZSgQAU8uukGQ==
X-Google-Smtp-Source: AGHT+IHlxudOT+0WQEHXM8R5fIZXNF/+mzKQMiuWrpNaj1uCitxMDDn+XL2jAmyw0Q2PHrQ0Xokpmw==
X-Received: by 2002:a1c:4b13:0:b0:405:3dee:3515 with SMTP id y19-20020a1c4b13000000b004053dee3515mr476951wma.27.1695886712314;
        Thu, 28 Sep 2023 00:38:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id z5-20020adfe545000000b003177074f830sm344363wrm.59.2023.09.28.00.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:38:31 -0700 (PDT)
Message-ID: <9de0e708-ff82-cc2b-2bb6-00c01cd5ff57@linaro.org>
Date:   Thu, 28 Sep 2023 09:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: thermal: nvidia,tegra124-soctherm: Add
 missing unevaluatedProperties on child node schemas
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230926164500.101593-1-robh@kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230926164500.101593-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/09/2023 18:44, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties as needed, and then add any missing properties
> flagged by the addition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

