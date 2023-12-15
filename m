Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484131580;
	Fri, 15 Dec 2023 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN9ORRbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702650044; x=1734186044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a2T5WAD/gFJSJbjGLC77H5z2qRqqvtIjxKbO3rM8iKU=;
  b=UN9ORRbRls7Uy68HSADV6J6JPqEKSqzBDNU4n712V2L5yir9vuYlMGtk
   dPYXr354QMjLafe0u9EvoUCQX26A/X10q3SJ5tg7v78Xg0XtRUXLXekdh
   hmCc8qwQ6kjX+kMUWxGBSmxSULCjxzHzNoX+X7pZhK/iDVdDFewpYoiM1
   5oatBB7fytAfya+UwsPdqCPmoX5xHML+h5qqhBN8qyIHMDqZ3rWH3Krrr
   eS3VwT0ffXXeTWNqEM+HIlfUH5OG8SZFKIh9uafYzncCtT6eE3HwpUsUz
   O4Kjil9GsyZ1NRTx5h0LrqwWZzAlCgSp1cDcAwx2A+p2om3USfKjHcCGl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461743595"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="461743595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 06:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892911857"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="892911857"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2023 06:20:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE93O-0000Iw-07;
	Fri, 15 Dec 2023 14:20:38 +0000
Date: Fri, 15 Dec 2023 22:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 4/5] memory: tegra30-emc: Simplify usage of
 clk_rate_exclusive_get()
Message-ID: <202312152223.5QHKKu32-lkp@intel.com>
References: <9cf2553c9da167ebf6654bbdeab6ce2a93232ca6.1702400947.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cf2553c9da167ebf6654bbdeab6ce2a93232ca6.1702400947.git.u.kleine-koenig@pengutronix.de>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bbd220ce4e29ed55ab079007cff0b550895258eb]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/PM-devfreq-sun8i-a33-mbus-Simplify-usage-of-clk_rate_exclusive_get/20231213-012823
base:   bbd220ce4e29ed55ab079007cff0b550895258eb
patch link:    https://lore.kernel.org/r/9cf2553c9da167ebf6654bbdeab6ce2a93232ca6.1702400947.git.u.kleine-koenig%40pengutronix.de
patch subject: [PATCH 4/5] memory: tegra30-emc: Simplify usage of clk_rate_exclusive_get()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231215/202312152223.5QHKKu32-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152223.5QHKKu32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152223.5QHKKu32-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/memory/tegra/tegra30-emc.c: In function 'tegra_emc_suspend':
>> drivers/memory/tegra/tegra30-emc.c:1696:13: warning: unused variable 'err' [-Wunused-variable]
    1696 |         int err;
         |             ^~~


vim +/err +1696 drivers/memory/tegra/tegra30-emc.c

e34212c75a6899 Dmitry Osipenko  2019-08-12  1692  
e34212c75a6899 Dmitry Osipenko  2019-08-12  1693  static int tegra_emc_suspend(struct device *dev)
e34212c75a6899 Dmitry Osipenko  2019-08-12  1694  {
e34212c75a6899 Dmitry Osipenko  2019-08-12  1695  	struct tegra_emc *emc = dev_get_drvdata(dev);
51bb73f93410a3 Dmitry Osipenko  2019-12-20 @1696  	int err;
e34212c75a6899 Dmitry Osipenko  2019-08-12  1697  
51bb73f93410a3 Dmitry Osipenko  2019-12-20  1698  	/* take exclusive control over the clock's rate */
2ba3f947597dae Uwe Kleine-König 2023-12-12  1699  	clk_rate_exclusive_get(emc->clk);
51bb73f93410a3 Dmitry Osipenko  2019-12-20  1700  
51bb73f93410a3 Dmitry Osipenko  2019-12-20  1701  	/* suspending in a bad state will hang machine */
51bb73f93410a3 Dmitry Osipenko  2019-12-20  1702  	if (WARN(emc->bad_state, "hardware in a bad state\n"))
e34212c75a6899 Dmitry Osipenko  2019-08-12  1703  		return -EINVAL;
e34212c75a6899 Dmitry Osipenko  2019-08-12  1704  
e34212c75a6899 Dmitry Osipenko  2019-08-12  1705  	emc->bad_state = true;
e34212c75a6899 Dmitry Osipenko  2019-08-12  1706  
e34212c75a6899 Dmitry Osipenko  2019-08-12  1707  	return 0;
e34212c75a6899 Dmitry Osipenko  2019-08-12  1708  }
e34212c75a6899 Dmitry Osipenko  2019-08-12  1709  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
