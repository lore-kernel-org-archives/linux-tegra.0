Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17484C6FD1F
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Mar 2023 15:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjCSPTi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Mar 2023 11:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjCSPTh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 11:19:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F384B199CF
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 08:19:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eg48so37665130edb.13
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679239173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DiXOBbFB11Ip0nTIkggAfEvbZiGBEphpMg7tUKwDv8Q=;
        b=bAZDUQYki7wbeRanSmh1+yCFPmXSZwkqqGPdsRHdCVXC03JyOxd/Y/vKKL6tDt0jh9
         peEJUFK2/gYsoZAmerpiPJwZKpvbNp/99WxXsC/f1NobG99PlsgQVFMQn1Qf3eoXh9+q
         8bcuBj8FrRC3Fc4+nbMmcdPm3MrhPFmJnQ9MscLdwELrfACrj7LwL9K4mtLXZyHggZ14
         VLeHDsdF7oBtL2M5sz9sOTMsxHS7vBr8KEaqpBKqu7zu7dACUr+RhwnYgTklcFLvC2dx
         IVmL7pzPNLKUAbhjBrdREvYc5vm3GwNW9/oGnebln3gS2usBcuSWDAbvX+ehTgJexXXF
         yVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679239173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DiXOBbFB11Ip0nTIkggAfEvbZiGBEphpMg7tUKwDv8Q=;
        b=5J9l6EbR117rjGi7CcFF2SqnAzupwc+UhWti75qIOUWqSgwSDuZoW1Z2hHYwXqP1OT
         xgRzd3tpPKYugaP2k5sAzhQ9wcu1zBV5leVQMu+NP4ItaIuAMOinJ55fr+ZrTjW/aYwE
         ZE6bpDyoTvRIR+RRyAHl7huhXy7axJ9gCOYzAH8VkZCOM0zC7pAX14oVindoq0SzMqRH
         0u/OnaGvIM4ZGMHRzsQc6mDKZp8q6wAGVEtoXATAP3Ba8gE9PvEVwgBrAz2BOXAizpZK
         WdCAONuF5Jq7fOq2R9NqI3JTpP6iCUtz+BHyY5bVSHxX7iX1nqliaEbEACCpSdDG582c
         fo5g==
X-Gm-Message-State: AO0yUKWraB7GlWGM5tbHdSYDOOOOLZxIpPvW3cMd73u8GKbyi+crmml/
        lVhJMN7hxpT2A0g8+kDEZjKOag==
X-Google-Smtp-Source: AK7set+6EyPI1D5fB1UGRkWHuzffRXBguOqPVwrOUmlBfKF0ISupIco1O4Z+5HC+N3PLJzPHc1Z8qw==
X-Received: by 2002:a17:906:95ce:b0:8b2:8876:2a11 with SMTP id n14-20020a17090695ce00b008b288762a11mr5510823ejy.28.1679239173483;
        Sun, 19 Mar 2023 08:19:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id rv17-20020a17090710d100b00932fa67b48fsm2137433ejb.183.2023.03.19.08.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 08:19:33 -0700 (PDT)
Message-ID: <8782c1a1-6600-31b8-bd62-8ea5cb0ff081@linaro.org>
Date:   Sun, 19 Mar 2023 16:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Patch v2 2/9] memory: tegra: add interconnect support for DRAM
 scaling in Tegra234
Content-Language: en-US
To:     Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
        dmitry.osipenko@collabora.com, viresh.kumar@linaro.org,
        rafael@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        lpieralisi@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, mmaddireddy@nvidia.com, kw@linux.com,
        bhelgaas@google.com, vidyas@nvidia.com, sanjayc@nvidia.com,
        ksitaraman@nvidia.com, ishah@nvidia.com, bbasu@nvidia.com
References: <20230220140559.28289-1-sumitg@nvidia.com>
 <20230220140559.28289-3-sumitg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220140559.28289-3-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/02/2023 15:05, Sumit Gupta wrote:
> Add Interconnect framework support to dynamically set the DRAM
> bandwidth from different clients. Both the MC and EMC drivers are
> added as ICC providers. The path for any request is:
>  MC-Client[1-n] -> MC -> EMC -> EMEM/DRAM
> 
> MC client's request for bandwidth will go to the MC driver which
> passes the client request info like BPMP Client ID, Client type
> and the Bandwidth to the BPMP-FW. The final DRAM freq to achieve
> the requested bandwidth is set by the BPMP-FW based on the passed
> parameters.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

