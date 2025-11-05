Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F132E13B
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354756; cv=none; b=HBaodki7d3xWmJBJamlDsvnFoWKSP3PnThKZTZ584DtCMnVw5W2qJVmNOAoM+BSRCkdNsbYVwrqLmzXMVDp/bKeIG9QaC4wFZZXrC0lbCNhVq7wFMF8BRoQcAEObUn2HST/KZx6W9B3Z4vg854CyUqxiUrROJGvZYcnloxce2AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354756; c=relaxed/simple;
	bh=en7TeJlKBrx/C+nM4gOVy8baN0W/O3amap3OUmtB08E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BIXqC3ylrFDJfwaZZyqXErkku17aEArODzqFE0KhK8OzUP3B0Vwujn58pTrbnO3P/VxCH1XtoZfOSzgaWMDstRl+qde1Pl+Wq3yi3GLcnbAWQeu2UojbW02vdtJX7Z+sy60AICz/GXqLIeQx7Sn7Ti9+oaI+Dzw2lzr5YCbUcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2cX7zSI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2cX7zSI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b71397df721so568973466b.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762354750; x=1762959550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1Ufgq26KO/UiFTVQ2dwsBFNMe828bkTGONCB7/Nzc8=;
        b=y2cX7zSIQz5TjG0rj42gLg8M/a9GkqTUspz0zk1eyQGukMl4eWcpbOH+fFVOFa7y+2
         jC1E4mBN/6dn8774N66U+UaxPaIpOHjjtMNfKLpXbOjQWdtMHx4lZB56+Y4q+3qZYUWu
         rU6YQAN/Auzgm0xlZzBCOclFm92eWW66voPZcEWaKlrJQ7N8RK47zB/ltEk1bupvIK6A
         VvBNlW/sEfB1pcZWRdcYR32GSnOPuyQq+2h/dFAuKXzeDYV8iOzyU5+8R4V0lGIWs7+g
         mj2mxeXFN88v6leMY/kxgUmnaocf10mr7BCcvlQewBRandKM8SnrbXe7pko1Q1pD4U4W
         M3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354750; x=1762959550;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1Ufgq26KO/UiFTVQ2dwsBFNMe828bkTGONCB7/Nzc8=;
        b=douU2lq+SnKrOkUvaIo9/mIPa4hWv8FKJWlX/aW/UyuxYJ1FssTaru16XcaF2T3GJ8
         lKZLP1CcZnjlj0cifB1gn76mdZOCgNpZA/2EYoP49b8EzOYULDKn3Fbr6lGDH2BpF+3j
         1x4CHVqEFyX+aNDUvGSR4dOdcuA2jFkpkiCxLztQnWQdjaLjVZ8NBm7IZKnuw6M6zM34
         2nMJbRvxI5S9ZbE3XUBevXw01rEuXwo7mRphe5Xq2lXRoe4jFb/JUQPQjvUlYvlMdggU
         dmT1mniI5gi4QRpKpZp9/HxVMwNuqnF8LBrhw/rW2lQtlRuT8UF9p7xZkMiaf1P8t1ND
         hXCA==
X-Forwarded-Encrypted: i=1; AJvYcCXxHztBCg8WxaRzPa2QXWyNbn60ZqfekyvocaxjcUTrBWdHUxlGbRgGUR07KKhl8Ivq5XZT1hTxnN/JpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVYI2IYPMwAnLTOtNylJZWPM/6vb9fMQX6v+EmETG3yszI9XT
	09DHda4Za82i3dsMbPxZh5BpRPnCz1t5y4QPTsmEFtqv3rrbF1z9Uuj1PPQOl73V1Jk=
X-Gm-Gg: ASbGncv+BnVWBtM/wgpBuPW0pD/3OBjy969ZjqztQk5x6yrjK+fkR/1aQsJf6OdrP6B
	PK0pcws0TczJPU3SwVpYlngX8xR6/4Hd3pIHzeJzTBihK8mn7k5Dcko4Td08yRcu1AhNEBl72WK
	BIosh0RgzzQaAWciYfJTjL4aADOK57SEDIanicxu45sInU5Xutd8Bb1zfSFKXwxvSv3TGMOYeWR
	odZbrF4rIrkSbs6Uyarec/NZn8QSipA5B69sjmja9fGCmJCP1ndzQJ9GRt2CoEPn6JR0encu+I5
	SN6gegX3CF/Xr4naPtkpuh9Hze3ZuPhdHLT9KjGMx+PkgLk5roW5AFG84hpvPLi9T3JjhuGIISx
	OYF9pfFizwcmjkB5GkdVbj1X7iiK1h6wh74EveXL7CMfg3eB3NGFkPNABoSw51D2k15UMCQ1RYs
	WoyZjdmGThT6/c
X-Google-Smtp-Source: AGHT+IGEbVOfoRG0NwUxUVx0a5u94ZVJ5b6JB4ndJ053yQljV9xOuZD9inglS4LiJinn4sWEM84qBw==
X-Received: by 2002:a17:906:6a1a:b0:b6d:55ee:506d with SMTP id a640c23a62f3a-b72656bf24bmr350804766b.65.1762354750093;
        Wed, 05 Nov 2025 06:59:10 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72676121b1sm207002366b.75.2025.11.05.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:59:09 -0800 (PST)
Date: Wed, 5 Nov 2025 17:59:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v6] memory: tegra210: Support interconnect framework
Message-ID: <246ce503-015e-4c2a-b979-24086df2646c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/memory-tegra210-Support-interconnect-framework/20251028-015017
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251027-t210-actmon-p2-v6-1-1c4bd227d676%40gmail.com
patch subject: [PATCH v6] memory: tegra210: Support interconnect framework
config: arm-randconfig-r071-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030812.rbcbrDyU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511030812.rbcbrDyU-lkp@intel.com/

New smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:1984 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'
drivers/memory/tegra/tegra210-emc-core.c:1985 tegra210_emc_opp_table_init() warn: missing error code 'err'

Old smatch warnings:
drivers/memory/tegra/tegra210-emc-core.c:1989 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'
drivers/memory/tegra/tegra210-emc-core.c:1997 tegra210_emc_opp_table_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1984 drivers/memory/tegra/tegra210-emc-core.c

7b344327c279ff Aaron Kling 2025-10-27  1958  static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
7b344327c279ff Aaron Kling 2025-10-27  1959  {
7b344327c279ff Aaron Kling 2025-10-27  1960  	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
7b344327c279ff Aaron Kling 2025-10-27  1961  	struct dev_pm_opp *opp;
7b344327c279ff Aaron Kling 2025-10-27  1962  	unsigned long rate;
7b344327c279ff Aaron Kling 2025-10-27  1963  	int opp_token, err, max_opps, i;
7b344327c279ff Aaron Kling 2025-10-27  1964  
7b344327c279ff Aaron Kling 2025-10-27  1965  	err = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
7b344327c279ff Aaron Kling 2025-10-27  1966  	if (err < 0)
7b344327c279ff Aaron Kling 2025-10-27  1967  		return dev_err_probe(emc->dev, err, "failed to set OPP supported HW\n");
7b344327c279ff Aaron Kling 2025-10-27  1968  
7b344327c279ff Aaron Kling 2025-10-27  1969  	opp_token = err;
7b344327c279ff Aaron Kling 2025-10-27  1970  
7b344327c279ff Aaron Kling 2025-10-27  1971  	err = dev_pm_opp_of_add_table(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  1972  	if (err) {
7b344327c279ff Aaron Kling 2025-10-27  1973  		if (err == -ENODEV)
7b344327c279ff Aaron Kling 2025-10-27  1974  			dev_err_probe(emc->dev, err,
7b344327c279ff Aaron Kling 2025-10-27  1975  				      "OPP table not found, please update your device tree\n");
7b344327c279ff Aaron Kling 2025-10-27  1976  		else
7b344327c279ff Aaron Kling 2025-10-27  1977  			dev_err_probe(emc->dev, err, "failed to add OPP table\n");
7b344327c279ff Aaron Kling 2025-10-27  1978  
7b344327c279ff Aaron Kling 2025-10-27  1979  		goto put_hw_table;
7b344327c279ff Aaron Kling 2025-10-27  1980  	}
7b344327c279ff Aaron Kling 2025-10-27  1981  
7b344327c279ff Aaron Kling 2025-10-27  1982  	max_opps = dev_pm_opp_get_opp_count(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  1983  	if (max_opps <= 0) {
7b344327c279ff Aaron Kling 2025-10-27 @1984  		dev_err_probe(emc->dev, err, "Failed to add OPPs\n");

If max_opps being zero is an error then we need to set the error
then we need to set the error code.  If it's not an error, then
we shouldn't print an error code.

7b344327c279ff Aaron Kling 2025-10-27 @1985  		goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1986  	}
7b344327c279ff Aaron Kling 2025-10-27  1987  
7b344327c279ff Aaron Kling 2025-10-27  1988  	if (emc->num_timings != max_opps) {
7b344327c279ff Aaron Kling 2025-10-27  1989  		dev_err_probe(emc->dev, err, "OPP table does not match emc table\n");
7b344327c279ff Aaron Kling 2025-10-27  1990  		goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1991  	}
7b344327c279ff Aaron Kling 2025-10-27  1992  
7b344327c279ff Aaron Kling 2025-10-27  1993  	for (i = 0; i < emc->num_timings; i++) {
7b344327c279ff Aaron Kling 2025-10-27  1994  		rate = emc->timings[i].rate * 1000;
7b344327c279ff Aaron Kling 2025-10-27  1995  		opp = dev_pm_opp_find_freq_exact(emc->dev, rate, true);
7b344327c279ff Aaron Kling 2025-10-27  1996  		if (IS_ERR(opp)) {
7b344327c279ff Aaron Kling 2025-10-27  1997  			dev_err_probe(emc->dev, err, "Rate %lu not found in OPP table\n", rate);
7b344327c279ff Aaron Kling 2025-10-27  1998  			goto remove_table;
7b344327c279ff Aaron Kling 2025-10-27  1999  		}
7b344327c279ff Aaron Kling 2025-10-27  2000  
7b344327c279ff Aaron Kling 2025-10-27  2001  		dev_pm_opp_put(opp);
7b344327c279ff Aaron Kling 2025-10-27  2002  	}
7b344327c279ff Aaron Kling 2025-10-27  2003  
7b344327c279ff Aaron Kling 2025-10-27  2004  	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
7b344327c279ff Aaron Kling 2025-10-27  2005  		      hw_version, clk_get_rate(emc->clk) / 1000000);
7b344327c279ff Aaron Kling 2025-10-27  2006  
7b344327c279ff Aaron Kling 2025-10-27  2007  	return 0;
7b344327c279ff Aaron Kling 2025-10-27  2008  
7b344327c279ff Aaron Kling 2025-10-27  2009  remove_table:
7b344327c279ff Aaron Kling 2025-10-27  2010  	dev_pm_opp_of_remove_table(emc->dev);
7b344327c279ff Aaron Kling 2025-10-27  2011  put_hw_table:
7b344327c279ff Aaron Kling 2025-10-27  2012  	dev_pm_opp_put_supported_hw(opp_token);
7b344327c279ff Aaron Kling 2025-10-27  2013  
7b344327c279ff Aaron Kling 2025-10-27  2014  	return err;
7b344327c279ff Aaron Kling 2025-10-27  2015  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

