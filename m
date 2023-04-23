Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0A4C77B73
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Apr 2023 11:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjDWLGB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 Apr 2023 07:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjDWLFy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Apr 2023 07:05:54 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C4730F8
        for <linux-tegra@vger.kernel.org>; Sun, 23 Apr 2023 04:05:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-504e232fe47so5980691a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 23 Apr 2023 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682247937; x=1684839937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oBnCQEBGXtSAEIanLhSekClnyHSr24Ok+VnVMLZrEI=;
        b=hv77IVehUa9xkU3c4CDNCnhlAG5dlsNmPUNm6jZ3PWzcrnMy5fI+z0sIajzCfXGJy7
         Ycxfr9xH+wFiFAM/gYRit8kTE+aej+eqdoAVOMta58gih1+KUjG/FPFpJsJhbmp6e9FE
         kg6b2q11cN9HORCLf6H84PgsgHftBzT1fWdDICqGh9M+kxYaR60O9UqL6rLJFdeJlT8v
         8IbeMnq/aQ/B5+LPSVj7Ir3JRDEmJL2P8bZmAZMqRlcr0st7TKc77hrDkWdHrCibhVP+
         k+qOhdY6+wSV/SWIMGJ8WoKe0i/Nw3ugTRsE+q3M6Q9hlAk/9p29WaimxTKk56SeG7rb
         q+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682247937; x=1684839937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oBnCQEBGXtSAEIanLhSekClnyHSr24Ok+VnVMLZrEI=;
        b=CFYKVs317GuCd4MisOI34ssUQQhtOtt97KNO6tmaPWni1nA+X1p3iNhw0i4Vfex1/N
         FWj5BM9wxtpCh4ndjmvs02idxN0nSu4iWBafKoBUvMwdd2YDbL+e2SWuXiXHJ64Da3tY
         ubBcpmuz4HwnY7VdmX7ju3Yv7FpfzOp8hR3qPcZOfeepngGnZLEU++LZQP1GmNnTFYWe
         OyZzT3KiW9d6kxzz0VyMnCldCgTbFJGhspXW4mvGEJLAnxhdrQx7R+mbC2uhyZVt4niZ
         etTJUKZ6FZC378BLyvqVwYJ/XSDTvxJj/aWBPWYfRo1rwnHEAMcOUHJQVdna8HXNGcIK
         QhRw==
X-Gm-Message-State: AAQBX9cXwVsoGmmJ988ONab5Cn/fBkKjsCAKzuL3Z3eie6BMeXrEkdsD
        oxogG1bnc6FfShQwjQCpMR1rZw==
X-Google-Smtp-Source: AKy350b1gZdRRS99FXwzdyRQvuYGxvtRfTqL3wNCEdC9oTnowvf0c3qWXdTnD0zdTodXYGJA5CPqbA==
X-Received: by 2002:a05:6402:14e:b0:505:7d54:db93 with SMTP id s14-20020a056402014e00b005057d54db93mr9808233edu.21.1682247937604;
        Sun, 23 Apr 2023 04:05:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5d52:d466:d57f:118c? ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id o10-20020aa7c50a000000b0050504648fc4sm3603764edq.80.2023.04.23.04.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 04:05:37 -0700 (PDT)
Message-ID: <b58bdaf6-f0a4-41aa-e271-53cd223e9bb3@linaro.org>
Date:   Sun, 23 Apr 2023 13:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: More dropping unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230421214810.1811962-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421214810.1811962-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/04/2023 23:48, Rob Herring wrote:
> Another batch of dropping unneeded quotes on $id and $schema which were
> missed in the last round. Once all these are fixed, checking for this can
> be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

