Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BECC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 07:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237883AbiEDH0e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 May 2022 03:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241181AbiEDH0e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 May 2022 03:26:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E17417045
        for <linux-tegra@vger.kernel.org>; Wed,  4 May 2022 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651648977; x=1683184977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BwLeIk3BnJud4clTeNUa2jr8qafqRq+oCd/QpnB6Xk0=;
  b=mLrUPfsagvFUh7fMo1ur7qmKoStkOxmvWJtV3HKpt7EyekznuZj3S2o3
   jCHCMM9DV38tLn56CkQix4iwN3gYzaH28SUf7sZUcyWDEZQyd1c0YNIRM
   wKwyj1bXTGxsU02XKHC5eIU/y+O1F0wgsCzUoqEADKQ7v6q38/edEZjMb
   Uu46HD8TbHRI+CC3+2CCw6/VRna3m8V4hW6dbjwWADfTBrFdJ627VWqjG
   1r6t7w5EjyMTEmfn7ePJsLNOUo1DmZxpPrUfuel18EvqlpMJZBXPeRFm3
   p5S7NRmn5SrRKI/eqo2vZdKqYT15pE12VKgT2O9D9ki6jZy1YR6Lhltp7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267568053"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="267568053"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 00:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="693452983"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 May 2022 00:22:55 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nm9Lb-000BAh-8b;
        Wed, 04 May 2022 07:22:55 +0000
Date:   Wed, 4 May 2022 15:22:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     kbuild-all@lists.01.org, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Subject: [arm-tegra:hte/for-next 7/10] drivers/gpio/gpiolib-cdev.c:572:8:
 error: unknown type name 'hte_return_t'
Message-ID: <202205041541.7ij2aoYa-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git hte/for-next
head:   cedbe14082d169f4c1136c70c5170a76bd9a076a
commit: 98935236600d4e179b664ffcfcd54e0ec3a1b4e3 [7/10] gpiolib: cdev: Add hardware timestamp clock type
config: i386-debian-10.3-kselftests (https://download.01.org/0day-ci/archive/20220504/202205041541.7ij2aoYa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git/commit/?id=98935236600d4e179b664ffcfcd54e0ec3a1b4e3
        git remote add arm-tegra https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
        git fetch --no-tags arm-tegra hte/for-next
        git checkout 98935236600d4e179b664ffcfcd54e0ec3a1b4e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib-cdev.c:572:8: error: unknown type name 'hte_return_t'
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


vim +/hte_return_t +572 drivers/gpio/gpiolib-cdev.c

   571	
 > 572	static hte_return_t process_hw_ts_thread(void *p)
   573	{
   574		struct line *line;
   575		struct linereq *lr;
   576		struct gpio_v2_line_event le;
   577		int level;
   578		u64 eflags;
   579	
   580		if (!p)
   581			return HTE_CB_HANDLED;
   582	
   583		line = p;
   584		lr = line->req;
   585	
   586		memset(&le, 0, sizeof(le));
   587	
   588		le.timestamp_ns = line->timestamp_ns;
   589		eflags = READ_ONCE(line->eflags);
   590	
   591		if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {
   592			if (line->raw_level >= 0) {
   593				if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
   594					level = !line->raw_level;
   595				else
   596					level = line->raw_level;
   597			} else {
   598				level = gpiod_get_value_cansleep(line->desc);
   599			}
   600	
   601			if (level)
   602				le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
   603			else
   604				le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
   605		} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
   606			/* Emit low-to-high event */
   607			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
   608		} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
   609			/* Emit high-to-low event */
   610			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
   611		} else {
   612			return HTE_CB_HANDLED;
   613		}
   614		le.line_seqno = line->line_seqno;
   615		le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
   616		le.offset = gpio_chip_hwgpio(line->desc);
   617	
   618		linereq_put_event(lr, &le);
   619	
   620		return HTE_CB_HANDLED;
   621	}
   622	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
