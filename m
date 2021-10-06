Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC88C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 17:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06C5861212
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 17:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239419AbhJFRXH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 13:23:07 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35488
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239391AbhJFRXG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 Oct 2021 13:23:06 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F33733FFD9
        for <linux-tegra@vger.kernel.org>; Wed,  6 Oct 2021 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633540872;
        bh=0cZECXo5Oq8InSEcFNJKeXKiRtAxuD956eiEhsyqxn4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=AX9u71FHGawoS6+mJqpcRQbFNKaDePnSLr0KzGkUVe3iIkjvrWPiJvrHBDcEH/MBB
         2owUXAT+pYWN290gxk4cwRTmNNQrLTKn/lZ1bgzghHy00mVKa2hAVQoNvBhLXXY8q5
         SRUYKCiHMvgqXAHZCWCLjCoHkxxg3X6SEF034UHk84tMF3YE8HwmqQvh11VVVnnrZA
         6IaqSgBT7i8cF6FQuCqfwWHEccovKivBWAG15YTDw2qQviX+NoROno5kvFfBPip0Gv
         yuWFffSv3hRR+8RKpdkpHx1/tHL7XxPu6cLZANS+lpHa11XQuIcL/oEymoiXItQytS
         unoKNor2PXLWQ==
Received: by mail-lf1-f69.google.com with SMTP id bp11-20020a056512158b00b003fc7d722819so2540212lfb.7
        for <linux-tegra@vger.kernel.org>; Wed, 06 Oct 2021 10:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0cZECXo5Oq8InSEcFNJKeXKiRtAxuD956eiEhsyqxn4=;
        b=10ueEQmAd0V/FquxCJJaTaNJsO6IPeV1ACgH28M2+01XHRkyfNfztBiTbAW+a8ADVL
         GFowjJlEqG6Ruoj2stHRKTuBhg1F2aVb4Ai30P/PKlZzVQLJvBtSe1IssnVVfC+d9KXg
         cH9E6otF0yIenz6wzsan7Rd+FioJbTGPXVmtDaBH9d7HEFPOjz7MVXfTpGySVcNGUmcL
         3G4vhN+lR7MuCru4s0lHdzFjNqKCbnZv1tp6Qj9ofDDPaaYCeY05ahL7DIPYot2jhqR+
         qcIbIWk8CiQ+hczhtno5w2mURZDOsnn/B4PjHmwnfUnEwsOaM8NdovJT3FqHNLWDWjuH
         qB9A==
X-Gm-Message-State: AOAM5305+rLI6pVKEjYuJudUS1XlvPekqn4Zuvr82SwmD1wCfBF0KnVK
        aIm79Jesrrls34w2B8r8bDpIe9jR89kPUIrOgxaqZ7FGzcLdaLwu/d1MQOb6bkIGSOs6w9v4PT6
        5HTnTQQ8e6YV0V8y0k7GP1oVQboMH7EQ5AOSUF1Mq
X-Received: by 2002:a2e:160a:: with SMTP id w10mr29552903ljd.50.1633540872231;
        Wed, 06 Oct 2021 10:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7gOFBqomi1IBdeCW+tCVrsZh82TOgzFybJHNk6+qbcfd0gOuOv7SH3dwoY9oJfUibCBvADg==
X-Received: by 2002:a2e:160a:: with SMTP id w10mr29552863ljd.50.1633540871949;
        Wed, 06 Oct 2021 10:21:11 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d13sm2319339lfi.48.2021.10.06.10.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:21:11 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] dt-bindings: memory: lpddr2: Convert to schema
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-3-digetx@gmail.com>
 <6b8f6ef7-cfc5-3a8b-d44d-f4080a85ecf3@canonical.com>
 <7047ad7b-52d6-0c91-b7d2-b115ea69506f@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6610ce30-405c-0a91-eb36-37ca3d0cf730@canonical.com>
Date:   Wed, 6 Oct 2021 19:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7047ad7b-52d6-0c91-b7d2-b115ea69506f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/10/2021 17:41, Dmitry Osipenko wrote:
> 06.10.2021 13:57, Krzysztof Kozlowski пишет:
>>> +  density:
>>> +    description: |
>>> +      Density in megabits of SDRAM chip. Obtained from device datasheet.
>> You need here a type/ref, so uint32.
>>
> 
> The type is uint32 by default. I can add it, but it's not really necessary.

Hmmm, maybe I missed some background here. Who sets uint32 as default?
The schema does not define "density" so this is more like a vendor-type
property which required therefore a type.

Also Rob's pointed this to my patch here around "op_mode":
https://lore.kernel.org/linux-samsung-soc/cdcd4eda-a7a9-2aa2-1316-e7184ff30bf3@canonical.com/T/#m17adea693a9cbcca75b0ba6f9d878f5fd1bf5d14

Best regards,
Krzysztof
