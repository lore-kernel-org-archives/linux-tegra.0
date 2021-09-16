Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B21DC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 14:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DED7B61214
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 14:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237935AbhIPOqA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 10:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbhIPOqA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 10:46:00 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D03C061574;
        Thu, 16 Sep 2021 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xTm1NaRptFZFSmCrLe8ZDubXtDPN1FNQ3UUquBBkFTA=; b=q3GRRUqLLOZxg2lFURWvmGFCf4
        /7RiofdSzBX/4+CnHgX2vifQKLEImTH+bgoKrYOwoeRfkAO9eA5U6pDsm6voeJnwXGllVhxSy9Vht
        2oKJvhwZ9KThO+TtxjcaIouqVo4sNX+loMPdFyTeM6Y7L4WgYEGgUrrTQFuPjvB1RGuSeIn49sjKZ
        hQJHDhbmWb7rJlkjiFhVQNuHkWCRrWi+rfYV4KKhB431wcM1pmSPRMtZp5DAFL+q8Y7bN3XxAxz76
        9A6XYca5N4z2uxACRd8gcZIATe2j+RRcV/WE2SHctZMc48XmGmwdO+pSXDY5bAPUtosAGIy5U4LSs
        lyvn2g4A==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mQscu-00009G-O6; Thu, 16 Sep 2021 17:44:36 +0300
Subject: Re: [PATCH v5 1/3] dt-bindings: Add YAML bindings for NVDEC
To:     Rob Herring <robh@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20210910104247.1206716-1-mperttunen@nvidia.com>
 <20210910104247.1206716-2-mperttunen@nvidia.com>
 <YUDCRb75pIqGZX1S@robh.at.kernel.org>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8e84e7e8-7930-db49-f5dd-5dfb0ce6cb11@kapsi.fi>
Date:   Thu, 16 Sep 2021 17:44:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YUDCRb75pIqGZX1S@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/14/21 6:39 PM, Rob Herring wrote:
> On Fri, Sep 10, 2021 at 01:42:45PM +0300, Mikko Perttunen wrote:
>> Add YAML device tree bindings for NVDEC, now in a more appropriate
>> place compared to the old textual Host1x bindings.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v5:
>> * Changed from nvidia,instance to nvidia,host1x-class optional
>>    property.
>> * Added dma-coherent
>> v4:
>> * Fix incorrect compatibility string in 'if' condition
>> v3:
>> * Drop host1x bindings
>> * Change read2 to read-1 in interconnect names
>> v2:
>> * Fix issues pointed out in v1
>> * Add T194 nvidia,instance property
>> ---
>>   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 105 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> new file mode 100644
>> index 000000000000..f1f8d083d736
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> @@ -0,0 +1,104 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Device tree binding for NVIDIA Tegra NVDEC
>> +
>> +description: |
>> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
>> +  and newer chips. It is located on the Host1x bus and typically
>> +  programmed through Host1x channels.
>> +
>> +maintainers:
>> +  - Thierry Reding <treding@gmail.com>
>> +  - Mikko Perttunen <mperttunen@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^nvdec@[0-9a-f]*$"
>> +
>> +  compatible:
>> +    enum:
>> +      - nvidia,tegra210-nvdec
>> +      - nvidia,tegra186-nvdec
>> +      - nvidia,tegra194-nvdec
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  dma-coherent: true
>> +
>> +  interconnects:
>> +    items:
>> +      - description: DMA read memory client
>> +      - description: DMA read 2 memory client
>> +      - description: DMA write memory client
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: dma-mem
>> +      - const: read-1
>> +      - const: write
>> +
>> +  nvidia,host1x-class:
>> +    description: Host1x class of the engine. If not specified, defaults to 0xf0.
> 
> Define what this is with more than just repeating what is in the
> property name.

Sure, I'll add a description.

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> default: 0xf0
> 
> Is there a range or set of valid values you specify as schema?

Only to the same extent that there is a set of valid MMIO addresses in 
the 'reg' field.

Mikko

> 
> Rob
> 
