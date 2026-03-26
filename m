Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD739FCAD;
	Thu, 26 Mar 2026 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553762; cv=none; b=TxrJkGJKFhEa9fVrQHqbvviWwzxVk4kKz9LuAibR75xKQnlscfu31OnNSxJ8PAnKoxQfoPBh/PfQdwZLwthYvX74B0Zur723V4FNQUgaOqNO45b7kj6geUcX2mGuYn+mBulbJOhecHnPLnqUtNQNuL9bkVLmC0wUBhoHTgS4LK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553762; c=relaxed/simple;
	bh=Jk8ElGKyrNTOPUaEA55Ava0pQHBr9CMmaX/jYm27JYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUE4PUI1hv8/81WQUrnUsfCIeKGKNhogCQN7dREr60xJCWyyyrAcOdeWA/7ENXYwZl4c6CzT9RXVNLQ7waBLnYop0l263Dg6pWSfgieh4U1McTbj6SP57vqufOkDLciJ8KX3d6g+gDDfNNiKOC6KZZd0Hf8YASEtTzRCWXfgd9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fum2Pa3R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fum2Pa3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774553760; x=1806089760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jk8ElGKyrNTOPUaEA55Ava0pQHBr9CMmaX/jYm27JYc=;
  b=fum2Pa3Rh1tHU0SQ+R9CugaVczmi//2H4q9SXggxcJB6V0FhWDJeFWZj
   aHulo1Qf3jh7tQsVZCPoPAe3eKf19WyDwjOsc/izHG1I8FmSr0RaPsMxs
   pVX34hHmcokLqvKxQwCZa6J5rvFDWYi5gOcWXFZ0PuzOJRCrA6Ap+K9J1
   gUALFYs92JAcpnLmwlG2Vp/bSFeiMb4ZABwbVr/KHl5xZJrOPB0b64OG0
   TvCZ8Co44pBw6c1gmGWwpIHRc6BW+HmBiNtRsdXV6mXXQIP7OF+x60817
   G0HoTrh+Ozp4gxoMgCCJt2kR+GHgNGevRcWcmcig2KifrVaR27dVw3gvi
   Q==;
X-CSE-ConnectionGUID: 0GuUoSkPSXeoU5X8pRHJlw==
X-CSE-MsgGUID: vh3/nX9fSVS3SJmxSv2ifQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75643182"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75643182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 12:36:00 -0700
X-CSE-ConnectionGUID: WnzQba57TA6Oj7JySzh5bQ==
X-CSE-MsgGUID: jMktIBv6SfWPcGG/kpyVLA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2026 12:35:57 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5qUl-000000009Gn-1Tlw;
	Thu, 26 Mar 2026 19:35:55 +0000
Date: Fri, 27 Mar 2026 03:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-tegra@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
Message-ID: <202603270355.rxjFONcV-lkp@intel.com>
References: <20260324015722.12507-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324015722.12507-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260325]
[cannot apply to tegra/for-next clk/clk-next drm-tegra/drm/tegra/for-next v7.0-rc5 v7.0-rc4 v7.0-rc3 linus/master v7.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/firmware-tegra-add-COMPILE_TEST/20260326-124230
base:   next-20260325
patch link:    https://lore.kernel.org/r/20260324015722.12507-1-rosenp%40gmail.com
patch subject: [PATCHv2] firmware/tegra: add COMPILE_TEST
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260327/202603270355.rxjFONcV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270355.rxjFONcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270355.rxjFONcV-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_register_devclks':
>> (.text+0x348): undefined reference to `clk_register_clkdev'
>> hppa-linux-ld: (.text+0x398): undefined reference to `__clk_get_name'
>> hppa-linux-ld: (.text+0x3a8): undefined reference to `clk_register_clkdev'
   hppa-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_clk_dev_register':
>> (.text+0x438): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_init_dup_clks':
>> (.init.text+0x114): undefined reference to `clkdev_add'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-audio.o: in function `tegra_audio_sync_clk_init.constprop.0':
>> (.init.text+0x90): undefined reference to `clk_register_mux_table'
>> hppa-linux-ld: (.init.text+0xd0): undefined reference to `clk_register_gate'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-audio.o: in function `tegra_audio_clk_init':
>> (.init.text+0x348): undefined reference to `clk_register_fixed_factor'
>> hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x10c): undefined reference to `clk_mux_ops'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x1a4): undefined reference to `clk_mux_ops'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x23c): undefined reference to `clk_mux_ops'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x2d4): undefined reference to `clk_mux_ops'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x36c): undefined reference to `clk_mux_ops'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x404): more undefined references to `clk_mux_ops' follow
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-periph.o: in function `init_pllp':
>> (.init.text+0x7c): undefined reference to `clk_register_clkdev'
   hppa-linux-ld: (.init.text+0x204): undefined reference to `clk_register_gate'
   hppa-linux-ld: (.init.text+0x24c): undefined reference to `clk_register_gate'
>> hppa-linux-ld: (.init.text+0x260): undefined reference to `clk_register_clkdev'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-fixed.o: in function `tegra_osc_clk_init':
>> (.init.text+0x9c): undefined reference to `clk_register_fixed_rate'
>> hppa-linux-ld: (.init.text+0xd8): undefined reference to `clk_register_fixed_factor'
   hppa-linux-ld: (.init.text+0x114): undefined reference to `clk_register_fixed_factor'
   hppa-linux-ld: (.init.text+0x150): undefined reference to `clk_register_fixed_factor'
   hppa-linux-ld: (.init.text+0x194): undefined reference to `clk_register_fixed_factor'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-fixed.o: in function `tegra_fixed_clk_init':
   (.init.text+0x20c): undefined reference to `clk_register_fixed_rate'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-super-gen4.o: in function `tegra_sclk_init':
>> (.init.text+0xb8): undefined reference to `clk_register_divider_table'
>> hppa-linux-ld: (.init.text+0x164): undefined reference to `clk_register_divider_table'
   hppa-linux-ld: (.init.text+0x194): undefined reference to `clk_register_gate'
   hppa-linux-ld: (.init.text+0x1ec): undefined reference to `clk_register_divider_table'
   hppa-linux-ld: (.init.text+0x21c): undefined reference to `clk_register_gate'
   hppa-linux-ld: drivers/clk/tegra/clk-audio-sync.o: in function `tegra_clk_register_sync_source':
   (.text+0x13c): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-dfll.o: in function `tegra_dfll_unregister':
>> (.text+0x1d8): undefined reference to `clk_unregister'
   hppa-linux-ld: drivers/clk/tegra/clk-divider.o: in function `clk_divider_restore_context':
>> (.text+0x2c8): undefined reference to `clk_hw_get_parent'
>> hppa-linux-ld: (.text+0x2d0): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: (.text+0x2dc): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: drivers/clk/tegra/clk-divider.o: in function `tegra_clk_register_divider':
   (.text+0x3d0): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-divider.o: in function `tegra_clk_register_mc':
>> (.text+0x4c4): undefined reference to `clk_register_divider_table'
   hppa-linux-ld: drivers/clk/tegra/clk-periph.o: in function `clk_periph_restore_context':
>> (.text+0x254): undefined reference to `clk_hw_get_parent_index'
   hppa-linux-ld: drivers/clk/tegra/clk-periph.o: in function `tegra_clk_register_periph':
   (.text+0x3bc): undefined reference to `clk_register'
   hppa-linux-ld: (.text+0x420): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-periph.o: in function `tegra_clk_register_periph_nodiv':
   (.text+0x528): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-periph.o: in function `tegra_clk_register_periph_data':
   (.text+0x648): undefined reference to `clk_register'
   hppa-linux-ld: (.text+0x6b0): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-periph.o:(.rodata+0x94): undefined reference to `clk_hw_determine_rate_no_reparent'
   hppa-linux-ld: drivers/clk/tegra/clk-periph-fixed.o: in function `tegra_clk_register_periph_fixed':
   (.text+0x250): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-periph-gate.o: in function `tegra_clk_register_periph_gate':
   (.text+0x35c): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_determine_rate':
   (.text+0x6c4): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_wait_for_lock':
   (.text+0x7c0): undefined reference to `clk_hw_get_name'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pllu_enable':
   (.text+0xed0): undefined reference to `clk_hw_get_parent'
   hppa-linux-ld: (.text+0xed8): undefined reference to `clk_hw_get_parent'
   hppa-linux-ld: (.text+0xee8): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_recalc_rate':
   (.text+0x17c4): undefined reference to `clk_hw_get_name'
   hppa-linux-ld: (.text+0x1818): undefined reference to `clk_hw_get_name'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_set_rate':
   (.text+0x1d54): undefined reference to `clk_hw_get_name'
   hppa-linux-ld: (.text+0x1d84): undefined reference to `clk_hw_get_name'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `tegra_clk_pll_restore_context':
   (.text+0x1dcc): undefined reference to `clk_hw_get_parent'
   hppa-linux-ld: (.text+0x1dd4): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: (.text+0x1de0): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: (.text+0x1e20): undefined reference to `__clk_get_enable_count'
   hppa-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_plle_enable':
   (.text+0x1ed0): undefined reference to `clk_hw_get_parent'
   hppa-linux-ld: (.text+0x1ed8): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: drivers/clk/tegra/clk-pll-out.o: in function `tegra_clk_pll_out_restore_context':
   (.text+0x1cc): undefined reference to `__clk_get_enable_count'
   hppa-linux-ld: drivers/clk/tegra/clk-pll-out.o: in function `tegra_clk_register_pll_out':
   (.text+0x2cc): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `clk_sdmmc_mux_get_parent':
   (.text+0x248): undefined reference to `clk_hw_get_num_parents'
   hppa-linux-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `clk_sdmmc_mux_restore_context':
   (.text+0x48c): undefined reference to `clk_hw_get_parent'
   hppa-linux-ld: (.text+0x494): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: (.text+0x4a0): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: (.text+0x4ac): undefined reference to `clk_hw_get_parent_index'
   hppa-linux-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `tegra_clk_register_sdmmc_mux_div':
   (.text+0x5f4): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-super.o: in function `clk_super_restore_context':
   (.text+0x38c): undefined reference to `clk_hw_get_parent_index'
   hppa-linux-ld: drivers/clk/tegra/clk-super.o: in function `clk_super_mux_restore_context':
   (.text+0x408): undefined reference to `clk_hw_get_parent_index'
   hppa-linux-ld: drivers/clk/tegra/clk-super.o: in function `tegra_clk_register_super_clk':
   (.text+0x658): undefined reference to `clk_register'
   hppa-linux-ld: drivers/clk/tegra/clk-super.o:(.rodata+0x94): undefined reference to `clk_hw_determine_rate_no_reparent'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-super-cclk.o: in function `cclk_super_determine_rate':
   (.text+0xe0): undefined reference to `clk_hw_get_parent_by_index'
   hppa-linux-ld: (.text+0xf0): undefined reference to `clk_hw_get_parent_by_index'
   hppa-linux-ld: (.text+0x10c): undefined reference to `clk_hw_get_rate'
   hppa-linux-ld: (.text+0x184): undefined reference to `clk_hw_get_rate_range'
   hppa-linux-ld: (.text+0x1b0): undefined reference to `clk_hw_round_rate'
   hppa-linux-ld: drivers/clk/tegra/clk-tegra-super-cclk.o: in function `tegra_clk_register_super_cclk':
   (.text+0x3c8): undefined reference to `clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
