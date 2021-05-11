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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EAFC433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 16:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E9D76188B
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 16:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhEKQYH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 12:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbhEKQYG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 12:24:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9678BC061574;
        Tue, 11 May 2021 09:22:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j10so29455802lfb.12;
        Tue, 11 May 2021 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HwEpM74kdAaM+n3u4jDMRjmIgZKln1Kp9Vng06ofsEs=;
        b=rnXgd3JdiCQ+1FYDmn0cX7dC/5N/q5R2muzhKp3lI9VL3+JM5N8/t33iIdQKxWp/2e
         u6aBUUvmIm0hNxJ4/PFItIHBRsk1BtVOeK9xJRoLLjgbmbiwzA7VtGu+8eM3OLPqvSAK
         wNVeGjFD8rAMKc6DjS+y1dh/02bLsmpKFqPuuN7CzWMOLtCn7qb/qF3UezEs+D+F7kiP
         zS7Jy2WEdpRt7jVmTTxdzvH1z3QTNNg2UItvNfFcerH2JtYUorcvMuGVbUY9Qzv5/7dF
         FX2ClBaqVO8p8ipyIn2OyZPtq56nnUO/BqiBIusdj3wO9uM6heB/YNqqQHIcSt4uVFSX
         hE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HwEpM74kdAaM+n3u4jDMRjmIgZKln1Kp9Vng06ofsEs=;
        b=ATdrqGN8S8saqWUbI/DxCNGzdtJ2iSwlxEvR8j5LmJvqF16XjIIroqVnmuy8Lh6eZD
         lt2RcUwELFX6b1BgiNyKiFGInUb3rQ/BY+DZVqdcdrVgGFlsxEs/PmKKg8e/IwSq14lP
         orTUajgC/TeNLZgmxOihZg5wjeVl3wIr5XD4eTcbp8Myf77HrOJ0jhKedWzGFOy5Rdku
         XJgT5WlvgRiBgSLcIVGE3C+WWznMPlDK05phBHOM6wrKhxQ0r+SRlzLrplFf4fSf/ogO
         Fck9h1Tr1GZ+D9oPBgLcWMJE/DixwYGQFTHKlHR4p4KfcrBuK/sc+QNgJwbDpLjBTJT8
         GpDQ==
X-Gm-Message-State: AOAM532c3KYQEu2nEfaA8pad8+gPE4Wc7IHdU/sAiPbG6uneL2tBtjRN
        t3bbQSOO/bIsYlxw2U4e0DU5ldrJ1nw=
X-Google-Smtp-Source: ABdhPJwW4sAYZyqRdxyMo2CZgZi+lf7DQCaLrt0nMm85rrXuEdCW3wy9F8tHZaF/tulVwCIEga4FRg==
X-Received: by 2002:a05:6512:713:: with SMTP id b19mr21194017lfs.125.1620750176989;
        Tue, 11 May 2021 09:22:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id z15sm1828888ljc.84.2021.05.11.09.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 09:22:56 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
To:     kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210510213729.7095-3-digetx@gmail.com>
 <202105112327.nAMH7lzl-lkp@intel.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d0b84024-2f91-bc0a-8d3b-ec342ac4812d@gmail.com>
Date:   Tue, 11 May 2021 19:22:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202105112327.nAMH7lzl-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.05.2021 18:43, kernel test robot пишет:
> Hi Dmitry,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on tegra/for-next]
> [also build test ERROR on v5.13-rc1 next-20210511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Enable-compile-testing-for-Tegra-memory-drivers/20210511-053910
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
> config: parisc-randconfig-r011-20210511 (attached as .config)
> compiler: hppa64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/ecd67b1d49eb33c9821130a2b3b896bab395118d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Enable-compile-testing-for-Tegra-memory-drivers/20210511-053910
>         git checkout ecd67b1d49eb33c9821130a2b3b896bab395118d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=parisc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    hppa64-linux-ld: drivers/memory/tegra/tegra20-emc.o: in function `.LC9':
>>> (.data.rel.ro+0x30): undefined reference to `tegra20_clk_set_emc_round_callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra20-emc.o: in function `.LC52':
>    (.data.rel.ro+0xe0): undefined reference to `tegra20_clk_set_emc_round_callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra30-emc.o: in function `.LC11':
>>> (.data.rel.ro+0x30): undefined reference to `tegra20_clk_set_emc_round_callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra30-emc.o: in function `.LC48':
>    (.data.rel.ro+0xd0): undefined reference to `tegra20_clk_set_emc_round_callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra30-emc.o: in function `.LC60':
>>> (.data.rel.ro+0x118): undefined reference to `tegra20_clk_prepare_emc_mc_same_freq'
>    hppa64-linux-ld: drivers/memory/tegra/tegra124-emc.o: in function `.LC3':
>>> (.data.rel.ro+0x10): undefined reference to `tegra124_clk_set_emc_callbacks'
>    hppa64-linux-ld: drivers/memory/tegra/tegra124-emc.o: in function `.LC55':
>    (.data.rel.ro+0x110): undefined reference to `tegra124_clk_set_emc_callbacks'
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for TEGRA124_CLK_EMC
>    Depends on COMMON_CLK
>    Selected by
>    - TEGRA124_EMC && MEMORY && TEGRA_MC && (ARCH_TEGRA_124_SOC || COMPILE_TEST

I'll fix these missing stubs in v2.
