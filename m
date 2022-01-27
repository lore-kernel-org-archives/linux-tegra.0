Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8EDC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jan 2022 18:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbiA0SSL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jan 2022 13:18:11 -0500
Received: from mga18.intel.com ([134.134.136.126]:34042 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232693AbiA0SSL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jan 2022 13:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643307491; x=1674843491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tiRW1w/ZrynBvZpC/+NGXrHRVk29FeyQEHkhrU+8/7U=;
  b=RBJeK4gMMtXSB6F6KsNfPWprZExEGn+w/0aDQ4h7fMUIobH28uVR1Deq
   FjfUCm6RjjsybS4/Zs4yminZPfw0tM228CVNp4OKAv8u7wg+5gkzHDUl0
   5EQI4RiktPyFalPig1PZPkGysPEczm7LhaRppeOSKVsfDCHv33gBJbBc2
   oDhswXOEWlgmXai3dtlzqpwiGjdDhO+KIToINzls0DObDNzqck8AumE8X
   Hd0dWKB8PX856AEdgHsrDu7+e59H0hfYz3webG9jcAZgvDZYihtUHXYS3
   XU2TmuvyxyD9BpfH0SIS1wrBzsLaf2Tt8kOf2ImOm+/z63TafTmnOhaSM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="230506270"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="230506270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 10:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="563885039"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2022 10:18:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nD9LS-000Mu4-Gp; Thu, 27 Jan 2022 18:18:06 +0000
Date:   Fri, 28 Jan 2022 02:17:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
        robh+dt@kernel.org, thierry.reding@gmail.com
Cc:     kbuild-all@lists.01.org, jonathanh@nvidia.com, mkumard@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: tegra: Add audio devices on Tegra234
Message-ID: <202201280238.X7EvyPqD-lkp@intel.com>
References: <1643268455-15567-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643268455-15567-5-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sameer,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on robh/for-next tegra/for-next v5.17-rc1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sameer-Pujar/Tegra234-APE-support/20220127-152859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-randconfig-r032-20220124 (https://download.01.org/0day-ci/archive/20220128/202201280238.X7EvyPqD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/208f1a37b06fb0211db2a4f54be494079f0f3310
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sameer-Pujar/Tegra234-APE-support/20220127-152859
        git checkout 208f1a37b06fb0211db2a4f54be494079f0f3310
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/nvidia/tegra234.dtsi:28.27-28 syntax error
   FATAL ERROR: Unable to parse input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
