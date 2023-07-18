Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBE3EB64DC
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Jul 2023 20:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjGRUzt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Jul 2023 16:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjGRUzs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jul 2023 16:55:48 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EE2C0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Jul 2023 13:55:44 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992ca792065so844182466b.2
        for <linux-tegra@vger.kernel.org>; Tue, 18 Jul 2023 13:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689713743; x=1692305743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5/Q35xHmhuof+VPV8azjO7eMNjfcha8DJIwvHdHt0o=;
        b=PFgB4D7FggRr8owwM5J+FpSet+uB+XvcF6jrR8wFL155JknFuxW51iG44FnpHV3txS
         ktD49zf9BRnxya4m0UCXw67GCZzoSUUbJoEvsCmSoG4clnIAwvL3hvWpWyY58kQv1bzg
         yd2ahiLHpyfjplaECs+ac/mknOfpXBTfdndgTjVlZyFI6K/f8t2d95ykGjK16XjstE0A
         VLLBAdFAY3EgPe9plAvlJBdUKAdXjJCFb1woUFyWAW0Mqq3R9Ao+zaEvDelX+rSIGyjv
         9g/Hjstz6DLB2o/IywUw2nxBakUKn0po6mHK8Kfwbao7+eqsAwOeEvwPzsx8xppj22NN
         BELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689713743; x=1692305743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5/Q35xHmhuof+VPV8azjO7eMNjfcha8DJIwvHdHt0o=;
        b=Uq+C1HpQbOuor5rfi9hg+2Bq/bGvNa7N6Tq4MxskXbJ7gbPbBIhoEGItSZ0RCCVDiW
         6HwgAc/ZPrtVLU0b1pJ2cFjQ5q1tvLaPPV0KPf/E1uOr4d/y7+XPIsTWDvOKO+jNmbCt
         Uc0Gvrl04tmMrfhgAbgqENoxBAslh49cv4+CQjzoIt3vsq8XhG+SJFjIaJrq32qbSQCy
         EEuch3atWoEI4NIpC3hJ2a+ttE0vsFTWcLWdVTFkRlRrZ90ZgfFCaLOrU45pqzygU2Cx
         Alow2xRBV2CZbRFPtQziLS0+5Wd0bbetUrrfQtUBbhDUuENGIyuZ7Oa8mJM7NZzh3KFi
         s+7g==
X-Gm-Message-State: ABy/qLZSHGT4BaSHhy6908f00PXatqQhYaK1s2qZ+aNDHDLzDeqPAJ4z
        rWvzu1dsWxoTTCwud/5oDaA=
X-Google-Smtp-Source: APBJJlFtmkRfvMkRgqpnhszk7Uo8WpEnXi7707OOBKLtasiVHiUnJHJCclhnQ2VzTVRzuaaFi1Frdw==
X-Received: by 2002:a17:906:cc:b0:974:1ef7:1e88 with SMTP id 12-20020a17090600cc00b009741ef71e88mr665351eji.13.1689713743015;
        Tue, 18 Jul 2023 13:55:43 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:3f48:40f3:5f5a:2395? ([2a02:908:8b3:1840:3f48:40f3:5f5a:2395])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b009937dbabbdasm1404787ejb.217.2023.07.18.13.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 13:55:42 -0700 (PDT)
Message-ID: <5de61620-8d12-1db4-56c6-8d63455b12c1@gmail.com>
Date:   Tue, 18 Jul 2023 22:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: LVDS panel compatible strings
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
References: <ZLFd_L_Uw1PmpSep@orome>
 <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
From:   Maxim Schwalm <maxim.schwalm@gmail.com>
In-Reply-To: <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 14.07.23 17:00, Svyatoslav Ryhel wrote:
> пт, 14 лип. 2023 р. о 17:38 Thierry Reding <thierry.reding@gmail.com> пише:
>>
>> Hi everyone,
>>
>> I've been working on converting all Tegra-related device tree bindings
>> to json-schema so that eventually we can fully validate device tree
>> files. Getting all the bindings reviewed and merged has been slow, but
>> I have a local tree where pretty much all validation errors and warnings
>> have been fixed. The remaining warnings that I'm not sure how to resolve
>> are these:
>>
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: display-panel: compatible: ['panel-lvds'] is too short
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: display-panel: compatible: ['panel-lvds'] is too short
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: display-panel: compatible: ['panel-lvds'] is too short
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-panel']
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel: compatible: ['panel-lvds'] is too short
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>>     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-panel: Unevaluated properties are not allowed ('compatible' was unexpected)
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> 
> Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used in
> ASUS TF201 but unfortunately it is not compatible with existing simple
> panel setup (blurry image if used). My assumption is that chagall as
> different revision of this panel like HSD101PWW3-B00 or
> HSD101PWW1-A00 which is more likely or panel is highly modified which
> is unlikely. I propose to use "hannstar,hsd101pww1" which is more wide
> spread.

perhaps we should check the EDID from Chagall before getting to
conclusions.

Best regards,
Maxim
