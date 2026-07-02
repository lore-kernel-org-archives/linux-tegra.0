Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB83803C7;
	Thu,  2 Jul 2026 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783026838; cv=none; b=C5yZvgMzR1XRGctN1TuJhAeHJyAMZM2yniG121cNZpMxtYxsxkB2nC8BRm7iRKe97uPf343o/8s0ZDSXo9DwcyjaaoKpNRqxCfvzg2FJTTR/tRr7Fc39jISfpSNFgoZ+796eaMMHPX0MpTQs1Xf93wsnSeez+utF64b24Kjbt7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783026838; c=relaxed/simple;
	bh=T2IG8BUKE6RPGRSzbny9fLbRTDQzqHScw4W/8FBzH3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAJ3emZf6CJUu6Xkr8O5VElDE7bHtWLxBDc6N0MpVADUTjUPgnxg0Tllc1jApcJf7pbheIAmpGMoeJiB58x+8fpWfnm0D6hkHrFLM03L6Z5iB2BqmTXCxC1LWuVQ1UsGy5sC3igne0TkdRb1juBKd617ZKdi8Ssmp4pGTWOQ1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzwedRjh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzwedRjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783026836; x=1814562836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T2IG8BUKE6RPGRSzbny9fLbRTDQzqHScw4W/8FBzH3Q=;
  b=FzwedRjh9OGKIHYoX7S5lYL/XtmFRSk0GEyDd805HG7AdrtXzaGxAUtk
   /8AtS36zKiEGTvyOaBPxMLyOZnbxLv4PCj/2sMD1FTD9nLet2QM0QhJHc
   ZpH2omiFgfDRALjikzyA77d6wzA7ZDRLbmTDzakLfkRG3mT4EPAzfNFi+
   dLPBgSKRQSju0LRuDsLp9X+Uy5X7Hqp+omN32jchWp7iH7zjNePGCEjEj
   GivvH5oDqFiOyye84wm6XAgful+vy+QuAOimtmrDqWm0x/lXUYampKjMa
   9FCPmkN17murQgc/C10NL3JPUM01hoBTVtB9CfY3jVRQq5Wq4pBWXkraj
   g==;
X-CSE-ConnectionGUID: zexAy9YoQ8Cm9iBp4mYG7A==
X-CSE-MsgGUID: HoXhaCX7SiWiiP57Y5aPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95290227"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="95290227"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 14:13:56 -0700
X-CSE-ConnectionGUID: /mauCWyWSmaDunwexJ98iQ==
X-CSE-MsgGUID: KOtOil2GR66qyV+CbjvnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="256538348"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2026 14:13:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfOjG-00000000BFX-3GYA;
	Thu, 02 Jul 2026 21:13:50 +0000
Date: Fri, 3 Jul 2026 05:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
	Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Warren <swarren@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: Re: [PATCH] staging: nvec: disable i2c slave on remove
Message-ID: <202607030502.TdzG5XDE-lkp@intel.com>
References: <20260702-contrib-nvec-clk-leak-v1-1-659bcbe74e56@microchip.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-contrib-nvec-clk-leak-v1-1-659bcbe74e56@microchip.com>

Hi Balakrishnan,

kernel test robot noticed the following build errors:

[auto build test ERROR on be5c93fa674f0fc3c8f359c2143abce6bbb422e6]

url:    https://github.com/intel-lab-lkp/linux/commits/Balakrishnan-Sambath/staging-nvec-disable-i2c-slave-on-remove/20260702-185025
base:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
patch link:    https://lore.kernel.org/r/20260702-contrib-nvec-clk-leak-v1-1-659bcbe74e56%40microchip.com
patch subject: [PATCH] staging: nvec: disable i2c slave on remove
config: arm64-randconfig-002-20260702 (https://download.01.org/0day-ci/archive/20260703/202607030502.TdzG5XDE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607030502.TdzG5XDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030502.TdzG5XDE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/nvec/nvec.c: In function 'tegra_nvec_remove':
>> drivers/staging/nvec/nvec.c:911:2: error: implicit declaration of function 'nvec_disable_i2c_slave'; did you mean 'disable_irq_wake'? [-Werror=implicit-function-declaration]
     nvec_disable_i2c_slave(nvec);
     ^~~~~~~~~~~~~~~~~~~~~~
     disable_irq_wake
   cc1: some warnings being treated as errors


vim +911 drivers/staging/nvec/nvec.c

   899	
   900	static void tegra_nvec_remove(struct platform_device *pdev)
   901	{
   902		struct nvec_chip *nvec = platform_get_drvdata(pdev);
   903	
   904		nvec_toggle_global_events(nvec, false);
   905		mfd_remove_devices(nvec->dev);
   906		nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
   907		cancel_work_sync(&nvec->rx_work);
   908		cancel_work_sync(&nvec->tx_work);
   909		if (pm_power_off == nvec_power_off)
   910			pm_power_off = NULL;
 > 911		nvec_disable_i2c_slave(nvec);
   912	}
   913	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
