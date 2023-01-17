Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5856C3DA78
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 11:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236834AbjAQLPR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 06:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236839AbjAQLO1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 06:14:27 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071E13346F
        for <linux-tegra@vger.kernel.org>; Tue, 17 Jan 2023 03:14:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r9so7411006wrw.4
        for <linux-tegra@vger.kernel.org>; Tue, 17 Jan 2023 03:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFlBtUA9NIzJ+Xj5+nFksMtQglLnDQLd6VLPQ/Pooa0=;
        b=snpHESDxX1Vxaw5PQT1Y/Jbqk9pnB6CBgGsF04oMFvYrDY/b9ZcOz4zonAnfVeJZuT
         4RJnfQ/RLIhEkhsqkIWy25q/oHBjq1cWnNG+/VCS833NNymCMnIrZepUHhoI+4fH3Slg
         D61XfzM30fGnEYEZNp2HY/8BaXGaAFv9MUKGAZG4prnVt0jxrsLCHjQerPZmNg6WQmsP
         AmhfGLPHH6+DBEtxk8t1FYX53RKgPbIcbjpYFawc7EMUhw6f3NV76HwMSY3F8R8UYDJ3
         F/1T/IE/bWvdLoWQpx1bHRu4VPPO1n6sv+/dYSWX7i6lMn1i4ByXym89VREh5vfJZmVq
         Eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFlBtUA9NIzJ+Xj5+nFksMtQglLnDQLd6VLPQ/Pooa0=;
        b=0nMPZkD7+/j1ZPzJUD3MvWJ7LkyNBUBMWP6JhX3L6NtiiPCZuMq0ug2PlEq+deugJj
         QJMTE1ZuQwH7VecbJYLssAWt/i8aQMxeqLBGByCxeMcDwhmsgm1AdAEKcCRBdYsKffo4
         zs7L3gIbCJ6xq1JC5lx2NWXZoyXSubKpCsbG8TqHv4JPAWnmSLrgyGQgr6SmECX3jV5n
         7y5RiJwCTSSmzU8qpqKI/ZzJrSeUyOq9trDF22JLeUG6VWnpYzsAKIolHbLFGLV/qHGA
         +1VcZlbbwjV8F56nJNFwYS7bRjBj/wYG2z+6sqgVwy5xvW4B3kWpH+1DjIkvmfN24/8X
         EYlw==
X-Gm-Message-State: AFqh2kpe3yHv86vCOMICArUyi78jfRRU1uEOlJaCAp1ohOHtluF9ruPw
        fL0rHQeNpUenBNkYmuWIATM3hg==
X-Google-Smtp-Source: AMrXdXsmG4bl6joXx+CVOeEvwnUHC/f2bfOz0R/qWQZo3huwHefkZB5ncWzhOURdhZimrBa9haFXNg==
X-Received: by 2002:adf:d4cc:0:b0:2bb:ebc4:2f62 with SMTP id w12-20020adfd4cc000000b002bbebc42f62mr2614967wrk.52.1673954062742;
        Tue, 17 Jan 2023 03:14:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q17-20020adff511000000b002366553eca7sm5980643wro.83.2023.01.17.03.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:14:22 -0800 (PST)
Message-ID: <73ac4da5-0fec-40de-cc4a-55fc403d62e5@linaro.org>
Date:   Tue, 17 Jan 2023 12:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND PATCH V4 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234
 XUDC support
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
 <20230116151917.94193-4-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116151917.94193-4-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/01/2023 16:19, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Extend the Tegra XUSB controller device (XUDC) tree binding with
> Tegra234 support.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

