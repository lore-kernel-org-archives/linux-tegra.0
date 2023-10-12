Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431D0CDB47E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Oct 2023 19:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbjJLTAa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Oct 2023 15:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjJLTA3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 15:00:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA164CC;
        Thu, 12 Oct 2023 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137225; x=1728673225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y/XP8q1lDbCREfgUptfNDz2/kh/GMSzr+qayc0xvTes=;
  b=J31F/wGoQesM6St9oufyMWzDCZp9Q38qSQ5yOCWeOKUFQSW/XMeuRRAW
   o/IdE4BUjJaGXSaYZGO16j9PdTvJW4NnJnZIg+aSpZWkZr0UHF35w+vKN
   RSlSEiV1t1QHOh4a9F3/JEBnnlrWfHt4o1j2lcyHT1tr/olec4vz52Hdw
   II5mLANegb7+JXPMV9dsVr++REHF0o/eEq/B9a+saCPK4K/kBtSiCMtvm
   ycsDBzzF8Ok/CtUQvvLVxsUQv4d0BZVN4IYlEjdoCr7NG7xEx9DHZLejD
   LBj01+LTHZ7lJzud72wg5icvBoTKiJpkR2ytlv6rsxgkf4gxaw3JCZdMA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471254779"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471254779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 12:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878209762"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878209762"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 12:00:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qr0uv-0003lT-2G;
        Thu, 12 Oct 2023 19:00:17 +0000
Date:   Fri, 13 Oct 2023 02:59:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kartik <kkartik@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, keescook@chromium.org, andy@kernel.org,
        akpm@linux-foundation.org, arnd@arndb.de, petlozup@nvidia.com,
        pshete@nvidia.com, ulf.hansson@linaro.org, frank.li@vivo.com,
        robh@kernel.org, stefank@nvidia.com, pdeschrijver@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org
Cc:     oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 7/8] soc/tegra: fuse: Add ACPI support for Tegra194
 and Tegra234
Message-ID: <202310130245.1Ndq4Syg-lkp@intel.com>
References: <20231011093412.7994-8-kkartik@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011093412.7994-8-kkartik@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Kartik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on kees/for-next/hardening akpm-mm/mm-everything linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik/mm-util-Introduce-kmemdup_array-to-duplicate-an-array/20231011-192039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20231011093412.7994-8-kkartik%40nvidia.com
patch subject: [PATCH v4 7/8] soc/tegra: fuse: Add ACPI support for Tegra194 and Tegra234
config: arm64-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231013/202310130245.1Ndq4Syg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130245.1Ndq4Syg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130245.1Ndq4Syg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/tegra/fuse/fuse-tegra.c:314:36: warning: 'tegra_fuse_acpi_match' defined but not used [-Wunused-const-variable=]
     314 | static const struct acpi_device_id tegra_fuse_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~


vim +/tegra_fuse_acpi_match +314 drivers/soc/tegra/fuse/fuse-tegra.c

   313	
 > 314	static const struct acpi_device_id tegra_fuse_acpi_match[] = {
   315		{ "NVDA200F" },
   316		{ /* sentinel */ }
   317	};
   318	MODULE_DEVICE_TABLE(acpi, tegra_fuse_acpi_match);
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
