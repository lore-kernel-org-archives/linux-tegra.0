Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9GgjRot"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B0BB0
	for <linux-tegra@vger.kernel.org>; Tue, 12 Dec 2023 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702418249; x=1733954249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z73/hOSxGYVupXLmXbwMfHy1VRD17NY40HD1VCffAhI=;
  b=R9GgjRotuNJgoEEqPnPdU1ZBoDrdFax1pW6L6nSkv6pyyENOBt1p9fKK
   wmHgRvj2TTPYht+EwTVh6N6eQAVZUzvAWUFbxxgOoXaINOjzAwBbq+eNU
   7ypCiseAr5cKQBVBaNSGHo3AUQmuFQV6JH2Zykt9zPOg60zGuLUMxnm3x
   Yh2w50lXMsUFbcAD6R6PJWchw92JpxpUQsTI3vEyD31JbnE/evuU0v3Ke
   8+eEBZ7ZTIk2M3l8lmU7e+4DbHtIH8GwKxqfCgloz1EOFk2jZatpRKSyA
   KdRX9ajVY92/bDci6IQiEA2QsnvrxYS/2yDKzspp2yayACA5VjPjOiAka
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397661381"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="397661381"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 13:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897068463"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="897068463"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 13:57:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDAkS-000Jln-1j;
	Tue, 12 Dec 2023 21:57:04 +0000
Date: Wed, 13 Dec 2023 05:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [PATCH] drm/tegra: include drm/drm_edid.h only where needed
Message-ID: <202312130548.FrTZXIdd-lkp@intel.com>
References: <20231212142409.3826544-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212142409.3826544-1-jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-tegra-include-drm-drm_edid-h-only-where-needed/20231212-222603
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20231212142409.3826544-1-jani.nikula%40intel.com
patch subject: [PATCH] drm/tegra: include drm/drm_edid.h only where needed
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231213/202312130548.FrTZXIdd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130548.FrTZXIdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130548.FrTZXIdd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/sor.c: In function 'tegra_sor_hdmi_setup_avi_infoframe':
>> drivers/gpu/drm/tegra/sor.c:1928:15: error: implicit declaration of function 'drm_hdmi_avi_infoframe_from_display_mode' [-Werror=implicit-function-declaration]
    1928 |         err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_hdmi_avi_infoframe_from_display_mode +1928 drivers/gpu/drm/tegra/sor.c

459cc2c6800b54 Thierry Reding 2015-07-30  1911  
459cc2c6800b54 Thierry Reding 2015-07-30  1912  static int
459cc2c6800b54 Thierry Reding 2015-07-30  1913  tegra_sor_hdmi_setup_avi_infoframe(struct tegra_sor *sor,
459cc2c6800b54 Thierry Reding 2015-07-30  1914  				   const struct drm_display_mode *mode)
459cc2c6800b54 Thierry Reding 2015-07-30  1915  {
459cc2c6800b54 Thierry Reding 2015-07-30  1916  	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
459cc2c6800b54 Thierry Reding 2015-07-30  1917  	struct hdmi_avi_infoframe frame;
459cc2c6800b54 Thierry Reding 2015-07-30  1918  	u32 value;
459cc2c6800b54 Thierry Reding 2015-07-30  1919  	int err;
459cc2c6800b54 Thierry Reding 2015-07-30  1920  
459cc2c6800b54 Thierry Reding 2015-07-30  1921  	/* disable AVI infoframe */
459cc2c6800b54 Thierry Reding 2015-07-30  1922  	value = tegra_sor_readl(sor, SOR_HDMI_AVI_INFOFRAME_CTRL);
459cc2c6800b54 Thierry Reding 2015-07-30  1923  	value &= ~INFOFRAME_CTRL_SINGLE;
459cc2c6800b54 Thierry Reding 2015-07-30  1924  	value &= ~INFOFRAME_CTRL_OTHER;
459cc2c6800b54 Thierry Reding 2015-07-30  1925  	value &= ~INFOFRAME_CTRL_ENABLE;
459cc2c6800b54 Thierry Reding 2015-07-30  1926  	tegra_sor_writel(sor, value, SOR_HDMI_AVI_INFOFRAME_CTRL);
459cc2c6800b54 Thierry Reding 2015-07-30  1927  
13d0add333afea Ville Syrjälä  2019-01-08 @1928  	err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
13d0add333afea Ville Syrjälä  2019-01-08  1929  						       &sor->output.connector, mode);
459cc2c6800b54 Thierry Reding 2015-07-30  1930  	if (err < 0) {
459cc2c6800b54 Thierry Reding 2015-07-30  1931  		dev_err(sor->dev, "failed to setup AVI infoframe: %d\n", err);
459cc2c6800b54 Thierry Reding 2015-07-30  1932  		return err;
459cc2c6800b54 Thierry Reding 2015-07-30  1933  	}
459cc2c6800b54 Thierry Reding 2015-07-30  1934  
459cc2c6800b54 Thierry Reding 2015-07-30  1935  	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
459cc2c6800b54 Thierry Reding 2015-07-30  1936  	if (err < 0) {
459cc2c6800b54 Thierry Reding 2015-07-30  1937  		dev_err(sor->dev, "failed to pack AVI infoframe: %d\n", err);
459cc2c6800b54 Thierry Reding 2015-07-30  1938  		return err;
459cc2c6800b54 Thierry Reding 2015-07-30  1939  	}
459cc2c6800b54 Thierry Reding 2015-07-30  1940  
459cc2c6800b54 Thierry Reding 2015-07-30  1941  	tegra_sor_hdmi_write_infopack(sor, buffer, err);
459cc2c6800b54 Thierry Reding 2015-07-30  1942  
459cc2c6800b54 Thierry Reding 2015-07-30  1943  	/* enable AVI infoframe */
459cc2c6800b54 Thierry Reding 2015-07-30  1944  	value = tegra_sor_readl(sor, SOR_HDMI_AVI_INFOFRAME_CTRL);
459cc2c6800b54 Thierry Reding 2015-07-30  1945  	value |= INFOFRAME_CTRL_CHECKSUM_ENABLE;
459cc2c6800b54 Thierry Reding 2015-07-30  1946  	value |= INFOFRAME_CTRL_ENABLE;
459cc2c6800b54 Thierry Reding 2015-07-30  1947  	tegra_sor_writel(sor, value, SOR_HDMI_AVI_INFOFRAME_CTRL);
459cc2c6800b54 Thierry Reding 2015-07-30  1948  
459cc2c6800b54 Thierry Reding 2015-07-30  1949  	return 0;
459cc2c6800b54 Thierry Reding 2015-07-30  1950  }
459cc2c6800b54 Thierry Reding 2015-07-30  1951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
