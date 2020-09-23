Return-Path: <SRS0=J1sk=DA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26792C4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 15:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC78A2137B
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600875171;
	bh=+uY3ZzVl6MPK3qKSJVmF+6sL3/uGj+I10+R8KEhIIgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kNG4bp3AImM7jcheSSFkGXr8V+fKE0QtB6JMxmpKn3ikFnWknYfuM9aXpDYU/cHmj
	 372l/cS6Sqrq0YilM8Ehdsq5RaTKBAk9qUFc75jvBoOPqNdoIzV8RxwufWrEvY3qyY
	 1yg8L3qMA/Gvd/I5K/ymz3Go6Hmt2wooFxlwkemU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgIWPcv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Sep 2020 11:32:51 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:38078 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWPcv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Sep 2020 11:32:51 -0400
Received: by mail-il1-f193.google.com with SMTP id t18so2445ilp.5;
        Wed, 23 Sep 2020 08:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DtoDYlIgkJM6C+Ai6LhWBQbNLvk60GPVee6qi+q1BVA=;
        b=WKy8TeQmAneDalsPGyG8D0I+sOlPitd7OiCYqdNMheiC1x4MEyXbRLnmaWmiESAhGN
         o72HVNYCkyRnL+g1j+KoEeGa8zQPPkrRjxY8QVQllYlwxomocPunPbFZlANqhVzQkjwK
         XfQ6ORjMLlu7tSH00kVNk8C1KHRYYHpD7sbz+4NynqVdJk/wEK3nE2Lo4xe53IIyx+Bw
         JW+2EcAo+43znMi5ExygBxhkz35rMe4a99n+XTPDMGc4tzMYZnhR9a4VCBMfUY+nov0b
         FJKzPDeyxw8Xk5jJ86Y52PTm7KvVwEPGWqP0jfDKLivzPOBHqr9S1PsLjGj8ah7f77Mi
         aFbQ==
X-Gm-Message-State: AOAM531CxpLYMBsE0Xm9BigRK/Hrod08G/DGCLR672JsdLHKUZsCCguV
        4zyC359CLo/O/SyiLwLjZ4MkFPYdteMvgTA=
X-Google-Smtp-Source: ABdhPJzoWPKxdJIWJBysTOwFw0i31FN6iTt9hOPtV7z+rEba3hOi6SYuHEcViMiAy4vfbjm5FYdeEQ==
X-Received: by 2002:a92:b602:: with SMTP id s2mr266105ili.299.1600875169920;
        Wed, 23 Sep 2020 08:32:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm8046160ilo.21.2020.09.23.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:32:49 -0700 (PDT)
Received: (nullmailer pid 787283 invoked by uid 1000);
        Wed, 23 Sep 2020 15:32:48 -0000
Date:   Wed, 23 Sep 2020 09:32:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 2/5] dt-bindings: eeprom: at24: Add label property for
 AT24
Message-ID: <20200923153248.GA787205@bogus>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
 <20200916094952.458003-3-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916094952.458003-3-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Sep 2020 10:49:49 +0100, Jon Hunter wrote:
> Add a label property for the AT24 EEPROM to allow a custom name to be
> used for identifying the EEPROM on a board. This is useful when there
> is more than one EEPROM present.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
