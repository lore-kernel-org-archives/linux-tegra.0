Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA74C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Dec 2021 19:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238970AbhLOT1D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Dec 2021 14:27:03 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:41783 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238939AbhLOT1C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Dec 2021 14:27:02 -0500
Received: by mail-oi1-f173.google.com with SMTP id u74so33046239oie.8;
        Wed, 15 Dec 2021 11:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ILCKf79K3QEU+W7rQ9d1idaE/Q5BxbJD/zYee4Hd05k=;
        b=BbxN8j+UyBEiIDrGAX/kwwC7S5OJg7Ng22fncoHh7X4gFmO43PKdI3XvNDZooUSkSY
         a1asGiADK/1tqPN2WBwiZUzIdD52klwHm5tYnyxmsazsNn8j9R3EAH1DTp4qToBDYmRj
         vMWlzYD0m57kerrGsHaPIwZN3VdDlCJS7PmGs19cuhPwl+JPCTl84Z2m/0iK7AWbMlSk
         PcPGvwvEML4q8fA69ZzR+OUHmEVwp3lps93mrR4SqL22YHNq/7P/ufpQ4Pq/lnIoOXhO
         gTkjawAYvKwkorsBDMBCgtpwNLJ1mfegn+aO+0HP/rIFYDnk7lZMdNbM0aPALVu1PsG8
         1M9Q==
X-Gm-Message-State: AOAM531oKIBZebSoM7llYU7XpwHsVHDGv/7sFGyG3DHDMXg7TgiILKSE
        Rzpc3NFbK4OpB1d0VqPjLw==
X-Google-Smtp-Source: ABdhPJytafQ5Or1Fx1ryGFd03qij2RndQ9oOJhMuSPwLbrkVyf4wBgqfpx+417m2CAaql9ioVdjt1A==
X-Received: by 2002:aca:4307:: with SMTP id q7mr1229338oia.3.1639596422276;
        Wed, 15 Dec 2021 11:27:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k14sm618018otb.50.2021.12.15.11.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:27:01 -0800 (PST)
Received: (nullmailer pid 1689232 invoked by uid 1000);
        Wed, 15 Dec 2021 19:27:00 -0000
Date:   Wed, 15 Dec 2021 13:27:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Peter Chen <peter.chen@freescale.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/4] dt-bindings: usb: tegra: Convert to json-schema
Message-ID: <YbpBhBwJvNtiITIj@robh.at.kernel.org>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
 <20211209165339.614498-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209165339.614498-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 09 Dec 2021 17:53:37 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the old plain-text device tree bindings for the USB EHCI
> controller found on NVIDIA Tegra SoCs to the json-schema format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> ---
> Changes in v2:
> - include usb-hcd.yaml and usb-drd.yaml
> - drop redundant phy_type property
> 
>  .../bindings/clock/nvidia,tegra124-car.yaml   |   5 +
>  .../bindings/clock/nvidia,tegra20-car.yaml    |   5 +
>  .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
>  .../bindings/usb/nvidia,tegra20-ehci.yaml     | 156 ++++++++++++++++++
>  4 files changed, 166 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
