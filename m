Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F22136896F;
	Sun, 22 Mar 2026 17:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774201730; cv=none; b=NTk775zjIQgvsOyM9zIA40Z3YlERp7H4L94i9qVOpcNzTtEdfmp7eAxlWMQLIWva0z8JG6uu0t4CQXaDGhcVevP+wGR2wAb7wehEZSDiRIoUJwePK7kkv4aKv2fWegpW7Wlypn4+RtiUESuV2manZhvsycdgmA/ScSVpLmcVQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774201730; c=relaxed/simple;
	bh=Q7plJylkoGw36pT5yDx8o4mQbJObfX4MYkkhDBNVVLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwIM6XQG7bJrZJDQt4AJ8tlVWzCbZEljmBV8s0nqDvR1Ttjg0i01pwVKSgFby6MI0WcBD8x0q69DNSSXNnUQ3EH0QGGVFl3EAWOMctkrhoHHrdXQnfOUoFMiL0jzxXZpRKlPMrlTJLE0+ZBLTUU53WX5hdez3pkM7bsJKGYaNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQmqnmzH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQmqnmzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774201729; x=1805737729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q7plJylkoGw36pT5yDx8o4mQbJObfX4MYkkhDBNVVLo=;
  b=SQmqnmzHCqPn9TAFHlBwkjxft0rwSkKK2crqG40KOPOalUXrEq+RD9kO
   46kWuWphH08YANzemVsrHvLETGavR5xaoq7oPg45bL9pYuTZe4K8YLNms
   EgjkFsKbC3epyztIdviyTT6PBN+Q5chXIhUOdgFe6DsCKuz6o0BItwDCA
   s+25tlYt6FpJ//LXp72M/gd7eL2YF2bfIE4dDXunx7Pq5SHrdYMjUYJla
   +l53aFAgdiAeGWeXUXh3SXXhCXlkhyqWdSUVzwrUMPOkWyBtMRE/7ATqD
   tHclfYYznV9WZl3SMKAVHBWZuMnuGbS2zl3oILUIIdiLRlWD0g32IhzHF
   g==;
X-CSE-ConnectionGUID: n9ZYZds6TIux+ReSnkbDaw==
X-CSE-MsgGUID: fYivz1zJQj2yfM89PlEdjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100668013"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="100668013"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 10:48:48 -0700
X-CSE-ConnectionGUID: 4NbUKZiMRHS2WCeYLBU5sQ==
X-CSE-MsgGUID: 2xvUqkYIRpmaRNzOgIoPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="261717612"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2026 10:48:42 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4MuG-000000002Tt-0QjY;
	Sun, 22 Mar 2026 17:48:17 +0000
Date: Mon, 23 Mar 2026 01:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Message-ID: <202603230124.VFt6CPBe-lkp@intel.com>
References: <20260318172820.13771-5-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-5-akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260320]
[also build test ERROR on linus/master v7.0-rc4]
[cannot apply to i3c/i3c/next rafael-pm/linux-next rafael-pm/bleeding-edge groeck-staging/hwmon-next v7.0-rc4 v7.0-rc3 v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-i3c-Add-mipi-i3c-static-method-to-support-SETAASA/20260322-174037
base:   next-20260320
patch link:    https://lore.kernel.org/r/20260318172820.13771-5-akhilrajeev%40nvidia.com
patch subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
config: hexagon-randconfig-002-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230124.VFt6CPBe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230124.VFt6CPBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230124.VFt6CPBe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master.c:2449:9: error: call to undeclared function 'acpi_dev_get_resources'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2449 |                 ret = acpi_dev_get_resources(adev, &resources,
         |                       ^
   drivers/i3c/master.c:2449:9: note: did you mean 'acpi_get_event_resources'?
   include/acpi/acpixf.h:816:9: note: 'acpi_get_event_resources' declared here
     816 |                              acpi_get_event_resources(acpi_handle device_handle,
         |                              ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
>> drivers/i3c/master.c:2455:3: error: call to undeclared function 'acpi_dev_free_resource_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2455 |                 acpi_dev_free_resource_list(&resources);
         |                 ^
   drivers/i3c/master.c:2556:2: error: unknown type name 'acpi_bus_address'; did you mean 'acpi_io_address'?
    2556 |         acpi_bus_address adr;
         |         ^~~~~~~~~~~~~~~~
         |         acpi_io_address
   include/acpi/actypes.h:187:13: note: 'acpi_io_address' declared here
     187 | typedef u64 acpi_io_address;
         |             ^
>> drivers/i3c/master.c:2563:7: error: call to undeclared function 'acpi_has_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
         |              ^
   drivers/i3c/master.c:2563:7: note: did you mean 'acpi_has_watchdog'?
   include/linux/acpi.h:1504:20: note: 'acpi_has_watchdog' declared here
    1504 | static inline bool acpi_has_watchdog(void) { return false; }
         |                    ^
>> drivers/i3c/master.c:2563:27: error: incomplete definition of type 'struct acpi_device'
    2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
         |                              ~~~~^
   include/linux/device/bus.h:224:8: note: forward declaration of 'struct acpi_device'
     224 | struct acpi_device;
         |        ^
>> drivers/i3c/master.c:2566:8: error: call to undeclared function 'acpi_device_adr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2566 |         adr = acpi_device_adr(adev);
         |               ^
   drivers/i3c/master.c:2566:8: note: did you mean 'acpi_device_handle'?
   include/linux/acpi.h:883:27: note: 'acpi_device_handle' declared here
     883 | static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
         |                           ^
   drivers/i3c/master.c:2674:9: error: call to undeclared function 'acpi_dev_get_resources'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2674 |                 ret = acpi_dev_get_resources(adev, &resources,
         |                       ^
   drivers/i3c/master.c:2683:3: error: call to undeclared function 'acpi_dev_free_resource_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2683 |                 acpi_dev_free_resource_list(&resources);
         |                 ^
   8 errors generated.


vim +/acpi_dev_get_resources +2449 drivers/i3c/master.c

  2423	
  2424	static int
  2425	i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
  2426				     struct fwnode_handle *fwnode, u32 *reg)
  2427	{
  2428		struct i2c_dev_boardinfo *boardinfo;
  2429		struct device *dev = &master->dev;
  2430		struct acpi_device *adev;
  2431		LIST_HEAD(resources);
  2432		int ret;
  2433	
  2434		boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
  2435		if (!boardinfo)
  2436			return -ENOMEM;
  2437	
  2438		if (is_of_node(fwnode)) {
  2439			ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
  2440			if (ret)
  2441				return ret;
  2442	
  2443			/* LVR is encoded in reg[2] for Device Tree. */
  2444			boardinfo->lvr = reg[2];
  2445		} else if (is_acpi_device_node(fwnode)) {
  2446			adev = to_acpi_device_node(fwnode);
  2447			boardinfo->base.fwnode = acpi_fwnode_handle(adev);
  2448	
> 2449			ret = acpi_dev_get_resources(adev, &resources,
  2450						     i3c_acpi_get_i2c_resource, boardinfo);
  2451	
  2452			if (ret < 0)
  2453				return ret;
  2454	
> 2455			acpi_dev_free_resource_list(&resources);
  2456	
  2457			if (!boardinfo->base.addr)
  2458				return -ENODEV;
  2459		} else {
  2460			return -EINVAL;
  2461		}
  2462	
  2463		/*
  2464		 * The I3C Specification does not clearly say I2C devices with 10-bit
  2465		 * address are supported. These devices can't be passed properly through
  2466		 * DEFSLVS command.
  2467		 */
  2468		if (boardinfo->base.flags & I2C_CLIENT_TEN) {
  2469			dev_err(dev, "I2C device with 10 bit address not supported.");
  2470			return -EOPNOTSUPP;
  2471		}
  2472	
  2473		list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
  2474		fwnode_handle_get(fwnode);
  2475	
  2476		return 0;
  2477	}
  2478	
  2479	static int
  2480	i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
  2481				     struct fwnode_handle *fwnode, u32 *reg)
  2482	{
  2483		struct i3c_dev_boardinfo *boardinfo;
  2484		struct device *dev = &master->dev;
  2485		enum i3c_addr_slot_status addrstatus;
  2486		u32 init_dyn_addr = 0;
  2487	
  2488		boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
  2489		if (!boardinfo)
  2490			return -ENOMEM;
  2491	
  2492		if (reg[0]) {
  2493			if (reg[0] > I3C_MAX_ADDR)
  2494				return -EINVAL;
  2495	
  2496			addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
  2497								  reg[0]);
  2498			if (addrstatus != I3C_ADDR_SLOT_FREE)
  2499				return -EINVAL;
  2500		}
  2501	
  2502		boardinfo->static_addr = reg[0];
  2503	
  2504		if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
  2505			if (init_dyn_addr > I3C_MAX_ADDR)
  2506				return -EINVAL;
  2507	
  2508			addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
  2509								  init_dyn_addr);
  2510			if (addrstatus != I3C_ADDR_SLOT_FREE)
  2511				return -EINVAL;
  2512		}
  2513	
  2514		boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
  2515	
  2516		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
  2517		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
  2518			return -EINVAL;
  2519	
  2520		boardinfo->init_dyn_addr = init_dyn_addr;
  2521		boardinfo->fwnode = fwnode_handle_get(fwnode);
  2522		list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
  2523	
  2524		return 0;
  2525	}
  2526	
  2527	static int i3c_master_add_of_dev(struct i3c_master_controller *master,
  2528					 struct fwnode_handle *fwnode)
  2529	{
  2530		u32 reg[3];
  2531		int ret;
  2532	
  2533		if (!master)
  2534			return -EINVAL;
  2535	
  2536		ret = fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(reg));
  2537		if (ret)
  2538			return ret;
  2539	
  2540		/*
  2541		 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
  2542		 * dealing with an I2C device.
  2543		 */
  2544		if (!reg[1])
  2545			ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
  2546		else
  2547			ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
  2548	
  2549		return ret;
  2550	}
  2551	
  2552	static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
  2553					   struct fwnode_handle *fwnode)
  2554	{
  2555		struct acpi_device *adev = to_acpi_device_node(fwnode);
> 2556		acpi_bus_address adr;
  2557		u32 reg[3] = { 0 };
  2558	
  2559		/*
  2560		 * If the ACPI table entry does not have _ADR method, it's an I2C device
  2561		 * If the ACPI table entry has _ADR method, it's an I3C device
  2562		 */
> 2563		if (!acpi_has_method(adev->handle, "_ADR"))
  2564			return i3c_master_add_i2c_boardinfo(master, fwnode, reg);
  2565	
> 2566		adr = acpi_device_adr(adev);
  2567	
  2568		/* For I3C devices, _ADR will have the 48 bit PID of the device  */
  2569		reg[1] = upper_32_bits(adr);
  2570		reg[2] = lower_32_bits(adr);
  2571	
  2572		fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
  2573	
  2574		return i3c_master_add_i3c_boardinfo(master, fwnode, reg);
  2575	}
  2576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
