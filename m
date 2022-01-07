Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61838C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jan 2022 12:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiAGMrH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jan 2022 07:47:07 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52840
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231959AbiAGMrG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 7 Jan 2022 07:47:06 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F89D3F17B
        for <linux-tegra@vger.kernel.org>; Fri,  7 Jan 2022 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641559625;
        bh=mw0ExawwR8ahd9kK1BIGn/SS/zU5Dv8XgcJ3wXAs/II=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=U0wKWHqcpGm/m+00m1PkET9TAVO1BlVbVgB4HVn7x8iXja77UaTu6IJFhaCUkvpXh
         0QPLXd9eHk86R8sVAKvuItU+lz62HvFpBnfexDk7i3Hb6JOvfnBavQ/MDnTuHAUZ7A
         xFvRWEdvUyQueOWzdwK5HdrWgupNdraQVIQrDGS5bhXuAWsZrNhWp1HBsSW1k6EjVS
         887SaP0Ioc4C26bLHekWAN5K7vwh8u7dy6jxkcoWZOpxZPVkNaulT70DTa2fhdSsb0
         8Q4GvnrvT+FAOeSwi/NyoOy82OHnd5kTuzeijznImSqES1ztiV+QEUSQAYOt9SihXT
         e9Uz5j2P8y6zA==
Received: by mail-wm1-f70.google.com with SMTP id b20-20020a05600c4e1400b003457da1c91eso773078wmq.4
        for <linux-tegra@vger.kernel.org>; Fri, 07 Jan 2022 04:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mw0ExawwR8ahd9kK1BIGn/SS/zU5Dv8XgcJ3wXAs/II=;
        b=W6tijIK8X+4tKBeKGzzIspj0IOJkYyfII6W84o7XPWymckbA61QEJ+XA+aKrfv9UqV
         EA1jNpvGLqFAUG6spqiuJ8Ia0hyNYLCHGW9TqF0dwE508+VfrlzPW3GF1VYB571VnkUr
         3WqIMPiHv3RC6njEUA1QuQ4RZXY5/hDTNUBB482fUg+rij3PN+FpkIvBaeHLIs9JIC+Z
         HDTzkBqnwEUe+3QhOfTjZBNRwogkzhSKDVADQDRa6M4dnq2luxtFmdyUsd2mCV+Qmkn3
         wVxQj1aio5wRiOQXstiYzdnGwiYcGmH9ow/3korqglc3X6qUTdOY2+XHknORVqpN0fol
         CH9w==
X-Gm-Message-State: AOAM532kNXxPD1G+5lSloCjIhBw4CJKAOEGMhJqmlWd/twjTTKwf/Uqc
        vaDohvjUlIuB5wDch2x1m1O9BYBficZKugR85mIL3aAnH/YBByjJdqjM5KjtWag3Xv1Mvde26v+
        gdIeR71UdGAKW5tvToO22YXUgwttBcwBlOK5p8n+C
X-Received: by 2002:a1c:7908:: with SMTP id l8mr10769069wme.16.1641559624910;
        Fri, 07 Jan 2022 04:47:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2FsvDO60VgGxZNwGuql9jeQSwLbf8fwlr9vig9/8LpbnhuhXAEvvUqztMYtnXUorH1j6+bA==
X-Received: by 2002:a1c:7908:: with SMTP id l8mr10769046wme.16.1641559624685;
        Fri, 07 Jan 2022 04:47:04 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id y8sm5941569wma.19.2022.01.07.04.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 04:47:04 -0800 (PST)
Message-ID: <99115cc4-32f6-d217-68be-33256a6993a8@canonical.com>
Date:   Fri, 7 Jan 2022 13:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/7] arm/arm64: dts: Remove unused num-viewport from pcie
 node
Content-Language: en-US
To:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        Jisheng Zhang <jszhang@kernel.org>
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        linux@armlinux.org.uk, andrew@lunn.ch,
        sebastian.hesselbarth@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211229160245.1338-1-jszhang@kernel.org>
 <d3cb7b8439ee3d06@bloch.sibelius.xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <d3cb7b8439ee3d06@bloch.sibelius.xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/12/2021 17:50, Mark Kettenis wrote:
>> From: Jisheng Zhang <jszhang@kernel.org>
>> Date: Thu, 30 Dec 2021 00:02:38 +0800
>>
>> After commit 281f1f99cf3a("PCI: dwc: Detect number of iATU windows"),
>> the number of iATU windows is detected at runtime, what's more,
>> the 'num-viewport' property parsing has been removed, so remove the
>> unused num-viewport from pcie node(s).
>>
>> It's too late for linux-5.17-rc1, I will rebase and send out v2 if
>> necessary when 5.17-rc1 is released.
> 
> Please no.  This only makes the device trees unnecessarily
> incompatible with older kernels

Anyone who is running a new DTB with older kernel is doomed anyway, not
only because of this change but hundreds of other similar cleanups, e.g.
making DTS conforming to dtschema. Are you sure there are such use cases
of using new DTB with old kernel? I cannot imagine making a stable
product with such scenario...

> and other OSes that do rely on the
> "num-viewport" property.

Right. We should have move the DTS out of the kernel when it was still
small. :)

> It really doesn't hurt to keep this property
> even if future Linux kernels no longer look at it.

For Exynos PCIe, the property is still required by bindings, so
definitely it cannot be removed from DTS. I did not check the other
bindings.

Best regards,
Krzysztof
