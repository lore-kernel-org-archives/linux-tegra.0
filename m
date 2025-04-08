Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060F9263F29;
	Tue,  8 Apr 2025 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102507; cv=none; b=iNIlgLDB49oOOqZszyLCdLXSSFFWJEAhhEog40HnQRJhvDspW+qlLEGoh5sRWwrPi/mWhFhXO7xlgEcAJuqY7Pfp+GafaN5With/ZWX6MRc/1X+/N4HcUu1/tG3frqWnwKTcuncOMxNMC3MsSpQRGSzh5B4JL814OEfpDyIkvFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102507; c=relaxed/simple;
	bh=Oy4zyY35cVd8Vsi31C/w3Gbc3g9hy5UKD99ZO8twaRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGYrqoXlJ9s3+xb+3wJKYA+Oh6SGkHQcxI6yYXFfF5BpfRHQwN1RcDD5Dpb/e8RLwcIt4MGM6LBGwMJeia9P9M7rQdmy2jATCQahmnTDtLT6DXRsJA2YIt/nUMge4YfimZsKTFBVZzNgTJSbX5DUafmKsG74C4T/nt3Cck/73Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imbwMl+2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imbwMl+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744102505; x=1775638505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oy4zyY35cVd8Vsi31C/w3Gbc3g9hy5UKD99ZO8twaRk=;
  b=imbwMl+2XqRSho35M6RG/pU+XqKEUdI+No7tGoCqpIv9asHo7AjHJHSx
   FmAKGI0O82dOrmyRD+zQ9fdIt5ShcjbZoZmzLD4Fi8JpVvj7pjEGtBoOr
   6ZNl7hq3Wv/g2ocXkr7QkJBHM87jpY3VIe6w12AONjTFtYKYkieftSwCo
   oPiBIuDKBhoM+4urRTKrrLDj72O5aZwDUuakxwTy3Sa7I8a/9PKamUJH3
   DKJLzOdW7TUWruXwXdRW4K1mx9002Tl7H1VyUWLADU3K4zRqv+8ZQOFJr
   j1M7WX6rw3l8BCqnB6K/87f8yfIkDjG9+gEOYUsrgO+Z3pfsnZCbGN1k+
   g==;
X-CSE-ConnectionGUID: eRD6XxHaS+2w8rRXzezcZw==
X-CSE-MsgGUID: UarmKgngRI6J8fIyVngUtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45615917"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45615917"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:55:05 -0700
X-CSE-ConnectionGUID: ogfWw3c6RCC6+P8wPO+YkQ==
X-CSE-MsgGUID: bwuLyhs+Rm2lKu9mt74pEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128729154"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2025 01:55:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u24jT-0004LX-1x;
	Tue, 08 Apr 2025 08:54:59 +0000
Date: Tue, 8 Apr 2025 16:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
	daniel.lezcano@linaro.org, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com,
	Robert Lin <robelin@nvidia.com>
Subject: Re: [PATCH v3 2/3] clocksource/drivers/timer-tegra186: fix watchdog
 self-pinging
Message-ID: <202504081506.0KaQZjFQ-lkp@intel.com>
References: <20250407102323.2690911-3-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407102323.2690911-3-robelin@nvidia.com>

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.15-rc1 next-20250408]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Lin/clocksource-drivers-timer-tegra186-add-WDIOC_GETTIMELEFT-support/20250407-182954
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250407102323.2690911-3-robelin%40nvidia.com
patch subject: [PATCH v3 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
config: sh-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081506.0KaQZjFQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081506.0KaQZjFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081506.0KaQZjFQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clocksource/timer-tegra186.c: In function 'tegra186_timer_probe':
>> drivers/clocksource/timer-tegra186.c:420:22: warning: variable 'irq' set but not used [-Wunused-but-set-variable]
     420 |         unsigned int irq;
         |                      ^~~


vim +/irq +420 drivers/clocksource/timer-tegra186.c

42cee19a9f839f Thierry Reding 2022-07-04  415  
42cee19a9f839f Thierry Reding 2022-07-04  416  static int tegra186_timer_probe(struct platform_device *pdev)
42cee19a9f839f Thierry Reding 2022-07-04  417  {
42cee19a9f839f Thierry Reding 2022-07-04  418  	struct device *dev = &pdev->dev;
42cee19a9f839f Thierry Reding 2022-07-04  419  	struct tegra186_timer *tegra;
42cee19a9f839f Thierry Reding 2022-07-04 @420  	unsigned int irq;
42cee19a9f839f Thierry Reding 2022-07-04  421  	int err;
42cee19a9f839f Thierry Reding 2022-07-04  422  
42cee19a9f839f Thierry Reding 2022-07-04  423  	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
42cee19a9f839f Thierry Reding 2022-07-04  424  	if (!tegra)
42cee19a9f839f Thierry Reding 2022-07-04  425  		return -ENOMEM;
42cee19a9f839f Thierry Reding 2022-07-04  426  
42cee19a9f839f Thierry Reding 2022-07-04  427  	tegra->soc = of_device_get_match_data(dev);
42cee19a9f839f Thierry Reding 2022-07-04  428  	dev_set_drvdata(dev, tegra);
42cee19a9f839f Thierry Reding 2022-07-04  429  	tegra->dev = dev;
42cee19a9f839f Thierry Reding 2022-07-04  430  
42cee19a9f839f Thierry Reding 2022-07-04  431  	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
42cee19a9f839f Thierry Reding 2022-07-04  432  	if (IS_ERR(tegra->regs))
42cee19a9f839f Thierry Reding 2022-07-04  433  		return PTR_ERR(tegra->regs);
42cee19a9f839f Thierry Reding 2022-07-04  434  
42cee19a9f839f Thierry Reding 2022-07-04  435  	err = platform_get_irq(pdev, 0);
42cee19a9f839f Thierry Reding 2022-07-04  436  	if (err < 0)
42cee19a9f839f Thierry Reding 2022-07-04  437  		return err;
42cee19a9f839f Thierry Reding 2022-07-04  438  
42cee19a9f839f Thierry Reding 2022-07-04  439  	irq = err;
42cee19a9f839f Thierry Reding 2022-07-04  440  
42cee19a9f839f Thierry Reding 2022-07-04  441  	/* create a watchdog using a preconfigured timer */
42cee19a9f839f Thierry Reding 2022-07-04  442  	tegra->wdt = tegra186_wdt_create(tegra, 0);
42cee19a9f839f Thierry Reding 2022-07-04  443  	if (IS_ERR(tegra->wdt)) {
42cee19a9f839f Thierry Reding 2022-07-04  444  		err = PTR_ERR(tegra->wdt);
42cee19a9f839f Thierry Reding 2022-07-04  445  		dev_err(dev, "failed to create WDT: %d\n", err);
42cee19a9f839f Thierry Reding 2022-07-04  446  		return err;
42cee19a9f839f Thierry Reding 2022-07-04  447  	}
42cee19a9f839f Thierry Reding 2022-07-04  448  
42cee19a9f839f Thierry Reding 2022-07-04  449  	err = tegra186_timer_tsc_init(tegra);
42cee19a9f839f Thierry Reding 2022-07-04  450  	if (err < 0) {
42cee19a9f839f Thierry Reding 2022-07-04  451  		dev_err(dev, "failed to register TSC counter: %d\n", err);
42cee19a9f839f Thierry Reding 2022-07-04  452  		return err;
42cee19a9f839f Thierry Reding 2022-07-04  453  	}
42cee19a9f839f Thierry Reding 2022-07-04  454  
42cee19a9f839f Thierry Reding 2022-07-04  455  	err = tegra186_timer_osc_init(tegra);
42cee19a9f839f Thierry Reding 2022-07-04  456  	if (err < 0) {
42cee19a9f839f Thierry Reding 2022-07-04  457  		dev_err(dev, "failed to register OSC counter: %d\n", err);
42cee19a9f839f Thierry Reding 2022-07-04  458  		goto unregister_tsc;
42cee19a9f839f Thierry Reding 2022-07-04  459  	}
42cee19a9f839f Thierry Reding 2022-07-04  460  
42cee19a9f839f Thierry Reding 2022-07-04  461  	err = tegra186_timer_usec_init(tegra);
42cee19a9f839f Thierry Reding 2022-07-04  462  	if (err < 0) {
42cee19a9f839f Thierry Reding 2022-07-04  463  		dev_err(dev, "failed to register USEC counter: %d\n", err);
42cee19a9f839f Thierry Reding 2022-07-04  464  		goto unregister_osc;
42cee19a9f839f Thierry Reding 2022-07-04  465  	}
42cee19a9f839f Thierry Reding 2022-07-04  466  
42cee19a9f839f Thierry Reding 2022-07-04  467  	return 0;
42cee19a9f839f Thierry Reding 2022-07-04  468  
42cee19a9f839f Thierry Reding 2022-07-04  469  unregister_osc:
42cee19a9f839f Thierry Reding 2022-07-04  470  	clocksource_unregister(&tegra->osc);
42cee19a9f839f Thierry Reding 2022-07-04  471  unregister_tsc:
42cee19a9f839f Thierry Reding 2022-07-04  472  	clocksource_unregister(&tegra->tsc);
42cee19a9f839f Thierry Reding 2022-07-04  473  	return err;
42cee19a9f839f Thierry Reding 2022-07-04  474  }
42cee19a9f839f Thierry Reding 2022-07-04  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
