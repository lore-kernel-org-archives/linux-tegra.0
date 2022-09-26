Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C20C07E9D
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Sep 2022 09:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbiIZJ1t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Sep 2022 05:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbiIZJ1Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Sep 2022 05:27:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05F5DEE6
        for <linux-tegra@vger.kernel.org>; Mon, 26 Sep 2022 02:26:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id k10so9871073lfm.4
        for <linux-tegra@vger.kernel.org>; Mon, 26 Sep 2022 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SAs267zzkbZc8WXFYLr/NLR/iCCUVjG9YIqyHkZX/Zk=;
        b=hhXgOHUdjqAAlSP04nrr2Wx7nQlNPh0efaR4V44EV2KFGJpduR/nACiFSOI+4Rzttb
         jpF1ltjDuIKOQg5YtQlR1YLiQJp3utaBj3diZ0Tskw491stWiVmsQCX85nFHnqx6NEt3
         dWMcIiSG04Yt49LN97N7TPXLJ996LwLWEK2zcP7Btfnvx3u8jdNsZaUVC7IbO3D9ktHF
         yOXDUKPoORPLqeEw0TShlX1VVjNfRxmRykS1nR4+A+XRuGAD7mI+WcKGZtauVagig63Y
         l6vGBHAQ4P0Z72SinKjZrGLOgBjHOZeUqXaXghCx5ek+MnhsGrKnexBJjv5dyZhzUogn
         0/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SAs267zzkbZc8WXFYLr/NLR/iCCUVjG9YIqyHkZX/Zk=;
        b=Y4PvqrRUZSVKiO6bDypsZ7WUNuLhkvxnGME2N2LUkiU9xbdM66+CYwfeOSubqaalqO
         w68cjdLuBADog63eJVcWzN/HPx8vmBol2QkAzcOgI+JUUQJXNljOWtF71fw9o/JR0Khz
         HPwU4/qlOq6IYZFT/ON8VeLkLhJ23LxzverbkvYOvRMxu9/esAjh88240k4W5kdzThsz
         IYoCeBZw7UMtAYAGh2zE5cNtdEQ9ZIgV/oURZHKtDu83xsqvGy791HwdayF9Xee5z0xi
         Pt/CpU02Hm3hOo1AW/5pguoR9suWls+RhKDI/k96HRFZ20yL4Bvvw5c2jvtgg95yTIVJ
         mLJg==
X-Gm-Message-State: ACrzQf23YGjrXz03F67MaJSpFJ+87/T2d8jdGaF5dH4Kfupg/hRUPK2H
        aCvoWgMMofmDpsDfrAsS45N+1Q==
X-Google-Smtp-Source: AMsMyM6TM4H2oxAb/1+bR6Nlgblj7yh+5ZedUKvDNsHUMQz23Pc6t8DMhBXAdsbtgOiL/yb97Z16bQ==
X-Received: by 2002:a19:f80d:0:b0:49b:29a8:db54 with SMTP id a13-20020a19f80d000000b0049b29a8db54mr8185541lff.178.1664184364894;
        Mon, 26 Sep 2022 02:26:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512214b00b0049944ab6895sm2469978lfr.260.2022.09.26.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:26:04 -0700 (PDT)
Message-ID: <55ffb305-950f-f482-5033-1d4ab1bc7eac@linaro.org>
Date:   Mon, 26 Sep 2022 11:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/4] memory: tegra: Use DEFINE_SHOW_ATTRIBUTE to simplify
 code
Content-Language: en-US
To:     Liu Shixin <liushixin2@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220922143344.3252585-1-liushixin2@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922143344.3252585-1-liushixin2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/09/2022 16:33, Liu Shixin wrote:
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> No functional change.
> 
> Liu Shixin (4):
>   memory: tegra20-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
>   memory: tegra30-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
>   memory: tegra210-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
>   memory: tegra186-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
> 

Any review from nVidia-interested folks? :)

Best regards,
Krzysztof

