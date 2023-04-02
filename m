Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B239C76196
	for <linux-tegra@archiver.kernel.org>; Sun,  2 Apr 2023 10:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjDBKsx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 2 Apr 2023 06:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjDBKsv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 2 Apr 2023 06:48:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E379ED1
        for <linux-tegra@vger.kernel.org>; Sun,  2 Apr 2023 03:48:50 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b20so106576920edd.1
        for <linux-tegra@vger.kernel.org>; Sun, 02 Apr 2023 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680432529;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tW+7TOlagUvWmJtVFJHl22fhkuH+2aKc+XL5snu6Uzo=;
        b=cv5sIp0UBeHlXf+jmaqhCJRUnWxJH21trKQ7vJaE+LHhkLsG8oiRP9mbB9/j2TVBNa
         k2xsxwOkQTpD2wSEgQhv4waiWsy07BpxQkASltnzFtyqW2fIjwSVB+94g03OsIu2dFIs
         tElyhw1V4wr5hrMueEoUv1zMdm4LHrQWDI1mq8nOIu6LgB32SzMfHHjfKw0BhNHFnDRl
         cUkoXq6HVVRvzabDnvISuji/i4jHWqoFrNCFMfpabgQob3XwCzTy1elpYyAIytw22QLW
         ZLq1N3BENpwa+QnoT4BL48pYlC8g9L+Cq7wAm65rL38Tbf8t0TyfFXTdbIWmhM7Uc5Wx
         fD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680432529;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tW+7TOlagUvWmJtVFJHl22fhkuH+2aKc+XL5snu6Uzo=;
        b=Ky3wzm6E0SFE+Hw2I0ESjHn/r6CQbAE/oSi8aBTslYzs2eR1A0hYXxC78MquMhvdA9
         nSSXyL8zuu7L8enNZp9DZG3kvLEuXRqadvF9GRrNEGjtAdpeORA67nfNB7ZrHPvYBl3I
         RJznx5F6djKbzsvfpuyjzlL/Z5lD2rsM4kdmxxkfm10i6Eiy0koypzkliZoV3HC5zsa6
         VRfhlgTFfUvIv9HsGAOgarY6vosVNrtqYTAcHROkQo2371R2YxmWYPU027kPjKj2fQVj
         5p9qkXDbOYr5GtIpSCBfAfydub5AuNv+BIBi9EDtUEzv/A0ikk5JQyCEFEWfrBX4w2xV
         DFqw==
X-Gm-Message-State: AAQBX9ecF1IfNdLetFY1v9TwJt7x0ru5uQ0ZDkO+fIWjk6/vX5FSLAPC
        MBmsvX6+qU9PmJE25GlQswcA9w==
X-Google-Smtp-Source: AKy350a9ti0wFRsYX7CDnCDMwimoQ+209hNtbHaA5HkE4+mkGOVRUdNflpysWcJQzRwTozpCdyvT4g==
X-Received: by 2002:aa7:dad3:0:b0:4fb:999:e04c with SMTP id x19-20020aa7dad3000000b004fb0999e04cmr31098522eds.38.1680432528999;
        Sun, 02 Apr 2023 03:48:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id ee55-20020a056402293700b004aef147add6sm3081539edb.47.2023.04.02.03.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:48:48 -0700 (PDT)
Message-ID: <05409782-c33b-983f-6e13-6b8fb87244e1@linaro.org>
Date:   Sun, 2 Apr 2023 12:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] memory: tegra: read values from correct device
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/03/2023 00:40, Diogo Ivo wrote:
> When reading MR18 for Dev1 the code was incorrectly reading the
> value corresponding to Dev0, so fix this by adjusting the index
> according to the Tegra X1 TRM.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Any reviews on this?

Anyway I expect resend to have full cc-list.

Standard msg:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

