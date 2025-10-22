Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEB2C21D8
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761112927; cv=none; b=syWcETPCu3rbqopLt+X2rMmbZNd6jZuYvN940gbeRkoKB7BdfdUyVQe3ZemYlD8ldzhHkuyBibr3NWzNOacLFL/BREqzrGDgCvMSVYzE26z9bLvdsYtd+e0JTwB5HKgqz4s3/2UWu27dJP+pQvb2aB/Ek8mcumb2IFAGSaufMDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761112927; c=relaxed/simple;
	bh=uNd0RlezKmVOkkCFnO3wa4SdchHNHXgBhmGRBya+TZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tzmu0oezpC88mYUN137tNjHjyR8iwgOhl43EeX1OcIB8QNbntrNMtDByf4nsaFIyYqQLLwchUlaUOf5fbJg32caLuTR/2zdaHemh79wGHPuHDQcslPrOtToKGa0/k6Id9fd0dd2G+F4EbOHmV8b6WEdhYGYqspTD2O35zt+QVak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKqpF+hP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKqpF+hP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b57bffc0248so522275a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 23:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761112923; x=1761717723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKqDAZxx1reZjTRMo7FvolWvlhv6pTm58+Z40R0DLEQ=;
        b=eKqpF+hP8Qbu3WbRL1Cu/e12XbVa8+AAEYIMi0P31MHcpq1v81UMrb/4C9zSK6AuOr
         z7Wjz61qr72WZxGlM0KXV+POp8WVj1nuV6yHeHG772YwOaJbcPx7ZU5VGQTxSsBKNsDD
         tC3BH8JAiYDj0y4N2XzwRyuolOTakgMmdRckXqQxSyMXTg0Szy3qtK4nMH2fPqkrPR/a
         D7YJuAcE1qmNXJBfoQDcqJQ70CUVxWehHcqWgC/Kn74BS8ejG+o8fCaC9PDKE4X7Uvi/
         A0gFJ3dfYeplAM1H86RVUfwBbqUsr4tDmv6CfS1s3aWtiKKfvVJSsvD7F239+xR2rA8P
         HAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761112923; x=1761717723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKqDAZxx1reZjTRMo7FvolWvlhv6pTm58+Z40R0DLEQ=;
        b=HzJw0z0hrT2G8NH3F++zXGnBQZDYaDhu5hP1/gRPwa10x0QBQukPjCh/k6kT3JKyOQ
         dyytEWW/bxdzmJfAgLVAt/8vxUEYTw1uC72BdeWinVO4nkYPPWfqPBQwhOsFNCfmje+C
         xO80fQB4i3490pIjMgQPGu+atzJgz7hiyhELaIf2qpAYdigo27PuYE2BBS9dG9Mu2g5l
         KT7VBPFSNxgERuQKhlJy4l/nz1IwQaOFlAq2d+v21JngNJQ2BYIep5Es9t8sTCEKl4nR
         dUk7t2m5uUWlVPHKEXHKEmU+gytgWUSy7V+OD/O5OPJ4sRu6/0LIs0kwL5ULMWktHgBY
         bXow==
X-Forwarded-Encrypted: i=1; AJvYcCV89F32dAxwblFEFrKcpqH0J1X9K2+K6d3RjcujRs6PruDv8yNeGcVj44azPMPinphxIysTpmAMfcn62A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNC8fNUohUoHPvhCRD2MhPkLOjdEeelLDKYx9KY/P4MKY5e1c
	UORxltRH+2JgPPS36CXrS2n2q7xxQoSPAsxGW1WR8EkiXGtzRzgd1RqTHMvrbEAdDgA=
X-Gm-Gg: ASbGncuZtNQvSRgevhH7SButWJlTOwlJIdocRRRm1rjFxFubcvlUQ5vpp+BAyzLMhSJ
	kkkzhpeI9S+NhKA3NNkedVm/hn7Xc42A7LIam95xhU7lOgiXspdatNI1j7M1kTVuTUEJ5/6fUhh
	8ZhzWqzOtZtox7CzhkSSXFx2/eaH417s+3UVPyCDDg77gh2jBMevuJEjvlnkBYm7xE2shJT/8ai
	Nmu1JRkfxw3Vl5o9tWkcuCx4RGSQiCESIeC4pDDgDN5Cp70y6yVVK+Mp9zmE2gC7IX+FwcHb0NC
	f+ixtRiVSJUKzbdawr1IkRuyGp7XXzLueOdhqKfJ1MoWn+Tp6Zuc5s1BZMcT9nvCjNHIb7o1WZm
	HS/ow0vt+mtJJDyLi7gisSyjeeYgT5XO0Vtua3H7Nr4Yarj6Td8YqZG60UqdVXCJ70zNYYGVeOo
	tX3Q==
X-Google-Smtp-Source: AGHT+IGnZYhZ63rWNSf5aRz/1B5HoUov1Sbx9ncDDRSOtX2wKHaECGMRKtQmrnXwpxWiNTSuOjN5Bw==
X-Received: by 2002:a17:902:ecc2:b0:269:a6b2:2463 with SMTP id d9443c01a7336-292ffc0b82emr31764605ad.16.1761112922908;
        Tue, 21 Oct 2025 23:02:02 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292469104edsm128908115ad.0.2025.10.21.23.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:02:01 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:31:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpufreq: tegra186: add OPP support and set bandwidth
Message-ID: <bxec7gq3b62g5jdyxs7oo4dvq4dd5hwczdsvbimjka7u4zwye5@iubxkvn2mbre>
References: <20251021-tegra186-icc-p1-v3-1-7e6db3b070c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-tegra186-icc-p1-v3-1-7e6db3b070c4@gmail.com>

On 21-10-25, 20:08, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add support to use OPP table from DT in Tegra186 cpufreq driver.
> Tegra SoC's receive the frequency lookup table (LUT) from BPMP-FW.
> Cross check the OPP's present in DT against the LUT from BPMP-FW
> and enable only those DT OPP's which are present in LUT also.
> 
> The OPP table in DT has CPU Frequency to bandwidth mapping where
> the bandwidth value is per MC channel. DRAM bandwidth depends on the
> number of MC channels which can vary as per the boot configuration.
> This per channel bandwidth from OPP table will be later converted by
> MC driver to final bandwidth value by multiplying with number of
> channels before being handled in the EMC driver.
> 
> If OPP table is not present in DT, then use the LUT from BPMP-FW
> directy as the CPU frequency table and not do the DRAM frequency

  directly

> scaling which is same as the current behavior.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied with:

diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
index 35f1c1371f6a..34ed943c5f34 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -127,9 +127,8 @@ static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
 
        /* Disable all opps and cross-validate against LUT later */
        for (rate = 0; ; rate++) {
-               struct dev_pm_opp *opp __free(put_opp);
-
-               opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
+               struct dev_pm_opp *opp __free(put_opp) =
+                       dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
                if (IS_ERR(opp))
                        break;
 
@@ -145,9 +144,8 @@ static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
         * Enable only those DT OPP's which are present in LUT also.
         */
        cpufreq_for_each_valid_entry(pos, bpmp_lut) {
-               struct dev_pm_opp *opp __free(put_opp);
-
-               opp = dev_pm_opp_find_freq_exact(cpu_dev, pos->frequency * HZ_PER_KHZ, false);
+               struct dev_pm_opp *opp __free(put_opp) =
+                       dev_pm_opp_find_freq_exact(cpu_dev, pos->frequency * HZ_PER_KHZ, false);
                if (IS_ERR(opp))
                        continue;

-- 
viresh
