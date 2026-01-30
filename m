Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC772EB5CD;
	Fri, 30 Jan 2026 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810655; cv=none; b=lrWgpIAEBG3N6wwd6zVIGNkYR0hWFeojMSrPaTO95ty/LjfJn+Ba28eent9Qlm2zxcr4vewoDsITjIroQgukN3JjdkUHIUhjCHphlZsgY6Q/0kBoY4iTraJpm/EUiViCwvWMBOctgzU2YGihwNB6csWp8JIrqVaygT+6qJj2XwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810655; c=relaxed/simple;
	bh=PlZcrzyZOeRKsk8nTeHngBdoT7z/2ZOmXHx36skWdCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV1VkTQXr8yTLGmK5kFKOt+tssXiA682cEpiX/UjWBxYbfxTJU5RFuYYPgqAZD31vL0mz00Z0Dh3uzTA1hM2W1TbBitK8JXGGx5XA8ch1HS6hHxo+R2KqK76pHB4DaCyiB+V6gbO/OxTxPW8NmnZhFXBiVKfvNLNvrR5PBYsn4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgwvSS5Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgwvSS5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769810654; x=1801346654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PlZcrzyZOeRKsk8nTeHngBdoT7z/2ZOmXHx36skWdCg=;
  b=MgwvSS5Yfi0bpEgCDt+2wbSmbhgXcX5tPBcZJseU2UOrxU21WhMB+x0L
   orzT3ZlPY0RRjfCRmTHnfE25uLU0QHROJTtKPMTg5uQ+ttr4dqEVmQDYy
   /d9K0jLPkZAeN/2biZRRE0zK2hRjAjfc/ZmL06deVT5ZjEAdrVtz2EfEI
   OGLO8O+0WdD0fxlp2qA3PPzrWzWou5IduvJxO4GFrB7HfGj15Caj8INg8
   RNY0De+pivgDacm3mS4IQg8cZors/IzcYrqr5YF/Q0w3fivg7FVYiVvww
   z6I21InIpPjIdKPPjL+9loVddnhYosZZLcIUSCriSD/nBxZqZeEFhT7Dr
   g==;
X-CSE-ConnectionGUID: RRUWEhRLSuCcpFB91tER6g==
X-CSE-MsgGUID: 3J/xrMX5Qce5i27jPFG70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70784131"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="70784131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 14:04:14 -0800
X-CSE-ConnectionGUID: 6PSjWHLdQB2h/hu0KwJl3w==
X-CSE-MsgGUID: 2SuD46HOR2S2E8txMuEtdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213038285"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2026 14:04:09 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlwb1-000000002Yn-0UZV;
	Fri, 30 Jan 2026 22:04:07 +0000
Date: Fri, 30 Jan 2026 23:03:15 +0100
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] ASoC: tegra: Support WM8962 by machine driver
Message-ID: <202601302334.FZthipoJ-lkp@intel.com>
References: <20260130133434.353353-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130133434.353353-5-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on broonie-sound/for-next robh/for-next linus/master v6.16-rc1 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ASoC-dt-bindings-nvidia-tegra-audio-document-CPCAP-CODEC/20260130-214002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260130133434.353353-5-clamor95%40gmail.com
patch subject: [PATCH v1 4/4] ASoC: tegra: Support WM8962 by machine driver
config: alpha-kismet-CONFIG_SND_SOC_WM8962-CONFIG_SND_SOC_TEGRA_WM8962-0-0 (https://download.01.org/0day-ci/archive/20260130/202601302334.FZthipoJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601302334.FZthipoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302334.FZthipoJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM8962 when selected by SND_SOC_TEGRA_WM8962
   WARNING: unmet direct dependencies detected for SND_SOC_WM8962
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=y] && INPUT [=n]
     Selected by [y]:
     - SND_SOC_TEGRA_WM8962 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_TEGRA [=y] && I2C [=y] && GPIOLIB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
