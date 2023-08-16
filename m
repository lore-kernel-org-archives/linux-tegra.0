Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EE7C19F4F
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 19:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345953AbjHPT53 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 15:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346004AbjHPT5M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 15:57:12 -0400
Received: from out-35.mta1.migadu.com (out-35.mta1.migadu.com [IPv6:2001:41d0:203:375::23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8FE1FE3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Aug 2023 12:56:41 -0700 (PDT)
Message-ID: <b07819ea-4a96-0906-b8e9-a9b045c37032@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1692215793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yp3MkvbYHVbY4WtDiqYyRJj3P45kzg6DQyko6DuWKV0=;
        b=BgwK/EGhn0IW5XUSJlu6UXElXClXaqEIHI+D6kIFYN7SJmk3DounVwwt0bXS0821KXioV3
        uj2EmgriIEeV3MQbkJQrt5GdGD5OSIK7knZtyXsUP3kehCTnkFW1WlHHLIdXTfohexMyFi
        GAtI1Kdkl9zsaLZLQdywnOfE2E30izI=
Date:   Wed, 16 Aug 2023 20:56:30 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: tegra: Enable IOMMU for host1x on Tegra132
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230810214543.16235-1-rayyan@ansari.sh> <ZNz4IZ8lSXlGIZb_@orome>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <ZNz4IZ8lSXlGIZb_@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/08/2023 17:24, Thierry Reding wrote:
> On Thu, Aug 10, 2023 at 10:45:41PM +0100, Rayyan Ansari wrote:
>> Add the iommu property to the host1x node to register it with its
>> swgroup.
>>
>> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> Do you happen to have a Tegra132 device that you can test upstream Linux
> on? Just asking out of curiosity because these devices are becoming very
> rare these days and it'd be good to know if people are still using these
> and that recent Linux kernels are still running on them.

I do - I have the Nexus 9. At some point I was trying to mainline it, 
but I stopped as I couldn't manage to get USB working - I only got 
simplefb working. If it would be useful I could see if my old patches 
work now and submit them.

> 
> Thierry

-- 
Rayyan Ansari
https://ansari.sh

