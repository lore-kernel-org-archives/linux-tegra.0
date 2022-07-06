Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D37CCA47C
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jul 2022 07:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiGFHh0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jul 2022 03:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbiGFHhV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jul 2022 03:37:21 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413B822B39
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 00:37:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id r9so17351829ljp.9
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wLYIn0NItelgAXJCwbM/q0ny/IBo5bW15RcTBf0gD1c=;
        b=W+6Z3LONPK5Ra0z4gntAAtuDAffOwqyAsxR4AWvSIWc/YTOgzf/LbdPEU63qy4XgI9
         VzpkAqTC8qOhM0yktec60aOOZFTI3LJUUB0Q5T3fTr5OrAC4FP6peAYuazdrWJzUujTO
         C7scBcPjWY+2I8QK3G/CyzhR7FF6WUwfe14imXbSbhfK8GK0Qsdeqt11dBvDegCumsKF
         33xGLkEtUhAJxzUN52Tqbako3dDm4nSZHsbSQfyffaD79DWiKg9VnidPbikak+NJZ2Ib
         YkM1f50x6dx2jrz9fPWdfBR0U6Mj2CX5k0tQSS5OmmPmzUD90Zk+Ph/GGTR+l4MEDiEV
         tjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wLYIn0NItelgAXJCwbM/q0ny/IBo5bW15RcTBf0gD1c=;
        b=JYvJQVrQnhN4UtCmGtFi5/6rl6Kw1aWN9WuOXcIPdH9avVDMIEf8GyIazgPIAMQS+W
         oJsYJMJAGKNaQckolBG+e4zl8YQE52q3kp+EZUB0shPRg477ze2MfcfrVLMELvod8w2t
         taz1LnM0sMkfOCSOBB3ogr08spiNRNFZmlg/bdH4dbInIVvUh9kZPbEklak8PyX9kg0Y
         iW24LhSOYQyco8hYb5xB/fba+h/5sPJHLfD43myVnGHMWrWyhO+7Vf1D4+NZyD5Q8P+t
         3URSgZQmyxRwvBosYX7zLWWX000tOueSv9sleRkoAZONGLP2Zhc2JK933iFcHmOG4Xiq
         1raA==
X-Gm-Message-State: AJIora9hRlaaLL2S9ED7b53pwbbuL0tAxpaXeJeuTEXuhBWcl5geLc3x
        dXFuLOVfzoB+u7h+RWadC72Ibg==
X-Google-Smtp-Source: AGRyM1sgyFI4TrauOfkHKFmiUcxJfEwLMSwt/lf0cmYz3yqs/Bie2Q0Qc0fJrVea82hBhXpNy/SafQ==
X-Received: by 2002:a05:651c:d4:b0:25a:91c6:d9b1 with SMTP id 20-20020a05651c00d400b0025a91c6d9b1mr21881129ljr.400.1657093037642;
        Wed, 06 Jul 2022 00:37:17 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id h2-20020a2ea482000000b002556a17e193sm6035809lji.38.2022.07.06.00.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:37:16 -0700 (PDT)
Message-ID: <b74b66f1-f354-9eb9-357b-753bf81cde16@linaro.org>
Date:   Wed, 6 Jul 2022 09:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next v2 0/9] tegra: Add support for MGBE controller
Content-Language: en-US
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, pabeni@redhat.com,
        davem@davemloft.net, edumazet@google.com
References: <20220706031259.53746-1-vbhadram@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706031259.53746-1-vbhadram@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/07/2022 05:12, Bhadram Varka wrote:
> This series adds the support for MGBE ethernet controller
> which is part of Tegra234 SoC's.
> 

Where is the changelog?

Best regards,
Krzysztof
