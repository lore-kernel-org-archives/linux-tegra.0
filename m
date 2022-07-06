Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12E4C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jul 2022 07:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiGFHkf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jul 2022 03:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiGFHke (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jul 2022 03:40:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6976D22B30
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 00:40:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bu42so4613278lfb.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=tHC6g1e0eMvimI9KqKd/ut+Z55C7x7KvZC11uhVlLBQ=;
        b=pMhY5I6oLgh6rf97jnoly2SY51aQrh/m0AW/L+woLnGunZh3dyg4KK3UqWPRnJbhvJ
         iAHHyav7sIhYJeOPcE+M8r9s+6pZlFbXiN20t4LJQE8RJJvdQ4nFgNufDnL/JPasKTy+
         W+PXTEzXClRqKAqtNZYqTd+CL5sACsTQ49C2Z3696xC7gzIIi/+xV9ufmjo/y1rxk2vm
         kpqgltwz0V5cD/mnnshEd9lhqbRDfGOmRjS6N8oh2ryvA5zmKqJ9MjW/nvG+ASqR9Ixt
         eU7JqcnYSEvcgcg/MS1sBTwd8TVOcQVZL9BL5XI90XGGTHUsrL2weMsH9KhllNdvmwt7
         ddiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=tHC6g1e0eMvimI9KqKd/ut+Z55C7x7KvZC11uhVlLBQ=;
        b=2dBUSruE76tk0+ySfVh+291acblTKOboN35keaOvpiBo9LITPvSooNY/Ef1dZ3zJkE
         sE5T0rmWJ/LvUDbJg0zG6nWlqj9GC2JACKH0VwhlnNFTxZIw6+6WbBnlQfsLpZipF+lt
         cI3fTi3MLXCe06tSceJVfotJ3FNyUpCL9dBnZEL3dWzBd3/K8Qj0ubmiy5xINuUZb8PH
         JC1WNx2yMK9bvwKOvUhYw4FndwrkcK+nl50iHNM0VXsHL1hfEh0p/vmlN5DAQv2X7jAd
         5e2auJ8S33CQTkJmv5Z7zP7X2XznTY5TchB+5LFt4vMfQ0WOLS/W+hD9zGdCBgy/8SJD
         luug==
X-Gm-Message-State: AJIora/6zR8N3u8MlnCKHNWLzD1/VnvaZdsZ6XgkMPazWHbpQH9IYZeu
        N9yH0NzHx387CbXWmHbBfdhAPQ==
X-Google-Smtp-Source: AGRyM1sUmxKidmtloQsmU6mxIVhwMR/efusfURXP9Md0qWiwboryqpDXm1jRxDwXDWbZpNhegi55Tg==
X-Received: by 2002:a05:6512:3a95:b0:483:e38b:528b with SMTP id q21-20020a0565123a9500b00483e38b528bmr4274849lfu.227.1657093231756;
        Wed, 06 Jul 2022 00:40:31 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id m18-20020a056512359200b00481348b1074sm4128441lfr.81.2022.07.06.00.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:40:30 -0700 (PDT)
Message-ID: <9513b46a-126f-667e-4ba1-a2a15d6d303e@linaro.org>
Date:   Wed, 6 Jul 2022 09:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next v2 1/9] dt-bindings: power: Add Tegra234 MGBE
 power domains
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, pabeni@redhat.com,
        davem@davemloft.net, edumazet@google.com,
        Thierry Reding <treding@nvidia.com>
References: <20220706031259.53746-1-vbhadram@nvidia.com>
 <20220706031259.53746-2-vbhadram@nvidia.com>
 <708c4a86-731a-c2a6-e3d3-df23ae7c35b1@linaro.org>
In-Reply-To: <708c4a86-731a-c2a6-e3d3-df23ae7c35b1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/07/2022 09:35, Krzysztof Kozlowski wrote:
> On 06/07/2022 05:12, Bhadram Varka wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Add power domain IDs for the four MGBE power partitions found on
>> Tegra234.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
>> ---
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Wait, I already acked this. Why do I need to ack second time?

Best regards,
Krzysztof
