Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8E2C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:51:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36F8E60C40
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhJNVxr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:53:47 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:45871 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbhJNVxr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 17:53:47 -0400
Received: by mail-ot1-f43.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so10093639otq.12;
        Thu, 14 Oct 2021 14:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cx4LWjMqpVjbFfeMTXQ+2uDkB5fpHg6cKfTffYlKnNY=;
        b=JHzdVxzavPf/zRFcHwAlEhje7qux9gzcQ2BjGe9tTZZSVaS+0A28KjVRVq96qLi1cM
         gA+n5PCXl3n/umVZcyFScQ/pUl/gR3lqDbmIz4wETYOx4nUH1FXPBfH0/N4qcv+T0t62
         /q8Wkmlqk/TLHnqf+HcX1qD2bjtYAZBXu7aFzoEwP3xlXrZ2w3u4G/bR0aXdzEhL0j3k
         X1dMvKJ5b24GXptnGKzGr+9LjabpPxz12NBNPTo7lXfEaYx7OGQaPQMrAF2Vn700nXQK
         xYG7vzk/5FDuy3ru2V4RlJPQFhkouWw6n7Kgy8jS6Yl0sMbqbq/LVufT3E8d/d132C7s
         9W/g==
X-Gm-Message-State: AOAM531OkNG44dGxb+U4xyKv7Xu+fBEXAJCnrbHYj017vCDnoXhNV62E
        +RVXIjKBk+dAh2wN28qT7Q==
X-Google-Smtp-Source: ABdhPJxX1kBJHrvrGA+YetQLeiIgpi2uxm92MhWxtrbA1+cmO67+ma2ZwektlegGd5f9FgXV4zvCvQ==
X-Received: by 2002:a9d:353:: with SMTP id 77mr4786380otv.143.1634248301588;
        Thu, 14 Oct 2021 14:51:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e2sm659060ooh.40.2021.10.14.14.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:51:41 -0700 (PDT)
Received: (nullmailer pid 4010794 invoked by uid 1000);
        Thu, 14 Oct 2021 21:51:40 -0000
Date:   Thu, 14 Oct 2021 16:51:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] dt-bindings: Add vendor prefix for Elpida Memory
Message-ID: <YWimbB2NLUEZY88Q@robh.at.kernel.org>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006224659.21434-6-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021 01:46:55 +0300, Dmitry Osipenko wrote:
> Elpida Memory designed, manufactured and sold dynamic random-access
> memory (DRAM) products. It was acquired by Micron Technology in 2013,
> still there are many devices with components from Elpida. Document the
> vendor prefix.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
