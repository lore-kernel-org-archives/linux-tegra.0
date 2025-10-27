Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F030DEB7
	for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554665; cv=none; b=ppZdcLNwT1QK5MxbA36fGAmKHblhNwOBaDhQaabwl/jGCX56qx9xfly021vCOykinLmm5WpsQrkUR7rvaDYTbmPF1IFoy3P8Bu0cfN+tE8u8qIDzePAIXfXF1DlQnpoWpzzmopQntPR59EVKovS0fo9QpcWyifYp6IYIyFtWefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554665; c=relaxed/simple;
	bh=auEwf2icKJ5N8eXV469NRfMO69M4TDa+I0O0A8KWhJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAk0pUkQTmloXALxqGBI6hO91QKKJVuUY5SJ3mZ05f265aG8TVoWneW5zc/f1cm3bihFa0S7lSa0cG/xl8xhGuWYVLoE9cH3oDc7fDxWzsH36UGiK9tcYwpdiCetBvazbsMciy7fCYQfZJgkhVRfPd21gzbYraFXs+uUQHdFvkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpwEmYKs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpwEmYKs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso13012915e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761554662; x=1762159462; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQ6fDJu4nOBCsqG9UMmERnNrEe5KW+9L11ecqG30wk0=;
        b=YpwEmYKsEQP/VcC9F8zEtSFTVg1MBwDQPfjO+WU0SxOFM7qCZGTJ/AtaFt2GkZ5yeE
         6ZufKTLtrpYiGfq43hkWwkk11JCJFCAcaWt22FvtpvKsVfLGR5UCehzSSRWN7S9vRqPX
         TzJRJJT8vROgQ6nrfG63xNGJo37+8bZ8RWsxRuRZXej9yZE2kLMytoyeZNBdkEiYdOPO
         ayCznUb8Y74l86uHe/dJQ9oqM1v4g34kO9xSLv2EIO59T18kbPiNmZfTDKeO5YCbpiEz
         R+gLdTPfdIhuZjeCWpSGN7aSwt3l6OgneAZGwQRnZXo+YNcEakKJ/Dzb4yRRyrLptzjW
         TROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554662; x=1762159462;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ6fDJu4nOBCsqG9UMmERnNrEe5KW+9L11ecqG30wk0=;
        b=aukI7PRx0IRaziQ2mJi97DO46AfEaYoHLd3Oq7PhvGV//QeygEO5EWRayBkOYJDLjL
         8nX90ooKWz9elT5tCJMROD4JBxDHI5rQnJA7492QRk7XiKoiqRygTCAFZSSP2G5MfhVa
         7Ni9P094e9S+YmUdFA+vgUp9jY/o/H5jlnPJSqtlRtLVVO7NYVremKH/QdkfG5GbCzvy
         KUjssL5RUVJiN0FP/F0Q+kAfdgYSA7mB1UFIWY128sNghAfj5zeYqrWEaRg8lg/pVfw1
         Od74KAFRTyv/fWzyeokHJ8Sg54C6lU7RJWPcpbYGnLbtONTmR1elwvCMa/fVGtYZDTSU
         uPbA==
X-Gm-Message-State: AOJu0Yzt8mAfvwvvqjJlJCTRD6jDUrq+lITwvLb7xDQMREC66uQ7qJUG
	FGt4fRfEBclng57AtM3YBvPdj6KNL7oUOu5BDO/a/bg8ygfe9J4B5r3b8frLdpBzQts=
X-Gm-Gg: ASbGnctKEFXQWj6M68xUBCIgTlZAQ/xvi2r62PpSQ1pHnVr3I72hMFnAe3FNMeF5wwa
	wLVfkSQkFPZl6qMI+fqdrOokwRz+t6uk0q1ZRlE8OUDw1y6YzGq0952rEUOjNTDPVEVngobq4wY
	/a0eKsLBJL6U8DxdrYmjHSzRt7bWfAqJyL+YvQfxhjZzgxZXYi/L03LC73v1CPjgPziEc0F/KIo
	+T9twXI8X4pjL+iVIkO7GBL50mURWap0aFiRO/ee1nXzg1pzNxqvP65ipzH/ef7xfCBSkpSFOtX
	No6NSmwAyeJp92XOx7bthirqW6niVcrqM38IjF3VpKN7Eec27R5B49hvyQjmixuNEzk8ghdYCZf
	mxqF6kvN6aAvkcTIvg617qVX4bxweGN2Yk46lXnQovcLzfhbzWdQn2RRPM3hG+Z3jOwChI6xx9l
	3669VJXg==
X-Google-Smtp-Source: AGHT+IERzrA7mdClLFVb6VKW6TMob3v002tE2P2HM0SVO/imnI3/IgdnfKpVH8riDNMG409Svv0HNw==
X-Received: by 2002:a05:600c:450a:b0:46e:442c:f5e1 with SMTP id 5b1f17b1804b1-4711791cb1fmr278033545e9.35.1761554661546;
        Mon, 27 Oct 2025 01:44:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b7b22sm12803875f8f.9.2025.10.27.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 01:44:21 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:44:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [bug report] cpufreq: tegra186: add OPP support and set bandwidth
Message-ID: <aP8w3_okN_KUCSyJ@stanley.mountain>
References: <aPsafpMKVTxj20zL@stanley.mountain>
 <CALHNRZ8XnH64GCSFk21D7HPnbJ0Avr0Ds1SAPTPksohqd4dhjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ8XnH64GCSFk21D7HPnbJ0Avr0Ds1SAPTPksohqd4dhjA@mail.gmail.com>

On Fri, Oct 24, 2025 at 03:00:47AM -0500, Aaron Kling wrote:
> On Fri, Oct 24, 2025 at 1:19 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hello Aaron Kling,
> >
> > Commit 71c46a6457e0 ("cpufreq: tegra186: add OPP support and set
> > bandwidth") from Oct 21, 2025 (linux-next), leads to the following
> > Smatch static checker warning:
> >
> >         drivers/cpufreq/tegra186-cpufreq.c:197 tegra186_cpufreq_init()
> >         error: uninitialized symbol 'freq_table'.
> >
> > drivers/cpufreq/tegra186-cpufreq.c
> >     174 static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
> >     175 {
> >     176         struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> >     177         unsigned int cluster = data->cpus[policy->cpu].bpmp_cluster_id;
> >     178         struct cpufreq_frequency_table *freq_table;
> >     179         struct cpufreq_frequency_table *bpmp_lut;
> >     180         u32 cpu;
> >     181         int ret;
> >     182
> >     183         policy->cpuinfo.transition_latency = 300 * 1000;
> >     184         policy->driver_data = NULL;
> >     185
> >     186         /* set same policy for all cpus in a cluster */
> >     187         for (cpu = 0; cpu < ARRAY_SIZE(tegra186_cpus); cpu++) {
> >     188                 if (data->cpus[cpu].bpmp_cluster_id == cluster)
> >     189                         cpumask_set_cpu(cpu, policy->cpus);
> >     190         }
> >     191
> >     192         bpmp_lut = data->clusters[cluster].bpmp_lut;
> >     193
> >     194         if (data->icc_dram_bw_scaling) {
> >     195                 ret = tegra_cpufreq_init_cpufreq_table(policy, bpmp_lut, &freq_table);
> >     196                 if (!ret) {
> > --> 197                         policy->freq_table = freq_table;
> >
> > tegra_cpufreq_init_cpufreq_table() will return zero if there are no
> > available opps.  The freq_table will be uninitialized in that case.
> > It's this path:
> >
> >           122          max_opps = dev_pm_opp_get_opp_count(cpu_dev);
> >           123          if (max_opps <= 0) {
> >           124                  dev_err(cpu_dev, "Failed to add OPPs\n");
> >           125                  return max_opps;
> >           126          }
> >
> >     198                         return 0;
> >     199                 }
> >     200         }
> >     201
> >     202         data->icc_dram_bw_scaling = false;
> >     203         policy->freq_table = bpmp_lut;
> >     204         pr_info("OPP tables missing from DT, EMC frequency scaling disabled\n");
> >     205
> >     206         return 0;
> >     207 }
> >
> > regards,
> > dan carpenter
> 
> I'm looking at dev_pm_opp_of_add_table_indexed which gets called
> before dev_pm_opp_get_opp_count inside
> tegra_cpufreq_init_cpufreq_table(). It states that it will return
> -ENODATA if the opp table is empty,

I don't see the comment you're referring to but the call to
dev_pm_opp_get_opp_count() which comes next would prevent an
empty table.  So it's fine.  We can leave this as-is.  Thanks for
reviewing it.

regards,
dan carpenter

