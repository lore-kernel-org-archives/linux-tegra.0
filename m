Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADA5EB64DC
	for <linux-tegra@archiver.kernel.org>; Sun,  9 Jul 2023 17:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjGIRTn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 9 Jul 2023 13:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGIRTm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 9 Jul 2023 13:19:42 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD4C137
        for <linux-tegra@vger.kernel.org>; Sun,  9 Jul 2023 10:19:40 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 450EF240029
        for <linux-tegra@vger.kernel.org>; Sun,  9 Jul 2023 19:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1688923178; bh=IpCRT4PQk7DlnuUgJCIbzC9/+vGQLjShcVYXvAcsweU=;
        h=Date:From:To:cc:Subject:Message-ID:MIME-Version:From;
        b=ddg/N4oXaQ06mqAiNkIg6rIGqgAcFF+1boA6NKyytYp+zLMl11gFUtyy5uZAF37CQ
         kgO4+wm8NgcOGCl3FwQb4QAlRNza3YBFxk5cVdMfL120hjXbzMbLR77HkaLGuGpC/T
         3YYb0DiId2L+aozEclsHxHWyB5v7/lasjtbYlpGv4mv966i/5ypu+Bfw1OtcTLqxJS
         yOyJl2QdU3vcSlxR0Lr5aa3ai8OBbp89NWaXABuO3395gfx6XWNhRLaTf74hSyDi3J
         EnW5wQc7JDyewTixgci4ShhQjjW5MsjEuWqnH/wePPSDKxjwzN9FM2abaoru/hY3Q3
         IoLqxy1CE0lvA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QzYls0KMlz9rxD;
        Sun,  9 Jul 2023 19:19:37 +0200 (CEST)
Date:   Sun, 9 Jul 2023 19:19:36 +0200 (CEST)
From:   Marc Dietrich <marvin24@posteo.de>
To:     Thierry Reding <thierry.reding@gmail.com>
cc:     Rob Herring <robh@kernel.org>, Marc Dietrich <marvin24@gmx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: tegra: nvec: Convert to
 json-schema
In-Reply-To: <ZKbEEDWg5N8r8s-b@orome>
Message-ID: <25075252-8e38-a5f5-ebbf-cddca1508210@posteo.de>
References: <20230705155222.2519728-1-thierry.reding@gmail.com> <20230705155222.2519728-3-thierry.reding@gmail.com> <20230705205013.GA1871916-robh@kernel.org> <ZKbEEDWg5N8r8s-b@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On Thu, 6 Jul 2023, Thierry Reding wrote:

> On Wed, Jul 05, 2023 at 02:50:13PM -0600, Rob Herring wrote:
>> On Wed, Jul 05, 2023 at 05:52:22PM +0200, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Convert the NVIDIA embedded controller bindings from the free-form text
>>> format to json-schema.
>>>
>>> Acked-by: Marc Dietrich <marvin24@gmx.de>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>> Changes in v2:
>>> - drop $ref for standard clock-frequency property
>>> - use 4 spaces for indentation in example
>>> - move to soc/tegra directory
>>>
>>>  .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
>>>  .../bindings/soc/tegra/nvidia,nvec.yaml       | 92 +++++++++++++++++++
>>>  2 files changed, 92 insertions(+), 21 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
>>>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
>>> deleted file mode 100644
>>> index 5ae601e7f51f..000000000000
>>> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
>>> +++ /dev/null
>>> @@ -1,21 +0,0 @@
>>> -NVIDIA compliant embedded controller
>>> -
>>> -Required properties:
>>> -- compatible : should be "nvidia,nvec".
>>> -- reg : the iomem of the i2c slave controller
>>> -- interrupts : the interrupt line of the i2c slave controller
>>> -- clock-frequency : the frequency of the i2c bus
>>> -- gpios : the gpio used for ec request
>>> -- slave-addr: the i2c address of the slave controller
>>> -- clocks : Must contain an entry for each entry in clock-names.
>>> -  See ../clocks/clock-bindings.txt for details.
>>> -- clock-names : Must include the following entries:
>>> -  Tegra20/Tegra30:
>>> -  - div-clk
>>> -  - fast-clk
>>> -  Tegra114:
>>> -  - div-clk
>>> -- resets : Must contain an entry for each entry in reset-names.
>>> -  See ../reset/reset.txt for details.
>>> -- reset-names : Must include the following entries:
>>> -  - i2c
>>> diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
>>> new file mode 100644
>>> index 000000000000..0b4f898b2a1d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
>>> @@ -0,0 +1,92 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soc/tegra/nvidia,nvec.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: NVIDIA compliant embedded controller
>>> +
>>> +maintainers:
>>> +  - Thierry Reding <thierry.reding@gmail.com>
>>> +  - Jon Hunter <jonathanh@nvidia.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: nvidia,nvec
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: divider clock
>>> +      - description: fast clock
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: div-clk
>>> +      - const: fast-clk
>>> +
>>> +  resets:
>>> +    items:
>>> +      - description: module reset
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: i2c
>>> +
>>> +  clock-frequency: true
>>> +
>>> +  request-gpios:
>>> +    description: phandle to the GPIO used for EC request
>>> +
>>> +  slave-addr:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: I2C address of the slave controller
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>
>> You don't have any child nodes defined, so these 2 properties are
>> pointless.
>
> Good point. Looking at this a bit more, I think perhaps we should also
> rename the node representing this to i2c@7000c500 because this is really
> only a repurposed I2C controller, which is probably also where these
> stray #address-cells and #size-cells come from.
>
> In DT we basically duplicate i2c@7000c500 and nvec@7000c500, but we can
> probably also reuse most of i2c@7000c500 and just drop some things that
> NVEC can't use (such as dmas and dma-names) and add the slave specific
> bits (such as clock-frequency, slave-addr and request-gpios).
>
> Marc, any thoughts?

the idea was indeed to convert the driver to the i2c-slave sub-sys and add
the EC sub-functions (keyboard, mouse, power, ...) as children below the
controllers node, which are currently hard-coded. As this didn't happen 
yet these entries could be removed for now.
Using i2c instead of nvec as the node name also makes sense, because that
is the real hardware described by the following properties. On the other 
hand, I'm not sure if it is worth the effort (u-boot would also need this 
change).

Best regards,

Marc
