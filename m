Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC4AC54EE9
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Sep 2022 10:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiIGK6Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiIGK6O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Sep 2022 06:58:14 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CEB8D3E6
        for <linux-tegra@vger.kernel.org>; Wed,  7 Sep 2022 03:58:12 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y29so2899233ljq.7
        for <linux-tegra@vger.kernel.org>; Wed, 07 Sep 2022 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IKM8Q7h7DhmkZcNT/ovGbRUjTQGFQvPY8l9yVR39E2Y=;
        b=VN4CTK1wTSHhO/JQHt4YeD14+4Bex9SURm9ys2I9Y9E1VK321hgUU3Vg+BrhRsoJyH
         ZylejopAIlyxFTa2No8cof4nkKLZ5qwshND72RxfCBRPRs/TdR7XFigsAXXNt4o+NhkY
         8ygZol/PORK29rql4KzTPO7+oWoY/X1F2WPrKm9Oo4KYe6bHGB6/6FfawTwwZ6ykWo5t
         wEHIjKwWOUAXOSIWvSnszCDfyA+38LKjRxCaexpuENogUHm/YFnZ3FjiXScJ5yFQAhs8
         bY6R7v9DAv8JC/9qsJA/BceRVEQu7ON8HXX6yJ6IPHbEsIIvBVj2NJ0173M1V69yi50q
         yi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IKM8Q7h7DhmkZcNT/ovGbRUjTQGFQvPY8l9yVR39E2Y=;
        b=Z1anvIKUOxCjc4OcL2VT1UwGcqEZPWQEMKl2/qDpLlDzojnQ/0E1jri27LOWF+qZYZ
         eLshoSFuW1+VtitRhd6IB17q7Wtl1jBKKVx8bQo6BdRcoAg4/OqHfVYJDTy70F2AtwNy
         Dqrp9qDJUDEsv3Feug5/2pcKvr2G79GMkcUPUzvBpv0j8ehNCHOFQopku5cDKVY9Nrzt
         y1ODJqPvaWr9ReDQoQlofg11HGvWxiWN+Us8jWZiaij/pVRWUh5ZUmDdi4o7EkSLL+fp
         5SkbUX1o7L3f4Ze75ahLfGn5WhZoRRfb9iH5cuW0K2/1gCp47Y7Lxeqjfxf3ihsc8Z7C
         DNVA==
X-Gm-Message-State: ACgBeo2AbDeSOtX1cFq1OjtHbgRRQ0/PmYbyxEbi47vSNqL6xJAt5U3E
        +ygACemYnJ+xL7U2X0e9jZgqIw==
X-Google-Smtp-Source: AA6agR5oDFn7ilykcXLvWcVzwobc5wxgalg0pbv8etU2MwU03o/ikyPHsbImXPqq3CXmJF/7zRaurQ==
X-Received: by 2002:a2e:2d09:0:b0:25a:816a:2e62 with SMTP id t9-20020a2e2d09000000b0025a816a2e62mr759769ljt.147.1662548290798;
        Wed, 07 Sep 2022 03:58:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t12-20020a195f0c000000b0048aa9d67483sm2399815lfb.160.2022.09.07.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 03:58:10 -0700 (PDT)
Message-ID: <e1145bd8-e477-9a20-00cc-3d5f5e4f7977@linaro.org>
Date:   Wed, 7 Sep 2022 12:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/8] Support for NVDEC on Tegra234
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
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
 <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
 <1dabfcbe-7729-1a96-816c-68ae524ed4aa@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1dabfcbe-7729-1a96-816c-68ae524ed4aa@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/09/2022 07:27, Mikko Perttunen wrote:
> On 9/6/22 20:50, Krzysztof Kozlowski wrote:
>> On 06/09/2022 15:28, Mikko Perttunen wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> Hi all,
>>>
>>> this series adds support for the HW video decoder, NVDEC,
>>> on Tegra234 (Orin). The main change is a switch from Falcon
>>> to RISC-V for the internal microcontroller, which brings along
>>> a change in how the engine is booted. Otherwise it is backwards
>>> compatible with earlier versions.
>>
>> You need to describe the dependencies, otherwise I would be free to go
>> with applying memory controllers part.
> 
> Hi Krzysztof,
> 
> the memory controller patch can be applied independently.

OK then... but looking at the code it does not seem to. Anyway kbuild
robot complained so I expect v2.

Best regards,
Krzysztof
