Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D825C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Mar 2022 13:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbiCCNED (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Mar 2022 08:04:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiCCNEC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Mar 2022 08:04:02 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5AC4EF66
        for <linux-tegra@vger.kernel.org>; Thu,  3 Mar 2022 05:03:17 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D06ED3F4C2
        for <linux-tegra@vger.kernel.org>; Thu,  3 Mar 2022 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646312590;
        bh=Rx4ZxbVhDyZFayUzEjmbuXvhfELZHztCqgfiHOmaXUk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=I08YoXc/4myiweY/9P4Pjj9pDXlH9vZZ8kpIE2pxxLVEnEfjMs2pLuIFVBly7XksS
         izZNfEvb3Yb2TIWjfzxk/8+fzs4f1zjYrAIrHh8K2gXKrQNB3WySbt1yU9nxCDpuRO
         LfkXFglFXOP8i2M5EYdtE1UiZRae6MWXMWIB+orHF0zUFo2JgksGJgN3p2SCrkWhtT
         yslZ1LI3Z64mP5KLlI/54E+Kw5V/IO5LBOyytUNhlvs3x0t1P6B2PUKBDwEW1Kae5i
         V9j4SjoA2l43LqDZtAHgHhaD8TugtLdtzw4DfV5gtNqvdH7/SgrfvZM4DFrgA8r3FX
         xE4V7q0qmokeQ==
Received: by mail-wm1-f70.google.com with SMTP id j42-20020a05600c1c2a00b00381febe402eso2700814wms.0
        for <linux-tegra@vger.kernel.org>; Thu, 03 Mar 2022 05:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rx4ZxbVhDyZFayUzEjmbuXvhfELZHztCqgfiHOmaXUk=;
        b=aUrdjFXW5mMoG9jwpaIL1tseHS1Bbl3EFZ7rB4ffGsGsyxWM5mVUiWYD3DRl4fky1o
         ekhjwWaM09fYBQ1jIUdvPkHotmpiG8BFhjGFb9Ze1d2vGrVGakRJgPReY5vV0fjl/OfY
         1h+71/bqYJBWs4RdJMucRWVq+ECpgzMCJuS07sZIDmRh3NtVthlVRGnVBU+MKpI0rRZs
         3hlBLELnd4vGvO1vTzH9jggptC+tBzSj3Y5lDD+5T/owYwMXmoDGxLsaWLbAWBqAduSz
         orw2fZoNiGzmEdN/bwuBu0+/Oi7m5AZOXi68jsgAS/6dm9igHNw7o3aCqh5OZpFgyV3V
         tmEw==
X-Gm-Message-State: AOAM530NSr+BXo+KrdTJtQNrsaDusZwBkhwVJgJClzInekf76SPAhAx1
        uTOHCqb264vcf/NtPTJIWZXCBzWM8yMs82mps5nIiQxk5MytMOoCtu4FEwrYCJBp1YJ93Kf5XG3
        cC9KdFVj8Nd83AZh64uRvdsurJFseCEX7J6uRj/ls
X-Received: by 2002:a5d:678f:0:b0:1f0:2471:5a93 with SMTP id v15-20020a5d678f000000b001f024715a93mr6943667wru.164.1646312590101;
        Thu, 03 Mar 2022 05:03:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtq12b/0QiPZ1UiPJj10zJ0+nXXE5RfkSxXjl3iTmlxz4AnHd2ZbB0Iubafpeh3O6Fry4k2Q==
X-Received: by 2002:a5d:678f:0:b0:1f0:2471:5a93 with SMTP id v15-20020a5d678f000000b001f024715a93mr6943647wru.164.1646312589904;
        Thu, 03 Mar 2022 05:03:09 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w6-20020a05600018c600b001efe4a49566sm2002944wrq.78.2022.03.03.05.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 05:03:08 -0800 (PST)
Message-ID: <a1f26936-6522-a3a5-f812-a80a63003453@canonical.com>
Date:   Thu, 3 Mar 2022 14:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Patch v4 4/4] memory: tegra: Add MC error logging on tegra186
 onward
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        Ashish Mhetre <amhetre@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org, vdumpa@nvidia.com,
        Snikam@nvidia.com
References: <202203031247.0bBX70B3-lkp@intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <202203031247.0bBX70B3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/03/2022 13:31, Dan Carpenter wrote:
> Hi Ashish,
> 
> url:    https://github.com/0day-ci/linux/commits/Ashish-Mhetre/memory-tegra-Add-MC-channels-and-error-logging/20220302-164625
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
> config: openrisc-randconfig-m031-20220302 (https://download.01.org/0day-ci/archive/20220303/202203031247.0bBX70B3-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 11.2.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New smatch warnings:
> drivers/memory/tegra/mc.c:593 tegra30_mc_handle_irq() error: uninitialized symbol 'channel'.

Ashish,

I mentioned with your v3 that it is expected for submitter to run
certain automatic tools:
"We not only expect to compile it but also compile with W=1, run sparse,
smatch and coccicheck. Then also test."

Judging by the output here, it could be that either you used old
compiler or did not run the checks.

Can you please confirm that you performed all the activities mentioned
before?

Best regards,
Krzysztof
