Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204BEC6FD19
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Mar 2023 15:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjCLPre (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Mar 2023 11:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjCLPrd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Mar 2023 11:47:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047803251A
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 08:47:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id k10so39228423edk.13
        for <linux-tegra@vger.kernel.org>; Sun, 12 Mar 2023 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678636050;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v06rTjtysizk3dYCZcIUf1KvlS398ZKl4+/CAT/kS9s=;
        b=iRISoVV8Bpkzo5XBe3YglS/r/o2V3CnHOgvfpYeVIqu47OH+39HRNimnWye5ZYxzGg
         m2AesnWsr6oosg0kI7V/09MDBkT2vXH5t6mTK7wilMk4XTRpsEm7a2gHawrQny7GqmFi
         Jd3cvvG5C01lsUtB/WMKusrwVdANlqthSUKmTBSFrGFeB7bI044lRfjFKZx4jHdTfTCl
         0e6+UOVnI52EnESnl1iuLVj7r5jdxnxn9rSBViisqVgR/8jZyySWBkJbWPyB9Y8CEd2y
         EqWifTcAxsoqnZONaO0sCov/Cw28N5Ox0HZCHz98W+e4V5WiWLscJjVdYlEoa8ddkKwq
         IfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678636050;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v06rTjtysizk3dYCZcIUf1KvlS398ZKl4+/CAT/kS9s=;
        b=3/wPCOETMV1UG4pLp8SDwbO93E5jr5QUGg00vxPLCZKNj2M94G7k3Jo+KM7nl5DAzm
         fZRVbYiUGYDDKwyR2y2khsGYrK/UmZ8jIu4Jh24qlUH0QFAu0sHhxieSPE/5BEQyHvt8
         OngM6vigxtvB3/mwJohGd3OQfQSZ4zvBdwVheQdK0Ab+aoA+jzd5OzfzfTzfmVkUGZ6t
         NQyHrjii/iPwBp6mTK/RejpHLKKasZVQ+TVPJIWCK70PPd7l95tzCWOz4cL9Qj8xtnKH
         iG0FVmOk1rEvjVsjjWj4fkhjruiBzifBPVoeUSXPTHEV3kJIy22q3Ejg2dmFuH51xlwP
         HqIA==
X-Gm-Message-State: AO0yUKX29ePWH/zP+SnGe5YsVp1uIXaDxsdEZswkKIdpVSHKNOuoY5aw
        qWhL+hwUrVrTpGK67t7qyPlsFw==
X-Google-Smtp-Source: AK7set/8mnKxkBnVmeDGbrLKovb7mhQG1E1trFhSe8qzJNLReFB/XjWSIhrw/2G+mxb+U/KIS4YVkQ==
X-Received: by 2002:a17:907:a686:b0:902:874:9c31 with SMTP id vv6-20020a170907a68600b0090208749c31mr7146528ejc.35.1678636050540;
        Sun, 12 Mar 2023 08:47:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id t7-20020a50ab47000000b004cbe45d2db5sm2302101edc.37.2023.03.12.08.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 08:47:30 -0700 (PDT)
Message-ID: <f6d9c84a-1c75-d9b4-59ed-39d6c5b310a9@linaro.org>
Date:   Sun, 12 Mar 2023 16:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V3 2/6] dt-bindings: timestamp: Add Tegra234 support
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230310190634.5053-1-dipenp@nvidia.com>
 <20230310190634.5053-3-dipenp@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310190634.5053-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/03/2023 20:06, Dipen Patel wrote:
> Added timestamp provider support for the Tegra234 in devicetree
> bindings. In addition, it addresses review comments from the
> previous review round as follows:
> - Removes nvidia,slices property. This was not necessary as it
> is a constant value and can be hardcoded inside the driver code.
> - Adds nvidia,gpio-controller property. This simplifies how GTE driver
> retrieves GPIO controller instance, see below explanation.
> 
> Without this property code would look like:
> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
> 	hte_dev->c = gpiochip_find("tegra194-gpio-aon",
> 				   tegra_get_gpiochip_from_name);
> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-aon"))
> 	hte_dev->c = gpiochip_find("tegra234-gpio-aon",
> 				   tegra_get_gpiochip_from_name);
> else
> 	return -ENODEV;
> 
> This means for every future addition of the compatible string, if else
> condition statements have to be expanded.
> 
> With the property:
> gpio_ctrl = of_parse_phandle(dev->of_node, "nvidia,gpio-controller", 0);
> ....
> hte_dev->c = gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_node);
> 
> We haven't technically started making use of these bindings, so
> backwards-compatibility shouldn't be an issue yet.

Unfortunately, I don't understand this statement. The
nvidia,tegra194-gte-aon with removed property is in a released kernel
v6.2. What does it mean "technically"? It's a released kernel thus it is
a released ABI.

And since DTS always go to separate branch, your patch #4 breaks
existing DTS (return -ENODEV;) - it is not bisectable.

> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---


Best regards,
Krzysztof

