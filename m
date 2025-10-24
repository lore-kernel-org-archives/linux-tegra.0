Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC7244692
	for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 06:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286799; cv=none; b=AOE0Pp9vinUCTJi+104MP1tt29kFhTPLWTWTcAx0l6PULzT5H3wZG/WbcGWsT2m1hEkTJUjrBu40bbwj9vUBxJsI5ymiB0dmlMd7ION2/5QP1ckuxp2/wCC7ZJE04alprKT37Sa4rN2gMjA3QH08rHJUnHKVIUchnjtEOE3ck9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286799; c=relaxed/simple;
	bh=HCZkaNFuqNQk65uaOKpTx4MM0vIhV/mSiZOc2p1Comg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMZjjf1vwEdayFmt269+4LrG/KUi2861N0Gap08NspCxuD+/Rno6PUMu0L2urjPDyU4NdlWXD75CZa9BDI+4OWQhif1FD42aGbf7r/1fj7VpzAT+rkkEpn8UXNZ/YnM9co1m9hw8CLsdCQQd+vq3zCQH046Rdru90AQhOdtuJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RceZSBjG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RceZSBjG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so1066196f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 23:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761286796; x=1761891596; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZhghM3cZ1r7/nlZhZrH1XOeT3g7TllE2m10kVYWYIc=;
        b=RceZSBjGycUmrfWst94SnIKr4iLT+OGDQkRBrRmQqfJjJqan4QPBpAcRn3a93RxPy7
         uZRxA2XOndIOt/TL6P8PYzivSX68WTEYyuHsal8t78tSoR7ITErDORK4XaRB2sWE1iqE
         DBVcyLQbI9VUo6JikMxmqZ+d7l5zBfJw8T9xE6jQeulSbl/mY5zW/D05djx8oWzW4559
         0J9gXpmtw8OeQvQE8BotLav8rTPJOQ5glJV7oB8/qxOVD+2q+GW9+0fajo/IWXe1tU51
         ch9llQXMvrkfiv9DyDVQ9sRvbZbLPz2rFELbfbuONtnFpVf2pSBv0u7wQYfRAzwV/aZK
         w8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286796; x=1761891596;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZhghM3cZ1r7/nlZhZrH1XOeT3g7TllE2m10kVYWYIc=;
        b=PCdubI2kxz6RxdZgPYpekfHH0DJu8Ky7VsxRvtf0fbpVUeSRV0Z64JYcCK/96Ox3pw
         Ifk93mAraMy1m5oFcVjAabiBnt5SsYUMMdgldsRMK4+vjTXCme0mHv6ihPvQNjDkvCDc
         DDkqDiSeXpVl8EMv4M6MooEsZIL06xCI4bD49zBnD+yyRFlvEa57H0i0jXz5ctOl9W+X
         Hu3YWFLIzOK1AgeB+RR904pScpcl3Lo7ELTQWrBx2mdfJzMhv5SA/fzdG8sCCq1Ywp+v
         AKTGXBpdGdKBeCQOuHjmWYZb7EcQ98pXqPZQ+OWIxj9dgKIsOFxmr+EGCTVmAarxxCoV
         ksTA==
X-Gm-Message-State: AOJu0Yzh2IedQaB9A8zktrPpiGBMOs1MpdJEo7sBCIA3GvgpUycHfmuB
	ffzXCMIUdmxpThuQOl6Hdpz/9IqGRcrSRRd8NO2Vq2uL94tUKPqaGesgCYHUDXHY1MM=
X-Gm-Gg: ASbGncs5GmblrTvcBcHY86kIMNGs3jXql6twGgDgebnMBXXb6jygGEu9DCYSEL4oEbe
	YqzhWiTXjlbVpbm6DtREgqhSAaWunPZNVb7tuls5FYX0We3gXEID4HOsIGliy430BsTp7Nt8YZZ
	azm6Y1m9mVc8PGg1nRAgUPpX6cpkLqqqH5H8cd8VdOICIKupWEf6YxCrkLBs/8cH0yS0VXR6+Fr
	R5GKXf3hqRA4k15Zyg4gu/8rw325yE/Ob/Fd2OdrjvlxEqzteIMYpc/NKElZSEPQydMdeqyuxzj
	qeKPgae1ZwXbKi9ylHAteWiui3djqeFI5kVMMQ9XFcZl9IBOYXEZ47ySBd/5vockO9jCZv8aoKj
	PU0DG0PJ9RsfBRd665W5CUTfGf7OV64GlYita1caVKmYxMDrBCf7VDoCkHC8NMYOEaQx8pM80Gn
	GrQaoC1w==
X-Google-Smtp-Source: AGHT+IGH955idcZXGot/tXa+zrjtdWIYXCzfu71qoE0FU8fGJN55ku5jneea959t/5ztvdvXnSEUJQ==
X-Received: by 2002:a05:6000:1862:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-429907471b1mr777403f8f.47.1761286795844;
        Thu, 23 Oct 2025 23:19:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429898ec1dfsm7666918f8f.43.2025.10.23.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:19:46 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: [bug report] cpufreq: tegra186: add OPP support and set bandwidth
Message-ID: <aPsafpMKVTxj20zL@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Aaron Kling,

Commit 71c46a6457e0 ("cpufreq: tegra186: add OPP support and set
bandwidth") from Oct 21, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/cpufreq/tegra186-cpufreq.c:197 tegra186_cpufreq_init()
	error: uninitialized symbol 'freq_table'.

drivers/cpufreq/tegra186-cpufreq.c
    174 static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
    175 {
    176         struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
    177         unsigned int cluster = data->cpus[policy->cpu].bpmp_cluster_id;
    178         struct cpufreq_frequency_table *freq_table;
    179         struct cpufreq_frequency_table *bpmp_lut;
    180         u32 cpu;
    181         int ret;
    182 
    183         policy->cpuinfo.transition_latency = 300 * 1000;
    184         policy->driver_data = NULL;
    185 
    186         /* set same policy for all cpus in a cluster */
    187         for (cpu = 0; cpu < ARRAY_SIZE(tegra186_cpus); cpu++) {
    188                 if (data->cpus[cpu].bpmp_cluster_id == cluster)
    189                         cpumask_set_cpu(cpu, policy->cpus);
    190         }
    191 
    192         bpmp_lut = data->clusters[cluster].bpmp_lut;
    193 
    194         if (data->icc_dram_bw_scaling) {
    195                 ret = tegra_cpufreq_init_cpufreq_table(policy, bpmp_lut, &freq_table);
    196                 if (!ret) {
--> 197                         policy->freq_table = freq_table;

tegra_cpufreq_init_cpufreq_table() will return zero if there are no
available opps.  The freq_table will be uninitialized in that case.
It's this path:

          122          max_opps = dev_pm_opp_get_opp_count(cpu_dev);
          123          if (max_opps <= 0) {
          124                  dev_err(cpu_dev, "Failed to add OPPs\n");
          125                  return max_opps;
          126          }

    198                         return 0;
    199                 }
    200         }
    201 
    202         data->icc_dram_bw_scaling = false;
    203         policy->freq_table = bpmp_lut;
    204         pr_info("OPP tables missing from DT, EMC frequency scaling disabled\n");
    205 
    206         return 0;
    207 }

regards,
dan carpenter
