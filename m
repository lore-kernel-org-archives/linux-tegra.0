Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BCDC19F2D
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Aug 2022 12:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239452AbiHIM65 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Aug 2022 08:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237342AbiHIM64 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Aug 2022 08:58:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D5715716
        for <linux-tegra@vger.kernel.org>; Tue,  9 Aug 2022 05:58:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b96so15085606edf.0
        for <linux-tegra@vger.kernel.org>; Tue, 09 Aug 2022 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=kPjnvUmfJWkzCXvwJnmoZlmPE/PE4hYt5/3+yKlMAyc=;
        b=WUPh+QPHCQxzXBwITi5JH81d1MavQfLHjzyUGbC9z+XKFxi1iHNJvHv6qbU/FeIwXf
         XhsJmF6Ogtb9C1Bn0Tsaq4So1guq4BoyMOmWj+VjH3qzQi7MPQ+CX3uFsepTJ7GsvJVh
         6RB8ocE61dE0l7a30ynDsxEHAJlzWIwLk+1U2R4j0MGfMNxw5fIoxhUEWGU28mSEMyx9
         uoI7qdEnRqfuFe5TK2bYPtXuPGf0p2hZ5NAQK0sYe8ZVMSDviVC5W+Zq+MtCBcWMRaO5
         04p0w50dA2c6OTp7gHvXXOn1rOryVhdoeHpss+lyQ9LEmzTQIgT2b5bgo7dIRcQZIDPt
         LlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=kPjnvUmfJWkzCXvwJnmoZlmPE/PE4hYt5/3+yKlMAyc=;
        b=waFUHRe/Xp6IF2d0hh3jQFJ2TNKcjQBN75UmwUKR+Fzfu5uQQbjc1/OKEZgergVjHb
         oBueoBCtD/5xya35M0fEgjB76i8TtRXAym6xdviSypLT/hiNuEgJZo0dLbU9As6Pnt9U
         fp1BVIU/bGDTkXu6GoDvFOlbtc5nSPKT8njYLPU/b4tFJ2hTtN4iVxeA96wxwFurJ1ne
         Bv37gIjKrqxGfxh/omm+MWBw6ml0E6SdlhVuMPX+OVddZPUoviOaq3dcmbAvPc/KLjKY
         BFtV6bYGTQfH5q9xi3RW7KB9Ga81eIWONylJqcNDE3kDaUZAgq/aBIGJ91Z+FVw91PZV
         jUhg==
X-Gm-Message-State: ACgBeo3OiragCaVexJt4GQixlyb8QTBlcNBp6hzJ3EtFzBWDg+Ixy/eu
        OUSe3eQxG2Yb94TEpxnjSAOkYDOPaOFSIg==
X-Google-Smtp-Source: AA6agR7hz2nZWQStWvY/4/0h7HwR79WswnvsZen/29O0+9iJON9lwyBiC/dLybyrOulTFL2r5bj5xQ==
X-Received: by 2002:a05:6402:4489:b0:43d:7f7d:7d88 with SMTP id er9-20020a056402448900b0043d7f7d7d88mr18967767edb.159.1660049934165;
        Tue, 09 Aug 2022 05:58:54 -0700 (PDT)
Received: from [10.202.0.7] ([31.31.140.89])
        by smtp.gmail.com with ESMTPSA id x17-20020aa7cd91000000b0043d34ab7ad6sm5948204edv.49.2022.08.09.05.58.52
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 05:58:52 -0700 (PDT)
Message-ID: <da3943f1-f4e9-6ddf-1cca-4393edb69dc8@citymesh.com>
Date:   Tue, 9 Aug 2022 14:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     linux-tegra@vger.kernel.org
From:   Koen Vandeputte <koen.vandeputte@citymesh.com>
Subject: dts for Nano development board 2GB version
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

I'm currently doing effort to support nvidia jetson within OpenWRT, 
starting with Nano boards.

It seems only the 4GB board is supported upstream (p3450-0000 
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts?h=v5.19>). 
[1]
Can someone share the dts for the 2GB version?  (|P3541-0000|)

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/nvidia?h=v5.19

Thanks,

Koen

