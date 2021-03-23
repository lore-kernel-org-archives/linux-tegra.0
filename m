Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF56C433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 22:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0639B619DD
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 22:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhCWWix (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 18:38:53 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:45623 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbhCWWiZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 18:38:25 -0400
Received: by mail-il1-f169.google.com with SMTP id v3so19664826ilj.12;
        Tue, 23 Mar 2021 15:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m3KU9ojkcc0Xo1iQNgnxQRVgpyEXyiLaxGNp9t3RWAs=;
        b=Bxj20ifXx4ksaBGoijx9zT1Yp6AkmRkW4V5KBuPqAM3gbulloQsF75cUt9JbiVfTOv
         N0pma4pVaMGOYOeimbqtvq8JHeFLUnaNaicqxlCG7QAcBpyOsuY+eQRXmsQIxnA0XDde
         MhpvgLvhIr10Jpo4v8wHmETbmxxD6XlGE0Rsnx+AUB37hTxI7FC3PQdqAKlWL8AytlJx
         uHI3PLboZIRLUtNrB+7lzQnc2V6tXOLviC7GnmEEoMN5T8VsH/vQm1nqcPr258tk3F5S
         Garl3SXANdxZlO4UtJqqDYPIf3RWJU8YxmftPTUAH7HIKfqLqKnEwqMPzGZWga1ta/oJ
         i1nw==
X-Gm-Message-State: AOAM533xRjnAjkmGwNK1Fqvj/K7CD7vHC1CjSVsrWrfezoMKQE7m4w4O
        z/PnCEcY/bvUMo+88CmfkIODgdOUAA==
X-Google-Smtp-Source: ABdhPJwAEp/g8EW3zhRIlMs4bDjQqMp5SSZ/GzMzFmgnA7JOvlwtyJF4TANQsYYlTTs3fyak6xPTng==
X-Received: by 2002:a92:d912:: with SMTP id s18mr340012iln.230.1616539104740;
        Tue, 23 Mar 2021 15:38:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a14sm112381ilm.68.2021.03.23.15.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:38:23 -0700 (PDT)
Received: (nullmailer pid 1475853 invoked by uid 1000);
        Tue, 23 Mar 2021 22:38:21 -0000
Date:   Tue, 23 Mar 2021 16:38:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-clk@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v6 7/7] dt-bindings: clock: tegra: Convert to schema
Message-ID: <20210323223821.GA1475819@robh.at.kernel.org>
References: <20210320152648.8389-1-digetx@gmail.com>
 <20210320152648.8389-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320152648.8389-8-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 20 Mar 2021 18:26:48 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra clock bindings to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
>  .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
>  .../bindings/clock/nvidia,tegra124-car.yaml   | 115 ++++++++++++++++++
>  .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
>  .../bindings/clock/nvidia,tegra20-car.yaml    |  69 +++++++++++
>  .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
>  .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
>  7 files changed, 184 insertions(+), 352 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
