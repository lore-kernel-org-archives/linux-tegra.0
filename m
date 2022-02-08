Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ACC433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Feb 2022 08:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345717AbiBHILE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:11:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239115AbiBHILD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Feb 2022 03:11:03 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FCAC0401F5
        for <linux-tegra@vger.kernel.org>; Tue,  8 Feb 2022 00:11:02 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EBD654004D
        for <linux-tegra@vger.kernel.org>; Tue,  8 Feb 2022 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644307860;
        bh=cYW0zgVOSV27j3Dwlea9zIlvvDmCtZOXKx4U6dIIDS4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=tt5Kru5yq6/U3QEm9O8lD59jt50DCmvpAZ1safLxyFAzbFWwS8MfWpdZq5phw1Smy
         LOT2nTT/lUpApws8YuP0oCEXfKDTu7Id6UYh0NueUHu4ON2XJd3GPEolIimkZFKHQz
         Brcphw5MXZOXfaCumjM8zpQQ5GzM2GcWpXBhPV8v1/arwmg585KBjZv7RSHrYOLFeB
         aUQkkDYt5LalnO0Ccr3mynOsDmvoADnmnrf0F6auK3VKm0G0ErYiS+Ujw2FrJVtu5P
         SgLT27YFYBJ9Kwib8SSROTasUz3Y1H2sMzmrtGvErecmwzepKS86H5Rpt+ebv06EU5
         qYb70rZ4b6i3Q==
Received: by mail-ed1-f71.google.com with SMTP id k5-20020a508ac5000000b00408dec8390aso9184196edk.13
        for <linux-tegra@vger.kernel.org>; Tue, 08 Feb 2022 00:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cYW0zgVOSV27j3Dwlea9zIlvvDmCtZOXKx4U6dIIDS4=;
        b=i3u3tatTndArlNOgIC2qSOj+kGVZjFpO7Wcr8xJQNWsnW+Oex+pGUdHHt+yadFeD2g
         dvgYUE1Z0j9pS0nfhX85eAI2JWaGVOTUGQjsY9wO4fwR2mIZkGwKHQpyhUD60KVdtgSq
         fSk3qPsGFbBmN4P2NcUX7pCZ7a5y9k54qgHaQ9Ty5qwg8rSZopsXJoL62MdaKz7RtPxc
         H8U+zgQjSXYcP3JeepXMrl2v9PZN81K3Zao/2eyjsGTBEh6DVt1PQsGxY5BnwoRLgU6X
         HqDtA0nf3eml3ItESTYuls+GF2hu/4cLxwWOz/Wo6AgSu/HoCUA8oxn1gVVETUToA4hC
         4rLg==
X-Gm-Message-State: AOAM53244J1RsbICPyg9DDL5ekYY07ZrQf9f9r3x526TBV1AouytIITN
        M7D1IZyc27vHryV1vHGJzR8pK1TBpIOI7tgx4Yl9fF4wv4YkOtbDtwbtIaGjFLHmpO2jMFMjQGu
        5HpXrQL3BJglbk227uGxoLx76nzjOA4Wl1kpCoYGK
X-Received: by 2002:a17:907:6e1f:: with SMTP id sd31mr2753370ejc.286.1644307860301;
        Tue, 08 Feb 2022 00:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUmnHD6q4SC2IMLlDe1bCpDWpJOnkm1iK1Rtn8sYQXbzQepNcfnchaDeO0+DwjK7XfD5g5VA==
X-Received: by 2002:a17:907:6e1f:: with SMTP id sd31mr2753353ejc.286.1644307860092;
        Tue, 08 Feb 2022 00:11:00 -0800 (PST)
Received: from [192.168.0.92] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z2sm2739333ejr.68.2022.02.08.00.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 00:10:59 -0800 (PST)
Message-ID: <d69f99ed-75a4-9b8c-addb-3eaa2b2be6a6@canonical.com>
Date:   Tue, 8 Feb 2022 09:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id
 properties
Content-Language: en-US
To:     Julius Werner <jwerner@chromium.org>, Rob Herring <robh@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-4-digetx@gmail.com>
 <YWimShkkxkR+bQLK@robh.at.kernel.org>
 <CAODwPW-2othAhTC9a_joBdHScA86iqs-FkZJZDrK5LxrJm8F8Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAODwPW-2othAhTC9a_joBdHScA86iqs-FkZJZDrK5LxrJm8F8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/02/2022 03:06, Julius Werner wrote:
> Apologies for only noticing this a couple of months too late... but
> this patch added the same thing to the "jedec,lpddr2" bindings that
> were previously added by
> https://www.spinics.net/lists/devicetree/msg413733.html to
> "jedec,lpddr3", but in a slightly incompatible manner. Should we
> adjust it to make them consistent (two bytes in one property, rather
> than a separate property for each)? Or is it too late to change that?

Unfortunately I have no clue what patch you talk about ("this patch").
There is no context here, no link except the older LPDDR3.

The latest discussion is about dtschema conversion, so no new fields are
being added:
https://lore.kernel.org/lkml/20220206135807.211767-1-krzysztof.kozlowski@canonical.com/

Feel free to propose something new on top of it.

Best regards,
Krzysztof
