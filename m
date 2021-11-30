Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BFCC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbhK3Bfr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:35:47 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35728 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbhK3Bfr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:35:47 -0500
Received: by mail-oi1-f180.google.com with SMTP id m6so38179072oim.2;
        Mon, 29 Nov 2021 17:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rZ9ua9dLmHLtXP7Agm3EoNvm+6bYjZxxXMd5Pr6rERQ=;
        b=C4EJTgS6TtVziZIjDuzNyeaYxtXa49wOTyBelyZFxeKs79pRR6QtdFU1bFaDhGzJ2s
         m9YHpl1m8U6+ui8mxFpNmnRtJ+m4RD9UW30BuN3/Zn1OYi8HkdOfJyU210MWlyp59qTN
         t9Y0f/OBxTnw2C24WKyVinVKGcc4AOkfNZPe5OaImNCab1WNu1QUsvRKq6fwg846xs7q
         hJF3KoPW5m1APHa2b0aD6mIxqSDQgVajkvBsM2KMd1y5j6rS7q4eI0HQx28f8a0EPeBO
         bZRxSfarAzJbeu9D6toLwP/tU4blM+FJRpMtOHV3DZhqF+a21YSjuJdR3SmDOHo+IeSn
         eiSQ==
X-Gm-Message-State: AOAM530DYLXr1j/MV5P2WQXfPJuZIlaCfTcrHxwk8fDgMIIVdwWk7sKo
        urE4WjmcE87Vp9Q+WZDJNCNpSlB8Mg==
X-Google-Smtp-Source: ABdhPJxXUETzLfWzyzckRnZzknlIy5WBLJcpHRENlBsv7DxyxZ5ibvhwgY43tjvByj1n4Zl6T02zUQ==
X-Received: by 2002:aca:a897:: with SMTP id r145mr1534780oie.136.1638235948801;
        Mon, 29 Nov 2021 17:32:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u13sm2564031oop.28.2021.11.29.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:32:28 -0800 (PST)
Received: (nullmailer pid 980136 invoked by uid 1000);
        Tue, 30 Nov 2021 01:32:27 -0000
Date:   Mon, 29 Nov 2021 19:32:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 03/16] dt-bindings: mailbox: tegra: Convert to
 json-schema
Message-ID: <YaV/KxcSAIDCQ1q2@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:26 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra HSP bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add missing additionalProperties: false
> 
>  .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  72 ------------
>  .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 111 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
