Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAECC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37C8860F36
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhJNVYb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:24:31 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35771 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhJNVYb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 17:24:31 -0400
Received: by mail-oi1-f180.google.com with SMTP id n64so10249664oih.2;
        Thu, 14 Oct 2021 14:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sTWbWNVDxXpUr7idNmcVYaWD0Lp1YKhdtqNx+mX5y/Y=;
        b=gBbMvA5IeQKnB4C93L3FI//FArSWBcQdGjUuboLCpLh994YBnlmZgbbfwU2bH3UhpQ
         dyRtFXb4jCXJtFt7A8u46UXkL+JYd4O+nmAEFsO2wpt8dw2c1drGBUBFDz8CGyoeIOVG
         l262+DkPDtgUdI5gAKNYlOqhOEQYWJMN28bVXqQqgIELZxCOeOZUxgXHk3y1hjrZKYfr
         DiYieJHoQiu1JxpDpMfUsUhxwdUtV7iLqv74rcnYTGr3LSLHDic/UwsKbz+lKhu1xN1R
         qIu2JW9SAaeyst6c3m0pxlRlQFgNTXWnkhDopmdn7kYUODOSnk8kUhGPJ5a+OeObI0dE
         3X4g==
X-Gm-Message-State: AOAM530CN/jsGONSQCk8yPdM3qIcoYu5nqw4n2/Ma74bHhU8oYs86skP
        tXAlItKV1RzRCdHoXKC3Bw==
X-Google-Smtp-Source: ABdhPJwIfzrDT9VcaTSgTR101M5RgBewZ7IVrd5UyQNz3PTbvJEEL53NKhSAayf/GEVjkb/6Ffaa/A==
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr5833455oib.40.1634246545627;
        Thu, 14 Oct 2021 14:22:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s206sm804475oia.33.2021.10.14.14.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:22:24 -0700 (PDT)
Received: (nullmailer pid 3961688 invoked by uid 1000);
        Thu, 14 Oct 2021 21:22:23 -0000
Date:   Thu, 14 Oct 2021 16:22:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: Relocate DDR bindings
Message-ID: <YWifjxkY7XYmNqXj@robh.at.kernel.org>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006224659.21434-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021 01:46:51 +0300, Dmitry Osipenko wrote:
> Move DDR bindings to memory-controllers directory to make them more
> discoverable.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt      | 0
>  .../devicetree/bindings/{ => memory-controllers}/ddr/lpddr2.txt   | 0
>  .../bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt      | 0
>  .../devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt   | 0
>  4 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt (100%)
>  rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2.txt (100%)
>  rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt (100%)
>  rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt (100%)
> 

Acked-by: Rob Herring <robh@kernel.org>
