Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90F834027D
	for <linux-tegra@vger.kernel.org>; Fri, 21 Nov 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717585; cv=none; b=IRtQ8kcEzuAmfnX5biwUEl/azAJjKlW9+bxSl9NIFsabuBAej39HXBiPDNWWqw2sXd8IOUrrYCm8G5hfll4l9rjcIccDEUxsK8RWhcM1ITXCnWsL0Ujq+xfjEE8X2L6dWKkWPL2gNAtALwqEK+ZYROEE0wc5YjnOmD+acMs+vdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717585; c=relaxed/simple;
	bh=2/e7Jm4bA9wuhlmXeda+EJohpN41MpPsQW8vmAMNF0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9hVnsoFJKxLIDWv+9gYjBGN9ZVzRV/3cVfQ6W3PnXx/SB0i8L220YMArkiyRgS7WX/a80nw5+6wnUrAcX0A3fHWAs29K+2Ub+adIpSuwYxdjG9vpxYTJ5+urxafvRZWBHswRR3cmYzeW3QE3NrdaPBY9UO2DvVsGo/zbY5uRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=co5zLSlX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="co5zLSlX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775ae77516so19849145e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 21 Nov 2025 01:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763717579; x=1764322379; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiQJxmjH8z13657p5gPjyse1tmT5KwzdB3evfWr5Mp0=;
        b=co5zLSlX8ZtylyuCytvWb+xjHaAqqWIyrAI++li5woC+P1mPYUr8UAcgGa+22re00I
         V9KXUWpxCqBP87p0RegJ+G65XU2W36d9SO53cUM1Od5H8wUlPk2VJcxLuX4lfTGuJA+K
         A0kbR9E2QddC2yRVuNneLCDzGmOJLQBMxnBSXt2vRiaY1x0BLifgTf66U8s95fdBySC1
         B673OD197m6orJcziG3dHx1yRVa+xPSj3yPHbWEnOdxQg9w0prdOBOiyd5p2Md/irbiG
         htYJW3OPLZ+wR1BL3XSIgSDvfWyCxlW7+dqP96EPMnK5WGmIQG6vRpvQG9dzXiOAzj1D
         YqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717579; x=1764322379;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiQJxmjH8z13657p5gPjyse1tmT5KwzdB3evfWr5Mp0=;
        b=NESV9TWUodyIz1WXmQv/lYHocW6prwEbKCsN/0zUoZ5FnwcqK/gFyW/+dyE98yteRX
         1c3bxNMs6FYalJu8NRUOqhIzRuBqMEn7N/2PO278WYlILzKh8lcjpZJGY+Y7BoIDAVtM
         8yTGiO8L/T3o9jelLG7v974WWHr1Mr4KtlQ6uP4vINRx580A6ZrsAPhKGObxTcBnbcBw
         AJ31iWA/uwwgvdaRVzjd0ldWtMAnEpXSOTnfQ9jmt6s40JvsKCuFfrvo9I1Xi8KJkWQL
         Xdjtzg1lMWLOHXDyPzkNJhQtTXFr316CRCf++5llZYdAFwSKgl/k2i8xLlaEjvmUeq2k
         SnMQ==
X-Gm-Message-State: AOJu0YxniyPQDNGFSOnEouiCLVISAwSsP8mXK9guFWYRtonBbZ0qTjrl
	KjPYeQXTe2cSAxVwIDEz9eMEUeMKi5L/JeZiF/VupgBVTDPZImMXBOux9pTAHsAeln8=
X-Gm-Gg: ASbGncsIjCFR2gOZ/FEY9bzwwLHV6eG3yx0tHH56EMRlx48iG5qGr1T4bTFQe1QMwGz
	nQJV6RzFnrZ9FujDVV6l+Dpax5MYCZfMHz1YKan+xrQpxNTM7jItzfp+15Mk2YDt9Lpgw/5YswU
	+NtTP9S1alUMWE8b/mdn7oaV3zcI6y3UaVAVL3dmJBNjejG9ohDBkP/7mTk0DCXEZJstNbhcxBS
	HVFTgQeZc3OuQIaVzT5MuFaofh/yZ+/b5UVzcitwSafMpFCD02NENFSJjBrXPzrvqjYAfV6a7xw
	BBGjtP6zyYCakU2i3FNWtHiHVxx/Ch+/6gEdF5IkQKm5hEHMHCmOfa+DzeXGwrW4mfpQeF/s/3k
	9Gz1hdgbjOgYPEG0M3FDmwhLSblU/wyQxzW0TUkFkI8cKe3piHou93165iQefzYcm7cmBbLP2bL
	w6eqOhDfKSek7+zgPA
X-Google-Smtp-Source: AGHT+IHww6nvM4v2npcttR1WxKBJ1oBs1YHaRiufj0J74ZjI2j+7fAbWOpggfblN7FemeRGKOxDU/Q==
X-Received: by 2002:a05:600c:c490:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477c11325c2mr14404525e9.31.1763717579165;
        Fri, 21 Nov 2025 01:32:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9731a75sm84847905e9.2.2025.11.21.01.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:32:58 -0800 (PST)
Date: Fri, 21 Nov 2025 12:32:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: [bug report] memory: tegra210: Support interconnect framework
Message-ID: <aSAxxzcRZduavJQT@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Aaron Kling,

Commit b33c93babead ("memory: tegra210: Support interconnect
framework") from Oct 27, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/memory/tegra/tegra210-emc-core.c:2230 tegra210_emc_probe()
	warn: missing unwind goto?

drivers/memory/tegra/tegra210-emc-core.c
  2070  static int tegra210_emc_probe(struct platform_device *pdev)
  2071  {
  2072          struct thermal_cooling_device *cd;
  2073          unsigned long current_rate;
  2074          struct tegra210_emc *emc;
  2075          struct device_node *np;
  2076          unsigned int i;
  2077          int err;
  2078  
  2079          emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
  2080          if (!emc)
  2081                  return -ENOMEM;
  2082  
  2083          emc->clk = devm_clk_get(&pdev->dev, "emc");
  2084          if (IS_ERR(emc->clk))
  2085                  return PTR_ERR(emc->clk);
  2086  
  2087          platform_set_drvdata(pdev, emc);
  2088          spin_lock_init(&emc->lock);
  2089          emc->dev = &pdev->dev;
  2090  
  2091          emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
  2092          if (IS_ERR(emc->mc))
  2093                  return PTR_ERR(emc->mc);
  2094  
  2095          emc->regs = devm_platform_ioremap_resource(pdev, 0);
  2096          if (IS_ERR(emc->regs))
  2097                  return PTR_ERR(emc->regs);
  2098  
  2099          for (i = 0; i < 2; i++) {
  2100                  emc->channel[i] = devm_platform_ioremap_resource(pdev, 1 + i);
  2101                  if (IS_ERR(emc->channel[i]))
  2102                          return PTR_ERR(emc->channel[i]);
  2103  
  2104          }
  2105  
  2106          tegra210_emc_detect(emc);
  2107          np = pdev->dev.of_node;
  2108  
  2109          /* attach to the nominal and (optional) derated tables */
  2110          err = of_reserved_mem_device_init_by_name(emc->dev, np, "nominal");
  2111          if (err < 0) {
  2112                  dev_err(emc->dev, "failed to get nominal EMC table: %d\n", err);
  2113                  return err;
  2114          }
  2115  
  2116          err = of_reserved_mem_device_init_by_name(emc->dev, np, "derated");
  2117          if (err < 0 && err != -ENODEV) {
  2118                  dev_err(emc->dev, "failed to get derated EMC table: %d\n", err);
  2119                  goto release;
  2120          }
  2121  
  2122          /* validate the tables */
  2123          if (emc->nominal) {
  2124                  err = tegra210_emc_validate_timings(emc, emc->nominal,
  2125                                                      emc->num_timings);
  2126                  if (err < 0)
  2127                          goto release;
  2128          }
  2129  
  2130          if (emc->derated) {
  2131                  err = tegra210_emc_validate_timings(emc, emc->derated,
  2132                                                      emc->num_timings);
  2133                  if (err < 0)
  2134                          goto release;
  2135          }
  2136  
  2137          /* default to the nominal table */
  2138          emc->timings = emc->nominal;
  2139  
  2140          /* pick the current timing based on the current EMC clock rate */
  2141          current_rate = clk_get_rate(emc->clk) / 1000;
  2142  
  2143          for (i = 0; i < emc->num_timings; i++) {
  2144                  if (emc->timings[i].rate == current_rate) {
  2145                          emc->last = &emc->timings[i];
  2146                          break;
  2147                  }
  2148          }
  2149  
  2150          if (i == emc->num_timings) {
  2151                  dev_err(emc->dev, "no EMC table entry found for %lu kHz\n",
  2152                          current_rate);
  2153                  err = -ENOENT;
  2154                  goto release;
  2155          }
  2156  
  2157          /* pick a compatible clock change sequence for the EMC table */
  2158          for (i = 0; i < ARRAY_SIZE(tegra210_emc_sequences); i++) {
  2159                  const struct tegra210_emc_sequence *sequence =
  2160                                  tegra210_emc_sequences[i];
  2161  
  2162                  if (emc->timings[0].revision == sequence->revision) {
  2163                          emc->sequence = sequence;
  2164                          break;
  2165                  }
  2166          }
  2167  
  2168          if (!emc->sequence) {
  2169                  dev_err(&pdev->dev, "sequence %u not supported\n",
  2170                          emc->timings[0].revision);
  2171                  err = -ENOTSUPP;
  2172                  goto release;
  2173          }
  2174  
  2175          emc->offsets = &tegra210_emc_table_register_offsets;
  2176          emc->refresh = TEGRA210_EMC_REFRESH_NOMINAL;
  2177  
  2178          emc->provider.owner = THIS_MODULE;
  2179          emc->provider.dev = &pdev->dev;
  2180          emc->provider.set_rate = tegra210_emc_set_rate;
  2181  
  2182          emc->provider.configs = devm_kcalloc(&pdev->dev, emc->num_timings,
  2183                                               sizeof(*emc->provider.configs),
  2184                                               GFP_KERNEL);
  2185          if (!emc->provider.configs) {
  2186                  err = -ENOMEM;
  2187                  goto release;
  2188          }
  2189  
  2190          emc->provider.num_configs = emc->num_timings;
  2191  
  2192          for (i = 0; i < emc->provider.num_configs; i++) {
  2193                  struct tegra210_emc_timing *timing = &emc->timings[i];
  2194                  struct tegra210_clk_emc_config *config =
  2195                                  &emc->provider.configs[i];
  2196                  u32 value;
  2197  
  2198                  config->rate = timing->rate * 1000UL;
  2199                  config->value = timing->clk_src_emc;
  2200  
  2201                  value = timing->burst_mc_regs[MC_EMEM_ARB_MISC0_INDEX];
  2202  
  2203                  if ((value & MC_EMEM_ARB_MISC0_EMC_SAME_FREQ) == 0)
  2204                          config->same_freq = false;
  2205                  else
  2206                          config->same_freq = true;
  2207          }
  2208  
  2209          err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
  2210          if (err < 0) {
  2211                  dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
  2212                  goto release;
  2213          }
  2214  
  2215          emc->clkchange_delay = 100;
  2216          emc->training_interval = 100;
  2217          dev_set_drvdata(emc->dev, emc);
  2218  
  2219          timer_setup(&emc->refresh_timer, tegra210_emc_poll_refresh,
  2220                      TIMER_DEFERRABLE);
  2221          atomic_set(&emc->refresh_poll, 0);
  2222          emc->refresh_poll_interval = 1000;
  2223  
  2224          timer_setup(&emc->training, tegra210_emc_train, 0);
  2225  
  2226          tegra210_emc_debugfs_init(emc);
  2227  
  2228          err = tegra210_emc_opp_table_init(emc);
  2229          if (!err) {
  2230                  tegra210_emc_rate_requests_init(emc);
  2231                  tegra210_emc_interconnect_init(emc);
  2232          } else if (err != -ENODEV) {
  2233                  return err;

This should be goto detach.  The other issue is that
tegra210_emc_opp_table_init() needs to be cleaned up as well.

void tegra210_emc_opp_table_cleanup()
{
        dev_pm_opp_of_remove_table(emc->dev);
        dev_pm_opp_put_supported_hw(opp_token);
}

  2234          }
  2235  
  2236          cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
  2237                                                       &tegra210_emc_cd_ops);
  2238          if (IS_ERR(cd)) {
  2239                  err = PTR_ERR(cd);
  2240                  dev_err(emc->dev, "failed to register cooling device: %d\n",
  2241                          err);
  2242                  goto detach;

goto cleanup_table;

  2243          }
  2244  
  2245          return 0;
  2246  

cleanup_table:
	tegra210_emc_opp_table_cleanup();

  2247  detach:
  2248          debugfs_remove_recursive(emc->debugfs.root);
  2249          tegra210_clk_emc_detach(emc->clk);
  2250  release:
  2251          of_reserved_mem_device_release(emc->dev);
  2252  
  2253          return err;
  2254  }
  2255  
  2256  static void tegra210_emc_remove(struct platform_device *pdev)
  2257  {
  2258          struct tegra210_emc *emc = platform_get_drvdata(pdev);
  2259  

Same here:

	tegra210_emc_opp_table_cleanup();

  2260          debugfs_remove_recursive(emc->debugfs.root);
  2261          tegra210_clk_emc_detach(emc->clk);
  2262          of_reserved_mem_device_release(emc->dev);
  2263  }

regards,
dan carpenter
