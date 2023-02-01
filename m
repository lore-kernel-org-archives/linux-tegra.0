Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B312FC38142
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 08:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjBAIN4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 03:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbjBAINz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 03:13:55 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C405D13D
        for <linux-tegra@vger.kernel.org>; Wed,  1 Feb 2023 00:13:54 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l8so12012869wms.3
        for <linux-tegra@vger.kernel.org>; Wed, 01 Feb 2023 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5mT2hrWS+VAr13J0u6Nts4f2ZSqjWnL3egrrOBO6/Y=;
        b=RBgXKAtkB/8spSJCXwbTizPK8CYc/iOE/ZsMeBGyUG0lQ/UrEPuLhkdKsdTTtY2VbT
         BQfeSw2GKgvFJ8qZJngtJ1R1RmRNh5y7JhnURwtsWxn+hfrRsIXCipdDK156w2+pn3UK
         GRB38B024sTjW4iv6Gm67niMPGorMck6lFPu/mkPcY2XbTizfeo4RhsAVSGNf8P0B2Uq
         vSZ4Ct/fPTvJ0jPZ0SaFO7UanPYKaK8thkyJNf0Zi5DLu0Kq6SbP+8V3+CnepM2LyeCQ
         JcxbEuB9J9js5NDV+uB3pCRpANh2NY1wehv8LOXCZSNz488n4xPaEW3bNwEW72uso4Xc
         ujkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5mT2hrWS+VAr13J0u6Nts4f2ZSqjWnL3egrrOBO6/Y=;
        b=QGu7KjmRKM1IgJ1F7aYWOC6MgXNX6w33gb8W7vr+K84dYohcpxzeHEEquVJ7kBKdV+
         CuYr8PfUqiCBrEBOs2F7ulnr7s6jjvKO9wF7c3vFqQmjJ9mJPOYnGF/60fmea64XQZht
         Tkzvd73eAI9qDlzPA+hB/+PbiLNXjXiyG4bJsmpCXL1t+vz84D9DRkaaYVPTe3VDQe/5
         I2JQOKGxEPqHpSrsbqbJXJwJCSHVu9thDDQFGnuX5WiYOcTWR/UBO1i2LLmgQ0K39bHt
         92AXAr+KtzmI8/ssIRj3MDcyGvd4wR78BfG0VZ4O+iHRzsITs8YuYfMm2piZxo3soQd7
         QL/Q==
X-Gm-Message-State: AO0yUKWFhEjnZzRiFDz25ea8LTiJIiW7GeS479/obw7MpTb1oxIOlR5c
        ifDcp9L1o6FG4+mgryGJycSRDQ==
X-Google-Smtp-Source: AK7set+x/w/Q/FMQQUirGNdkE3f4f+nKijB2O6lJhL56R9MWFzDVGr/uuQKdMrvIKGkqF0q4GTkSdg==
X-Received: by 2002:a05:600c:190c:b0:3dc:43cf:7302 with SMTP id j12-20020a05600c190c00b003dc43cf7302mr6762111wmq.3.1675239233002;
        Wed, 01 Feb 2023 00:13:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b003de664d4c14sm891170wmh.36.2023.02.01.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 00:13:52 -0800 (PST)
Message-ID: <422ff910-a780-5582-0a53-8859738a7e69@linaro.org>
Date:   Wed, 1 Feb 2023 09:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V10 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131175748.256423-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31/01/2023 18:57, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V10: Limited connector indexes to 0 and 1. Added 'anyOf' to ensure that
>      there is at least one connector present.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

