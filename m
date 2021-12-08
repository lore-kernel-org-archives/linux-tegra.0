Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0F8C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 18:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239474AbhLHTCF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 14:02:05 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:39788 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhLHTCF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 14:02:05 -0500
Received: by mail-oi1-f182.google.com with SMTP id bf8so5366942oib.6;
        Wed, 08 Dec 2021 10:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KKsS5ERzblu+cHr+gFdBax3NBmt5adfDb9QpoKRIgBc=;
        b=c8OU9Am7nxLmXRMRt14dsHizcNhNHyWIUt/q9ri4LrbkYRIgfHv6Bq5yM+0tMbz1h/
         1fRLo2W3ywOoi69lC3kt/1H+wXDmDpD1JVBbj7NEuvSKdtgg/P/EwGswN6UWvJ8zNYUG
         iQkmRB+Pcu44hY6Wzcfupj4+9TP8TPbMOR7ZT1CHQ/d33aPPdDPimehXluqepniwKg5n
         jmSveXDi8eWJZO7TTTTVvP46jQDiOk98uZ26RXSeF2//hj1tPY4lxdKlfGcdGzgw3M46
         tduKCXUs4eYXsnAuMAflr1hZUc1kZHS6nRQHpCQ/fRDkwjimCV9VuvUyrLLNyiS00kLi
         ozHA==
X-Gm-Message-State: AOAM531/ov/fJ3Zm/d7KVVRX2Ed2ubCdKcDzRNaDGB7nmjOfsvYdmXon
        yKrohzwsKCArI6fqbMP2fcHlnBpLbQ==
X-Google-Smtp-Source: ABdhPJztFEXXmr5arUYl/LaTFuMKU4hVvGte7lyJ9o/PLIwjK4QmASeQiLWM04jrFyu1vpwe8GtPBw==
X-Received: by 2002:a05:6808:9ae:: with SMTP id e14mr1259044oig.68.1638989912381;
        Wed, 08 Dec 2021 10:58:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c3sm909514oiw.8.2021.12.08.10.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 10:58:31 -0800 (PST)
Received: (nullmailer pid 148290 invoked by uid 1000);
        Wed, 08 Dec 2021 18:58:30 -0000
Date:   Wed, 8 Dec 2021 12:58:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Message-ID: <YbEAVmZzQw5+URv7@robh.at.kernel.org>
References: <20211208143306.534700-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208143306.534700-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 08 Dec 2021 15:33:06 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - include i2c-controller.yaml and use unevaluatedProperties: false
> 
> Changes in v2:
> - add missing additionalProperties: false
> 
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -----------------
>  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> 

Applied, thanks!
