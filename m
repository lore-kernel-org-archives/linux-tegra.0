Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC992C4742C
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B83920A8B
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uI5sjdIZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgKEKkP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgKEKkN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 05:40:13 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E19C061A4C
        for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2020 02:40:13 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id z1so578630plo.12
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2020 02:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WCCTQKcgxT5BgoXvd55cVkeUPDruRceTke7HPT3Hkyo=;
        b=uI5sjdIZnJfMXmb2BmcneLzfiFbBlet9wY7JQZtjHR0GF8UkHMmcqlXwBrkvsqK1WI
         SeinhDQqNDH8/hEaMPpSpgwvj0qAA2DAOlij96dLz+WulydyVF4o3fYzumZUYFXFoH1h
         ZgXb17DvmcshHNZxztv5zRi/aeOa+ymd+joJrRroDAhLo0nx97avxNo1KBPgxXcO+5qD
         SXvk12UVzaw2/5tEF2FemBinKY4gdRZP1KDwgT69Jbp7nnNi1tx0Yci0mKB/TEHxbTdH
         hUsmGHEaNuInutK+0y4SPLiOBIQ+CzV6c4LqpUQ2rUe9GYtY4Vnxx2LLLnO7akoNoqHJ
         X5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WCCTQKcgxT5BgoXvd55cVkeUPDruRceTke7HPT3Hkyo=;
        b=QUy2a0dUml6LapLjBa4W/VEFIsB4Qawc3AwliedF9glND7y9ypLjydmgOVN4M7q/cj
         gO3BI1qy3IbjACYZI1+3ZmIZK0EjWn6fezs06SqMf0pHgA2pBPsdwBLxVeXWnvRysiyx
         kQoItn4FEc9RDr9lrfC9oYrx7zfa2V+60RxCI8ZvSjGJIhxs3DTS++chIG39ObgwdkmB
         0+q+yjIOilXuRLRVplF4z09gJr9rZuv/FAcwiwxW2svJ5I38uSUDbVX4A2n9h1SkIVT7
         otquQAFyD20opy3aK2rS1gNA0XyUeiAHWGwSfzcYGTRrAKjWjnZivtf4I/ctASLuKC7f
         WG0Q==
X-Gm-Message-State: AOAM532N88oPihm6YHBJsGSwqNj8IJX6JUrR0uSDWDkTdHaU5J9G8EQK
        u6j/ZqK0RH0x2JWQ8bUNUzF1iQ==
X-Google-Smtp-Source: ABdhPJxaeig/5BttxMih2SwDkKcSP7+kCvVk+Bpsa5+VJfx+t48gt5Hq0JWRUoD/r4V+wRad0uK0Vw==
X-Received: by 2002:a17:902:b601:b029:d3:e6c5:5112 with SMTP id b1-20020a170902b601b02900d3e6c55112mr1328833pls.65.1604572812590;
        Thu, 05 Nov 2020 02:40:12 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id q11sm1908845pgm.79.2020.11.05.02.40.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 02:40:11 -0800 (PST)
Date:   Thu, 5 Nov 2020 16:10:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Chen <Peter.Chen@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201105104009.oo4dc6a2gdcwduhk@vireshk-i7>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <20201105100603.skrirm7uke4s2xyl@vireshk-i7>
 <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05-11-20, 11:34, Ulf Hansson wrote:
> I am not objecting about scaling the voltage through a regulator,
> that's fine to me. However, encoding a power domain as a regulator
> (even if it may seem like a regulator) isn't. Well, unless Mark Brown
> has changed his mind about this.
>
> In this case, it seems like the regulator supply belongs in the
> description of the power domain provider.

Okay, I wasn't sure if it is a power domain or a regulator here. Btw,
how do we identify if it is a power domain or a regulator ?

> > In case of Qcom earlier (when we added the performance-state stuff),
> > the eventual hardware was out of kernel's control and we didn't wanted
> > (allowed) to model it as a virtual regulator just to pass the votes to
> > the RPM. And so we did what we did.
> >
> > But if the hardware (where the voltage is required to be changed) is
> > indeed a regulator and is modeled as one, then what Dmitry has done
> > looks okay. i.e. add a supply in the device's node and microvolt
> > property in the DT entries.
> 
> I guess I haven't paid enough attention how power domain regulators
> are being described then. I was under the impression that the CPUfreq
> case was a bit specific - and we had legacy bindings to stick with.
> 
> Can you point me to some other existing examples of where power domain
> regulators are specified as a regulator in each device's node?

No, I thought it is a regulator here and not a power domain.

-- 
viresh
