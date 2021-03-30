Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C3FC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7433619CD
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhC3WeQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 18:34:16 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:45942 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbhC3WeA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 18:34:00 -0400
Received: by mail-oi1-f177.google.com with SMTP id d12so18037117oiw.12;
        Tue, 30 Mar 2021 15:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=B34gJi7ZC6hGf/Zl/UZa/ffIBrU37Enr4nRfOk1Ng+8=;
        b=FO60hRzVh3Dfqet1l66vkHWJSJfLny97X7GUMeE7SRvHtkfpHKo1183tIS25mTkHMz
         +OEFu2CCYKzPXpHqijgjOp/xQWK6TUs6CizCtfp2HSWWPtqgWD2f14r8x1bTRIu5+Mhl
         4Gmf/XGcgwZ2I0GBEyQyo4/1+QZ+kRnoINWGNSIzZLx4DNdWP9Hj7QWvBjfxbV3auHk1
         L+EsAQ4gdKKVeMBcvIAp1VyW9hfrRkan7KPyHu7OfAp3w6jZ46qzrKCNwfk3+BJThJ63
         +xKUxAaULzfP9frquraGdLAG2CzvmMav8gLItLEZH/iJgoPqMgl1wOvO+ebxzVabwAv0
         yUNw==
X-Gm-Message-State: AOAM530Plpk8KwgZ+tyajI3pwZ3Eh6wdv4Fdmg2cTTk0cyfSXwffalNd
        eHaKjyTEeNPGsGTGhqWxlQ==
X-Google-Smtp-Source: ABdhPJxtngukcqvTMEWwD3NhMFZ8M6NEZPfp7rdCTZX3uu4d1pYJZVbJargwoKCS8RncTr8S8rWGlg==
X-Received: by 2002:aca:484:: with SMTP id 126mr111933oie.81.1617143640395;
        Tue, 30 Mar 2021 15:34:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r15sm51173ote.27.2021.03.30.15.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 15:33:59 -0700 (PDT)
Received: (nullmailer pid 835085 invoked by uid 1000);
        Tue, 30 Mar 2021 22:33:58 -0000
Date:   Tue, 30 Mar 2021 17:33:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
Message-ID: <20210330223358.GA821638@robh.at.kernel.org>
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-6-digetx@gmail.com>
 <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
 <989c3c70-3f0c-abff-ed07-c2dea3b66a2d@gmail.com>
 <eb29dd93-214d-ba15-7825-888467bd782b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb29dd93-214d-ba15-7825-888467bd782b@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 30, 2021 at 06:56:44PM +0300, Dmitry Osipenko wrote:
> 30.03.2021 18:29, Dmitry Osipenko пишет:
> > 30.03.2021 11:48, Krzysztof Kozlowski пишет:
> >>> +  power-domains:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description:
> >>> +      Phandle of the SoC "core" power domain.
> >> I think the core checks the type, so you only need to limit max items.
> >>
> > 
> > It's a bit confusing that both variants work and it's not apparent what
> > variant is better.

Soon '$ref' won't work. I have a pending meta-schema change to catch 
this. It takes some time because I have to fix all the existing cases in 
tree and wait a cycle so I'm not breaking everyone. 

> > 
> > I actually used the max items limit initially and then changed it to
> > $ref phandle because it appeared to me that it's a better choice. I'll
> > switch back to the limit in v2, thanks.
> > 
> 
> Although, I'm still not sure what is the best variant. Could you please
> clarify why maxItems is better?
> 
> Seems the $ref phandle already limits domain items to 1. So I don't
> understand what's the difference.

It would not work with '<&domain 1>' as 'phandle' doesn't accept any 
arg cells. While you may know you don't have any cells, technically 
that's provider dependent and outside the scope of this binding.

Rob



