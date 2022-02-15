Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F40EC4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Feb 2022 08:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbiBOI2a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:28:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235439AbiBOI21 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Feb 2022 03:28:27 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F61EC4B4D
        for <linux-tegra@vger.kernel.org>; Tue, 15 Feb 2022 00:28:16 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4CACF3F1D1
        for <linux-tegra@vger.kernel.org>; Tue, 15 Feb 2022 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644913695;
        bh=SYCs4rlwehI9uixUmtccsfBnafF4vNQ33COhcYadmEI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=tBluYdOGxVBJdCghfagQc0/1tR6gqng7Gt5xLxcleLnGrw3mKIhomILXpFvwTwMLl
         tU8eab9peMmfl3U04spXQ48VRZ0K4PlEsBs4vZqsZp7zW55gjzOaUTDyUhzTgTfnaQ
         UTl9ZNMO7fA2PO0t1JCv9WELSYxUKrmoi23lR205FBVi/wu639vovzX6bwK2SwSrbi
         S56g4CE+45LQ3u8NYVaFZ+k0NItDVbeXHjPlTh8JUY26wlA7DeiFke8ZII+6NvO2jb
         gdjbQgXLqTDKbV3bC8XYunE7089WVPaut+7O3hrNHf+uTOcA73mWFcGl2WSwG+AH5z
         clJbh9uNgoGcA==
Received: by mail-wm1-f72.google.com with SMTP id g22-20020a1c4e16000000b0037bc7a977b3so1894766wmh.5
        for <linux-tegra@vger.kernel.org>; Tue, 15 Feb 2022 00:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SYCs4rlwehI9uixUmtccsfBnafF4vNQ33COhcYadmEI=;
        b=BLuIHdsJMYoEgQ5Fs7j9bf/j+CjhgGE6Hjs8orExk1mhvxtF3kmnQkNB+oUvpx57Ew
         Q9ts1RoS4wNELm+bGLLu1xqn4PcnLYCyixzg6QksEz2hrlYv6Tkfb7rkWfb+i1a/NY2P
         2euDc+uRNd1DmgPYIRhvakU3oVCK09WTId0giNrI2R6KzmW360oz1/IaAiPryC1pjQLn
         NvX/nsf8PEqbO2HF4CnfbR5WlBpVAe2gHTqtkpOL3HbHai908kWDVPyck1g4ZES1vLDq
         aOKXd14EGVhAAnXWxolMDkCtJoKbDbJTwqZ6yXtCMg9TsJN0UgwWLUbZQHqzbMmulHJw
         k7HQ==
X-Gm-Message-State: AOAM532TcqVBjqvZ7d3gN6Et7S1LYWIDXs1hzPYR+uuQOXsUJRfFt/8E
        0Tt05QHzpzG01JLzLqGc9rCn4vsaWsdVvq+nY6pmAavlxwswEoqGcxgbT0FOv3PIIMAxteDxykA
        0GiHXyLKpXQrLbRDr4qOZ6ak2jhatvtVjQ90EW1K2
X-Received: by 2002:adf:fe01:: with SMTP id n1mr2267118wrr.141.1644913695009;
        Tue, 15 Feb 2022 00:28:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh+hWeGmrip2gp+7LRc0NsiVtARyJICQ651r0zOjxPcx/VDhc7XmjHKyoi0nwmVdqqN1QhjQ==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr2267101wrr.141.1644913694842;
        Tue, 15 Feb 2022 00:28:14 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o14sm14182083wmr.3.2022.02.15.00.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 00:28:14 -0800 (PST)
Message-ID: <c6e226a5-55a2-89ac-1703-0a0d9bcaf259@canonical.com>
Date:   Tue, 15 Feb 2022 09:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/8] ARM: dts: exynos: fix ethernet node name for
 different odroid boards
Content-Language: en-US
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     kernel@pengutronix.de, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220215080937.2263111-1-o.rempel@pengutronix.de>
 <20220215080937.2263111-5-o.rempel@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215080937.2263111-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15/02/2022 09:09, Oleksij Rempel wrote:
> The node name of Ethernet controller should be "ethernet" instead of
> "usbether"

Missing full stop.
Please also mention why this should be "ethernet" (e.g. because Ethernet
dtschema requires it). This applies to other DTS patches as well.

Plus comments from Marc.

> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/exynos4412-odroidu3.dts       | 4 ++--
>  arch/arm/boot/dts/exynos4412-odroidx.dts        | 8 ++++----
>  arch/arm/boot/dts/exynos5410-odroidxu.dts       | 4 ++--
>  arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 6 +++---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts      | 6 +++---
>  5 files changed, 14 insertions(+), 14 deletions(-)
> 

Best regards,
Krzysztof
