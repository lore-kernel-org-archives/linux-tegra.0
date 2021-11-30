Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B227FC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236836AbhK3BtE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:49:04 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:35532 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhK3BtD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:49:03 -0500
Received: by mail-ot1-f41.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso28140123otr.2;
        Mon, 29 Nov 2021 17:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wY1NADhUKf9LP8Tdz8fLv6Z6IS+yjtdNz6gGeMmafFc=;
        b=K2LNC1Hx/SMYEfkxZIOJUN0vuXVKAPCNg5JeiOE+4PnYxgOR0bFes7u/kUSFE/MGER
         uSjBa3be7Lj77Vfq4Sn7s3k+Cc2nZoSQAZs/TIHWdSL6vZkrLrtOf3tVHTeFgPu950H/
         cQJQlJTGvnYPX55ZXeJ+uq6QLElopmbh2C3pfDvGGkRkPhRJmYGbOLpbH1jQRAIxmUkH
         8hvm8jnBdwaHdBX+fxhESfmgxNb12iDE1FjffscTF9RFRXIh2DCqGa8ML7VpuVEHsR3i
         jwn/ojlRahKP/UARJKQZEFTxHqbdftvw0zvRyNpi/ObFX3zx7MGf6a2q+AgwXZQ+PyXW
         PJCw==
X-Gm-Message-State: AOAM531bgZAkQ3JP2BFNkh5YTP60tSZXIpJE0vPsvDcv/6Bi+gQWQxex
        jtlxlSQCVDZTjMvWd5HMtA==
X-Google-Smtp-Source: ABdhPJwVL12u5u/v+JNuRaK0MB5kujKxv2HHTgFR6ClVjL8GSJKR5LLtZEgLPttyHhJfcuiTcO4ceA==
X-Received: by 2002:a9d:7d04:: with SMTP id v4mr49203945otn.180.1638236745048;
        Mon, 29 Nov 2021 17:45:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m6sm2519017ooe.24.2021.11.29.17.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:45:44 -0800 (PST)
Received: (nullmailer pid 999034 invoked by uid 1000);
        Tue, 30 Nov 2021 01:45:43 -0000
Date:   Mon, 29 Nov 2021 19:45:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 15/16] dt-bindings: serial: tegra-tcu: Convert to
 json-schema
Message-ID: <YaWCR71lBCbv6OHZ@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-16-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-16-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:38 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra TCU device tree bindings to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/serial/nvidia,tegra194-tcu.txt   | 35 ------------
>  .../bindings/serial/nvidia,tegra194-tcu.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
