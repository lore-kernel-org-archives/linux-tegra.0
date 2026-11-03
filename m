Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694318;
	b=RcAomyfpOdXoP7TuU3g8Qi5ktFrAPrG3IsK3TJxp1nhj20uhWymGyMUW2phOtVgjbM+q
	 Og9DD5cuxZz14+H4Xu1rQFFLgWx0bN91pF/YgVGA0PFr6T6X3OLuY90HcH+uLKl3KEKKE
	 89N6WdtxBS5jVQXIluVAXJ1xSpCCNnDCua/6ue/rNDKU+eIYk6VHpFDPuegN02m70J7Pl
	 8kuAZDR8cFJ6MJqSSJ8I68WY3YyXEaclf7RTtgmvBaUYfMkSuog+cFbT6tDBc7EjS7yMZ
	 aOVUZ0f3vHbWBivC6yHIT8+K0iebWTgcW4ZHkTwWG/p0j5YJyhDNUa9/2Kvb9QhpHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694318;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=C/3oiEJrrgISDj6VHltYxSNS0bTbSGPe28QqrXWzDyw=;
	b=qWmjVXCllOCjhu4CPzKGPJf7nSCo2BoNkAwMqLZstwlI1tjV59dc9oJZkk7TLbPyKHtu
	 O7Kt3VznsMoKVXOM0gXWqENKq+drQvYsInrbWrQ00zi14xRd/L3LKP0+qU+7LOlzFnSFe
	 fn5wDkRVa+33DVEiiE+SI5Vwp/kZCV3aIJnvur8rEjoMjiM9fgIX9cwSFA2WvHPBPUtrI
	 WeE1oW6g8jDNN3TZppg+ADc6U+abZk/GW55mp3ToYVAPx9V/IovpqFWUl+2kcgdK/MNlf
	 DDw+bqLuMBBClSSJFKfalv4GLHU3FKnrPYcfjMBe7XkqABoRxaLchQXqGr5i29EAzjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZpwFKBK;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D1606A337;
	Tue,  3 Nov 2026 08:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63D1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZpwFKBK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793694318; x=1825230318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UnGE9ewV3SGTBwGzdYg4KybWaWjSn9+eL7CYGNT63s8=;
  b=DZpwFKBKlAv6S3OCGiaVWxmlbxFy+Ofn/rl4lXyfA0Amjmoadr69neVG
   OsjClXEHJW/kXV2z7UK6nyMsT8Nvo+jaxw/+2wT31SULwZ3JJS+kDVCXW
   8y3y51ivAXe+Of6KgFGZQmgP6x47blYp1zJt3xH6kk7ENHiqx92DsjOZW
   kRRR/9/2IwdL/PPQ9e6X5NIv39wpXlFc1PHaxmou5eex97764ki6XeJKc
   +XrRGSohACnsWGbZTrQxPnEXOi8mfa4u5uuPRlloVsDQrVHDbEfspPYbJ
   pOkXwU3YLjMvODkbSf2tcEM3IDSkUCLswPsNgvFlRAvDNeRW0+8SWjbt9
   w==;
X-CSE-ConnectionGUID: GdxshL2hRIaQOg1CbTCdeA==
X-CSE-MsgGUID: jxgkUoFhR8O61tRNM2VMzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2287623"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2287623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:25:17 -0800
X-CSE-ConnectionGUID: ZHqYrjrJRoCXZA6PU6ZdQg==
X-CSE-MsgGUID: jrcaaq4rQHOdXmodazj03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6740307"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2026 00:25:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO9pN-00000000iUO-0oT5;
	Tue, 03 Nov 2026 08:25:09 +0000
Date: Tue, 3 Nov 2026 16:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 6/7] dmaengine: fsl-edma: support per-channel DT child
 nodes
Message-ID: <202611031650.EONIRpF4-lkp@intel.com>
References: <20261102-edma-iommu-v3-v3-6-9d0e62a954eb@Example.Com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-edma-iommu-v3-v3-6-9d0e62a954eb@Example.Com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/dmaengine-fsl-edma-unregister-channels-before-vchan-cleanup/20261102-144955
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261102-edma-iommu-v3-v3-6-9d0e62a954eb%40Example.Com
patch subject: [PATCH v3 6/7] dmaengine: fsl-edma: support per-channel DT child nodes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261103/202611031650.EONIRpF4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031650.EONIRpF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031650.EONIRpF4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/dma/fsl-edma.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
