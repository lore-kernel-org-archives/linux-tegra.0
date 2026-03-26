Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95733A0B24;
	Thu, 26 Mar 2026 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553762; cv=none; b=oULNFLPejqzoeXn8M/NFIY8+bSCvZrPuhAjKSLKKifFxn5XO3bdVaGNIyPpM3SbjFlv/H+Th0J3ZrnhfKDF51lZ0kYdEG7JzTkCXYT+ntTGfNOtAfg3EoX2qr9Btt1CjNMgh8/fApuVFCfKl5VCyjRa0iFUmovfGB/U572FWCW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553762; c=relaxed/simple;
	bh=Ms5TVuiQzhL+jqryxb6U+ELUeVyocDJ/o3lZudoEwrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvFhDaSid02oxiiFP9cgNEBZXUk3cNJ4/bjwTcaqpDXR9zGWjBZPYJnvcOBQbbB9Qk2sfhLuIs4SkNbTR22kDbZH5K5yq8QKy6sywiO7nqRpWzXYvcBYYV1gfonQ7Vg8wuDqbAW9XlvEonaIMkfsvzb4ku5JGlPsEuDn3sLwumo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvM2fu3a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvM2fu3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774553761; x=1806089761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ms5TVuiQzhL+jqryxb6U+ELUeVyocDJ/o3lZudoEwrE=;
  b=WvM2fu3aklspBuTz3Byr1aMB49pbegzWK6U2dipylOdC2o1f9ZftBeDX
   WlDCX/xjYgFUPDKK6o+ORykopkasMifCrjbENx2sHvkIhiOR2M1mfbV/s
   kg3IWg0lRZjZ6tPJF40gkvBg31ghEb97QjhJVr5sCD2hKKdyMyEbkUAv/
   QqmJS0IEfFK4GlBIkxeJfSdsPy+fibluqII7p8jFp+ohPwOjNiqYCR2ug
   yeP5FmRsU+MndTGJaI7PSVSnZK2sama8XwW6096U7KyzNgCpirD/zHRU0
   Ft60aTr9/GqST3wWgIFDZJmEqarj32F7fDFFNtH5tjj3vJrpWyZ9jkgDd
   A==;
X-CSE-ConnectionGUID: FuwZAjtKTteWrPBIfP340w==
X-CSE-MsgGUID: RKm2OrToTuCKIRWALIVXBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79224185"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="79224185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 12:36:00 -0700
X-CSE-ConnectionGUID: YIdT5BSGSlaV8cl/W5VeVQ==
X-CSE-MsgGUID: 0LJ8LOGIRJqQbalU7Pwlvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="230048594"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2026 12:35:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5qUl-000000009Gr-1k2T;
	Thu, 26 Mar 2026 19:35:55 +0000
Date: Fri, 27 Mar 2026 03:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-tegra@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
Message-ID: <202603270305.aMVfb5Bs-lkp@intel.com>
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
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260327/202603270305.aMVfb5Bs-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270305.aMVfb5Bs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270305.aMVfb5Bs-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_register_devclks':
   clk.c:(.text+0x4b0): undefined reference to `clk_register_clkdev'
>> sparc-linux-ld: clk.c:(.text+0x520): undefined reference to `__clk_get_name'
>> sparc-linux-ld: clk.c:(.text+0x530): undefined reference to `clk_register_clkdev'
   sparc-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_clk_dev_register':
   clk.c:(.text+0x5fc): undefined reference to `clk_register'
>> sparc-linux-ld: clk.c:(.text+0x664): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_init_dup_clks':
   clk.c:(.init.text+0x10c): undefined reference to `clkdev_add'
   sparc-linux-ld: drivers/clk/tegra/clk.o: in function `tegra_add_of_provider':
   clk.c:(.init.text+0x1a0): undefined reference to `of_clk_add_provider'
   sparc-linux-ld: drivers/clk/tegra/clk-audio-sync.o: in function `tegra_clk_register_sync_source':
   clk-audio-sync.c:(.text+0x128): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-dfll.o: in function `tegra_dfll_unregister':
   clk-dfll.c:(.text+0x19c): undefined reference to `of_clk_del_provider'
>> sparc-linux-ld: clk-dfll.c:(.text+0x1a4): undefined reference to `clk_unregister'
   sparc-linux-ld: drivers/clk/tegra/clk-divider.o: in function `clk_divider_restore_context':
   clk-divider.c:(.text+0x2c4): undefined reference to `clk_hw_get_parent'
>> sparc-linux-ld: clk-divider.c:(.text+0x2cc): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: clk-divider.c:(.text+0x2d8): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: drivers/clk/tegra/clk-divider.o: in function `tegra_clk_register_divider':
   clk-divider.c:(.text+0x3b4): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-divider.o: in function `tegra_clk_register_mc':
   clk-divider.c:(.text+0x438): undefined reference to `clk_register_divider_table'
   sparc-linux-ld: drivers/clk/tegra/clk-periph.o: in function `clk_periph_restore_context':
   clk-periph.c:(.text+0x248): undefined reference to `clk_hw_get_parent_index'
   sparc-linux-ld: drivers/clk/tegra/clk-periph.o: in function `tegra_clk_register_periph':
   clk-periph.c:(.text+0x350): undefined reference to `clk_register'
>> sparc-linux-ld: clk-periph.c:(.text+0x3d4): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-periph.o: in function `tegra_clk_register_periph_nodiv':
   clk-periph.c:(.text+0x484): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-periph.o: in function `tegra_clk_register_periph_data':
   clk-periph.c:(.text+0x560): undefined reference to `clk_register'
   sparc-linux-ld: clk-periph.c:(.text+0x5e4): undefined reference to `clk_register'
>> sparc-linux-ld: drivers/clk/tegra/clk-periph.o:(.rodata+0x94): undefined reference to `clk_hw_determine_rate_no_reparent'
   sparc-linux-ld: drivers/clk/tegra/clk-periph-fixed.o: in function `tegra_clk_register_periph_fixed':
   clk-periph-fixed.c:(.text+0x2fc): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-periph-gate.o: in function `tegra_clk_register_periph_gate':
   clk-periph-gate.c:(.text+0x448): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_determine_rate':
   clk-pll.c:(.text+0x764): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_wait_for_lock':
   clk-pll.c:(.text+0x860): undefined reference to `clk_hw_get_name'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pllu_enable':
   clk-pll.c:(.text+0x1244): undefined reference to `clk_hw_get_parent'
>> sparc-linux-ld: clk-pll.c:(.text+0x124c): undefined reference to `clk_hw_get_parent'
>> sparc-linux-ld: clk-pll.c:(.text+0x1260): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_set_rate':
   clk-pll.c:(.text+0x20d8): undefined reference to `clk_hw_get_name'
>> sparc-linux-ld: clk-pll.c:(.text+0x2110): undefined reference to `clk_hw_get_name'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `tegra_clk_pll_restore_context':
   clk-pll.c:(.text+0x2184): undefined reference to `clk_hw_get_parent'
   sparc-linux-ld: clk-pll.c:(.text+0x218c): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: clk-pll.c:(.text+0x2198): undefined reference to `clk_hw_get_rate'
>> sparc-linux-ld: clk-pll.c:(.text+0x21e4): undefined reference to `__clk_get_enable_count'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_recalc_rate':
   clk-pll.c:(.text+0x243c): undefined reference to `clk_hw_get_name'
   sparc-linux-ld: clk-pll.c:(.text+0x248c): undefined reference to `clk_hw_get_name'
   sparc-linux-ld: drivers/clk/tegra/clk-pll.o: in function `clk_plle_enable':
   clk-pll.c:(.text+0x24f4): undefined reference to `clk_hw_get_parent'
   sparc-linux-ld: clk-pll.c:(.text+0x24fc): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: drivers/clk/tegra/clk-pll-out.o: in function `tegra_clk_pll_out_restore_context':
   clk-pll-out.c:(.text+0x284): undefined reference to `__clk_get_enable_count'
   sparc-linux-ld: drivers/clk/tegra/clk-pll-out.o: in function `tegra_clk_register_pll_out':
   clk-pll-out.c:(.text+0x364): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `clk_sdmmc_mux_get_parent':
   clk-sdmmc-mux.c:(.text+0x244): undefined reference to `clk_hw_get_num_parents'
   sparc-linux-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `clk_sdmmc_mux_restore_context':
   clk-sdmmc-mux.c:(.text+0x4c4): undefined reference to `clk_hw_get_parent'
>> sparc-linux-ld: clk-sdmmc-mux.c:(.text+0x4cc): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: clk-sdmmc-mux.c:(.text+0x4d8): undefined reference to `clk_hw_get_rate'
>> sparc-linux-ld: clk-sdmmc-mux.c:(.text+0x4e4): undefined reference to `clk_hw_get_parent_index'
   sparc-linux-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `tegra_clk_register_sdmmc_mux_div':
   clk-sdmmc-mux.c:(.text+0x5f8): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-super.o: in function `clk_super_restore_context':
   clk-super.c:(.text+0x404): undefined reference to `clk_hw_get_parent_index'
   sparc-linux-ld: drivers/clk/tegra/clk-super.o: in function `clk_super_mux_restore_context':
   clk-super.c:(.text+0x484): undefined reference to `clk_hw_get_parent_index'
   sparc-linux-ld: drivers/clk/tegra/clk-super.o: in function `tegra_clk_register_super_clk':
   clk-super.c:(.text+0x620): undefined reference to `clk_register'
>> sparc-linux-ld: drivers/clk/tegra/clk-super.o:(.rodata+0x94): undefined reference to `clk_hw_determine_rate_no_reparent'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-audio.o: in function `tegra_audio_sync_clk_init.constprop.0':
   clk-tegra-audio.c:(.init.text+0x54): undefined reference to `clk_register_mux_table'
>> sparc-linux-ld: clk-tegra-audio.c:(.init.text+0x94): undefined reference to `clk_register_gate'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-audio.o: in function `tegra_audio_clk_init':
   clk-tegra-audio.c:(.init.text+0x29c): undefined reference to `clk_register_fixed_factor'
>> sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x10c): undefined reference to `clk_mux_ops'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x1a4): undefined reference to `clk_mux_ops'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x23c): undefined reference to `clk_mux_ops'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x2d4): undefined reference to `clk_mux_ops'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x36c): undefined reference to `clk_mux_ops'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data+0x404): more undefined references to `clk_mux_ops' follow
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-periph.o: in function `init_pllp':
   clk-tegra-periph.c:(.init.text+0x48): undefined reference to `clk_register_clkdev'
>> sparc-linux-ld: clk-tegra-periph.c:(.init.text+0x1c8): undefined reference to `clk_register_gate'
   sparc-linux-ld: clk-tegra-periph.c:(.init.text+0x20c): undefined reference to `clk_register_gate'
>> sparc-linux-ld: clk-tegra-periph.c:(.init.text+0x21c): undefined reference to `clk_register_clkdev'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-fixed.o: in function `tegra_osc_clk_init':
   clk-tegra-fixed.c:(.init.text+0x98): undefined reference to `clk_register_fixed_rate'
>> sparc-linux-ld: clk-tegra-fixed.c:(.init.text+0xd0): undefined reference to `clk_register_fixed_factor'
   sparc-linux-ld: clk-tegra-fixed.c:(.init.text+0x108): undefined reference to `clk_register_fixed_factor'
   sparc-linux-ld: clk-tegra-fixed.c:(.init.text+0x140): undefined reference to `clk_register_fixed_factor'
   sparc-linux-ld: clk-tegra-fixed.c:(.init.text+0x184): undefined reference to `clk_register_fixed_factor'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-fixed.o: in function `tegra_fixed_clk_init':
   clk-tegra-fixed.c:(.init.text+0x1d8): undefined reference to `clk_register_fixed_rate'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-super-cclk.o: in function `cclk_super_determine_rate':
   clk-tegra-super-cclk.c:(.text+0xc8): undefined reference to `clk_hw_get_parent_by_index'
>> sparc-linux-ld: clk-tegra-super-cclk.c:(.text+0xd8): undefined reference to `clk_hw_get_parent_by_index'
   sparc-linux-ld: clk-tegra-super-cclk.c:(.text+0xfc): undefined reference to `clk_hw_get_rate'
   sparc-linux-ld: clk-tegra-super-cclk.c:(.text+0x144): undefined reference to `clk_hw_round_rate'
   sparc-linux-ld: clk-tegra-super-cclk.c:(.text+0x194): undefined reference to `clk_hw_get_rate_range'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-super-cclk.o: in function `tegra_clk_register_super_cclk':
   clk-tegra-super-cclk.c:(.text+0x420): undefined reference to `clk_register'
   sparc-linux-ld: drivers/clk/tegra/clk-tegra-super-gen4.o: in function `tegra_sclk_init':
   clk-tegra-super-gen4.c:(.init.text+0x98): undefined reference to `clk_register_divider_table'
   sparc-linux-ld: clk-tegra-super-gen4.c:(.init.text+0x140): undefined reference to `clk_register_divider_table'
   sparc-linux-ld: clk-tegra-super-gen4.c:(.init.text+0x16c): undefined reference to `clk_register_gate'
   sparc-linux-ld: clk-tegra-super-gen4.c:(.init.text+0x1c4): undefined reference to `clk_register_divider_table'
   sparc-linux-ld: clk-tegra-super-gen4.c:(.init.text+0x1f0): undefined reference to `clk_register_gate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
