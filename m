Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171C4C6FA82
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Sep 2022 18:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiIUShX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Sep 2022 14:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiIUShW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Sep 2022 14:37:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A94A0314
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 11:37:21 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x29so8109714ljq.2
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=21yo/o9B1Z///KQURij6FTrdwpuSR6f9Iw+FckBY2pQ=;
        b=scx5aDinqwOzyktx9EfIUAeNOHk77EkF6br4UcMXBuVwtoxL9iYFi8xijVRCpHvPV9
         F7MTHj9+nQr5Qn0WPkx8Rtx1szwHU78eK7p7AxgbblziBHJxioaz3RnNszdowlC+iVvs
         I4HKglXBuw/40CeoXtNAye4gvB84iHMZpwzxnJD0VPDz7EjxINsV0EJP4RFNEURGHWBc
         Bj3G7xztwKJwVeMwPGJzAZyvlEtVeydENF+4Oxhy2evgKC3rD2H2yY6R6PuQmJ0747K2
         PQ9NB/hn8JOuKmantMPWAh5Jb6HeKBQuoqZAs289cwEOoodh8gNpoqmO3clxM25sGAg7
         QJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=21yo/o9B1Z///KQURij6FTrdwpuSR6f9Iw+FckBY2pQ=;
        b=ycdRRwhURkHXIv+y8caW7dTjQvCJf9JAEeYrPOqXxR+2V34vGLoFqG1HeV32mTNYMf
         2gBRaApky5oYSAIiwip909k5x9wSX13gNuunbYQL5LecvyMQMDUhTQO8J2ogLIeb5W1O
         k4oDtIOdzIfEnx7zJZNUWkIInJQ1yploG4TBs32ik56AlPEDOE62rTU1uxMQW+MgJ865
         YLRydRi7CMAnVKJjEzDFbCuULSj2INhTfPPaofdkZakZTOOENO6fmojsVPm6889uoa0c
         UtWp0hs8Rs5EuqN0oBke2p5eHvzg9Ver1kNxmTdmUcy1XB5ZbSPRxFLXqGXB50yeCfqs
         Q5Ig==
X-Gm-Message-State: ACrzQf2CoE3UkYtDTu2qt80YsMDsymOQxqakKdq1YsZXcjk8PJ99dwEP
        KCD8T0T9G3M8gM2qWodg3oGPBQ==
X-Google-Smtp-Source: AMsMyM62wnzWt6Vp8mUjb+gIZEsui3L9hXgPsI7/JmBOT8VcKQ2uhobjPCK+P25klFmqdlSyfydITA==
X-Received: by 2002:a05:651c:1951:b0:26c:6215:1e92 with SMTP id bs17-20020a05651c195100b0026c62151e92mr2540306ljb.240.1663785439395;
        Wed, 21 Sep 2022 11:37:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651205c900b004979ec19387sm532855lfo.305.2022.09.21.11.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 11:37:18 -0700 (PDT)
Message-ID: <8cb14446-01ec-255a-5bf6-e16098628f60@linaro.org>
Date:   Wed, 21 Sep 2022 20:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920081203.3237744-2-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/09/2022 10:11, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
> has been loaded by a bootloader. When booting NVDEC, we need to tell it
> the address of this firmware, which we can determine by checking the
> starting address of the carveout. As such, add an MC API to query the
> bounds of carveouts, and add related information on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

