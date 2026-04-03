Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671D736681F
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205841; cv=none; b=faZ5v6mWSmgYyzHpcyQJRW24gNlw9blLPkKw32Mx6p3lhRR4E8llIFS6x5tjHa7BZEWrDJTiDx9w22fKY9Uu6Q3HqRX+o0p+L1B0E1N3oCk6J4SqbmBxHVM4YTVSPm4FNJUq4G4rdsamXrpjLxrag1/diVN1NEGgyHePshXfQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205841; c=relaxed/simple;
	bh=UABZR7qEwcDSbZGHgIDkQE6KjxdgGL32H1ICuSWPHTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+3oaf6QexrXlpntPgMUWUU7CkDauiInwYvFMFvE/d+Snmo6TYt9sLV0vB6NVaT7KmaQhXMJouKNwsUdrw0aKPMIQMVsTeEa+lGB1/xMAJDfwnwhyVWe5t2NgWVwvyzcvXv5tw75e5jDTnMm1UZvCT7IxzX2fcqP5p4p2HpBOkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0LdrMTy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0LdrMTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205840; x=1806741840;
  h=date:from:to:cc:subject:message-id;
  bh=UABZR7qEwcDSbZGHgIDkQE6KjxdgGL32H1ICuSWPHTI=;
  b=N0LdrMTyf4yx4DkIpOglTo/d9C+HwbWKvjFhaajDHHbJz9tBscqnyWoO
   /rnc4m1SA+R54u7IkBwxLv8eM0HKFF9AP1KkW+GUYrdYXCz/PSohNnUVE
   vocyLppqoZeNdw5rmbtxgU/8ikRm8lT8BmnekGXKTeUQNkQ9fWOgC9Mzx
   38vK98QLoD0A6lc44PkwYSxQqwHRtr8Pgf79cAAQpXlZkbSL7KYEa1F8j
   PWR6hnE6pHJNwxs2Cr/0aTq69fWggL9p6bPdEMg5hG6qdCGHHbEPRM1nr
   c7omZATy0sQ3QVZRE/8q5tJM7i3Sy+AiqPF1IFWPjlcmoIyToBYKj7Dg4
   A==;
X-CSE-ConnectionGUID: +ldTdb74RRefl22j+fTQ1A==
X-CSE-MsgGUID: PwNXjMCZR2SsjrfFdtDoAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852241"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852241"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:43:59 -0700
X-CSE-ConnectionGUID: jvxwJR91TFywY4KdWcYSLw==
X-CSE-MsgGUID: nlObDcg0Qz+TfQ++jP6TIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943430"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8B-0000000014P-3TxO;
	Fri, 03 Apr 2026 08:43:55 +0000
Date: Fri, 03 Apr 2026 16:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-tegra@vger.kernel.org,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [arm-tegra:for-7.1/pci 4/5]
 drivers/pci/controller/pcie-tegra264.c:228:27: warning: left shift count >=
 width of type
Message-ID: <202604030544.CYytXhkh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-7.1/pci
head:   9aa0c83c7374a1aa096bad5ae3260bb8bc62d0c1
commit: 270ae177795a7046f1e0ad2692f15b73b0ecf5d2 [4/5] PCI: tegra: Add Tegra264 support
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604030544.CYytXhkh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030544.CYytXhkh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030544.CYytXhkh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-tegra264.c: In function 'tegra264_pcie_check_ranges':
>> drivers/pci/controller/pcie-tegra264.c:228:27: warning: left shift count >= width of type [-Wshift-count-overflow]
     228 |                 phys = hi << 32 | lo;
         |                           ^~
   drivers/pci/controller/pcie-tegra264.c:232:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     232 |                 limit = hi << 32 | lo | mask;
         |                            ^~
   drivers/pci/controller/pcie-tegra264.c:248:19: warning: left shift count >= width of type [-Wshift-count-overflow]
     248 |         phys = hi << 32 | lo;
         |                   ^~


vim +228 drivers/pci/controller/pcie-tegra264.c

   152	
   153	/*
   154	 * The various memory regions used by the controller (I/O, memory, ECAM) are
   155	 * set up during early boot and have hardware-level protections in place. If
   156	 * the DT ranges don't match what's been setup, the controller won't be able
   157	 * to write the address endpoints properly, so make sure to validate that DT
   158	 * and firmware programming agree on these ranges.
   159	 */
   160	static bool tegra264_pcie_check_ranges(struct platform_device *pdev)
   161	{
   162		struct tegra264_pcie *pcie = platform_get_drvdata(pdev);
   163		struct device_node *np = pcie->dev->of_node;
   164		struct of_pci_range_parser parser;
   165		phys_addr_t phys, limit, hi, lo;
   166		struct of_pci_range range;
   167		struct resource *res;
   168		bool status = true;
   169		u32 value;
   170		int err;
   171	
   172		err = of_pci_range_parser_init(&parser, np);
   173		if (err < 0)
   174			return false;
   175	
   176		for_each_of_pci_range(&parser, &range) {
   177			unsigned int addr_hi, addr_lo, limit_hi, limit_lo, enable;
   178			unsigned long type = range.flags & IORESOURCE_TYPE_BITS;
   179			phys_addr_t start, end, mask;
   180			const char *region = NULL;
   181	
   182			end = range.cpu_addr + range.size - 1;
   183			start = range.cpu_addr;
   184	
   185			switch (type) {
   186			case IORESOURCE_IO:
   187				addr_hi = XAL_RC_IO_BASE_HI;
   188				addr_lo = XAL_RC_IO_BASE_LO;
   189				limit_hi = XAL_RC_IO_LIMIT_HI;
   190				limit_lo = XAL_RC_IO_LIMIT_LO;
   191				enable = XAL_RC_BAR_CNTL_STANDARD_IOBAR_EN;
   192				mask = SZ_64K - 1;
   193				region = "I/O";
   194				break;
   195	
   196			case IORESOURCE_MEM:
   197				if (range.flags & IORESOURCE_PREFETCH) {
   198					addr_hi = XAL_RC_MEM_64BIT_BASE_HI;
   199					addr_lo = XAL_RC_MEM_64BIT_BASE_LO;
   200					limit_hi = XAL_RC_MEM_64BIT_LIMIT_HI;
   201					limit_lo = XAL_RC_MEM_64BIT_LIMIT_LO;
   202					enable = XAL_RC_BAR_CNTL_STANDARD_64B_BAR_EN;
   203					region = "prefetchable memory";
   204				} else {
   205					addr_hi = XAL_RC_MEM_32BIT_BASE_HI;
   206					addr_lo = XAL_RC_MEM_32BIT_BASE_LO;
   207					limit_hi = XAL_RC_MEM_32BIT_LIMIT_HI;
   208					limit_lo = XAL_RC_MEM_32BIT_LIMIT_LO;
   209					enable = XAL_RC_BAR_CNTL_STANDARD_32B_BAR_EN;
   210					region = "memory";
   211				}
   212	
   213				mask = SZ_1M - 1;
   214				break;
   215			}
   216	
   217			/* not interested in anything that's not I/O or memory */
   218			if (!region)
   219				continue;
   220	
   221			/* don't check regions that haven't been enabled */
   222			value = readl(pcie->xal + XAL_RC_BAR_CNTL_STANDARD);
   223			if ((value & enable) == 0)
   224				continue;
   225	
   226			hi = readl(pcie->xal + addr_hi);
   227			lo = readl(pcie->xal + addr_lo);
 > 228			phys = hi << 32 | lo;
   229	
   230			hi = readl(pcie->xal + limit_hi);
   231			lo = readl(pcie->xal + limit_lo);
   232			limit = hi << 32 | lo | mask;
   233	
   234			if (phys != start || limit != end) {
   235				dev_err(pcie->dev,
   236					"%s region mismatch: %pap-%pap -> %pap-%pap\n",
   237					region, &phys, &limit, &start, &end);
   238				status = false;
   239			}
   240		}
   241	
   242		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ecam");
   243		if (!res)
   244			return false;
   245	
   246		hi = readl(pcie->xal + XAL_RC_ECAM_BASE_HI);
   247		lo = readl(pcie->xal + XAL_RC_ECAM_BASE_LO);
   248		phys = hi << 32 | lo;
   249	
   250		value = readl(pcie->xal + XAL_RC_ECAM_BUSMASK);
   251		limit = phys + ((value + 1) << 20) - 1;
   252	
   253		if (phys != res->start || limit != res->end) {
   254			dev_err(pcie->dev,
   255				"ECAM region mismatch: %pap-%pap -> %pap-%pap\n",
   256				&phys, &limit, &res->start, &res->end);
   257			status = false;
   258		}
   259	
   260		return status;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
