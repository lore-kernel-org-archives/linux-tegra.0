Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFBAEE49A0
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 21:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjHYVJl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 17:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjHYVJY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 17:09:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695B72114;
        Fri, 25 Aug 2023 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692997762; x=1724533762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9KgjcJf3oUFZsCckYwsRBIZm34FJhS+OzL6mTSQHt9U=;
  b=P6jSh3p2IWtgunZMEG9Vs4OWNkm+FzMThejfMuf+chUpfjgnhBrq8pqf
   EFNb8l7sbCa8wUjO5cuzy28fTzVB8gNgaOZcB3dz2YjBnUT1Ou1Nd6VQA
   maCTDLToXJLuYu8hb4SQLkHCMQ/5m+yWKimu9KQMTEJnviihY1e6Lb/f4
   6qv81rniG3XpnGi363ARF0/5E6Pskgll8gRSPc1V6S8snNloBvBRt/Vzg
   VS+e2FjmW8bpAPYxolLcpGia3s6EvUjIYUzUbcnsBFKxc/BCojMYqoUe/
   X7UPGtNCtV3Tp7cKFc31MefMZzEhXMDfV78hBz3ryg/OlkO0f2bLaVJXH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461167749"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="461167749"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="827717088"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="827717088"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2023 14:09:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZe3S-00040B-0A;
        Fri, 25 Aug 2023 21:09:18 +0000
Date:   Sat, 26 Aug 2023 05:08:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, Ninad Malwade <nmalwade@nvidia.com>,
        Rajkumar Kasirajan <rkasirajan@nvidia.com>
Subject: Re: [PATCH V2 3/4] hwmon: ina3221: add support for summation channel
 control
Message-ID: <202308260438.7OwsGAd8-lkp@intel.com>
References: <20230825164249.22860-4-nmalwade@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825164249.22860-4-nmalwade@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Ninad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230825]
[also build test WARNING on linus/master v6.5-rc7]
[cannot apply to groeck-staging/hwmon-next robh/for-next v6.5-rc7 v6.5-rc6 v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Malwade/dt-bindings-hwmon-ina3221-Convert-to-json-schema/20230826-004606
base:   next-20230825
patch link:    https://lore.kernel.org/r/20230825164249.22860-4-nmalwade%40nvidia.com
patch subject: [PATCH V2 3/4] hwmon: ina3221: add support for summation channel control
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260438.7OwsGAd8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260438.7OwsGAd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260438.7OwsGAd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/ina3221.c:108: warning: Function parameter or member 'summation_bypass' not described in 'ina3221_input'
>> drivers/hwmon/ina3221.c:132: warning: Function parameter or member 'summation_channel_control' not described in 'ina3221_data'


vim +108 drivers/hwmon/ina3221.c

7cb6dcff1956ec Andrew F. Davis 2016-06-10   96  
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01   97  /**
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01   98   * struct ina3221_input - channel input source specific information
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01   99   * @label: label of channel input source
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  100   * @shunt_resistor: shunt resistor value of channel input source
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  101   * @disconnected: connection status of channel input source
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  102   */
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  103  struct ina3221_input {
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  104  	const char *label;
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  105  	int shunt_resistor;
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  106  	bool disconnected;
3aab5d0b835881 Ninad Malwade   2023-08-26  107  	bool summation_bypass;
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01 @108  };
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  109  
7cb6dcff1956ec Andrew F. Davis 2016-06-10  110  /**
7cb6dcff1956ec Andrew F. Davis 2016-06-10  111   * struct ina3221_data - device specific information
323aeb0eb5d9a6 Nicolin Chen    2018-11-05  112   * @pm_dev: Device pointer for pm runtime
7cb6dcff1956ec Andrew F. Davis 2016-06-10  113   * @regmap: Register map of the device
7cb6dcff1956ec Andrew F. Davis 2016-06-10  114   * @fields: Register fields of the device
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  115   * @inputs: Array of channel input source specific structures
87625b24986bc2 Nicolin Chen    2018-11-05  116   * @lock: mutex lock to serialize sysfs attribute accesses
59d608e152e582 Nicolin Chen    2018-09-29  117   * @reg_config: Register value of INA3221_CONFIG
2057bdfb7184e9 Nicolin Chen    2019-10-16  118   * @summation_shunt_resistor: equivalent shunt resistor value for summation
43dece162de047 Nicolin Chen    2019-01-17  119   * @single_shot: running in single-shot operating mode
7cb6dcff1956ec Andrew F. Davis 2016-06-10  120   */
7cb6dcff1956ec Andrew F. Davis 2016-06-10  121  struct ina3221_data {
323aeb0eb5d9a6 Nicolin Chen    2018-11-05  122  	struct device *pm_dev;
7cb6dcff1956ec Andrew F. Davis 2016-06-10  123  	struct regmap *regmap;
7cb6dcff1956ec Andrew F. Davis 2016-06-10  124  	struct regmap_field *fields[F_MAX_FIELDS];
a9e9dd9c6de5d8 Nicolin Chen    2018-10-01  125  	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
87625b24986bc2 Nicolin Chen    2018-11-05  126  	struct mutex lock;
59d608e152e582 Nicolin Chen    2018-09-29  127  	u32 reg_config;
2057bdfb7184e9 Nicolin Chen    2019-10-16  128  	int summation_shunt_resistor;
3aab5d0b835881 Ninad Malwade   2023-08-26  129  	u32 summation_channel_control;
43dece162de047 Nicolin Chen    2019-01-17  130  
43dece162de047 Nicolin Chen    2019-01-17  131  	bool single_shot;
7cb6dcff1956ec Andrew F. Davis 2016-06-10 @132  };
7cb6dcff1956ec Andrew F. Davis 2016-06-10  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
