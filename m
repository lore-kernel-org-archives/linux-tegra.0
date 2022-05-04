Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0790C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 03:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343870AbiEDDjO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 May 2022 23:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344426AbiEDDjN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 May 2022 23:39:13 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6741C201BE
        for <linux-tegra@vger.kernel.org>; Tue,  3 May 2022 20:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651635338; x=1683171338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhtUz+qeZTjE8/++Anr/nnyq2MR/uTHHHZTfS+FTPlw=;
  b=LIbU7iRltE/J4A3T023dCqePVcLYYK+LvmfnEZ68t6NjPaFOd9rMVxXd
   Ewi+aVdct4aLW7rI4kHxv5qLs9ODlBNvuynx0Is2e7OjCIpxQ36APb3jK
   p1Bw2lAm5T19ElNZHD1BSugH6w/KNiPmJac66hlrCR5DBC7AVLbnNcvrH
   caLXjXpsV46AZh38RhMlicqphVZfLxzeJUuYLhWiwsh91YhYjCw2SRAoD
   XdPgy8Cr9R0P8oDLWnlkmCNn7qLd8hfXw7mOc19NOC4jY9+jzBez6VPfz
   V9eeG7wp+kNRV0dI+zyFn5kTaVZqePU1Aagdx5PwXv2lSBSo88Mhb+qAk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="328194976"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="328194976"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 20:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="536649777"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 May 2022 20:35:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nm5nc-000B27-13;
        Wed, 04 May 2022 03:35:36 +0000
Date:   Wed, 4 May 2022 11:34:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     kbuild-all@lists.01.org, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Subject: [arm-tegra:hte/for-next 9/10] drivers/hte/hte-tegra194-test.c:62:8:
 error: unknown type name 'hte_return_t'
Message-ID: <202205041101.S97kTIme-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git hte/for-next
head:   cedbe14082d169f4c1136c70c5170a76bd9a076a
commit: efa970f56d8517105d19510612cd096cde86a6fb [9/10] hte: Add tegra HTE test driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220504/202205041101.S97kTIme-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git/commit/?id=efa970f56d8517105d19510612cd096cde86a6fb
        git remote add arm-tegra https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
        git fetch --no-tags arm-tegra hte/for-next
        git checkout efa970f56d8517105d19510612cd096cde86a6fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hte/hte-tegra194-test.c:62:8: error: unknown type name 'hte_return_t'
      62 | static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
         |        ^~~~~~~~~~~~
   drivers/hte/hte-tegra194-test.c: In function 'tegra_hte_test_probe':
>> drivers/hte/hte-tegra194-test.c:190:46: error: passing argument 3 of 'devm_hte_request_ts_ns' from incompatible pointer type [-Werror=incompatible-pointer-types]
     190 |                                              process_hw_ts, NULL,
         |                                              ^~~~~~~~~~~~~
         |                                              |
         |                                              int (*)(struct hte_ts_data *, void *)
   In file included from drivers/hte/hte-tegra194-test.c:17:
   include/linux/hte.h:196:40: note: expected 'hte_ts_cb_t' {aka 'enum hte_return (*)(struct hte_ts_data *, void *)'} but argument is of type 'int (*)(struct hte_ts_data *, void *)'
     196 |                            hte_ts_cb_t cb, hte_ts_sec_cb_t tcb, void *data);
         |                            ~~~~~~~~~~~~^~
   cc1: some warnings being treated as errors


vim +/hte_return_t +62 drivers/hte/hte-tegra194-test.c

    61	
  > 62	static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
    63	{
    64		char *edge;
    65		struct hte_ts_desc *desc = p;
    66	
    67		if (!ts || !p)
    68			return HTE_CB_HANDLED;
    69	
    70		if (ts->raw_level < 0)
    71			edge = "Unknown";
    72	
    73		pr_info("HW timestamp(%u: %llu): %llu, edge: %s\n",
    74			desc->attr.line_id, ts->seq, ts->tsc,
    75			(ts->raw_level >= 0) ? ((ts->raw_level == 0) ?
    76						"falling" : "rising") : edge);
    77	
    78		return HTE_CB_HANDLED;
    79	}
    80	
    81	static void gpio_timer_cb(struct timer_list *t)
    82	{
    83		(void)t;
    84	
    85		gpiod_set_value(hte.gpio_out, !gpiod_get_value(hte.gpio_out));
    86		mod_timer(&hte.timer, jiffies + msecs_to_jiffies(8000));
    87	}
    88	
    89	static irqreturn_t tegra_hte_test_gpio_isr(int irq, void *data)
    90	{
    91		(void)irq;
    92		(void)data;
    93	
    94		return IRQ_HANDLED;
    95	}
    96	
    97	static const struct of_device_id tegra_hte_test_of_match[] = {
    98		{ .compatible = "nvidia,tegra194-hte-test"},
    99		{ }
   100	};
   101	MODULE_DEVICE_TABLE(of, tegra_hte_test_of_match);
   102	
   103	static int tegra_hte_test_probe(struct platform_device *pdev)
   104	{
   105		int ret = 0;
   106		int i, cnt;
   107	
   108		dev_set_drvdata(&pdev->dev, &hte);
   109		hte.pdev = &pdev->dev;
   110	
   111		hte.gpio_out = gpiod_get(&pdev->dev, "out", 0);
   112		if (IS_ERR(hte.gpio_out)) {
   113			dev_err(&pdev->dev, "failed to get gpio out\n");
   114			ret = -EINVAL;
   115			goto out;
   116		}
   117	
   118		hte.gpio_in = gpiod_get(&pdev->dev, "in", 0);
   119		if (IS_ERR(hte.gpio_in)) {
   120			dev_err(&pdev->dev, "failed to get gpio in\n");
   121			ret = -EINVAL;
   122			goto free_gpio_out;
   123		}
   124	
   125		ret = gpiod_direction_output(hte.gpio_out, 0);
   126		if (ret) {
   127			dev_err(&pdev->dev, "failed to set output\n");
   128			ret = -EINVAL;
   129			goto free_gpio_in;
   130		}
   131	
   132		ret = gpiod_direction_input(hte.gpio_in);
   133		if (ret) {
   134			dev_err(&pdev->dev, "failed to set input\n");
   135			ret = -EINVAL;
   136			goto free_gpio_in;
   137		}
   138	
   139		ret = gpiod_to_irq(hte.gpio_in);
   140		if (ret < 0) {
   141			dev_err(&pdev->dev, "failed to map GPIO to IRQ: %d\n", ret);
   142			ret = -ENXIO;
   143			goto free_gpio_in;
   144		}
   145	
   146		hte.gpio_in_irq = ret;
   147		ret = request_irq(ret, tegra_hte_test_gpio_isr,
   148				  IRQF_TRIGGER_RISING,
   149				  "tegra_hte_gpio_test_isr", &hte);
   150		if (ret) {
   151			dev_err(&pdev->dev, "failed to acquire IRQ\n");
   152			ret = -ENXIO;
   153			goto free_irq;
   154		}
   155	
   156		cnt = of_hte_req_count(hte.pdev);
   157		if (cnt < 0)
   158			goto free_irq;
   159	
   160		dev_info(&pdev->dev, "Total requested lines:%d\n", cnt);
   161	
   162		hte.desc = devm_kzalloc(hte.pdev, sizeof(*hte.desc) * cnt, GFP_KERNEL);
   163		if (!hte.desc) {
   164			ret = -ENOMEM;
   165			goto free_irq;
   166		}
   167	
   168		for (i = 0; i < cnt; i++) {
   169			if (i == 0)
   170				/*
   171				 * GPIO hte init, line_id and name will be parsed from
   172				 * the device tree node. The edge_flag is implicitly
   173				 * set by request_irq call. Only line_data is needed to be
   174				 * set.
   175				 */
   176				hte_init_line_attr(&hte.desc[i], 0, 0, NULL,
   177						   hte.gpio_in);
   178			else
   179				/*
   180				 * same comment as above except that IRQ does not need
   181				 * line data.
   182				 */
   183				hte_init_line_attr(&hte.desc[i], 0, 0, NULL, NULL);
   184	
   185			ret = hte_ts_get(hte.pdev, &hte.desc[i], i);
   186			if (ret)
   187				goto ts_put;
   188	
   189			ret = devm_hte_request_ts_ns(hte.pdev, &hte.desc[i],
 > 190						     process_hw_ts, NULL,
   191						     &hte.desc[i]);
   192			if (ret) /* no need to ts_put, request API takes care */
   193				goto free_irq;
   194		}
   195	
   196		timer_setup(&hte.timer, gpio_timer_cb, 0);
   197		mod_timer(&hte.timer, jiffies + msecs_to_jiffies(5000));
   198	
   199		return 0;
   200	
   201	ts_put:
   202		cnt = i;
   203		for (i = 0; i < cnt; i++)
   204			hte_ts_put(&hte.desc[i]);
   205	free_irq:
   206		free_irq(hte.gpio_in_irq, &hte);
   207	free_gpio_in:
   208		gpiod_put(hte.gpio_in);
   209	free_gpio_out:
   210		gpiod_put(hte.gpio_out);
   211	out:
   212	
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
