Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839F45BE4;
	Tue, 21 May 2024 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288383; cv=none; b=i81m0pEl/0GIEii7JQOeu4bWPiRHuPF4aBnJ3COR3xFWSGM5sbZNXjdwR9tsew3PqOdTkXAdoPTzbuJmTCqhyXyIotsE964f2T8HuUx0BrxJIUswkdNdoLn4vOQ1SkWRhOOw/rkFBZGz0sNbS4Bo7iG5a0+zxqX6rfLWVjdECDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288383; c=relaxed/simple;
	bh=bDGTQIbNuU6qDiiUTtPdQm0ymaZxO0OTHbB+zw8NqVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZm1aKjz19FHSYms5SMiyxX5oL9fwPZR/qRePPzeFxc7H0ocSyT4Agbjf0Yg0780kj1fglAWMSCq80pCMpW9HxmS3WjOdRd33Czx56vm7tFr8s34Plb+cACzs8ZGw45pQ+2jVS5VLfc1yolo2nPDfTT9mKCNZDp+8pUjnH0i32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNic/U2b; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNic/U2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716288381; x=1747824381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bDGTQIbNuU6qDiiUTtPdQm0ymaZxO0OTHbB+zw8NqVs=;
  b=lNic/U2bIh3W1BGq3Sbo63J2h64vOHEzmz0fsSz55IUYps7pYI7tFBKW
   01CB0PxL44f3h+Oe5Zga3rJILd6F7mfWkKxEi25BiWG7kI0dLxDGizEeS
   6ouOw03icNM9Ae2cNPzZMOgTDvnRTSa+g3L1HtQiQqVX8ljUdUzFYisd9
   V71dVuP0YBxNPCp8uaKXz4B03I0B2cAQI91YjugjGavXsZGzyzGDk9eGf
   LlB3zrjFRFZpnL5w+BFxrL6lWQkiD+1GCSBS/HNBKaIYj039qqkAHy3LE
   JN3GclAnvHu1hi5eXZTBZJcFSRvyUDSlxis0oj+HnN46gDmffwOnm4Tm6
   Q==;
X-CSE-ConnectionGUID: 5tnv7gY8R2KkH73jmozXrQ==
X-CSE-MsgGUID: HsMjbi/JT2iO20DId9ItEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11629505"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="11629505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 03:46:21 -0700
X-CSE-ConnectionGUID: Ec61e1E7SDOnvg/9Ah+dqA==
X-CSE-MsgGUID: mj2BKImBTxWfm+JEvhDBOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="32991818"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2024 03:46:18 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9N0Z-0006I4-2d;
	Tue, 21 May 2024 10:46:15 +0000
Date: Tue, 21 May 2024 18:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com, mkumard@nvidia.com,
	spujar@nvidia.com
Subject: Re: [PATCH 2/2] ASoC: tegra: I2S client convert formats handling
Message-ID: <202405211805.UMAdiH0d-lkp@intel.com>
References: <20240520114902.1663695-3-spujar@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520114902.1663695-3-spujar@nvidia.com>

Hi Sameer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tegra/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.9 next-20240521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sameer-Pujar/ASoC-simple-card-utils-Split-simple_fixup_sample_fmt-func/20240520-195311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240520114902.1663695-3-spujar%40nvidia.com
patch subject: [PATCH 2/2] ASoC: tegra: I2S client convert formats handling
config: arm-randconfig-r122-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211805.UMAdiH0d-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240521/202405211805.UMAdiH0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211805.UMAdiH0d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/tegra/tegra210_i2s.c:640:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int sample_format @@     got restricted snd_pcm_format_t @@
   sound/soc/tegra/tegra210_i2s.c:640:23: sparse:     expected unsigned int sample_format
   sound/soc/tegra/tegra210_i2s.c:640:23: sparse:     got restricted snd_pcm_format_t
>> sound/soc/tegra/tegra210_i2s.c:649:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/tegra/tegra210_i2s.c:654:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/tegra/tegra210_i2s.c:659:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer

vim +640 sound/soc/tegra/tegra210_i2s.c

   599	
   600	static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
   601					  struct snd_pcm_hw_params *params,
   602					  struct snd_soc_dai *dai)
   603	{
   604		struct device *dev = dai->dev;
   605		struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
   606		unsigned int sample_size, channels, srate, val, reg, path;
   607		struct tegra_cif_conf cif_conf;
   608		unsigned int sample_format;
   609	
   610		memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
   611	
   612		channels = params_channels(params);
   613		if (channels < 1) {
   614			dev_err(dev, "invalid I2S %d channel configuration\n",
   615				channels);
   616			return -EINVAL;
   617		}
   618	
   619		cif_conf.audio_ch = channels;
   620		cif_conf.client_ch = channels;
   621		if (i2s->client_channels)
   622			cif_conf.client_ch = i2s->client_channels;
   623	
   624		/* AHUB CIF Audio bits configs */
   625		switch (params_format(params)) {
   626		case SNDRV_PCM_FORMAT_S8:
   627			cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
   628			break;
   629		case SNDRV_PCM_FORMAT_S16_LE:
   630			cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
   631			break;
   632		case SNDRV_PCM_FORMAT_S32_LE:
   633			cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
   634			break;
   635		default:
   636			dev_err(dev, "unsupported params audio bit format!\n");
   637			return -EOPNOTSUPP;
   638		}
   639	
 > 640		sample_format = params_format(params);
   641		if (i2s->client_sample_format >= 0)
   642			sample_format = i2s->client_sample_format;
   643	
   644		/*
   645		 * Format of the I2S for sending/receiving the audio
   646		 * to/from external device.
   647		 */
   648		switch (sample_format) {
 > 649		case SNDRV_PCM_FORMAT_S8:
   650			val = I2S_BITS_8;
   651			sample_size = 8;
   652			cif_conf.client_bits = TEGRA_ACIF_BITS_8;
   653			break;
   654		case SNDRV_PCM_FORMAT_S16_LE:
   655			val = I2S_BITS_16;
   656			sample_size = 16;
   657			cif_conf.client_bits = TEGRA_ACIF_BITS_16;
   658			break;
   659		case SNDRV_PCM_FORMAT_S32_LE:
   660			val = I2S_BITS_32;
   661			sample_size = 32;
   662			cif_conf.client_bits = TEGRA_ACIF_BITS_32;
   663			break;
   664		default:
   665			dev_err(dev, "unsupported client bit format!\n");
   666			return -EOPNOTSUPP;
   667		}
   668	
   669		/* Program sample size */
   670		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
   671				   I2S_CTRL_BIT_SIZE_MASK, val);
   672	
   673		srate = params_rate(params);
   674	
   675		/* For playback I2S RX-CIF and for capture TX-CIF is used */
   676		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
   677			path = I2S_RX_PATH;
   678		else
   679			path = I2S_TX_PATH;
   680	
   681		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
   682			unsigned int max_th;
   683	
   684			/* FIFO threshold in terms of frames */
   685			max_th = (I2S_RX_FIFO_DEPTH / cif_conf.audio_ch) - 1;
   686	
   687			if (i2s->rx_fifo_th > max_th)
   688				i2s->rx_fifo_th = max_th;
   689	
   690			cif_conf.threshold = i2s->rx_fifo_th;
   691	
   692			reg = TEGRA210_I2S_RX_CIF_CTRL;
   693		} else {
   694			reg = TEGRA210_I2S_TX_CIF_CTRL;
   695		}
   696	
   697		cif_conf.mono_conv = i2s->mono_to_stereo[path];
   698		cif_conf.stereo_conv = i2s->stereo_to_mono[path];
   699	
   700		tegra_set_cif(i2s->regmap, reg, &cif_conf);
   701	
   702		return tegra210_i2s_set_timing_params(dev, sample_size, srate,
   703						      cif_conf.client_ch);
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
