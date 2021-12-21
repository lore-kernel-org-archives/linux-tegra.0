Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0E9C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Dec 2021 18:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhLUSbM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Dec 2021 13:31:12 -0500
Received: from mail-qt1-f181.google.com ([209.85.160.181]:35328 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhLUSbL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 13:31:11 -0500
Received: by mail-qt1-f181.google.com with SMTP id j17so13735425qtx.2;
        Tue, 21 Dec 2021 10:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Msqbr64lilA79sJrWaKHhlNoWI4Y9ukNts0JMzmKRhI=;
        b=08uO6I2LyaMW3qsAapLdJDdMRf27CPNyXlHn5eZSbdAacn1sehkIwZVdoprTRrRFV0
         tZha/lZm9+MdlyysEKO1VhrslbeT5DBkZij22inRMHhgu/zcsoR8OpCOYl9ISH9BDkJJ
         JcyO4Ir+VaeJKO07oEgZ0wQT9yFL9OAEv58M/zdUxtce4OJg98IT5Pgu/StjwzO65/0l
         83e4RSfNnEecM5qmNe6lP01wJSlZ9ZuC8eYMhbaxFBJG9qiOQkkXSFvuVJmEXwlP5BN9
         FV49q5eubTgecIZO99NYGh147jDRxc+/2SM8Opix02r8ixAq3npSFM6IYYNdjFdU9lkp
         Umxw==
X-Gm-Message-State: AOAM531oTr4RsfMGXTwptaiecpij5MPTI6O40B7G6hg5/28YQh+LsmSL
        tYp/Dym69gtundZk+/ZUSdRgvGVGtGjg
X-Google-Smtp-Source: ABdhPJyf75x3C6dapnwSf9z2R3Z2Osx2xL1TcJO6IOd4QXYzPawNCtrFL7EjqDnAc7dKxtwj+1s2Ww==
X-Received: by 2002:a05:622a:190f:: with SMTP id w15mr3404818qtc.124.1640111471085;
        Tue, 21 Dec 2021 10:31:11 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id v9sm13845840qkf.90.2021.12.21.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 10:31:10 -0800 (PST)
Received: (nullmailer pid 1534684 invoked by uid 1000);
        Tue, 21 Dec 2021 18:31:09 -0000
Date:   Tue, 21 Dec 2021 14:31:09 -0400
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: display: tegra: Convert to json-schema
Message-ID: <YcIdbfoeBIZl8xlW@robh.at.kernel.org>
References: <20211217164320.2330784-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217164320.2330784-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 17 Dec 2021 17:43:20 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
> 
> This also adds the missing display-hub DT bindings that were not
> previously documented.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v4:
> - add interconnect, interconnect-names, operating-points-v2 and
>   power-domains property to match latest DT updates
> - drop stale reference to DPAUX pad controller bindings
> - include dsi-controller.yaml and drop $nodename, #address-cells,
>   #size-cells and patternProperties from DSI bindings
> - integrate #sound-dai-cells addition from published patch
> - drop some generic, useless comments
> 
> Changes in v3:
> - split into separate YAML files for simplicity
> - add display-hub DT bindings
> 
> Changes in v2:
> - use additionalProperties instead of unevaluatedProperties where
>   sufficient
> - drop redundant $ref and add missing maxItems properties
> - drop documentation for standard properties
> - remove status properties from example
> - drop spurious comments
> 
>  .../display/tegra/nvidia,tegra114-mipi.txt    |  41 --
>  .../display/tegra/nvidia,tegra114-mipi.yaml   |  74 ++
>  .../display/tegra/nvidia,tegra124-dpaux.yaml  | 149 ++++
>  .../display/tegra/nvidia,tegra124-sor.yaml    | 206 ++++++
>  .../display/tegra/nvidia,tegra124-vic.yaml    |  71 ++
>  .../display/tegra/nvidia,tegra186-dc.yaml     |  85 +++
>  .../tegra/nvidia,tegra186-display.yaml        | 310 ++++++++
>  .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  46 ++
>  .../display/tegra/nvidia,tegra20-dc.yaml      | 181 +++++
>  .../display/tegra/nvidia,tegra20-dsi.yaml     | 159 +++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     |  70 ++
>  .../display/tegra/nvidia,tegra20-gr2d.yaml    |  73 ++
>  .../display/tegra/nvidia,tegra20-gr3d.yaml    | 214 ++++++
>  .../display/tegra/nvidia,tegra20-hdmi.yaml    | 126 ++++
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 675 ------------------
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 347 +++++++++
>  .../display/tegra/nvidia,tegra20-isp.yaml     |  67 ++
>  .../display/tegra/nvidia,tegra20-mpe.yaml     |  73 ++
>  .../display/tegra/nvidia,tegra20-tvo.yaml     |  58 ++
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 163 +++++
>  .../display/tegra/nvidia,tegra210-csi.yaml    |  52 ++
>  .../pinctrl/nvidia,tegra124-dpaux-padctl.txt  |  59 --
>  22 files changed, 2524 insertions(+), 775 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
