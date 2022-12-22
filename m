Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B434BC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Dec 2022 11:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbiLVLhk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Dec 2022 06:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbiLVLhj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Dec 2022 06:37:39 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E040528E15
        for <linux-tegra@vger.kernel.org>; Thu, 22 Dec 2022 03:37:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f34so2298408lfv.10
        for <linux-tegra@vger.kernel.org>; Thu, 22 Dec 2022 03:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3dFp/oI5Q5dQ5wwd/ulSr6dhNqL6ZqSNPqtr9kld8A=;
        b=Y+Eab9fFOqbuSpMMx9QaFXsViJH309/ale7ipzeUyetsoBLPSNm3BbbrGFKBXdDT/1
         Q8SH2+MEOAoGwVjM40B1iFPFSvDqablZBCL2vEH6tK0GacMdKICAmtrHrdZV5b1lMzUV
         ox/XX271TFp36fjcjjD7yrl/5wD+sU/pFzeQ0dOG2KcM0xoMb78yNS0EGOLcBQaOkTj3
         EyO+14jpPrYyI/RbjV2gg2OOTlBqbmp3GQQ/dqJMwshgqM4DmJWJwYFExYQ6dOKIXLG9
         Vx8JY6snphj8c5KyJGwvzXGpuFvAUGTnoTGHBVwcrPhauiyzvLw9VvU47jghvFh1edav
         B5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3dFp/oI5Q5dQ5wwd/ulSr6dhNqL6ZqSNPqtr9kld8A=;
        b=T7q//c5eJOIRuRGqAAPRIhU0FBBBhh0jEb2edhTHGUmLT1zuq1pJDLxMtEcutSVtBr
         pk9ZK7YXxYezp0OTCuMPjAPQBUZtCtUCJ3+pAkzEhwsW1pmRf7COBguaWDP8Jhtfgx/v
         rXw4uIafANIGIlvEtsuZbXQvGbKR7Rot18XpcsYCvUNkjEfdf2SZ3O8XNYEB3/PDAQ/A
         lm1ykowZJxg6j6jBThHib2QIEYRcnddymgoZR65FHMuiUtAN4PYoZwIImHawX0T37mYT
         7ixZWnh80BiK5Cd65zWx9k90PManA1hC6JZ8CdEFFR34BhO0pRo7HmKYEK3Rs+pgSC/T
         CHEQ==
X-Gm-Message-State: AFqh2kpNmxrTeLTErXaZV68AdFH+NHoMGOJwCUGdD2q0Z1rQJc/4If3k
        BqszhIDEzTuN07hyE0Fa3F/lPA==
X-Google-Smtp-Source: AMrXdXu5ipMG9KfK2kHMM5bFqFrJnWNtPxPN+7XKps3+Y9S/13kRFXNoin/6IB1zH/viyyNJ3MbNfQ==
X-Received: by 2002:a05:6512:1115:b0:4aa:e120:b431 with SMTP id l21-20020a056512111500b004aae120b431mr1829201lfg.38.1671709056308;
        Thu, 22 Dec 2022 03:37:36 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t17-20020ac243b1000000b004ac088fdfd2sm44242lfl.85.2022.12.22.03.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 03:37:35 -0800 (PST)
Message-ID: <db223161-a424-c4cf-09a8-ff2241fda71a@linaro.org>
Date:   Thu, 22 Dec 2022 12:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Patch v1 09/10] memory: tegra: get number of enabled mc channels
Content-Language: en-US
To:     Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
        dmitry.osipenko@collabora.com, viresh.kumar@linaro.org,
        rafael@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     sanjayc@nvidia.com, ksitaraman@nvidia.com, ishah@nvidia.com,
        bbasu@nvidia.com
References: <20221220160240.27494-1-sumitg@nvidia.com>
 <20221220160240.27494-10-sumitg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220160240.27494-10-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/12/2022 17:02, Sumit Gupta wrote:
> Get number of MC channels which are actually enabled
> in current boot configuration.

Why? You don't do anything with it. Commit msg should give the reason of
changes.


Best regards,
Krzysztof

