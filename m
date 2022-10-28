Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6FEFA3741
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 02:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbiJ1CUE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 22:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbiJ1CUD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 22:20:03 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820F14BD07
        for <linux-tegra@vger.kernel.org>; Thu, 27 Oct 2022 19:20:01 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id g16so2750619qtu.2
        for <linux-tegra@vger.kernel.org>; Thu, 27 Oct 2022 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cykFnUK9bm/0PhHnZ0sXhtZ2At3ENMM99eYPdegdYSI=;
        b=AQJVYjKsyiTsjDySzOp48brbJiygd9QBWnj3eqx4ycythFdyul1dAGKYj+uTuabOYd
         R4JA8+FlW70IhjEgqggL9QziGlh7/l3LTgAYQkrzZHeF84hiTphL3mIzJP+Ji1/7KXk6
         Zxyk/yTJFtxODuiIdNpR1v4Tb/IHo1msssbiT/8gEcpo6dnsy/bBr5SicRVWQ/SYvoGw
         f6qwZB0YLz/+nKEAZgio2FOp3UFjxD0tDnV+/H+L80njN6vGAonlJVvXHAc6ao7Baxs6
         mKQQt1FP4htijiDoRDbs8D8DIX0D0JRqct708dGH7QvXcVsbvRvpY6AjgWqW0/q+3mAs
         VJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cykFnUK9bm/0PhHnZ0sXhtZ2At3ENMM99eYPdegdYSI=;
        b=slmV+j+EkyJesQuv8du0IaJcaG95k9arsI4xKMych5v96UtT8GoRsDA1vq1EHPwObj
         eqFQGgml7GFyWPL/ml45VU/v7vQmXeFyOmbU0lpBGNsiEvz/v8AsMUzzlQMl/62363lt
         lArO2QOxq1oe6AlJPHWj0ZK7tYxFxEljyYkLRostayxUlSFGwALGYYBJiu8mkm2qfFhR
         Nk8+1gyLWKiusLhO1iGxv5WU2k9AWB5RimNrPKxfsDSaNbo1sH4WfJczp4p2R9oEWSQV
         NoBNrmgrZ6hihVRnNQrxffbN4tKKf3ePJ4tQWunGtEXmOh38ky5aKQsO4xhe4v9jPYUd
         tuMA==
X-Gm-Message-State: ACrzQf0EVlkfn4FsfdznABzcJ+VdffXN093/ibiFuAdeRxI8kVIjMYho
        auiHyk+gdlhwMdgTyjjQNUtJSQ==
X-Google-Smtp-Source: AMsMyM4nFrse7LOawN/dKiRc/aj8ygVoOp4zOOXiLSE5lagp50tusE21h1qz86DoB8x3z2sSytqEbA==
X-Received: by 2002:ac8:7d94:0:b0:39c:ed3c:98a3 with SMTP id c20-20020ac87d94000000b0039ced3c98a3mr45065437qtd.628.1666923600693;
        Thu, 27 Oct 2022 19:20:00 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id a24-20020ac86118000000b0039ee562799csm1760187qtm.59.2022.10.27.19.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 19:19:59 -0700 (PDT)
Message-ID: <f5d2c979-a61c-e0d4-7a08-5b6f5b38dffb@linaro.org>
Date:   Thu, 27 Oct 2022 22:19:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
 <20221024145446.GA1763588-robh@kernel.org>
 <52ae737e-eb4f-9eb7-8b79-d58251062276@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <52ae737e-eb4f-9eb7-8b79-d58251062276@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/10/2022 04:02, Wayne Chang wrote:
> 
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: xusb_host
>>> +      - const: xusb_ss
>>
>> Drop 'xusb_'.
> 
> The properties are constant and we use the name to get the power domain.
> 
> 	tegra->genpd_dev_host = dev_pm_domain_attach_by_name(dev, "xusb_host");
> 	
> 	tegra->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "xusb_ss");
> 	
> we might not be able to drop the xusb_

These are new bindings, so why do say they are "constant"? New bindings
means you did not use them. If you used them before bindings... what can
we say? Don't?

Best regards,
Krzysztof

