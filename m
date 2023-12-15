Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE52F86C;
	Fri, 15 Dec 2023 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBxA8qUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702644713; x=1734180713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZE7lfcTR0hQX2Pnx5bEqtJ1eBdLPAqkT9OH2B60IzVc=;
  b=nBxA8qUnG3Lfg9BioNofwqRfxNl0b2KqYdNTmdMuUJr78U5lRJ8qeU5M
   CyACDDlL1SSg+c+7zHeW6fgdRyNWEzqbm6DShNm+Ny3W02dGSKWUfeWgS
   fFxUulUrY3aLthKrWI7Ch2pQWy161MW9Evz5X1i/O+cqE484dT3ugAkI/
   8JkZ/gHAkjDKHlZp4HsCZ8tRrpPQYSYGU8WhSGhmMXG0rhBW/9AVAI6ZV
   P9We2i6DejhJsgjfnaDbxKJpAUbXqxhREj7RXAZR5bCAUqQlopWqss21P
   wHFNI5/xTDw/bTSrFPNIw5NLeoJxkaowLtehUyvxNo1vxVhWmSobZPCg/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="395015563"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="395015563"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 04:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803702215"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="803702215"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2023 04:51:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE7ey-0000DO-2n;
	Fri, 15 Dec 2023 12:51:20 +0000
Date: Fri, 15 Dec 2023 20:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/5] memory: tegra210-emc: Simplify usage of
 clk_rate_exclusive_get()
Message-ID: <202312152014.NrQUsmxR-lkp@intel.com>
References: <1b4321a975ac1a903a0c816ef2cce80e7d75eae3.1702400947.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4321a975ac1a903a0c816ef2cce80e7d75eae3.1702400947.git.u.kleine-koenig@pengutronix.de>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bbd220ce4e29ed55ab079007cff0b550895258eb]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/PM-devfreq-sun8i-a33-mbus-Simplify-usage-of-clk_rate_exclusive_get/20231213-012823
base:   bbd220ce4e29ed55ab079007cff0b550895258eb
patch link:    https://lore.kernel.org/r/1b4321a975ac1a903a0c816ef2cce80e7d75eae3.1702400947.git.u.kleine-koenig%40pengutronix.de
patch subject: [PATCH 3/5] memory: tegra210-emc: Simplify usage of clk_rate_exclusive_get()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231215/202312152014.NrQUsmxR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152014.NrQUsmxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152014.NrQUsmxR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/memory/tegra/tegra210-emc-core.c: In function 'tegra210_emc_suspend':
>> drivers/memory/tegra/tegra210-emc-core.c:2002:13: warning: unused variable 'err' [-Wunused-variable]
    2002 |         int err;
         |             ^~~


vim +/err +2002 drivers/memory/tegra/tegra210-emc-core.c

10de21148f7d28 Joseph Lo        2019-05-29  1998  
10de21148f7d28 Joseph Lo        2019-05-29  1999  static int __maybe_unused tegra210_emc_suspend(struct device *dev)
10de21148f7d28 Joseph Lo        2019-05-29  2000  {
10de21148f7d28 Joseph Lo        2019-05-29  2001  	struct tegra210_emc *emc = dev_get_drvdata(dev);
10de21148f7d28 Joseph Lo        2019-05-29 @2002  	int err;
10de21148f7d28 Joseph Lo        2019-05-29  2003  
53a616302fe1b2 Uwe Kleine-König 2023-12-12  2004  	clk_rate_exclusive_get(emc->clk);
10de21148f7d28 Joseph Lo        2019-05-29  2005  
10de21148f7d28 Joseph Lo        2019-05-29  2006  	emc->resume_rate = clk_get_rate(emc->clk);
10de21148f7d28 Joseph Lo        2019-05-29  2007  
10de21148f7d28 Joseph Lo        2019-05-29  2008  	clk_set_rate(emc->clk, 204000000);
10de21148f7d28 Joseph Lo        2019-05-29  2009  	tegra210_clk_emc_detach(emc->clk);
10de21148f7d28 Joseph Lo        2019-05-29  2010  
10de21148f7d28 Joseph Lo        2019-05-29  2011  	dev_dbg(dev, "suspending at %lu Hz\n", clk_get_rate(emc->clk));
10de21148f7d28 Joseph Lo        2019-05-29  2012  
10de21148f7d28 Joseph Lo        2019-05-29  2013  	return 0;
10de21148f7d28 Joseph Lo        2019-05-29  2014  }
10de21148f7d28 Joseph Lo        2019-05-29  2015  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
