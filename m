Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8399CC05027
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Jan 2023 15:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjAWPyb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjAWPyb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Jan 2023 10:54:31 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679C635B8
        for <linux-tegra@vger.kernel.org>; Mon, 23 Jan 2023 07:54:28 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so8935479wmq.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Jan 2023 07:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sWhsZS74+Dvjyfzik5/nC+Ev2mJ9IDMei/KC6GCemqY=;
        b=TT+l75Q3a2+t2PvAy6nHsS+q1ZUp/sKbhf5T64RkZ9ddDppwuYZeXMANpq/6o/mj+A
         yMJgop3GLTikdPYq98Wm9+bmbsmcgeRyrpDOH5wvGMevQKJW5Gz1hGCIDPVqiptM7gPI
         GkruSFbxWZZPi7Ast7916sM4U7Txk25klxq/bRBHnH/qFQ8shdnm+okdCP4opcfnLSnt
         AmddDMghG+aDGpq1cc/hRVyVU6vh0zcKxyIw8pA3LjwiOzhMEecd1cE3e6OaThw3+hQj
         h2JXVEgDPlVEVY5qgPjmA5r40jPMP0VZglCL3lbfUWvDHlWwOllnrSJV/ipOUyi7L6R4
         gw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWhsZS74+Dvjyfzik5/nC+Ev2mJ9IDMei/KC6GCemqY=;
        b=ggF/UsYucGYq90BVRaxGwfTBpdmv6tDPUOufCNvYettrLOFYKKIgzRhk4lCpm8TWio
         TMJArpftQ0oj+PVfz3gFePrBGwpN28B8/x1CHEMhiCAHnSVkNIvCCIYNM+5Sv9qnmBz2
         FRzNfU2V0kegiMnZeroWsO9+1LjsTq1qtpPN4vnVWGbprxNR/GUu/KPrhK8DYuOC0JC6
         Lwx02WXh/vFy3mj0EHym0UWr2hUzux24ntxuPS7sGH7W1XiI12TTq7948Ve8gYvpkBph
         iJtVz2pZzBku8xPjFKq0dqVFM9IR222z02tHaHKjyArR1hWrDqsKWlIBdEVF1RWVUQwh
         nTcQ==
X-Gm-Message-State: AFqh2krP44jwPeBPG3/VO42z1E+9/J1KsBSlncFco1tkdoH2NmoIp4ve
        TwDOR8J9bBQ5OzueisAsRps/J6m68nVTvQCj
X-Google-Smtp-Source: AMrXdXud0tQooneMXSQQVIEYXsQAZXqN6E4Gkaz9JfIa1aRRHlSWR2a6cT0AuUF0CvwyFs2RKMFDuw==
X-Received: by 2002:a05:600c:5116:b0:3db:1a8:c041 with SMTP id o22-20020a05600c511600b003db01a8c041mr24615039wms.17.1674489266958;
        Mon, 23 Jan 2023 07:54:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b003dafadd2f77sm12126036wms.1.2023.01.23.07.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:54:26 -0800 (PST)
Message-ID: <b86ed174-811a-023f-4a65-4bc0b10cf710@linaro.org>
Date:   Mon, 23 Jan 2023 16:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-2-jonathanh@nvidia.com>
 <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
 <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/01/2023 15:28, Jon Hunter wrote:
> 
> On 20/01/2023 08:32, Krzysztof Kozlowski wrote:
> 
> ...
> 
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/tegra194-gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    i2c {
>>> +      #address-cells = <1>;
>>> +      #size-cells = <0>;
>>> +      #interrupt-cells = <2>;
>>
>> Drop, does not look like relevant or used here.
> 
> 
> Without the above I get ...

Didn't you drop too much? I meant only that one line above my comment,
so only interrupt-cells.

> 
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:25.13-26: Warning (reg_format): /example-0/i2c/typec-controller@8:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #address-cells value
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #size-cells value
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: typec-controller@8: interrupts: [[10], [8]] is too long
> 
>>
>>> +
>>> +      ucsi-ccg@8 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> Thanks. I don't see anything there is would fit here, so would 'typec-controller' for the node name be OK?

Yeah, pretty often we miss a generic example. Can be just "typec".


> 

Best regards,
Krzysztof

