Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AFBC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 19:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbhLHT1V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 14:27:21 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40526 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhLHT1V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 14:27:21 -0500
Received: by mail-oi1-f173.google.com with SMTP id bk14so5441772oib.7;
        Wed, 08 Dec 2021 11:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vMPOCqmX2rqJjII8l8BhrszWEXK/3JkPbo/jt/J6tZo=;
        b=RH53txauN7nrHA+BYEiPd8+VSNdMy4AMeK+jb0SlaIkLsh42moSdPORVWtxBd1tKAk
         QgJu6HITkpEeEqkMUyvWmxouIoKJEnheBfgYDvflEA63Di7DlThpsHmYRcRvwrVucXXW
         bM+iuRBeQ7RNXEO2FCcUN1rl6rCuPjmJql94IPlvZXVZfTkOtdUtseAsGW3PIW8vFJuk
         POHBjp3daYJPQCuMQzm7K4jJdgpgsrDcr/asvrIz+a3Ukpdai+J5LFkQeodzBH0dV72G
         VLO2NnO22GZe0TErcVHOmW8UgqWrARU5TPamUXIb7xIAcJakabZnC98ZmRUu3tv5c13X
         1lKw==
X-Gm-Message-State: AOAM531tm6AkgfLxdgS515E38IGk4v7O/fMlX8OF5ducAx7FZTU/zlld
        BvPPaSmGWySbOecmmCXpuw==
X-Google-Smtp-Source: ABdhPJwVkrkrr5nVAI0j0IIW3IPYeAO5ORB1xsKyTnQoRXndakA8lAglSly8T50huhEZYmPSG7nbuw==
X-Received: by 2002:a05:6808:171b:: with SMTP id bc27mr1486405oib.21.1638991428735;
        Wed, 08 Dec 2021 11:23:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bd6sm913921oib.53.2021.12.08.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:23:48 -0800 (PST)
Received: (nullmailer pid 184533 invoked by uid 1000);
        Wed, 08 Dec 2021 19:23:47 -0000
Date:   Wed, 8 Dec 2021 13:23:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, JC Kuo <jckuo@nvidia.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: usb: tegra-xudc: Document interconnects and
 iommus properties
Message-ID: <YbEGQ3C/Ha9dRyEF@robh.at.kernel.org>
References: <20211206155559.232550-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206155559.232550-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 06 Dec 2021 16:55:59 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the interconnects, interconnect-names and iommus properties to the
> device tree bindings for the Tegra XUDC controller. These are used to
> describe the device's paths to and from memory.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
