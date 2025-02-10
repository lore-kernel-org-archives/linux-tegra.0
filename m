Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B943C231CB1;
	Mon, 10 Feb 2025 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196569; cv=none; b=JWOuy38CZdpo4jebv8xiDL1AibaKHMerHxUIsyswcQJHfRDiw/VKAvQani1DVKAPmlGoT9ccXAtRp9ZDDQM3WwAUgG/UGu9bj4aHkNv51FJ87eKVbkn6/hL8yO8/tBcUw+lQ2TFYb+i7aW9ZvM7f4IDqmiar05EBDItKro6MC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196569; c=relaxed/simple;
	bh=C7SkemvwORgaUl1YU8GiXRM6pVvQ3d9ddNlbK0UE0Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrnPV0jpBLVskBZwnfFtQ3i5chRrfl0sCijqfpM6DAUboNi9nPvtFdtMKHImSMAAv+G4TqMsorUNh1VDerTwSuHamXedZglLG5uL3pATFdGdV0RIbwVtbr57jEZg6V1rI28eYE7GkTU8PyDlzJFHosm15xUflVo4b6uumuCN4Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDhgJZ4v; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDhgJZ4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739196568; x=1770732568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C7SkemvwORgaUl1YU8GiXRM6pVvQ3d9ddNlbK0UE0Cw=;
  b=cDhgJZ4va6LI6IJKv+JoEU19hQkAZNdPyTos++q7pkD+z8SfImndjNIh
   W1IR/TEwcBZPoyIguMr8oKrNtYcAtTLvfeuhD8F/i2V0Zc5vm3UCbcQAR
   y5GCAMDMgoUQkJDNcT1pIKwowm6SnPK45RnT8tomNOOtf2DCSXHvLXr03
   rNlks0yuK/3qkiqjJcwRVqQCBSrvYPOq1/uv1Y+Hi5NuyFpvkSX7+q3em
   AeOyzXcge9Y+k/LFKTfFctvQpqhp25gFbvozxaTtWdJ04vHl3q7AJiQaS
   v5V8BJsjQMgTT6zcd1fp1YRM5BPJNsi9evuZaYnEmtYFzwdCyUfzYYu4w
   Q==;
X-CSE-ConnectionGUID: 18/nNP93T4STju1C1CZlQg==
X-CSE-MsgGUID: we23o5MkS9i5Wl/e1VCQlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57190257"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="57190257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:09:27 -0800
X-CSE-ConnectionGUID: aoJ+IyDKRqKAgTib5FLPkQ==
X-CSE-MsgGUID: zQEtYhgISoS9JkphlkdvDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="111964109"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2025 06:09:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thUTS-0012rL-27;
	Mon, 10 Feb 2025 14:09:22 +0000
Date: Mon, 10 Feb 2025 22:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dima Volkovsk <s0ldw3ll@gmail.com>, marvin24@gmx.de,
	gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dima Volkovsk <s0ldw3ll@gmail.com>
Subject: Re: [PATCH] Staging: nvec: Fix pm_power_off reset condition in
 tegra_nvec_remove
Message-ID: <202502102138.1CqFj1nV-lkp@intel.com>
References: <20250209201752.66313-1-s0ldw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209201752.66313-1-s0ldw3ll@gmail.com>

Hi Dima,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dima-Volkovsk/Staging-nvec-Fix-pm_power_off-reset-condition-in-tegra_nvec_remove/20250210-041929
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250209201752.66313-1-s0ldw3ll%40gmail.com
patch subject: [PATCH] Staging: nvec: Fix pm_power_off reset condition in tegra_nvec_remove
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502102138.1CqFj1nV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102138.1CqFj1nV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102138.1CqFj1nV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/nvec/nvec.c: In function 'tegra_nvec_remove':
>> drivers/staging/nvec/nvec.c:908:13: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
     908 |         if (pm_power_off = nvec_power_off)
         |             ^~~~~~~~~~~~


vim +908 drivers/staging/nvec/nvec.c

   896	
   897	static void tegra_nvec_remove(struct platform_device *pdev)
   898	{
   899		struct nvec_chip *nvec = platform_get_drvdata(pdev);
   900	
   901		nvec_toggle_global_events(nvec, false);
   902		mfd_remove_devices(nvec->dev);
   903		nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
   904		cancel_work_sync(&nvec->rx_work);
   905		cancel_work_sync(&nvec->tx_work);
   906	
   907		/* only reset pm_power_off if it's our handler */
 > 908		if (pm_power_off = nvec_power_off)
   909			pm_power_off = NULL;
   910	}
   911	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
