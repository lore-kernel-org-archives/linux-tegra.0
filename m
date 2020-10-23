Return-Path: <SRS0=+r4X=D6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E681AC388F9
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Oct 2020 13:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8249B21527
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Oct 2020 13:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="P+mXkpL3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374463AbgJWNqE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Oct 2020 09:46:04 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6969 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374057AbgJWNqE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Oct 2020 09:46:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f92de6b0002>; Fri, 23 Oct 2020 06:45:15 -0700
Received: from [10.25.102.106] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Oct
 2020 13:45:56 +0000
Subject: Re: [PATCH v4 08/15] Documentation: of: Convert graph bindings to
 json-schema
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-9-git-send-email-spujar@nvidia.com>
 <20201019215628.GA3650804@bogus>
 <ea670e2ed677d67afdb52e876eeee35eb9d7949e.camel@pengutronix.de>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <9cea202e-6ffb-c9da-d9c0-debc351fd944@nvidia.com>
Date:   Fri, 23 Oct 2020 19:15:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea670e2ed677d67afdb52e876eeee35eb9d7949e.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603460715; bh=xEanTRCOYabNAppmF/+BLQC44ZrW3FYCtdF8/+89DCo=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=P+mXkpL3P8Yckwuga28igVEQhM0NlLpL0YNCr9SXLwURhQYJZpYQStl24TUoJ54E1
         wB+hizDdXiwDup9Drb3CykEYfZOZmSfj2Eo5gdKet1ENTH5AiPAg2jQlT2NN/EA7z9
         rEOObWzslgQPhs5UYie/6WPc9mMrAK6nGnjArdN7GtiX4Yj2p7M5PI8ayRMhb5JqP3
         vTAXxwCTDQR1syYDud+GyXz7o3BXZQ8Ny+ZmkHs6tiGezIVj6++nEH6lBf087sJcYo
         CzE12yAY8dhDxnonWrNUSLqL0TaEKZwpxGXf1CALvKaRNM60a1ofgsy0ndzis+6gOP
         opcv5TrtwfSgA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>   Documentation/devicetree/bindings/graph.txt  | 128 --------------------
> The removed Documentation/devicetree/bindings/graph.txt is referenced by
> a lot of files, tree-wide. Should the references be updated in the same
> series?

May be possible to include in the same series if it is just about using 
'graph.yaml' reference instead of 'graph.txt' in various files.

...

>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/graph.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Common bindings for device graphs
>>> +
>>> +description: |
>>> +  The hierarchical organisation of the device tree is well suited to describe
>>> +  control flow to devices, but there can be more complex connections between
>>> +  devices that work together to form a logical compound device, following an
>>> +  arbitrarily complex graph.
>>> +  There already is a simple directed graph between devices tree nodes using
>>> +  phandle properties pointing to other nodes to describe connections that
>>> +  can not be inferred from device tree parent-child relationships. The device
>>> +  tree graph bindings described herein abstract more complex devices that can
>>> +  have multiple specifiable ports, each of which can be linked to one or more
>>> +  ports of other devices.
>>> +
>>> +  These common bindings do not contain any information about the direction or
>>> +  type of the connections, they just map their existence. Specific properties
>>> +  may be described by specialized bindings depending on the type of connection.
>>> +
>>> +  To see how this binding applies to video pipelines, for example, see
>>> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
>>> +  Here the ports describe data interfaces, and the links between them are
>>> +  the connecting data buses. A single port with multiple connections can
>>> +  correspond to multiple devices being connected to the same physical bus.
>>> +
>>> +maintainers:
>>> +  - Philipp Zabel <p.zabel@pengutronix.de>
>>> +
>>> +definitions:
>>> +
>>> +  port:
>>> +    type: object
>>> +    description: |
>>> +      If there is more than one 'port' or more than one 'endpoint' node
>>> +      or 'reg' property present in the port and/or endpoint nodes then
>>> +      '#address-cells' and '#size-cells' properties are required in relevant
>>> +      parent node.
>> reg property.
> What about #address-cells and #size-cells in port and ports nodes?
> These must either be #address-cells = <1>, #size-cells = <0>, or they
> can be absent if the parent node already has the same, or if a port node
> only contains a single endpoint.

Yes, will list these properties for port/ports.

...
