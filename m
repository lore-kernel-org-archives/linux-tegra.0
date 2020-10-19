Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5948C433E7
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 21:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BA8422400
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603144592;
	bh=yZWk3jU06ZfrimzDC19qf0Fd5wAuClK9rhtWsEHWQnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nrZY38imXDSFf53CVzHQSZEe8dt67xSgqHFuEmYrNeT8yPHM2+HEehod5eLpsLUBd
	 tJiY7V3RVDE+uNLEwr+r6TDedFadfGykGlsO5RoH5vBwhQDkUgcqNf+Hx8qkliLhWo
	 ESP7tV5842zI8PQDTHOc8PgDx2BOZZrzuX81TrAs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbgJSV4c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 17:56:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40463 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgJSV4b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 17:56:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id m128so1738292oig.7;
        Mon, 19 Oct 2020 14:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PjydU190i7GN2JJAnYmlRKleN4kFxmQKH0ztDbomadk=;
        b=jfNJOVwodSSmYR2RH4VChyGIeo6YCqa8YqWmFrS8sj1vC7oeA22CxcG10//tcaEXQe
         7gwl0og3HoSwWFRD5jnQHjvKJ8q0J/XCg/LRKogiboZBu8/v/wOpxbNCRIAQth/X8c5m
         98LOOcNw9JVFjIlbLuqqmVUHCwQp/d0xwdn2b+Waw7Sg3xbhow6ovDOFbO0xfRnn/coC
         b3hMq5ciD2b5ANaj4A6BecFD0oIq4yHyh9nuHigvKXfEaiAHPIhuO9JxRPVAWRlrTxEp
         1Zw2ZhPx8ZjKDdTsF+F08A0tCRyokXd0L1iW+gS2DKsFnMo0lbja6gY9l9Lpirbu2tnY
         Sx1A==
X-Gm-Message-State: AOAM5325RNSjKFiyUMIf8cLQU+piMJNM5en5OLO4rPD1wk17f7FCfvic
        mV2IfigYG9MJ4dKqcRQmwQ==
X-Google-Smtp-Source: ABdhPJw4Lum6ffck1YRawMIIyuUeY33/Wvg9VIm5C8dx7ePCdMYgUxZN7KQBNvd54FJAMw3Kp0RLig==
X-Received: by 2002:aca:37c5:: with SMTP id e188mr1067613oia.159.1603144590441;
        Mon, 19 Oct 2020 14:56:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w128sm285335oie.47.2020.10.19.14.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 14:56:29 -0700 (PDT)
Received: (nullmailer pid 3669541 invoked by uid 1000);
        Mon, 19 Oct 2020 21:56:28 -0000
Date:   Mon, 19 Oct 2020 16:56:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, p.zabel@pengutronix.de, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com,
        dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com,
        swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: [PATCH v4 08/15] Documentation: of: Convert graph bindings to
 json-schema
Message-ID: <20201019215628.GA3650804@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-9-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602859382-19505-9-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2020 at 08:12:55PM +0530, Sameer Pujar wrote:
> Convert device tree bindings of graph to YAML format.

Thanks for doing this.

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/graph.txt  | 128 --------------------
>  Documentation/devicetree/bindings/graph.yaml | 170 +++++++++++++++++++++++++++
>  2 files changed, 170 insertions(+), 128 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/graph.txt
>  create mode 100644 Documentation/devicetree/bindings/graph.yaml

I'd like to move this to the dtschema repository instead.

> diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
> new file mode 100644
> index 0000000..67804c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/graph.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

As the original text defaulted to GPL2, this needs Philipp's permission 
to re-license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/graph.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common bindings for device graphs
> +
> +description: |
> +  The hierarchical organisation of the device tree is well suited to describe
> +  control flow to devices, but there can be more complex connections between
> +  devices that work together to form a logical compound device, following an
> +  arbitrarily complex graph.
> +  There already is a simple directed graph between devices tree nodes using
> +  phandle properties pointing to other nodes to describe connections that
> +  can not be inferred from device tree parent-child relationships. The device
> +  tree graph bindings described herein abstract more complex devices that can
> +  have multiple specifiable ports, each of which can be linked to one or more
> +  ports of other devices.
> +
> +  These common bindings do not contain any information about the direction or
> +  type of the connections, they just map their existence. Specific properties
> +  may be described by specialized bindings depending on the type of connection.
> +
> +  To see how this binding applies to video pipelines, for example, see
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  Here the ports describe data interfaces, and the links between them are
> +  the connecting data buses. A single port with multiple connections can
> +  correspond to multiple devices being connected to the same physical bus.
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +definitions:
> +
> +  port:
> +    type: object
> +    description: |
> +      If there is more than one 'port' or more than one 'endpoint' node
> +      or 'reg' property present in the port and/or endpoint nodes then
> +      '#address-cells' and '#size-cells' properties are required in relevant
> +      parent node.

reg property.

> +
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?$":
> +        type: object
> +        properties:

reg?

> +          remote-endpoint:
> +            description: |
> +              phandle to an 'endpoint' subnode of a remote device node.
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ports:
> +    type: object
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?$":
> +        $ref: "#/definitions/port"

No reason for this to be under 'definitions'. Just move down.

> +
> +properties:
> +  ports:
> +    $ref: "#/definitions/ports"
> +
> +patternProperties:
> +  "^port(@[0-9a-f]+)?$":
> +    $ref: "#/definitions/port"
> +
> +additionalProperties: false

This needs to be true here. But you need this within 'ports' and 'port'. 
(I think... I think we only have extra properties within endpoint 
nodes.) 

> +
> +examples:
> +  # Organisation of ports and endpoints:
> +  #
> +  # Ports are described by child 'port' nodes contained in the device node.
> +  # Each port node contains an 'endpoint' subnode for each remote device port
> +  # connected to this port. If a single port is connected to more than one
> +  # remote device, an 'endpoint' child node must be provided for each link.
> +  # If more than one port is present in a device node or there is more than
> +  # one endpoint at a port, or a port node needs to be associated with a
> +  # selected hardware interface, a common scheme using '#address-cells',
> +  # '#size-cells' and 'reg' properties is used to number the nodes.
> +  - |
> +    device {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            endpoint@0 {
> +                reg = <0>;
> +                // ...
> +            };
> +            endpoint@1 {
> +                reg = <1>;
> +                // ...
> +            };
> +        };
> +
> +        port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +                // ...
> +            };
> +        };
> +    };
> +
> +  # All 'port' nodes can be grouped under an optional 'ports' node, which
> +  # allows to specify #address-cells, #size-cells properties for the 'port'
> +  # nodes independently from any other child device nodes a device might
> +  # have.
> +  - |
> +    device {
> +        // ...
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +                // ...
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                    // ...
> +                };
> +                endpoint@1 {
> +                    reg = <1>;
> +                    // ...
> +                };
> +            };
> +
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +                // ...
> +            };
> +        };
> +    };
> +
> +  # Links between endpoints:
> +  #
> +  # Each endpoint should contain a 'remote-endpoint' phandle property that
> +  # points to the corresponding endpoint in the port of the remote device.
> +  # In turn, the remote endpoint should contain a 'remote-endpoint' property.
> +  # If it has one, it must not point to anything other than the local endpoint.
> +  # Two endpoints with their 'remote-endpoint' phandles pointing at each other
> +  # form a link between the containing ports.
> +  - |
> +    device-1 {
> +        port {
> +            device_1_output: endpoint {
> +                remote-endpoint = <&device_2_input>;
> +            };
> +        };
> +    };
> +
> +    device-2 {
> +        port {
> +            device_2_input: endpoint {
> +                remote-endpoint = <&device_1_output>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
