Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233BD4369A;
	Thu, 26 Mar 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561911; cv=none; b=ZJ6CgwFDTw7bCedPOVWM0gCFGu0KGzikffemYSRfhkelLMS+5b6vceGHi1i8LvKtVdp4dalZuXY3hNeBVYr+8H05WtVjD1GW9Wp3NlGgchQRiE1NXhgbHK0G7CAvdEUr7342wgZOatbxIeCXhY3lxYZdAONMId8rPWiMlQh9Nzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561911; c=relaxed/simple;
	bh=ksQxwM+OccMxa9iJv3EW5rDxkiElko9WrzO8RLo+obM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFj7qOl06f1nRenoZfgcMc8F8tQg+vJsHIGxUNqG4qH1yqOez+cX3OiBqB4cPSFyW5obRCeWCNpLk9I8oeMudyAKgn4SeEinDeR9XJfOlTs4b0ZtYhscuTFM31RdywvAdffNCQQAyXWcZcSL8/uTHtL+4XS4W7B2+LhhnCCsf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHfgmTjr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHfgmTjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774561908; x=1806097908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ksQxwM+OccMxa9iJv3EW5rDxkiElko9WrzO8RLo+obM=;
  b=NHfgmTjr2vncHNixqO+P3QyTvkSxXAKXYqBvu3vGgT8i+68ovzFykGot
   TF4y9hpIC/MhAfB5vaPqxi7UY/ZJ6y104Qt2AbJdSLXxZcapVFUENtl38
   a+RZcGl+vOMU4qEshbs7WATwNq66q2kTZv1ZX+LS0+kjG+k/6w5Nnnoxy
   b1bEQz80EncG3tbOMWh53UvlOL2k3rFp0hV3EaKqbu3UAR9jkMjrhraHC
   4742WEOzWuGyletpqEOoYFnetpe5C5RP61NdKd/FjMWpMMajPVJeVfGgT
   bg8IB9kKXjPWpij7FpZsoYKWEEQ8KUgFSr+dRvnXGX21MqMIaL5grbcNW
   Q==;
X-CSE-ConnectionGUID: MbUrdvjtTSa4OBUGCPD0+A==
X-CSE-MsgGUID: pGrzLfHLT9W/poFLzuDP6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85939218"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="85939218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 14:51:47 -0700
X-CSE-ConnectionGUID: 5HsxH+RiTJKVrVxatLAu0Q==
X-CSE-MsgGUID: Ty7k5RPuQJWBmzhu3j4qUw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2026 14:51:45 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5scA-000000007L7-36Pq;
	Thu, 26 Mar 2026 21:51:42 +0000
Date: Thu, 26 Mar 2026 22:51:21 +0100
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-tegra@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
Message-ID: <202603262233.dvRyEA8v-lkp@intel.com>
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
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260326/202603262233.dvRyEA8v-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262233.dvRyEA8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603262233.dvRyEA8v-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: drivers/clk/tegra/clk.o: in function `tegra_register_devclks':
>> drivers/clk/tegra/clk.c:361:(.text+0x718): undefined reference to `clk_register_clkdev'
>> s390x-linux-gnu-ld: drivers/clk/tegra/clk.c:366:(.text+0x770): undefined reference to `__clk_get_name'
>> s390x-linux-gnu-ld: drivers/clk/tegra/clk.c:366:(.text+0x784): undefined reference to `clk_register_clkdev'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk.o: in function `tegra_clk_dev_register':
>> drivers/clk/tegra/clk.c:437:(.text+0x830): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk.o: in function `tegra_init_dup_clks':
>> drivers/clk/tegra/clk.c:263:(.init.text+0x17c): undefined reference to `clkdev_add'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-audio-sync.o: in function `tegra_clk_register_sync_source':
>> drivers/clk/tegra/clk-audio-sync.c:70:(.text+0x1f8): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-dfll.o: in function `dfll_unregister_clk':
>> drivers/clk/tegra/clk-dfll.c:1215:(.text+0x236): undefined reference to `clk_unregister'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-divider.o: in function `clk_divider_restore_context':
>> drivers/clk/tegra/clk-divider.c:127:(.text+0x262): undefined reference to `clk_hw_get_parent'
>> s390x-linux-gnu-ld: drivers/clk/tegra/clk-divider.c:128:(.text+0x268): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-divider.c:129:(.text+0x276): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-divider.o: in function `tegra_clk_register_divider':
>> drivers/clk/tegra/clk-divider.c:174:(.text+0x6e0): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-divider.o: in function `tegra_clk_register_mc':
>> drivers/clk/tegra/clk-divider.c:190:(.text+0x7da): undefined reference to `clk_register_divider_table'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.o: in function `clk_periph_restore_context':
>> drivers/clk/tegra/clk-periph.c:119:(.text+0x676): undefined reference to `clk_hw_get_parent_index'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.o: in function `_tegra_clk_register_periph':
>> drivers/clk/tegra/clk-periph.c:199:(.text+0x8ec): undefined reference to `clk_register'
>> s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.c:199:(.text+0x9b6): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.c:199:(.text+0xb72): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.c:199:(.text+0xdf2): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.c:199:(.text+0xeb8): undefined reference to `clk_register'
>> s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph.o:(.data.rel.ro+0x60): undefined reference to `clk_hw_determine_rate_no_reparent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph-fixed.o: in function `tegra_clk_register_periph_fixed':
>> drivers/clk/tegra/clk-periph-fixed.c:105:(.text+0x558): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-periph-gate.o: in function `tegra_clk_register_periph_gate':
>> drivers/clk/tegra/clk-periph-gate.c:171:(.text+0x79e): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_determine_rate':
>> drivers/clk/tegra/clk-pll.c:852:(.text+0xbc4): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_wait_for_lock':
>> drivers/clk/tegra/clk-pll.c:319:(.text+0xdae): undefined reference to `clk_hw_get_name'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pllu_enable':
>> drivers/clk/tegra/clk-pll.c:1124:(.text+0x1eec): undefined reference to `clk_hw_get_parent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:1125:(.text+0x1ef2): undefined reference to `clk_hw_get_parent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:1137:(.text+0x1f08): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_recalc_rate':
   drivers/clk/tegra/clk-pll.c:888:(.text+0x2b58): undefined reference to `clk_hw_get_name'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:902:(.text+0x2c10): undefined reference to `clk_hw_get_name'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `clk_pll_set_rate':
   drivers/clk/tegra/clk-pll.c:821:(.text+0x3a1a): undefined reference to `clk_hw_get_name'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:811:(.text+0x3a4e): undefined reference to `clk_hw_get_name'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `tegra_clk_pll_restore_context':
   drivers/clk/tegra/clk-pll.c:1042:(.text+0x3ae2): undefined reference to `clk_hw_get_parent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:1043:(.text+0x3ae8): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:1044:(.text+0x3af6): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:1054:(.text+0x3b5c): undefined reference to `__clk_get_enable_count'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.o: in function `clk_plle_enable':
   drivers/clk/tegra/clk-pll.c:971:(.text+0x3cc0): undefined reference to `clk_hw_get_parent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll.c:971:(.text+0x3cc6): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll-out.o: in function `tegra_clk_pll_out_restore_context':
   drivers/clk/tegra/clk-pll-out.c:74:(.text+0x432): undefined reference to `__clk_get_enable_count'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-pll-out.o: in function `tegra_clk_register_pll_out':
   drivers/clk/tegra/clk-pll-out.c:115:(.text+0x5f8): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `clk_sdmmc_mux_get_parent':
   drivers/clk/tegra/clk-sdmmc-mux.c:48:(.text+0x66c): undefined reference to `clk_hw_get_num_parents'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `clk_sdmmc_mux_restore_context':
   drivers/clk/tegra/clk-sdmmc-mux.c:208:(.text+0x9e2): undefined reference to `clk_hw_get_parent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-sdmmc-mux.c:209:(.text+0x9e8): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-sdmmc-mux.c:210:(.text+0x9f6): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-sdmmc-mux.c:213:(.text+0xa04): undefined reference to `clk_hw_get_parent_index'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-sdmmc-mux.o: in function `tegra_clk_register_sdmmc_mux_div':
   drivers/clk/tegra/clk-sdmmc-mux.c:269:(.text+0xc06): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-super.o: in function `clk_super_restore_context':
   drivers/clk/tegra/clk-super.c:184:(.text+0x726): undefined reference to `clk_hw_get_parent_index'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-super.o: in function `clk_super_mux_restore_context':
   drivers/clk/tegra/clk-super.c:131:(.text+0x7a2): undefined reference to `clk_hw_get_parent_index'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-super.o: in function `tegra_clk_register_super_clk':
   drivers/clk/tegra/clk-super.c:270:(.text+0xbba): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-super.o:(.data.rel.ro+0x60): undefined reference to `clk_hw_determine_rate_no_reparent'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-audio.o: in function `tegra_audio_sync_clk_init':
   drivers/clk/tegra/clk-tegra-audio.c:145:(.init.text+0xda): undefined reference to `clk_register_mux_table'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-audio.c:156:(.init.text+0x172): undefined reference to `clk_register_gate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-audio.o: in function `tegra_audio_clk_init':
   drivers/clk/tegra/clk-tegra-audio.c:235:(.init.text+0x4a0): undefined reference to `clk_register_fixed_factor'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o: in function `init_pllp':
   drivers/clk/tegra/clk-tegra-periph.c:952:(.init.text+0x7c): undefined reference to `clk_register_clkdev'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.c:1004:(.init.text+0x326): undefined reference to `clk_register_gate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.c:1013:(.init.text+0x380): undefined reference to `clk_register_gate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.c:1017:(.init.text+0x394): undefined reference to `clk_register_clkdev'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data.rel+0xe8): undefined reference to `clk_mux_ops'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data.rel+0x208): undefined reference to `clk_mux_ops'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data.rel+0x328): undefined reference to `clk_mux_ops'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data.rel+0x448): undefined reference to `clk_mux_ops'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data.rel+0x568): undefined reference to `clk_mux_ops'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-periph.o:(.data.rel+0x688): more undefined references to `clk_mux_ops' follow
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-fixed.o: in function `tegra_osc_clk_init':
   drivers/clk/tegra/clk-tegra-fixed.c:53:(.init.text+0xe0): undefined reference to `clk_register_fixed_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-fixed.c:59:(.init.text+0x12e): undefined reference to `clk_register_fixed_factor'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-fixed.c:67:(.init.text+0x17c): undefined reference to `clk_register_fixed_factor'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-fixed.c:76:(.init.text+0x1ca): undefined reference to `clk_register_fixed_factor'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-fixed.c:87:(.init.text+0x226): undefined reference to `clk_register_fixed_factor'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-fixed.o: in function `tegra_fixed_clk_init':
   drivers/clk/tegra/clk-tegra-fixed.c:105:(.init.text+0x2da): undefined reference to `clk_register_fixed_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-cclk.o: in function `cclk_super_determine_rate':
   drivers/clk/tegra/clk-tegra-super-cclk.c:71:(.text+0x200): undefined reference to `clk_hw_get_parent_by_index'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-cclk.c:72:(.text+0x212): undefined reference to `clk_hw_get_parent_by_index'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-cclk.c:84:(.text+0x246): undefined reference to `clk_hw_get_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-cclk.c:95:(.text+0x304): undefined reference to `clk_hw_get_rate_range'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-cclk.c:106:(.text+0x34c): undefined reference to `clk_hw_round_rate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-cclk.o: in function `tegra_clk_register_super_cclk':
   drivers/clk/tegra/clk-tegra-super-cclk.c:200:(.text+0x6e2): undefined reference to `clk_register'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-gen4.o: in function `tegra_sclk_init':
   drivers/clk/tegra/clk-tegra-super-gen4.c:117:(.init.text+0xf8): undefined reference to `clk_register_divider_table'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-gen4.c:141:(.init.text+0x1e8): undefined reference to `clk_register_divider_table'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-gen4.c:144:(.init.text+0x21a): undefined reference to `clk_register_gate'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-gen4.c:156:(.init.text+0x286): undefined reference to `clk_register_divider_table'
   s390x-linux-gnu-ld: drivers/clk/tegra/clk-tegra-super-gen4.c:159:(.init.text+0x2b8): undefined reference to `clk_register_gate'


vim +361 drivers/clk/tegra/clk.c

d5ff89a82a6d27 Peter De Schrijver 2013-08-22  254  
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  255  void __init tegra_init_dup_clks(struct tegra_clk_duplicate *dup_list,
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  256  				struct clk *clks[], int clk_max)
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  257  {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  258  	struct clk *clk;
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  259  
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  260  	for (; dup_list->clk_id < clk_max; dup_list++) {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  261  		clk = clks[dup_list->clk_id];
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  262  		dup_list->lookup.clk = clk;
8f8f484bf355e5 Prashant Gaikwad   2013-01-11 @263  		clkdev_add(&dup_list->lookup);
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  264  	}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  265  }
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  266  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  267  void tegra_init_from_table(struct tegra_clk_init_table *tbl,
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  268  			   struct clk *clks[], int clk_max)
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  269  {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  270  	struct clk *clk;
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  271  
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  272  	for (; tbl->clk_id < clk_max; tbl++) {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  273  		clk = clks[tbl->clk_id];
b9e742c3164344 Tomeu Vizoso       2014-09-17  274  		if (IS_ERR_OR_NULL(clk)) {
b9e742c3164344 Tomeu Vizoso       2014-09-17  275  			pr_err("%s: invalid entry %ld in clks array for id %d\n",
b9e742c3164344 Tomeu Vizoso       2014-09-17  276  			       __func__, PTR_ERR(clk), tbl->clk_id);
b9e742c3164344 Tomeu Vizoso       2014-09-17  277  			WARN_ON(1);
b9e742c3164344 Tomeu Vizoso       2014-09-17  278  
b9e742c3164344 Tomeu Vizoso       2014-09-17  279  			continue;
b9e742c3164344 Tomeu Vizoso       2014-09-17  280  		}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  281  
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  282  		if (tbl->parent_id < clk_max) {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  283  			struct clk *parent = clks[tbl->parent_id];
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  284  			if (clk_set_parent(clk, parent)) {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  285  				pr_err("%s: Failed to set parent %s of %s\n",
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  286  				       __func__, __clk_get_name(parent),
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  287  				       __clk_get_name(clk));
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  288  				WARN_ON(1);
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  289  			}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  290  		}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  291  
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  292  		if (tbl->rate)
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  293  			if (clk_set_rate(clk, tbl->rate)) {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  294  				pr_err("%s: Failed to set rate %lu of %s\n",
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  295  				       __func__, tbl->rate,
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  296  				       __clk_get_name(clk));
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  297  				WARN_ON(1);
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  298  			}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  299  
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  300  		if (tbl->state)
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  301  			if (clk_prepare_enable(clk)) {
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  302  				pr_err("%s: Failed to enable %s\n", __func__,
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  303  				       __clk_get_name(clk));
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  304  				WARN_ON(1);
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  305  			}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  306  	}
8f8f484bf355e5 Prashant Gaikwad   2013-01-11  307  }
61fd290d213e25 Prashant Gaikwad   2013-01-11  308  
7ba256d2aa2a18 Philipp Zabel      2016-02-25  309  static const struct reset_control_ops rst_ops = {
6d5b988e7dc56b Stephen Warren     2013-11-05  310  	.assert = tegra_clk_rst_assert,
6d5b988e7dc56b Stephen Warren     2013-11-05  311  	.deassert = tegra_clk_rst_deassert,
4236e752f19d4d Mikko Perttunen    2017-03-02  312  	.reset = tegra_clk_rst_reset,
6d5b988e7dc56b Stephen Warren     2013-11-05  313  };
6d5b988e7dc56b Stephen Warren     2013-11-05  314  
6d5b988e7dc56b Stephen Warren     2013-11-05  315  static struct reset_controller_dev rst_ctlr = {
6d5b988e7dc56b Stephen Warren     2013-11-05  316  	.ops = &rst_ops,
6d5b988e7dc56b Stephen Warren     2013-11-05  317  	.owner = THIS_MODULE,
6d5b988e7dc56b Stephen Warren     2013-11-05  318  	.of_reset_n_cells = 1,
6d5b988e7dc56b Stephen Warren     2013-11-05  319  };
6d5b988e7dc56b Stephen Warren     2013-11-05  320  
5d797111afe12e Dmitry Osipenko    2018-05-08  321  void __init tegra_add_of_provider(struct device_node *np,
5d797111afe12e Dmitry Osipenko    2018-05-08  322  				  void *clk_src_onecell_get)
343a607cb79259 Peter De Schrijver 2013-09-02  323  {
343a607cb79259 Peter De Schrijver 2013-09-02  324  	int i;
343a607cb79259 Peter De Schrijver 2013-09-02  325  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  326  	tegra_car_np = np;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  327  
343a607cb79259 Peter De Schrijver 2013-09-02  328  	for (i = 0; i < clk_num; i++) {
343a607cb79259 Peter De Schrijver 2013-09-02  329  		if (IS_ERR(clks[i])) {
343a607cb79259 Peter De Schrijver 2013-09-02  330  			pr_err
343a607cb79259 Peter De Schrijver 2013-09-02  331  			    ("Tegra clk %d: register failed with %ld\n",
343a607cb79259 Peter De Schrijver 2013-09-02  332  			     i, PTR_ERR(clks[i]));
343a607cb79259 Peter De Schrijver 2013-09-02  333  		}
343a607cb79259 Peter De Schrijver 2013-09-02  334  		if (!clks[i])
343a607cb79259 Peter De Schrijver 2013-09-02  335  			clks[i] = ERR_PTR(-EINVAL);
343a607cb79259 Peter De Schrijver 2013-09-02  336  	}
343a607cb79259 Peter De Schrijver 2013-09-02  337  
343a607cb79259 Peter De Schrijver 2013-09-02  338  	clk_data.clks = clks;
343a607cb79259 Peter De Schrijver 2013-09-02  339  	clk_data.clk_num = clk_num;
5d797111afe12e Dmitry Osipenko    2018-05-08  340  	of_clk_add_provider(np, clk_src_onecell_get, &clk_data);
6d5b988e7dc56b Stephen Warren     2013-11-05  341  
6d5b988e7dc56b Stephen Warren     2013-11-05  342  	rst_ctlr.of_node = np;
66b6f3d07454a6 Mikko Perttunen    2015-05-20  343  	rst_ctlr.nr_resets = periph_banks * 32 + num_special_reset;
6d5b988e7dc56b Stephen Warren     2013-11-05  344  	reset_controller_register(&rst_ctlr);
343a607cb79259 Peter De Schrijver 2013-09-02  345  }
343a607cb79259 Peter De Schrijver 2013-09-02  346  
66b6f3d07454a6 Mikko Perttunen    2015-05-20  347  void __init tegra_init_special_resets(unsigned int num,
66b6f3d07454a6 Mikko Perttunen    2015-05-20  348  				      int (*assert)(unsigned long),
66b6f3d07454a6 Mikko Perttunen    2015-05-20  349  				      int (*deassert)(unsigned long))
66b6f3d07454a6 Mikko Perttunen    2015-05-20  350  {
66b6f3d07454a6 Mikko Perttunen    2015-05-20  351  	num_special_reset = num;
66b6f3d07454a6 Mikko Perttunen    2015-05-20  352  	special_reset_assert = assert;
66b6f3d07454a6 Mikko Perttunen    2015-05-20  353  	special_reset_deassert = deassert;
66b6f3d07454a6 Mikko Perttunen    2015-05-20  354  }
66b6f3d07454a6 Mikko Perttunen    2015-05-20  355  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  356  void tegra_register_devclks(struct tegra_devclk *dev_clks, int num)
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  357  {
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  358  	int i;
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  359  
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  360  	for (i = 0; i < num; i++, dev_clks++)
73d37e4c7c4b9d Peter De Schrijver 2013-10-09 @361  		clk_register_clkdev(clks[dev_clks->dt_id], dev_clks->con_id,
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  362  				dev_clks->dev_id);
9f0030c8ad0ce3 Peter De Schrijver 2014-06-26  363  
9f0030c8ad0ce3 Peter De Schrijver 2014-06-26  364  	for (i = 0; i < clk_num; i++) {
9f0030c8ad0ce3 Peter De Schrijver 2014-06-26  365  		if (!IS_ERR_OR_NULL(clks[i]))
9f0030c8ad0ce3 Peter De Schrijver 2014-06-26 @366  			clk_register_clkdev(clks[i], __clk_get_name(clks[i]),
9f0030c8ad0ce3 Peter De Schrijver 2014-06-26  367  				"tegra-clk-debug");
9f0030c8ad0ce3 Peter De Schrijver 2014-06-26  368  	}
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  369  }
73d37e4c7c4b9d Peter De Schrijver 2013-10-09  370  
b8700d506ac405 Peter De Schrijver 2013-10-14  371  struct clk ** __init tegra_lookup_dt_id(int clk_id,
b8700d506ac405 Peter De Schrijver 2013-10-14  372  					struct tegra_clk *tegra_clk)
b8700d506ac405 Peter De Schrijver 2013-10-14  373  {
b8700d506ac405 Peter De Schrijver 2013-10-14  374  	if (tegra_clk[clk_id].present)
b8700d506ac405 Peter De Schrijver 2013-10-14  375  		return &clks[tegra_clk[clk_id].dt_id];
b8700d506ac405 Peter De Schrijver 2013-10-14  376  	else
b8700d506ac405 Peter De Schrijver 2013-10-14  377  		return NULL;
b8700d506ac405 Peter De Schrijver 2013-10-14  378  }
b8700d506ac405 Peter De Schrijver 2013-10-14  379  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  380  static struct device_node *tegra_clk_get_of_node(struct clk_hw *hw)
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  381  {
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  382  	struct device_node *np;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  383  	char *node_name;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  384  
28df1500f53874 Andy Shevchenko    2023-08-04  385  	node_name = kstrdup_and_replace(hw->init->name, '_', '-', GFP_KERNEL);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  386  	if (!node_name)
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  387  		return NULL;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  388  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  389  	for_each_child_of_node(tegra_car_np, np) {
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  390  		if (!strcmp(np->name, node_name))
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  391  			break;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  392  	}
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  393  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  394  	kfree(node_name);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  395  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  396  	return np;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  397  }
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  398  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  399  struct clk *tegra_clk_dev_register(struct clk_hw *hw)
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  400  {
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  401  	struct platform_device *pdev, *parent;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  402  	const char *dev_name = NULL;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  403  	struct device *dev = NULL;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  404  	struct device_node *np;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  405  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  406  	np = tegra_clk_get_of_node(hw);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  407  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  408  	if (!of_device_is_available(np))
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  409  		goto put_node;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  410  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  411  	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  412  	if (!dev_name)
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  413  		goto put_node;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  414  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  415  	parent = of_find_device_by_node(tegra_car_np);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  416  	if (parent) {
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  417  		pdev = of_platform_device_create(np, dev_name, &parent->dev);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  418  		put_device(&parent->dev);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  419  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  420  		if (!pdev) {
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  421  			pr_err("%s: failed to create device for %pOF\n",
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  422  			       __func__, np);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  423  			goto free_name;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  424  		}
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  425  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  426  		dev = &pdev->dev;
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  427  		pm_runtime_enable(dev);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  428  	} else {
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  429  		WARN(1, "failed to find device for %pOF\n", tegra_car_np);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  430  	}
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  431  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  432  free_name:
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  433  	kfree(dev_name);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  434  put_node:
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  435  	of_node_put(np);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  436  
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01 @437  	return clk_register(dev, hw);
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  438  }
b1bc04a2ac5b15 Dmitry Osipenko    2021-12-01  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
