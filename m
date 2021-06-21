Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21352C49EA4
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 17:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B432611CE
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 17:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhFURmt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 13:42:49 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:41947 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbhFURmr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 13:42:47 -0400
Received: by mail-oo1-f43.google.com with SMTP id k21-20020a4a2a150000b029024955603642so4684588oof.8;
        Mon, 21 Jun 2021 10:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=eZRvTitUTXg79vCUcBqtliWJ27F6/oY71n/zgGdrqfk=;
        b=kWTcnedxKX4h6qDK7yDA0g+K+9lCi1I5Er9B8gkY+x74XszgKygB5u4oI4+r/QX9Bv
         nyW8RmJ398POvqdzSmI4ZocHezVv1mppoHRpJbWWkJ4Re9okXWhpgPSW3ggfh1a6HejZ
         md+OAKZiOBDlbxY6hPM0qJGRSvH7Uh8e9qfqApP9Ooq8OybKmi2jsjqpmhufPQTus1su
         tlfjhDCXBCg1L0qm4i7m3URmc8IsFvcE7Xu6SBJwxtpliicdft1BQ8oOOSPBl1zglVnp
         yovjWvSrS6URsNUUTElgCfXY+jZFlpXK5eT4XUDzX9FBX6h9jnYF3ssLMEg+bC3N2IH3
         tTvg==
X-Gm-Message-State: AOAM531WtHDo4tXf516/ot3ZBTALsyDqa5v/TYVwpZ4+CXkdlzyfKvKX
        ZTB26mh+1AYeUXbERGnT5g==
X-Google-Smtp-Source: ABdhPJxtCbL9mw6b/aMOND5CNu6uLtvO3vUcxYX9T/Pg61Q//F01DNoeEEpQaUcIKm7dP2ZPiM65/A==
X-Received: by 2002:a4a:8749:: with SMTP id a9mr21523118ooi.71.1624297232669;
        Mon, 21 Jun 2021 10:40:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t3sm3317001oic.48.2021.06.21.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:40:32 -0700 (PDT)
Received: (nullmailer pid 1161645 invoked by uid 1000);
        Mon, 21 Jun 2021 17:40:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20210621141559.2881667-2-thierry.reding@gmail.com>
References: <20210621141559.2881667-1-thierry.reding@gmail.com> <20210621141559.2881667-2-thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: tegra: Convert to json-schema
Date:   Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.397900.1161644.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 21 Jun 2021 16:15:59 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the old plain-text device tree bindings for the USB EHCI
> controller found on NVIDIA Tegra SoCs to the json-schema format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
>  .../bindings/usb/nvidia,tegra20-ehci.yaml     | 151 ++++++++++++++++++
>  2 files changed, 151 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml:22:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml:23:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml:30:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.example.dt.yaml: usb@7d000000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1495151

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

