Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0615C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Apr 2022 14:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239356AbiDXOhx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Apr 2022 10:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238971AbiDXOhw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Apr 2022 10:37:52 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA97233A17
        for <linux-tegra@vger.kernel.org>; Sun, 24 Apr 2022 07:34:49 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id p18so10505193edr.7
        for <linux-tegra@vger.kernel.org>; Sun, 24 Apr 2022 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+IvreAFlZ7WN1oSh6mz8g0KZPjFboEMtyxdYXlqR+YE=;
        b=Ipg2a/WrYl020qSef2xIrztFmw2oE8T58hCAT35PInriSj0D56ksqS7VDmFLgviXJX
         Ice0CBq08htvPn8/d6vUxQNRlRJ7dHRqk/jJIt/6daoKzbjtVP+OQnrZifOZhLOnZ043
         hQzb9WYUXHwp405jlUUZiXkcbd9ms4dNAtjMHSaElujpVf0S+f5vOrTdWUr/TBta0zYv
         9LLkVNsTHliu8ljLe0dgzRCUlEncQSSKYs1LzQawwpccWuIqZcgMvsmHmz9JWR+D5RU3
         O4F8EnWE0sDiczy/0feGtEigLfkp1VUT8DYUSQ1xUh7GZk6nLOKky7kiEbrwFrz/ubYP
         gCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+IvreAFlZ7WN1oSh6mz8g0KZPjFboEMtyxdYXlqR+YE=;
        b=DbmPPquNKiK5aK6IXPwEdqphwXZXbuKVbnLuTbL+Bj9t1/jaqU+JhfOp0PX42Njqua
         pnqSHzfb07n7DVUG+pQbVeNB1U107RGIk8PjIYrvJdjIYz+rBiJL5ELFHkUrCoPwBCQv
         nEP+9i/oi/MUoIYj5ZWMLP0v7ohgS6bbnjTTk9nXRlPzyWJcOS6vLDnX4EGzzOmfDeK7
         QAM79wuV+ht3ZejCX7qW1wH5odqWy3KSgJOEeWbAxQzvwjSSzCO8HCGW0fqd/PPbxUNj
         UAYe21PyQ0q1G2HxY+TXbymjcy/53VOC3vttsUu35viYLJlLjZs/EUmJW4A3YY2vxDg6
         xx5w==
X-Gm-Message-State: AOAM532G0rtsjOa4TiH/CAlr6Ts8vTWSy/iwAaJWULKvfBl5dmOcjNhj
        PQTzsdSFfwCgOAFxMHILX7umDw==
X-Google-Smtp-Source: ABdhPJzzsu4vRs/Z/xkWPmrBGOmgzzRujE4OVmNwYy6mi28SnMI9uYv/8FN3JlyozQ8KHS7wjC0/Lw==
X-Received: by 2002:a05:6402:209:b0:416:5211:841f with SMTP id t9-20020a056402020900b004165211841fmr14594595edv.59.1650810888302;
        Sun, 24 Apr 2022 07:34:48 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z6-20020a170906074600b006efc5a283b4sm2664832ejb.89.2022.04.24.07.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 07:34:47 -0700 (PDT)
Message-ID: <47ccfe2d-5b96-2a76-90b7-6c3679dcec27@linaro.org>
Date:   Sun, 24 Apr 2022 16:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Patch v7 3/4] dt-bindings: memory: Update reg/reg-names
 validation
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     dmitry.osipenko@collabora.com, digetx@gmail.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220413094012.13589-1-amhetre@nvidia.com>
 <20220413094012.13589-4-amhetre@nvidia.com>
 <YlbSGEBKgpVC51dZ@robh.at.kernel.org>
 <60db2153-2d78-646c-1e5e-e89346991b0c@nvidia.com>
 <011311d4-7139-c10c-edd7-119f5466469e@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <011311d4-7139-c10c-edd7-119f5466469e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/04/2022 07:20, Ashish Mhetre wrote:
>>>
>>> New, added properties cannot be required. That's an ABI break.
>>>
>> This is handled in driver code to make sure driver works with old dts
>> as well. So is this bindings change fine or shall I change it such that
>> dt bindings check shall pass with older dts as well?
>> Or as mentioned by Dmitry, I can update the commit message to reflect
>> that ABI change is intended and driver is compatible with older DTBs as
>> well.
>>
> Hi Rob,
> Can you please confirm how shall I go in next version?
> Is it fine for dt bindings check to fail if driver is compatible with
> old as well as new dts? Or dt bindings check shall pass with old as
> well as new dts?
The driver works fine without reg-names and accepts old DTB, right? In
such case, just mention this in commit msg, that the bindings require
reg-names but backwards compatibility will be preserved in the driver. I
think it's fine to alter bindings such way.

Best regards,
Krzysztof
