Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67660C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  3 May 2022 23:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244384AbiECXvH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 May 2022 19:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244385AbiECXvH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 May 2022 19:51:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3326142EE8
        for <linux-tegra@vger.kernel.org>; Tue,  3 May 2022 16:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651621653; x=1683157653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hX5NeeBdLMGWUILQNv60Zwp3g5arz4ofV+yCSsZZlM=;
  b=hxdTlMDN8HP1gt/5FmeiRxnm6smGpS+IbK/EGfgPj/IF2X2iPbOWTjFj
   A4P0fldpAvJJTqCVkKbgyjvA9qeRgrxbtNC8vWomRGqQElAvH742tYst4
   0Cz2dkjAjtyLJ1OGVew5qegTxlrJ6QK7+FC2s515so5HWKvAI9z7YDGQQ
   rTf3JQfTEE0ZbkRXeC9EKNAqVJ4CUe6ZYjgQ1dIcVH/Us/obbxH4dP1De
   d0s8oonUPPf2JrwWSn05bi0e2/12MLjgXMisQoQSpTEpN4UDEjj/rfIxv
   p9P2wMeT4mIgwvjostpBdgAhrYO2EmrihN0PNR1WPHDbG+rGOIRcnf9I6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267501307"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="267501307"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 16:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="547969506"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 May 2022 16:47:30 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nm2Er-000At6-TR;
        Tue, 03 May 2022 23:47:29 +0000
Date:   Wed, 4 May 2022 07:47:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: [arm-tegra:hte/for-next 2/10] drivers/hte/hte.c:616:6: warning:
 variable 'ei' is used uninitialized whenever 'if' condition is true
Message-ID: <202205040735.Qhz7Bads-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git hte/for-next
head:   cedbe14082d169f4c1136c70c5170a76bd9a076a
commit: a15a6cd5adac70f8ea9188b55ff0b2899cc34e0f [2/10] drivers: Add hardware timestamp engine (HTE)
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220504/202205040735.Qhz7Bads-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git/commit/?id=a15a6cd5adac70f8ea9188b55ff0b2899cc34e0f
        git remote add arm-tegra https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
        git fetch --no-tags arm-tegra hte/for-next
        git checkout a15a6cd5adac70f8ea9188b55ff0b2899cc34e0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hte/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hte/hte.c:616:6: warning: variable 'ei' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ret < 0)
               ^~~~~~~
   drivers/hte/hte.c:630:13: note: uninitialized use occurs here
           module_put(ei->gdev->owner);
                      ^~
   drivers/hte/hte.c:616:2: note: remove the 'if' if its condition is always false
           if (ret < 0)
           ^~~~~~~~~~~~
   drivers/hte/hte.c:595:6: warning: variable 'ei' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!gdev->chip) {
               ^~~~~~~~~~~
   drivers/hte/hte.c:630:13: note: uninitialized use occurs here
           module_put(ei->gdev->owner);
                      ^~
   drivers/hte/hte.c:595:2: note: remove the 'if' if its condition is always false
           if (!gdev->chip) {
           ^~~~~~~~~~~~~~~~~~
   drivers/hte/hte.c:570:24: note: initialize the variable 'ei' to silence this warning
           struct hte_ts_info *ei;
                                 ^
                                  = NULL
   2 warnings generated.


vim +616 drivers/hte/hte.c

   551	
   552	/**
   553	 * hte_ts_get() - The function to initialize and obtain HTE desc.
   554	 *
   555	 * The function initializes the consumer provided HTE descriptor. If consumer
   556	 * has device tree node, index is used to parse the line id and other details.
   557	 * The function needs to be called before using any request APIs.
   558	 *
   559	 * @dev: HTE consumer/client device, used in case of parsing device tree node.
   560	 * @desc: Pre-allocated timestamp descriptor.
   561	 * @index: The index will be used as an index to parse line_id from the
   562	 * device tree node if node is present.
   563	 *
   564	 * Context: Holds mutex lock.
   565	 * Returns: Returns 0 on success or negative error code on failure.
   566	 */
   567	int hte_ts_get(struct device *dev, struct hte_ts_desc *desc, int index)
   568	{
   569		struct hte_device *gdev;
   570		struct hte_ts_info *ei;
   571		const struct fwnode_handle *fwnode;
   572		struct of_phandle_args args;
   573		u32 xlated_id;
   574		int ret;
   575		bool free_name;
   576	
   577		if (!desc)
   578			return -EINVAL;
   579	
   580		fwnode = dev ? dev_fwnode(dev) : NULL;
   581	
   582		if (is_of_node(fwnode))
   583			gdev = hte_of_get_dev(dev, desc, index, &args, &free_name);
   584		else
   585			gdev = hte_get_dev(desc);
   586	
   587		if (IS_ERR(gdev)) {
   588			pr_err("%s() no hte dev found\n", __func__);
   589			return PTR_ERR(gdev);
   590		}
   591	
   592		if (!try_module_get(gdev->owner))
   593			return -ENODEV;
   594	
   595		if (!gdev->chip) {
   596			pr_err("%s(): requested id does not have provider\n",
   597			       __func__);
   598			ret = -ENODEV;
   599			goto out;
   600		}
   601	
   602		if (is_of_node(fwnode)) {
   603			if (!gdev->chip->xlate_of)
   604				ret = -EINVAL;
   605			else
   606				ret = gdev->chip->xlate_of(gdev->chip, &args,
   607							   desc, &xlated_id);
   608		} else {
   609			if (!gdev->chip->xlate_plat)
   610				ret = -EINVAL;
   611			else
   612				ret = gdev->chip->xlate_plat(gdev->chip, desc,
   613							     &xlated_id);
   614		}
   615	
 > 616		if (ret < 0)
   617			goto out;
   618	
   619		ei = &gdev->ei[xlated_id];
   620	
   621		ret = hte_bind_ts_info_locked(ei, desc, xlated_id);
   622		if (ret)
   623			goto out;
   624	
   625		ei->free_attr_name = free_name;
   626	
   627		return 0;
   628	
   629	out:
   630		module_put(ei->gdev->owner);
   631	
   632		return ret;
   633	}
   634	EXPORT_SYMBOL_GPL(hte_ts_get);
   635	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
