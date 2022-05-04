Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF04C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 03:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344185AbiEDDSM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 May 2022 23:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344169AbiEDDSM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 May 2022 23:18:12 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6F124F28
        for <linux-tegra@vger.kernel.org>; Tue,  3 May 2022 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651634077; x=1683170077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPNqCn8B1r/CxYCmXyDvw3yRFK2NMcxBFCnWdoQNkco=;
  b=c8j9kUtSXOQFbv9NdeeF0OVVPaXPsYO66s0qlTR1sj7qX2i/k2f1rxkf
   VsDE1helN+74Sx4aRJZ8tZnYe0AtYUtxw6tkZ0S6jclw49fhGehu1Z+U3
   AkKdcHKEp5Oi1ZYVsC3eQIjebCIr18MAf1A3K+NxavxhcHKlSICr34rdK
   mPWzrxhXUtBNnebZXTsV0RClC+SbfGGu2KvagNzqsEjhgrEhkCKb940ON
   XS4N5IFOxXxeEpOU6WX8lmy1yRBe3lUnsLw36q0VKaBY7I3EUogtyxbd3
   A8Q7zbOCGsYld/pB2sj8Gvcn4VLt46SKgFyqOYIjWxUPC6O12/tQo/TGe
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="255113862"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="255113862"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 20:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="567923490"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 May 2022 20:14:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nm5TH-000B0h-27;
        Wed, 04 May 2022 03:14:35 +0000
Date:   Wed, 4 May 2022 11:14:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     kbuild-all@lists.01.org, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Subject: [arm-tegra:hte/for-next 7/10] drivers/gpio/gpiolib-cdev.c:851:41:
 error: passing argument 2 of 'hte_request_ts_ns' from incompatible pointer
 type
Message-ID: <202205041124.ou0h2qgO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git hte/for-next
head:   cedbe14082d169f4c1136c70c5170a76bd9a076a
commit: 98935236600d4e179b664ffcfcd54e0ec3a1b4e3 [7/10] gpiolib: cdev: Add hardware timestamp clock type
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220504/202205041124.ou0h2qgO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git/commit/?id=98935236600d4e179b664ffcfcd54e0ec3a1b4e3
        git remote add arm-tegra https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
        git fetch --no-tags arm-tegra hte/for-next
        git checkout 98935236600d4e179b664ffcfcd54e0ec3a1b4e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib-cdev.c:572:8: error: unknown type name 'hte_return_t'
     572 | static hte_return_t process_hw_ts_thread(void *p)
         |        ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:623:8: error: unknown type name 'hte_return_t'
     623 | static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
         |        ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c: In function 'hte_edge_setup':
>> drivers/gpio/gpiolib-cdev.c:851:41: error: passing argument 2 of 'hte_request_ts_ns' from incompatible pointer type [-Werror=incompatible-pointer-types]
     851 |         return hte_request_ts_ns(hdesc, process_hw_ts,
         |                                         ^~~~~~~~~~~~~
         |                                         |
         |                                         int (*)(struct hte_ts_data *, void *)
   In file included from drivers/gpio/gpiolib-cdev.c:27:
   include/linux/hte.h:234:75: note: expected 'hte_ts_cb_t' {aka 'enum hte_return (*)(struct hte_ts_data *, void *)'} but argument is of type 'int (*)(struct hte_ts_data *, void *)'
     234 | static inline int hte_request_ts_ns(struct hte_ts_desc *desc, hte_ts_cb_t cb,
         |                                                               ~~~~~~~~~~~~^~
   drivers/gpio/gpiolib-cdev.c:852:34: error: passing argument 3 of 'hte_request_ts_ns' from incompatible pointer type [-Werror=incompatible-pointer-types]
     852 |                                  process_hw_ts_thread, line);
         |                                  ^~~~~~~~~~~~~~~~~~~~
         |                                  |
         |                                  int (*)(void *)
   In file included from drivers/gpio/gpiolib-cdev.c:27:
   include/linux/hte.h:235:53: note: expected 'hte_ts_sec_cb_t' {aka 'enum hte_return (*)(void *)'} but argument is of type 'int (*)(void *)'
     235 |                                     hte_ts_sec_cb_t tcb, void *data)
         |                                     ~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/hte_request_ts_ns +851 drivers/gpio/gpiolib-cdev.c

   828	
   829	static int hte_edge_setup(struct line *line, u64 eflags)
   830	{
   831		int ret;
   832		unsigned long flags = 0;
   833		struct hte_ts_desc *hdesc = &line->hdesc;
   834	
   835		if (eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
   836			flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
   837					  HTE_FALLING_EDGE_TS : HTE_RISING_EDGE_TS;
   838		if (eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
   839			flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
   840					  HTE_RISING_EDGE_TS : HTE_FALLING_EDGE_TS;
   841	
   842		line->total_discard_seq = 0;
   843	
   844		hte_init_line_attr(hdesc, desc_to_gpio(line->desc), flags,
   845				   NULL, line->desc);
   846	
   847		ret = hte_ts_get(NULL, hdesc, 0);
   848		if (ret)
   849			return ret;
   850	
 > 851		return hte_request_ts_ns(hdesc, process_hw_ts,
   852					 process_hw_ts_thread, line);
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
