Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD85CC433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  3 May 2022 20:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbiECUWC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 May 2022 16:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236271AbiECUWB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 May 2022 16:22:01 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5002CE0F
        for <linux-tegra@vger.kernel.org>; Tue,  3 May 2022 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651609106; x=1683145106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/DmKAqhcBCwyk+W58kHF9vgs2kME3Fop4ErwDfmo6zI=;
  b=kQ3qVkJaNrF4XTRkIVFOjcjIYljL6HwE3GrF4Y15TaI7GqrBITY3tKIp
   /BUSNa+8vuF7BjEvyKfcy29NpUTM4wCilxxZFXvy5ZurTBr1PH20hM+xG
   7fKt2ryF/HSkU1DC93dEO+Jb6akK/0CPg01Xq+27El3Kv1fanAvK4f0c7
   RPkZQjc4iH+5M3KVAmJ1rpFWJu7Y2xanOBJRqi/QUHyzbRzK/NK7kARn1
   Vts1sGkSGmJ8NleTHxQtUIFSjRp2xGLIFR6mxpwYxAVGlM3oV2woF8Ce5
   Z2u9WY1Jhji45h2GdgBLCfM51jRYsw2LhK11j1n+bbbr8nJVlaaw1KIXf
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267170281"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="267170281"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 13:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="620488390"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 May 2022 13:18:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nlyyV-000AlZ-P5;
        Tue, 03 May 2022 20:18:23 +0000
Date:   Wed, 4 May 2022 04:17:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: [arm-tegra:hte/for-next 7/10] drivers/gpio/gpiolib-cdev.c:851:34:
 error: incompatible function pointer types passing 'irqreturn_t (struct
 hte_ts_data *, void *)' (aka 'enum irqreturn (struct hte_ts_data *, void
 *)') to parameter of type 'hte_ts_cb_t' (aka 'enum hte_return (*)(struct
 h...
Message-ID: <202205040454.CGWxoTt3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git hte/for-next
head:   cedbe14082d169f4c1136c70c5170a76bd9a076a
commit: 98935236600d4e179b664ffcfcd54e0ec3a1b4e3 [7/10] gpiolib: cdev: Add hardware timestamp clock type
config: arm-ep93xx_defconfig (https://download.01.org/0day-ci/archive/20220504/202205040454.CGWxoTt3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git/commit/?id=98935236600d4e179b664ffcfcd54e0ec3a1b4e3
        git remote add arm-tegra https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
        git fetch --no-tags arm-tegra hte/for-next
        git checkout 98935236600d4e179b664ffcfcd54e0ec3a1b4e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib-cdev.c:572:8: error: unknown type name 'hte_return_t'; did you mean 'irqreturn_t'?
   static hte_return_t process_hw_ts_thread(void *p)
          ^~~~~~~~~~~~
          irqreturn_t
   include/linux/irqreturn.h:17:24: note: 'irqreturn_t' declared here
   typedef enum irqreturn irqreturn_t;
                          ^
   drivers/gpio/gpiolib-cdev.c:581:10: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
                   return HTE_CB_HANDLED;
                   ~~~~~~ ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:612:10: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
                   return HTE_CB_HANDLED;
                   ~~~~~~ ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:620:9: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
           return HTE_CB_HANDLED;
           ~~~~~~ ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:623:8: error: unknown type name 'hte_return_t'; did you mean 'irqreturn_t'?
   static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
          ^~~~~~~~~~~~
          irqreturn_t
   include/linux/irqreturn.h:17:24: note: 'irqreturn_t' declared here
   typedef enum irqreturn irqreturn_t;
                          ^
   drivers/gpio/gpiolib-cdev.c:630:10: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
                   return HTE_CB_HANDLED;
                   ~~~~~~ ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:644:11: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
                           return HTE_CB_HANDLED;
                           ~~~~~~ ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:652:10: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
                   return HTE_RUN_SECOND_CB;
                   ~~~~~~ ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:655:9: warning: implicit conversion from enumeration type 'enum hte_return' to different enumeration type 'irqreturn_t' (aka 'enum irqreturn') [-Wenum-conversion]
           return HTE_CB_HANDLED;
           ~~~~~~ ^~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-cdev.c:851:34: error: incompatible function pointer types passing 'irqreturn_t (struct hte_ts_data *, void *)' (aka 'enum irqreturn (struct hte_ts_data *, void *)') to parameter of type 'hte_ts_cb_t' (aka 'enum hte_return (*)(struct hte_ts_data *, void *)') [-Werror,-Wincompatible-function-pointer-types]
           return hte_request_ts_ns(hdesc, process_hw_ts,
                                           ^~~~~~~~~~~~~
   include/linux/hte.h:234:75: note: passing argument to parameter 'cb' here
   static inline int hte_request_ts_ns(struct hte_ts_desc *desc, hte_ts_cb_t cb,
                                                                             ^
>> drivers/gpio/gpiolib-cdev.c:852:6: error: incompatible function pointer types passing 'irqreturn_t (void *)' (aka 'enum irqreturn (void *)') to parameter of type 'hte_ts_sec_cb_t' (aka 'enum hte_return (*)(void *)') [-Werror,-Wincompatible-function-pointer-types]
                                    process_hw_ts_thread, line);
                                    ^~~~~~~~~~~~~~~~~~~~
   include/linux/hte.h:235:25: note: passing argument to parameter 'tcb' here
                                       hte_ts_sec_cb_t tcb, void *data)
                                                       ^
   7 warnings and 4 errors generated.


vim +851 drivers/gpio/gpiolib-cdev.c

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
 > 852					 process_hw_ts_thread, line);
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
