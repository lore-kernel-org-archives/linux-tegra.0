Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69178EE14A0
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Sep 2023 14:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237169AbjIFOya (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Sep 2023 10:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242017AbjIFOy3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Sep 2023 10:54:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E651019B5;
        Wed,  6 Sep 2023 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012058; x=1725548058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bz44MW893fGLZ166JEU3zSxEA/2p8R0CSkhmqN9mB3E=;
  b=CxXzUUnOnrWorZoyq1IXdMFaIkCbUeFF67I5NcKH1qsGSlkS1nxiQ6uY
   Ih8EbEdHAkpqQ64AhAG6B9BHTkjxDn/KBfI7yczDWvYALck9DTh4um8Gr
   aPZU92952F6vjg/qqXJ4bi1L/mpPEZ2BbyM0cjjISW3WK9aD/W6M8Ayxi
   /aCo3Lapo21N+AIFgkj9//DYFCowW+HwLIgtBAONNAG7opyUln01TseAS
   NDpwNvSrvTVEXxUrgOJQO7I9ZI07p0SYrf0s4ptGAQ7sDEgOEuKL8zRx/
   5+nw0/h4yugMDtM66Khv9185i9BZq0rD9JGtD33ICD/NdrZPSUEjoW++y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463463300"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="463463300"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807044455"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="807044455"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2023 07:54:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qdtv2-0000Il-2a;
        Wed, 06 Sep 2023 14:54:12 +0000
Date:   Wed, 6 Sep 2023 22:54:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kartik <kkartik@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, sumitg@nvidia.com, arnd@arndb.de,
        pshete@nvidia.com, andriy.shevchenko@linux.intel.com,
        digetx@gmail.com, petlozup@nvidia.com, windhl@126.com,
        frank.li@vivo.com, robh@kernel.org, stefank@nvidia.com,
        pdeschrijver@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/6] soc/tegra: fuse: Add tegra_acpi_init_apbmisc()
Message-ID: <202309062233.ytjhz7lC-lkp@intel.com>
References: <20230905125824.2947-3-kkartik@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905125824.2947-3-kkartik@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Kartik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on linus/master v6.5 next-20230906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik/soc-tegra-fuse-Refactor-resource-mapping/20230906-032546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20230905125824.2947-3-kkartik%40nvidia.com
patch subject: [PATCH v2 2/6] soc/tegra: fuse: Add tegra_acpi_init_apbmisc()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230906/202309062233.ytjhz7lC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062233.ytjhz7lC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062233.ytjhz7lC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/tegra/fuse/tegra-apbmisc.c:133:36: warning: 'apbmisc_acpi_match' defined but not used [-Wunused-const-variable=]
     133 | static const struct acpi_device_id apbmisc_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +/apbmisc_acpi_match +133 drivers/soc/tegra/fuse/tegra-apbmisc.c

   132	
 > 133	static const struct acpi_device_id apbmisc_acpi_match[] = {
   134		{ "NVDA2010" },
   135		{ /* sentinel */ }
   136	};
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
