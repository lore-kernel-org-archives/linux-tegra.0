Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C61C433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 15:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9955264EE9
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 15:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhCOPxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 11:53:38 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:40935 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhCOPxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 11:53:13 -0400
Received: by mail-io1-f50.google.com with SMTP id m7so14831831iow.7;
        Mon, 15 Mar 2021 08:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qUzbYoLRVLqBw5frbABFgMY67VGZ4J3muyE0zF2BAGI=;
        b=S/bBDas3d+hlT942LkrOxJWmd1Sc1O5jLyVag4DBn/7xcABpGcLr2matbWEZ7c4zZ6
         lq9319jLvrImE94ljLIDBLDRZomJC+b1BvFNJm9l8vx4ofU/QegW1ruM5qKb25lU7gFt
         7qcs06QboRHqjesSfyTIs1XPbAPh1KfrSEDDf7eiSO4JUmopPY/QS+5gBa6jQTURNIDv
         gd1R8/AmI/2IKWvDUQg2FejhkVFR9sFBGJjbH9RPKaBH0HqsVlRNJGL4+bW7ULi1TGG0
         w3yW8DlH0D+m/AoCbfGTIgsFRe4ohd1+ivM5HlO44+V9EU6KHYdKTEH9ZKhlNQDhiflk
         dsnw==
X-Gm-Message-State: AOAM532aJNU+z3IF8IX2KGEpgPdoWAQqooonnyK33XpZMyvSSQuB21yy
        lrAdUgs3i3GLHBbfQ2uE3w==
X-Google-Smtp-Source: ABdhPJwBn8VhCV20lHqxJ2qfBas4ppj+UCeNwTs+/nl+6LEfMl8M7thRj1+mRM9aQeucmUoE1/5tDw==
X-Received: by 2002:a6b:ed08:: with SMTP id n8mr143877iog.197.1615823592800;
        Mon, 15 Mar 2021 08:53:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m4sm3399641ilf.80.2021.03.15.08.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 08:53:12 -0700 (PDT)
Received: (nullmailer pid 932438 invoked by uid 1000);
        Mon, 15 Mar 2021 15:53:10 -0000
Date:   Mon, 15 Mar 2021 09:53:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 7/7] dt-bindings: clock: tegra: Convert to schema
Message-ID: <20210315155310.GA926230@robh.at.kernel.org>
References: <20210312163632.8861-1-digetx@gmail.com>
 <20210312163632.8861-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312163632.8861-8-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 12, 2021 at 07:36:32PM +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra clock bindings to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra-car.yaml      | 118 ++++++++++++++++++
>  .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
>  .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------

Seems like this one is a bit different and should remain a separate 
binding?

>  .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
>  .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
>  .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
>  6 files changed, 118 insertions(+), 352 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra-car.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
