Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070B8C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 15:41:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6473610A5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 15:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJFPnK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 11:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhJFPnJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 11:43:09 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D488C061746;
        Wed,  6 Oct 2021 08:41:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r19so11419619lfe.10;
        Wed, 06 Oct 2021 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EcWwiS6s+2hsdKW38DDnyx0jTkPf8lZT967mi4aaVRU=;
        b=OSx2SIFa3QZatPqQ1/1JhIMHW9/xVzpWbWJ3JRx38+vkc7yD3VhW0qZPTRXo9BHPAb
         jqThRDpZ0kg6ZpAqxG2JtHeMn3hkxCgfz6NEKIJ7VCvOhBjv8tEvA+F+ola4MKtey4W6
         6tkAdoqeo5YgJ+ccviV414q5ymKWqXmOHWR03wrBvLcC1hyucYUejAbGeEBHMdkt6pNZ
         8HWP4CFxNNf4YTbPRr/OlQ8ucASJWFLCMnmZRQ+kMjzWnezyK5gHEkf2wflkjyStAtpK
         CH0vEiVb7u1tSojwaalDHZzv61AptJr6u6640FPdb069l7IzleOKJabZjkqRSGs5cxlh
         zq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EcWwiS6s+2hsdKW38DDnyx0jTkPf8lZT967mi4aaVRU=;
        b=WHdzqRjCuBSQvIE6NL+CyHsCd6RTwoBr3NxNexvpuoXIOJkdvChn7Ax+lXFYyw0td+
         Ywn0QOHFa4UWaOQSbbcFTsk+HiOXkZuv04F+lBR6Mu4Uvng/unPFCkSSTYfhD0t5Q7Wy
         mdGZ4exljrOLSX11yL0kdQXxjeSJW5Bhcb9fV0lJnSTy4maM6yuYSkS8Xh4/PCz7XDNr
         kyWbyXXpNOM+vUb3ZEu0U8JIvC91x74/++3eTT/R0sIKXLDE9lEnGhyrLYhgsBbZ7NOU
         o+efWj8BMCKQrFk+beTSkmb8vDH1k+HFM939uJ9GPW2GvMazl0bdrkMBUl8pUYWFigV/
         w+1A==
X-Gm-Message-State: AOAM531I124dJsVt+2NgP10lK5+nlQTha87kOGYqIEmiSLAZSDJ8y82m
        eXPGVt4nDKY4XDfpDLjjUa9JE7bDtMs=
X-Google-Smtp-Source: ABdhPJyyPif7tIwRD8TIt+Gr8SE2XFik/v8luje5qQy8jYQOg+e2WrqhmAoSQ0MfKf9L2+5J+fDukw==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr7989973lfr.308.1633534865724;
        Wed, 06 Oct 2021 08:41:05 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id t9sm300124ljk.39.2021.10.06.08.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 08:41:05 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] dt-bindings: memory: lpddr2: Convert to schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-3-digetx@gmail.com>
 <6b8f6ef7-cfc5-3a8b-d44d-f4080a85ecf3@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7047ad7b-52d6-0c91-b7d2-b115ea69506f@gmail.com>
Date:   Wed, 6 Oct 2021 18:41:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6b8f6ef7-cfc5-3a8b-d44d-f4080a85ecf3@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 13:57, Krzysztof Kozlowski пишет:
>> +  density:
>> +    description: |
>> +      Density in megabits of SDRAM chip. Obtained from device datasheet.
> You need here a type/ref, so uint32.
> 

The type is uint32 by default. I can add it, but it's not really necessary.
