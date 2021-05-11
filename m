Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D450AC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:17:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 927F661396
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhEKPSW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 11:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbhEKPST (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 11:18:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9028C061574;
        Tue, 11 May 2021 08:17:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c3so29187353lfs.7;
        Tue, 11 May 2021 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l0+Py+3CSfNlV3pR44naNix1unXeingMcJ67NIXwY+s=;
        b=KvmvfOGCxA5R95WsJ7wQo1T7SFztdufpvwNa0wqh0a2VAR9KELBm2fXiKtVjucIons
         qyceviM5GU6KDbiZCKyxbZdEXMiui+5ZdDs0lSC1pPJrH1ZYSabTHoqrUpjdpCOUn5wj
         crJI6WoKbj17Pp/DjlEWpEhGGitpDdUaVnIubOD9vxarDIxBavzhJ/sjpHdA9LL6LKfT
         ckWXMjC1ptTnnkPwIYjLWfFivMW8v0WACxHFMfoXCcjDWKFxXLiiw+iUOQS26W4Keb9O
         Brvr7ke36/ZqKSjJsILolqmmZFIef8JojRRxW2T3IQc9VkcFMNsA25UqyRZswAAN9yvi
         BDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l0+Py+3CSfNlV3pR44naNix1unXeingMcJ67NIXwY+s=;
        b=RcqzOiPHgU5mH7a4wgVq3u+Tg4unwK2rnUS9e87Rk6kAXRZj5PDS2j0FOImyG8AMhC
         VqQop8/BvX/7xJzEcvvA6Rg34lMdwUmy0IoyqUR/AqZi4gsQUMpGPYfksxf75ubGEZ4K
         fdc0lGIFEEaDGG1DlvawsJkE4bcJpqLr4EaGGkwnIopGY5vn0/7Ko1oJQysek6Ekl4zc
         yq2GJDkcBMreG4UzQcR6+7f/uEV6aKiIJCFZYDZtjkGAdcwmsmLtJIVp2dzQucCmP0JZ
         COMhQlV6IdNrC5R1zLaeNwZVw8dyH7FqhJ4cRbuWRfKPrKnAOvEXUz3FutbYBFOPQ2qX
         XN1A==
X-Gm-Message-State: AOAM5302xcj7ZeFI5PEKS06DmcKXZBSv314jfQW+4baIxT1YIA1vHQK+
        iDEgr4Vx2SZbIsppPAePSfSKSM3qY6E=
X-Google-Smtp-Source: ABdhPJyXhN6Oluf0OSbovpK7KCmU9QCVIYigxkbbwdonQZFsw+d5xv8p+sw5yqXIED599YuCBkNwpA==
X-Received: by 2002:a05:6512:3f04:: with SMTP id y4mr22107926lfa.458.1620746229956;
        Tue, 11 May 2021 08:17:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id j14sm2657790lfc.47.2021.05.11.08.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 08:17:09 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
To:     kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210510213729.7095-3-digetx@gmail.com>
 <202105112125.VctfC6sX-lkp@intel.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
Date:   Tue, 11 May 2021 18:17:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202105112125.VctfC6sX-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.05.2021 16:58, kernel test robot пишет:
> Hi Dmitry,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on tegra/for-next]
> [also build test WARNING on v5.13-rc1 next-20210511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Enable-compile-testing-for-Tegra-memory-drivers/20210511-053910
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
> config: powerpc-randconfig-r032-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fed635fe1701470062495a6ffee1c608f3f1bc)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://github.com/0day-ci/linux/commit/ecd67b1d49eb33c9821130a2b3b896bab395118d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Enable-compile-testing-for-Tegra-memory-drivers/20210511-053910
>         git checkout ecd67b1d49eb33c9821130a2b3b896bab395118d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=powerpc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    __do_insb
>    ^
>    arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_insb'
>    #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:211:1: note: expanded from here
>    __do_insw
>    ^
>    arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
>    #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:213:1: note: expanded from here
>    __do_insl
>    ^
>    arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
>    #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:215:1: note: expanded from here
>    __do_outsb
>    ^
>    arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
>    #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:217:1: note: expanded from here
>    __do_outsw
>    ^
>    arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
>    #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:219:1: note: expanded from here
>    __do_outsl
>    ^
>    arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
>    #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>> drivers/memory/tegra/tegra30-emc.c:757:18: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744071562067985 to 2147483665 [-Wconstant-conversion]
>                    writel_relaxed(EMC_ZQ_CAL_LONG_CMD_DEV0,
>                    ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/memory/tegra/tegra30-emc.c:161:36: note: expanded from macro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>                                              ^
>    arch/powerpc/include/asm/io.h:679:40: note: expanded from macro 'writel_relaxed'
>    #define writel_relaxed(v, addr) writel(v, addr)
>                                    ~~~~~~ ^
>    13 warnings generated.
> --
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:203:1: note: expanded from here
>    __do_outl
>    ^
>    arch/powerpc/include/asm/io.h:537:62: note: expanded from macro '__do_outl'
>    #define __do_outl(val, port)    writel(val,(PCI_IO_ADDR)_IO_BASE+port);
>                                               ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:217:1: note: expanded from here
>    __do_insb
>    ^
>    arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_insb'
>    #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:219:1: note: expanded from here
>    __do_insw
>    ^
>    arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
>    #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:221:1: note: expanded from here
>    __do_insl
>    ^
>    arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
>    #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:223:1: note: expanded from here
>    __do_outsb
>    ^
>    arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
>    #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:225:1: note: expanded from here
>    __do_outsw
>    ^
>    arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
>    #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:227:1: note: expanded from here
>    __do_outsl
>    ^
>    arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
>    #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744071562067985 to 2147483665 [-Wconstant-conversion]
>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>    13 warnings generated.

This doesn't look like a useful warning from clang, it should see that
the constant value itself isn't truncated, hence it should be a problem
of clang. Do you think it's okay to ignore this nonsense?
