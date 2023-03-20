Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36F7C7618A
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Mar 2023 11:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjCTLht (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Mar 2023 07:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjCTLhs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Mar 2023 07:37:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F9A136E5
        for <linux-tegra@vger.kernel.org>; Mon, 20 Mar 2023 04:37:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b20so12480792edd.1
        for <linux-tegra@vger.kernel.org>; Mon, 20 Mar 2023 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679312265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fM3eIYbobvS5DDqQUcIkhyQtOcZNqI/Pay7lYZLf9M=;
        b=vnfkxjbJKY/cj0yVfHazpv5TAv7i/jDcCM0vCW+RAa4PswU9B1hCQcREUaVNwcnq7G
         9jfUCy7LcDCwllcJ9u3Ex9bAd1Bd96DWeage7PDh8n8wLjIpWs/E3jjoZvT8/sFpUeqD
         A/9DjXPU0CJchyqQdVijBLYmxFQGcvvLJ6JBQ0lXq8ch3zhpHQmP8fRrgy331AS+y/R9
         wUlBSMGC+l/MJoHdxj0AflGjMtV9Ca8Qk9/n1VjGzWQc/O94nGqvUWO8ShLZkBa1BTmz
         FP6ZLZXtAam3Lz+Kq3tLouVrkNGuhtPeg3DU8eqXC1doVp6X2QbudRCW5pSWTUEjISNZ
         iZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fM3eIYbobvS5DDqQUcIkhyQtOcZNqI/Pay7lYZLf9M=;
        b=ICRIcYMVxbSVNxwMxD5LxT0mrZCVWpRWj767e8loyz2QQnKHchGGwz3YCesV2E5V+0
         lRhwQDsPa8dw1KJ0cUNnTVJo0ZEiZ9YGj+xczVlDh+AFaMfpyGMusIMA1roeAvNC8bjB
         hjGKB0AUlGOqSIDTdMlCMRiyXf3vzgovgFgMl8X829nX7E7mOmkjNSio/c5s1cCWXkZf
         vJAIA0akbBF7lnKtnhDYiK3RgFlMlNlOjCWMBdP4FfB6tvX/2MIGdcHfpKhyZeoYTUz9
         Z1JG/tIOlI91ZhoUW6bdcGVWMkVn7dTvJUa1V2pOPIAmaca+niK4a/84Kyd72817RWMN
         n00g==
X-Gm-Message-State: AO0yUKXm5P3zv+0ewEavdI9JURKBqF9rmbk4wTh3fj9xk3UD3hsza5C+
        FM+LBlNRnnB9BMZpl3prd9w/Ig==
X-Google-Smtp-Source: AK7set9oF5tyv8ziN58375bQ5wd/TNbo9jcf4Lfz12tgMfepWY2XEtHs2ZgqWYxs3p3JKyMrs93K0g==
X-Received: by 2002:a17:906:6712:b0:932:a14e:4c57 with SMTP id a18-20020a170906671200b00932a14e4c57mr7963489ejp.76.1679312265306;
        Mon, 20 Mar 2023 04:37:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id rk28-20020a170907215c00b00933b38505f9sm1731067ejb.152.2023.03.20.04.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 04:37:44 -0700 (PDT)
Message-ID: <b33da2e7-47df-ed07-50ba-a197c8b94457@linaro.org>
Date:   Mon, 20 Mar 2023 12:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, arnd@arndb.de,
        linux-tegra@vger.kernel.org
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
 <a464381c-bdff-4b8e-6e41-229fbf332372@linaro.org>
 <20230320113403.4oyp7anjuh7azy6q@wslaptop>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320113403.4oyp7anjuh7azy6q@wslaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/03/2023 12:34, Diogo Ivo wrote:
> On Mon, Mar 20, 2023 at 07:50:27AM +0100, Krzysztof Kozlowski wrote:
>> On 19/03/2023 20:42, Diogo Ivo wrote:
>>> +	emc: external-memory-controller@7001b000 {
>>
>> Node names should be generic, so memory-controller.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
>> Check your code for warnings (dtc, dtbs_check). Node with unit address
>> requires reg or ranges.
>>
>> Best regards,
>> Krzysztof
> 
> 
> Hello,
> 
> The external-memory-controller node is declared in tegra210.dtsi, so
> here I am just adding more properties to it.

Ah, ok, apologies then for false alarm. This Tegra notation of extending
existing nodes is crazy confusing...

Best regards,
Krzysztof

