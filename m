Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B0AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 06:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FCD7615E5
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Sep 2021 06:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348409AbhI3G4I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Sep 2021 02:56:08 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57696
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348393AbhI3G4H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Sep 2021 02:56:07 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 16A79402F6
        for <linux-tegra@vger.kernel.org>; Thu, 30 Sep 2021 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632984864;
        bh=KCX4B1ULxSJnJGmYcLBUzwn6g7EB4GBQxWYASGCp2Is=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=o3p29BsuRt+XgN8VHwLrh2ebvk6Mj2Eh7cqvNEFmqCoiggneP2UxeHJ1euqxJS1ep
         +dOa0Wh8zLhoQpygQ+7ue8sjXiikjDn4BEUHliSPu4i7mO5abVvKsHI/bcZI31aScX
         YfOCBqYSxyfdPKpr2lygnd9pRT4DxnyO27T19LdrNGJVdxoiceJUUSHgeToSr531aV
         FHqrX6l+6nJm/M9cXzkqRoinSo96tizgp/sDufI0mBpZLfsETNSjWCo510r832VR9h
         dMFQcH3O4PUF4lJuTYr+LRaC58nutTFIily27m28rQgxnX92GoIi3Q3M83sAOnRLL1
         fJgXZlp4kXbZw==
Received: by mail-lf1-f69.google.com with SMTP id 12-20020ac2484c000000b003fcb3298d00so4644751lfy.13
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 23:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KCX4B1ULxSJnJGmYcLBUzwn6g7EB4GBQxWYASGCp2Is=;
        b=l0BPOcQybhjkOC7Sfd/W2RYFQaOMz4yyxIj48d3s2N1BsVjXfBQob8uWnEGYE3xNb8
         qX1wKgB0KbBMICozEUCg3O4kGdhneeL16deadJ0gXV9iObSUrAy1uHsy9u6Lgpo7007X
         2Km5h4wcOkDup0DJXJJOdlf6vof7gRAe0X9SdWF2Jm5ERlXx3b90+Sccn+6KYzo6nwr4
         gXkuqzG2VvVz81L9mmcp52CbvFsJ0SaLze4rwcSVPf/5ogXMLRLZDmBaG106ozGUjAUd
         bceEYGoKziansH9ycMCnq3W55a5NOHQ4Dt9UXAM4czqRQdqeNyqNqmIwUt9+6AEq+INN
         0xJQ==
X-Gm-Message-State: AOAM533j1sn/ajVIfrpupQFBSMZASAYDWU6QL+ggOJ0/k9yIK91eMqgA
        N6opAnZf6ETTcGVo+Rt5CXusETmzASytTgdegHiVv3qMGn3NGGCzvVGXQZfX2Ymwo70OPoOuxrn
        wAm/tSydp/WuTlrCdBz83XDO7+v/y/lcP+a2VxXBa
X-Received: by 2002:ac2:490d:: with SMTP id n13mr4259473lfi.185.1632984862564;
        Wed, 29 Sep 2021 23:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrmRbYqXV+I780EDfAqCAWVZA/cjP5V5bydrNmIPMKftKUdBdaVNtZ1rYRknaoYPFzK5QKbg==
X-Received: by 2002:ac2:490d:: with SMTP id n13mr4259455lfi.185.1632984862370;
        Wed, 29 Sep 2021 23:54:22 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id d16sm263276lfv.164.2021.09.29.23.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 23:54:22 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] dt-bindings: memory: tegra20: emc: Document
 optional LPDDR properties
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210929200305.4245-1-digetx@gmail.com>
 <20210929200305.4245-2-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2df06f23-1a5e-f6e9-8e2c-0bb4c93fe23c@canonical.com>
Date:   Thu, 30 Sep 2021 08:54:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929200305.4245-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/09/2021 22:03, Dmitry Osipenko wrote:
> Some Tegra20 boards don't use RAM code for the memory chip identification
> and the identity information should read out from LPDDR chip in this case.
> Document new optional generic LPDDR properties that will be used for the
> memory chip identification if RAM code isn't provided.

Please mention how they are going to be used. Naively I would assume
that these new properties describe the RAM you have. However it seems
you do not use them to configure the device but to compare with the
device. Why do you need them?

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../nvidia,tegra20-emc.yaml                   | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> index cac6842dc8f1..6d01b1bf6304 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> @@ -158,6 +158,46 @@ patternProperties:
>          description:
>            Value of RAM_CODE this timing set is used for.
>  
> +      jedec,lpddr-manufacturer-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Unique manufacturer ID of SDRAM chip this timing set is used for.
> +          See MR5 description in JEDEC LPDDR2 specification (JESD209-2).
> +
> +      jedec,lpddr-revision-id1:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Revision 1 value of SDRAM chip this timing set is used for.
> +          See MR6 description in chip vendor specification.
> +
> +      jedec,lpddr-revision-id2:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Revision 2 value of SDRAM chip this timing set is used for.
> +          See MR7 description in chip vendor specification.
> +
> +      jedec,lpddr-density-mbits:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Density in megabits of SDRAM chip this timing set is used for.
> +          See MR8 description in JEDEC LPDDR2 specification.
> +
> +      jedec,lpddr-io-width-bits:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          IO bus width in bits of SDRAM chip this timing set is used for.
> +          See MR8 description in JEDEC LPDDR2 specification.
> +
> +      jedec,lpddr-type:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          LPDDR type which corresponds to a number of words SDRAM pre-fetches
> +          per column request that this timing set is used for.
> +          See MR8 description in JEDEC LPDDR2 specification.
> +        enum:
> +          - 4 # S4 (4 words prefetch architecture)
> +          - 2 # S2 (2 words prefetch architecture)

I think instead you should use generic lpddr{2,3} bindings - have a
separate node and reference it via a phandle.

Best regards,
Krzysztof
