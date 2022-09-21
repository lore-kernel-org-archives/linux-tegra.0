Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF13ECAAD8
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Sep 2022 07:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbiIUH0O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Sep 2022 03:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiIUH0N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Sep 2022 03:26:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71A7832C8
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 00:26:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f14so7761001lfg.5
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MnSWHO+RfIeNaFDFqzwfoinv6Rc5CwKZJPD6zpABsuA=;
        b=oGeYxT8aHwJywwRm9eJhQOM9sgCnqevsJOBHoKUDP0+7PklEDRAvCLaJe/vz6zR1d6
         y4f2oxBEvIhXfqhHO7uQ9YnXtNXBCIboI0eQFWaq4TyaYVFZvfqjWGwQ7VyK8ocoRNA8
         7peHkg3H5So8Obcb5qU/Dez9PuyDebutxrlc5xQ33SPuP/4Stg5Zk7C5otypLXlN7NGZ
         qyMS7nTrzlJ63Tbl7Gx79PvRkjxfOJNoND1Rl77PZH6bouqlScCNb2ga3k7w6V3oMUaN
         axbLtlfUzULYO1Fge3E/pkyBDcJ3il+gBPdtHwOEGS3rowWsAFEzxqpFNaZNWZ8t5bkd
         Z2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MnSWHO+RfIeNaFDFqzwfoinv6Rc5CwKZJPD6zpABsuA=;
        b=Sc4c+xRqVGGI4ksNFID/wV0LbGawwHmeesVqp0jNxjvZhtmYrsgYsrY9fWmrwXedpv
         0QRngC/MLyyU3k8+uVkMNI0Qe36q3bXt7EXUJBRWom37BQ/GCHtcziHxiqkjcb0SkAbm
         xl+RlUlY1XtspE1hHVbySiRNb/tuMIwFexSiwpMdGVmj4JydvCnxO9auUMRNnav9q70X
         7Yhq00aUcrVZM6Yyx4epZaXhtmNZfLJj0fXFQujozSHPX40hJ8WxmQh/Wum2QQIAneMd
         SsDudf1QVn44Hg9g4MpG+PMBOXpd7xyl6zr96HcHHKPzfZHhvvUbkepN3gI6uZAUysQW
         OIkQ==
X-Gm-Message-State: ACrzQf1KMZBztOq2zuKyPIp9R7XY30IglmHM1TbDlI8F1Gm/jCQDE4iC
        NhYYUe3l9ZDWPkaqtTpnnC2iJg==
X-Google-Smtp-Source: AMsMyM7FEIha/kn5S4kD/G/mfgRfoNfCWlTclJDQXi2ZBv8md5pqDwyGpYTNn55ERJ4Gzh4WeZqDjA==
X-Received: by 2002:a05:6512:3ba1:b0:498:f547:866b with SMTP id g33-20020a0565123ba100b00498f547866bmr9174722lfv.653.1663745169086;
        Wed, 21 Sep 2022 00:26:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d9-20020a196b09000000b004999c243331sm315377lfa.141.2022.09.21.00.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:26:08 -0700 (PDT)
Message-ID: <89d925ea-f550-6903-1c24-b320ae5a82c0@linaro.org>
Date:   Wed, 21 Sep 2022 09:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/8] Support for NVDEC on Tegra234
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/09/2022 10:11, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> v3:
> * Updated patch 3 based on comments
> 
> v2:
> * Updated patches 1,3 based on comments
> * Added Acked-by to patch 2
> 
> Original message:
> 
> Hi all,
> 
> this series adds support for the HW video decoder, NVDEC,
> on Tegra234 (Orin). The main change is a switch from Falcon
> to RISC-V for the internal microcontroller, which brings along
> a change in how the engine is booted. Otherwise it is backwards
> compatible with earlier versions.

I asked you to describe the dependencies and patch merging strategy.
It's still not here, so I assume there are no and I am taking patches
relevant to me.

Best regards,
Krzysztof
