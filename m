Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA1BC43457
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 08:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88443223FB
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 08:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388868AbgJTIak convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 04:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388850AbgJTIak (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 04:30:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE11C061755
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2020 01:30:40 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kUn2G-00036F-3p; Tue, 20 Oct 2020 10:30:24 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kUn2E-0005oA-K0; Tue, 20 Oct 2020 10:30:22 +0200
Message-ID: <ea670e2ed677d67afdb52e876eeee35eb9d7949e.camel@pengutronix.de>
Subject: Re: [PATCH v4 08/15] Documentation: of: Convert graph bindings to
 json-schema
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Rob Herring <robh@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com,
        nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
Date:   Tue, 20 Oct 2020 10:30:22 +0200
In-Reply-To: <20201019215628.GA3650804@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
         <1602859382-19505-9-git-send-email-spujar@nvidia.com>
         <20201019215628.GA3650804@bogus>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sameer, Rob,

On Mon, 2020-10-19 at 16:56 -0500, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 08:12:55PM +0530, Sameer Pujar wrote:
> > Convert device tree bindings of graph to YAML format.
> 
> Thanks for doing this.

Seconded.

> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/graph.txt  | 128 --------------------

The removed Documentation/devicetree/bindings/graph.txt is referenced by
a lot of files, tree-wide. Should the references be updated in the same
series?

> >  Documentation/devicetree/bindings/graph.yaml | 170 +++++++++++++++++++++++++++
> >  2 files changed, 170 insertions(+), 128 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/graph.txt
> >  create mode 100644 Documentation/devicetree/bindings/graph.yaml
> 
> I'd like to move this to the dtschema repository instead.
> 
> > diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
> > new file mode 100644
> > index 0000000..67804c1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/graph.yaml
> > @@ -0,0 +1,170 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> 
> As the original text defaulted to GPL2, this needs Philipp's permission 
> to re-license.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/graph.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for device graphs
> > +
> > +description: |
> > +  The hierarchical organisation of the device tree is well suited to describe
> > +  control flow to devices, but there can be more complex connections between
> > +  devices that work together to form a logical compound device, following an
> > +  arbitrarily complex graph.
> > +  There already is a simple directed graph between devices tree nodes using
> > +  phandle properties pointing to other nodes to describe connections that
> > +  can not be inferred from device tree parent-child relationships. The device
> > +  tree graph bindings described herein abstract more complex devices that can
> > +  have multiple specifiable ports, each of which can be linked to one or more
> > +  ports of other devices.
> > +
> > +  These common bindings do not contain any information about the direction or
> > +  type of the connections, they just map their existence. Specific properties
> > +  may be described by specialized bindings depending on the type of connection.
> > +
> > +  To see how this binding applies to video pipelines, for example, see
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +  Here the ports describe data interfaces, and the links between them are
> > +  the connecting data buses. A single port with multiple connections can
> > +  correspond to multiple devices being connected to the same physical bus.
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +definitions:
> > +
> > +  port:
> > +    type: object
> > +    description: |
> > +      If there is more than one 'port' or more than one 'endpoint' node
> > +      or 'reg' property present in the port and/or endpoint nodes then
> > +      '#address-cells' and '#size-cells' properties are required in relevant
> > +      parent node.
> 
> reg property.

What about #address-cells and #size-cells in port and ports nodes?
These must either be #address-cells = <1>, #size-cells = <0>, or they
can be absent if the parent node already has the same, or if a port node
only contains a single endpoint.

> > +
> > +    patternProperties:
> > +      "^endpoint(@[0-9a-f]+)?$":
> > +        type: object
> > +        properties:
> 
> reg?
> 
> > +          remote-endpoint:
> > +            description: |
> > +              phandle to an 'endpoint' subnode of a remote device node.
> > +            $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  ports:
> > +    type: object
> > +    patternProperties:
> > +      "^port(@[0-9a-f]+)?$":
> > +        $ref: "#/definitions/port"
> 
> No reason for this to be under 'definitions'. Just move down.
> 
> > +
> > +properties:
> > +  ports:
> > +    $ref: "#/definitions/ports"
> > +
> > +patternProperties:
> > +  "^port(@[0-9a-f]+)?$":
> > +    $ref: "#/definitions/port"
> > +
> > +additionalProperties: false
> 
> This needs to be true here. But you need this within 'ports' and 'port'. 
> (I think... I think we only have extra properties within endpoint 
> nodes.) 
> 
> > +
> > +examples:
> > +  # Organisation of ports and endpoints:
> > +  #
> > +  # Ports are described by child 'port' nodes contained in the device node.
> > +  # Each port node contains an 'endpoint' subnode for each remote device port
> > +  # connected to this port. If a single port is connected to more than one
> > +  # remote device, an 'endpoint' child node must be provided for each link.
> > +  # If more than one port is present in a device node or there is more than
> > +  # one endpoint at a port, or a port node needs to be associated with a
> > +  # selected hardware interface, a common scheme using '#address-cells',
> > +  # '#size-cells' and 'reg' properties is used to number the nodes.
> > +  - |
> > +    device {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +
> > +            endpoint@0 {
> > +                reg = <0>;
> > +                // ...
> > +            };
> > +            endpoint@1 {
> > +                reg = <1>;
> > +                // ...
> > +            };
> > +        };
> > +
> > +        port@1 {
> > +            reg = <1>;
> > +
> > +            endpoint {
> > +                // ...
> > +            };
> > +        };
> > +    };
> > +
> > +  # All 'port' nodes can be grouped under an optional 'ports' node, which
> > +  # allows to specify #address-cells, #size-cells properties for the 'port'
> > +  # nodes independently from any other child device nodes a device might
> > +  # have.
> > +  - |
> > +    device {
> > +        // ...
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <0>;
> > +                // ...
> > +
> > +                endpoint@0 {
> > +                    reg = <0>;
> > +                    // ...
> > +                };
> > +                endpoint@1 {
> > +                    reg = <1>;
> > +                    // ...
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <1>;
> > +                // ...
> > +            };
> > +        };
> > +    };
> > +
> > +  # Links between endpoints:
> > +  #
> > +  # Each endpoint should contain a 'remote-endpoint' phandle property that
> > +  # points to the corresponding endpoint in the port of the remote device.
> > +  # In turn, the remote endpoint should contain a 'remote-endpoint' property.
> > +  # If it has one, it must not point to anything other than the local endpoint.
> > +  # Two endpoints with their 'remote-endpoint' phandles pointing at each other
> > +  # form a link between the containing ports.
> > +  - |
> > +    device-1 {
> > +        port {
> > +            device_1_output: endpoint {
> > +                remote-endpoint = <&device_2_input>;
> > +            };
> > +        };
> > +    };
> > +
> > +    device-2 {
> > +        port {
> > +            device_2_input: endpoint {
> > +                remote-endpoint = <&device_1_output>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.7.4
> > 

regards
Philipp
