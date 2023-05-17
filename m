Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD4EC7EE2A
	for <linux-tegra@archiver.kernel.org>; Wed, 17 May 2023 08:49:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjEQItd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 May 2023 04:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjEQItc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 May 2023 04:49:32 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8534849DC
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 01:49:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc456cc39so749778a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684313369; x=1686905369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OD0C3nZ8z9gjBYEFpqDfiRlm0u5lH5jK1nwISvRKjHg=;
        b=prpHwMHSnMat6comn9Vx+sA5FKtmagSwuKgZu6LSSMrRKhJ64xUSG0tuf43aggqMqt
         lh9AMJh3buWnAfEeVxUVKAYw7T6HoKhl4wlusfF39r3QjkDnh0muzFtkJ1Dg/wnent58
         6U39JYG7isW4TmaBmuy2jKG2JqhQylmCTOEjYjNNLRRNHmVJt33Qat08lSMzz+JbAQ7t
         +LUldVbshWYLbvRt8AdCJ4VvIyQO09oftz9rymeg96QrUa+5h+o3/loo9rytec4LNg66
         VjOcFgbd1nBT4KxPAupgF6Zw4I4Jb5RrCRNbjBJw2G3P6lAkipQpn5zmxg35vwXqmvg5
         OwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684313369; x=1686905369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OD0C3nZ8z9gjBYEFpqDfiRlm0u5lH5jK1nwISvRKjHg=;
        b=Xw2Hgm8vPUogwVuayTzIqUcz6fk4Pb67WRRTFQZ68blRxjErpk509TxD2bhh687qBV
         I9RAnFw6cJgLYyB+txuVY7/kdC/CTp7d3HmqrsLT0MHLq3M8VwihbjlCxFjGm2xXpGsU
         3cXwtKdoi2uxWJzfI05NncTw/BnK9q3+4aEBFxEkZmCpctRsmbjHypVLejeEDEjTsXm6
         yhG2tfoR/Hkg3jw8D5j1zynWL4YbtKq8usLF8mx+viincF39B65rY4LWhzd5NxhEDUPv
         GRvIgFnkgKJFDIi+Z1S55pYoZTOaT/GJ0mV1Sp1DPRXlaTAwJnv4F6rYSF21Y6x8g6zx
         Z4EA==
X-Gm-Message-State: AC+VfDwhwldGM94zJpDoW1PuNVBcvJFlLkNIKLYHYMaQ+nwlNDHYLHh9
        N+0EzCdN9jZozMTge+K9xhePPg==
X-Google-Smtp-Source: ACHHUZ7SwpTS7cXnaJ0gkuk0w5mwCe4N04JDiT9fRauhtzbGSpHcBUU9I9UuCfAG4aWPbuEtczoCRg==
X-Received: by 2002:a17:907:a0e:b0:94f:450e:6a76 with SMTP id bb14-20020a1709070a0e00b0094f450e6a76mr36434698ejc.61.1684313369061;
        Wed, 17 May 2023 01:49:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id gx1-20020a1709068a4100b00965a0f30fbfsm12011483ejc.186.2023.05.17.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:49:28 -0700 (PDT)
Message-ID: <9c507258-70df-c11a-9fd8-8101e533f5a3@linaro.org>
Date:   Wed, 17 May 2023 10:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: tegra: Document Jetson Orin Nano
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
 <20230516095850.2426604-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516095850.2426604-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2023 11:58, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
> Document the corresponding compatible strings for these devices.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

