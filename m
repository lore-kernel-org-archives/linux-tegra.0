Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A94DC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Dec 2021 21:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243165AbhLBVMj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Dec 2021 16:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhLBVMi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Dec 2021 16:12:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28F0C06174A;
        Thu,  2 Dec 2021 13:09:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44FB262657;
        Thu,  2 Dec 2021 21:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72FFC00446;
        Thu,  2 Dec 2021 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638479353;
        bh=L2e8HqW+dRovUp4kKOJlCJHgbSnTfs0UOcthSJhMeoo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=flivxh+ywdU8KQZYdad8Q7m1Q8oKS4skhZyPVS3vMEJf06av5XR+EEZsdvt54fV+Q
         Me+d1UWDSZ4kd3LUH9z+Fa7rUYDQ8emKhr9PKynFuhuCfAHFamIrXHNTY76IcS3Z+r
         pbx87pBM4Z1E/aKgU+VKBLnVzfkRiCYtNZMz9OdGjfDpMK3Tm66XxLHNFJ77ATizR3
         G3I8LrFMC+hf/A0oCgG/AF/KrRRFZNew2b85IRhoJPpGB4T37JHpTwHLwdRc64zCij
         oOT20E4SFCbKsuQtCQdcc7R3T0kxAJk7mnE/HyNHudF+B+2IWGxdqxfeFrk+/8n6lV
         YZ+7csPglJScA==
Received: by mail-ed1-f51.google.com with SMTP id l25so3034801eda.11;
        Thu, 02 Dec 2021 13:09:13 -0800 (PST)
X-Gm-Message-State: AOAM533JhWcO7tmbJnpjql6+VkxjAu4XI9yyX6HT6ATgFCHrJ9iEjzOT
        OumUXnOUP543ToTLFiDvjNb05jPRgvnGYdjuKg==
X-Google-Smtp-Source: ABdhPJyLQ7wzKuLDYNj6lPT3KgbxQXk0zkoWYpThJ5TJtBDf2b4+6Yz19vtzMXi2J5s0verOrVZmNK6NlX1W6zO/N04=
X-Received: by 2002:a17:906:bccc:: with SMTP id lw12mr17768529ejb.128.1638479351965;
 Thu, 02 Dec 2021 13:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-14-thierry.reding@gmail.com> <YaWCAGQU0sjCwz66@robh.at.kernel.org>
 <Yae0DwCpFu8F/Gbw@orome.fritz.box> <CAL_Jsq+JvZQjN3q4A3yoM+pUPHLYKtwUT=QsDq+oQ7jk8mD3CA@mail.gmail.com>
 <YakIePafm3t6rJLE@orome.fritz.box>
In-Reply-To: <YakIePafm3t6rJLE@orome.fritz.box>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 2 Dec 2021 15:08:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKb-azHGWkNzEJfCffiJ7FzscV4--8sKgq+uEONFmRD0w@mail.gmail.com>
Message-ID: <CAL_JsqKb-azHGWkNzEJfCffiJ7FzscV4--8sKgq+uEONFmRD0w@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 2, 2021 at 11:55 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Dec 01, 2021 at 12:42:07PM -0600, Rob Herring wrote:
> > On Wed, Dec 1, 2021 at 11:42 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Mon, Nov 29, 2021 at 07:44:32PM -0600, Rob Herring wrote:
> > > > On Fri, Nov 19, 2021 at 03:38:36PM +0100, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >
> > > > > Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> > > > > free-form text format to json-schema.
> > > > >
> > > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - add missing additionalProperties: false
> > > > >
> > > > >  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
> > > > >  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++++++
> > > > >  2 files changed, 42 insertions(+), 42 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > > > > deleted file mode 100644
> > > > > index ab240e10debc..000000000000
> > > > > --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> > > > > +++ /dev/null
> > > > > @@ -1,42 +0,0 @@
> > > > > -NVIDIA Tegra186 BPMP I2C controller
> > > > > -
> > > > > -In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
> > > > > -devices, such as the I2C controller for the power management I2C bus. Software
> > > > > -running on other CPUs must perform IPC to the BPMP in order to execute
> > > > > -transactions on that I2C bus. This binding describes an I2C bus that is
> > > > > -accessed in such a fashion.
> > > > > -
> > > > > -The BPMP I2C node must be located directly inside the main BPMP node. See
> > > > > -../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> > > > > -
> > > > > -This node represents an I2C controller. See ../i2c/i2c.txt for details of the
> > > > > -core I2C binding.
> > > > > -
> > > > > -Required properties:
> > > > > -- compatible:
> > > > > -    Array of strings.
> > > > > -    One of:
> > > > > -    - "nvidia,tegra186-bpmp-i2c".
> > > > > -- #address-cells: Address cells for I2C device address.
> > > > > -    Single-cell integer.
> > > > > -    Must be <1>.
> > > > > -- #size-cells:
> > > > > -    Single-cell integer.
> > > > > -    Must be <0>.
> > > > > -- nvidia,bpmp-bus-id:
> > > > > -    Single-cell integer.
> > > > > -    Indicates the I2C bus number this DT node represent, as defined by the
> > > > > -    BPMP firmware.
> > > > > -
> > > > > -Example:
> > > > > -
> > > > > -bpmp {
> > > > > -   ...
> > > > > -
> > > > > -   i2c {
> > > > > -           compatible = "nvidia,tegra186-bpmp-i2c";
> > > > > -           #address-cells = <1>;
> > > > > -           #size-cells = <0>;
> > > > > -           nvidia,bpmp-bus-id = <5>;
> > > > > -   };
> > > > > -};
> > > > > diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..351e12124959
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> > > > > @@ -0,0 +1,42 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/i2c/nvidia,tegra186-bpmp-i2c.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: NVIDIA Tegra186 (and later) BPMP I2C controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > > +  - Jon Hunter <jonathanh@nvidia.com>
> > > > > +
> > > > > +description: |
> > > > > +  In Tegra186 and later, the BPMP (Boot and Power Management Processor)
> > > > > +  owns certain HW devices, such as the I2C controller for the power
> > > > > +  management I2C bus. Software running on other CPUs must perform IPC to
> > > > > +  the BPMP in order to execute transactions on that I2C bus. This
> > > > > +  binding describes an I2C bus that is accessed in such a fashion.
> > > > > +
> > > > > +  The BPMP I2C node must be located directly inside the main BPMP node.
> > > > > +  See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
> > > > > +  binding.
> > > > > +
> > > > > +  This node represents an I2C controller. See ../i2c/i2c.txt for details
> > > > > +  of the core I2C binding.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: nvidia,tegra186-bpmp-i2c
> > > > > +
> > > >
> > > > > +  "#address-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  "#size-cells":
> > > > > +    const: 0
> > > >
> > > > Covered by i2c-controller.yaml. Add a reference and then use
> > > > unevaluatedProperties.
> > >
> > > About that: I've recently noticed that this doesn't seem to work
> > > properly. I'm using branch draft2020-12 from your github and my
> >
> > Use dtschema main/master branch. That branch is likely stale.
>
> That seems to have helped somewhat. I do occasionally see warnings now
> about unevaluated properties being unexpected. I can still reproduce the
> issue, though, see below.
>
> > > understanding was that this should give us support for
> > > unevaluatedProperties. And indeed, it no longer complains about
> > > #address-cells and #size-cells if I remove them from this binding,
> > > presumably because it gets them from i2c-controller.yaml.
> > >
> > > However, a side-effect seems to be that now it also ignores any
> > > properties that aren't defined anywhere. So for example if I touch
> > > up the example in firmware/nvidia,tegra186-bpmp.yaml and add a bogus
> > > "foo-bar = <0>;" property in the BPMP I2C node, then it'll blindly
> > > accept that as valid.
> >
> > Do you have unevaluatedProperties within the i2c node? It only applies
> > to 1 level, and you can't have a parent+child schema evaluated with
> > another child (or parent+child) schema. This is why the graph schema
> > is done the way it is and why we're splitting spi-controller.yaml
> > child node schema out to spi-peripheral.yaml.
>
> Let me give an example based on a schema that's already upstream. So
> looking at this:
>
>         Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
>
> it does include spi-controller.yaml via an allOf: [ $ref: ... ], so it
> uses unevaluatedProperties to validate against any generic SPI
> controller properties. For example, #address-cells and #size-cells are
> validated based on the schema from spi-controller.yaml.
>
> However, if I now apply the following patch to add an undocumented
> property to the example, then validation doesn't fail as I would expect
> it to.

Indeed you are right. The problem is 'additionalProperties: true' in
spi-controller.yaml makes everything evaluated. I thought
'additionalProperties: true' was equivalent to the default, but that's
not how it's working. Now to figure out if this is correct operation
or not. No wonder there were relatively few fixes when
'unevaluatedProperties' got implemented...

Rob
