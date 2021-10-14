Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AA3C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F11F96108E
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbhJNVxN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:53:13 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:37620 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234141AbhJNVxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 17:53:13 -0400
Received: by mail-oi1-f171.google.com with SMTP id o83so10323240oif.4;
        Thu, 14 Oct 2021 14:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xHLc2aUcd74L+EUP0fb7YdwVm3kENIvUi2iCQua1G0U=;
        b=qREPt2lt1kWTJ7taa33dRWvXWwhC0U8nyJjbYzZ5KHwokT3VzClMObQmDMi1UoZIyp
         ur7SdTOxleHRXIXTQJfosUrQm1hVDED0iXChCnZwM5PK7hhIWhVjIxGStee0I7poPo6K
         L1DhIdEMt7RsdkMXy/4UkbaxIShG2Bk03UU5H4LQONqgL2fF38/cwee/zTCAfJkO83Za
         jN/n4nqHsrKYIVxin/peWpagrWb405zQzgIlnNCBTJ8/qECaPehuRHV8CpkwzxNne7/J
         ismNUX8wTFtZ5ql8RJb47e5+gDZVjlA+9B//ReHoI2lWKnVkxUccClAZUmnHrbYKBRFm
         lzcA==
X-Gm-Message-State: AOAM531OFVlKMkogZw0WF743/qXLYqzvb+2gOFPN2es3IA84hl98R2Af
        MPdNuh2lbkvyT1DpCgT2WQ==
X-Google-Smtp-Source: ABdhPJwshkAYue3N+O6WPgFhOPrl4sCXGJP0QolXJnIwCwUiehtoUAjaryM1UfgSbtv+1tygUvo9tA==
X-Received: by 2002:a05:6808:2206:: with SMTP id bd6mr34375oib.105.1634248267467;
        Thu, 14 Oct 2021 14:51:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n12sm814602otq.32.2021.10.14.14.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:51:06 -0700 (PDT)
Received: (nullmailer pid 4009564 invoked by uid 1000);
        Thu, 14 Oct 2021 21:51:06 -0000
Date:   Thu, 14 Oct 2021 16:51:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id
 properties
Message-ID: <YWimShkkxkR+bQLK@robh.at.kernel.org>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006224659.21434-4-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021 01:46:53 +0300, Dmitry Osipenko wrote:
> Add optional revision-id standard LPDDR2 properties which will help to
> identify memory chip.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/ddr/jedec,lpddr2.yaml       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
