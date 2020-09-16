Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDAFC43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B09120838
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="nsqiln7d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgIPT2j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgIPT0r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 15:26:47 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F14C06174A
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=g+cGRsItI8plFrm1ENJsm5T9BsZ3PevnipkmNmYaEic=; b=nsqiln7dC94KM3EbOP3WwRNekM
        Zsn+t9m8xOpw26pB49IeRez35DrfsyTv1kF4bnBFO2sBKc88VNx6bcQTDjQnJqJrg5dHSYa7ytfRv
        FEs8DrOUHD+Kf8bengp0S9LQhwbKDLjG38VLdCljqmqdM2p+eOcVr1Act2eLrSQz+rZvQmp8vBrcI
        Jp0f4na136iojZcXquXOe3ins/7/1ScMqyqP/Cxp2jGXa4EBn+jPSwZ9K51c5tsd1c5g3PBuk9kQq
        FPDKT3Capk4vfmSSek0w6Mqg8Gb1YiXaxfLS5DR4AGp+NOzQPdBkcYlvFn6/bo9oQ6regJwB2EGSo
        vlH51i5A==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kId4W-0008Fg-46; Wed, 16 Sep 2020 22:26:28 +0300
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Jon Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc:     Sumit Garg <sumit.garg@linaro.org>, linus.walleij@linaro.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Will Deacon <will@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
 <dcf812d9-2409-bcae-1925-e21740c2932e@nvidia.com>
 <a6c7bbc91c5b23baa44f3abe35eb61c9@kernel.org>
 <d6dddab0-47aa-ddf2-959b-85493b8da52d@nvidia.com>
 <13c096832bd923f956ddd7db7e337857@kernel.org>
 <02bb9262-221a-b2cf-4471-dd3a46b442e7@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <63815f37-6a82-27c2-10e9-2649b2c864a0@kapsi.fi>
Date:   Wed, 16 Sep 2020 22:26:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <02bb9262-221a-b2cf-4471-dd3a46b442e7@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Not sure which boards this issue is happening on, but looking at my 
hobby kernel's git history (from a couple of years ago, memory is a bit 
hazy), the commit labeled "Add support for TX2" adds code to drop from 
EL2 to EL1 at boot.

Mikko

On 9/16/20 10:06 PM, Jon Hunter wrote:
> On 16/09/2020 17:22, Marc Zyngier wrote:
>> Do you boot form EL2?
> 
> Not that I am aware of. There is no hypervisor that we are using.
> 
> Jon
> 
