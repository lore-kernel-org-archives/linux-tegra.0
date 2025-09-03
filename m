Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987AF20110B
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756875674; cv=none; b=t8VDe8+lsNx7NGkf2E7oJGHp1EjggFGqgABB3F96uQftMuuMfdrx3gJS97kG3aECEdpzGsAxfvhf4CPZ3Rqlnu7XjranCfFVe4EZq4cnBtpFakkei//532S7E/YuNJwJlcP7/DEmUAF6vzz5ANdrZbWZzGA51KMxXBMI6sIOT9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756875674; c=relaxed/simple;
	bh=AA71B8NJreCeVVfvGx3ZjcSsqstB/8899jp3oGDVKl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob9kt5Gi9tOChFu442JsMKzp5Hl+cSUMMJ4xCzHxkopBBSrZ0JZIMsyfsDt4RE+lBvSS1KbB3SkXKwnPcIoK7sjafd7mFphq2MBeaObIKa++tx8RgEbZGtUkxSK7o1jHHESnyjcDmt0msbo0mUgmesycWBJv5zH8tJgF6IxKkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYQArQHw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYQArQHw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7722bcb989aso3493192b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 02 Sep 2025 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756875671; x=1757480471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KmFmkMrKYl0vhT4WYXXBO9G8/vtPS0Slb6J+QwEqB6g=;
        b=hYQArQHw5FqM6MRzKpwhLQs6uyco7npUFPL8FCy44ZWc5P6Al/pkEUj5E/hFv5sgTJ
         ahYLtIFcPMbcuBHENGmH1dr5FcCz4dGx/KGuXWc/wQVZYQVoNhLuG4qnFhCvBdEcA4Oe
         1DiiM11+OhP3DXL01mzVSnwAgPoWM8hZyiZw90YJrWxnvzqmmdAtVtdLrcj6nNqJRvI2
         bHgTVkRbB723aPJf7lgOfCpNn0jUfE5LOb9THXwBtswCk5bBzPfqZfEP4kxqgdSTBF0y
         yHGQYfN2qXWoiK4uJjSOh4GF2lABJfvaG39NTY0sOyM3jkyMM+1ZmnTmvzEHRYJ02JQl
         BNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756875671; x=1757480471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmFmkMrKYl0vhT4WYXXBO9G8/vtPS0Slb6J+QwEqB6g=;
        b=mQsnBo6cDIH4QkgVDadYVlXIvoC0u+/YjRoshQ8mvhdDMSwTmGRW4Opk73nkUrzmO2
         SXXrkl+aQ2LWVYryuEwsLM6fOtEcs5jnpQEYH800FTCHansvdgs4plQzmUkh9evIBMji
         lD86mKGZI5htKjPahtctQdoytiQAWqi+e3Bp7190CE6OCb61wtOYpvYf6dH223q7VlKu
         3TIT9tICjHXcdxfIlvufv9SCa3qMct8a1nJT8f+H3cBFscM38kGJLrJfZrk3vZ21cAjN
         jg0OQG5hUp+sbBRVlTD5aPTPSyYXPnb5YBLrUomRrk6CbCfOSKG2S+fhAx1aMmRwSf0d
         zABQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu7Rys0niIaoWUVRwJz2+gUVfVJqj2ZdWGzLxUEhAeZABK29962IA/2okSKN0X5RECgVaBkq1Vs5GSRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDI2V+IMO4RMHASwhEmWUwNm5NXCvG53xDlx5am7nF/1XE80BD
	KSdAvnOP9y0GeuZYAjKTLv1aAxtHhXn/hBG9yGTsPLOfyHMkR5BEIsCT5bAiM5ICg0E=
X-Gm-Gg: ASbGncvoEdnv6QjB56wdDjo5/Yeiqf/cOp8SA3OSs8nxcAT9cOIv85LiHQq2Ti3F4HV
	bOve+waoj37Rfpy3gImmvwVGr/PZr4MY1D1In+4LWRfzH76ERmvzYo3g8qmNPb+wW527k66f2TY
	/vdAPWgoiV6t2KLpz4uPwF2uG5tYLmAcpv4AEnfcfW0nJBxT/TeSlTuKx1Ih0ra1bXNuIf3I36i
	MvpU26LGZfX3wVOUFRQfpEpFG6YhCsl+imnqTWEyeLFncmt8P0A36syMMyBi3vNDV0Xfk1n/rA6
	TSLviT42k6oJS9EMQx5+lGHcHDM5QTP3Jl6k2ZYue3nJ2iO+vpCEHLOF+DMIhpYddbr41ylnYEz
	7bkmS5AypZMu/tLqpYBsPXUtFwvCRtAEBMCE=
X-Google-Smtp-Source: AGHT+IGBPOnffDQd9Eaf1t/UFpYoHDGA4fA/SJ0Q0vJYXBrk8WH+r8HctNJ+gmV4xFNP8bM8q1PPuQ==
X-Received: by 2002:a05:6a00:180a:b0:772:ce8:d894 with SMTP id d2e1a72fcca58-7723e3e3aeamr18055742b3a.29.1756875670745;
        Tue, 02 Sep 2025 22:01:10 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77241f08b3asm11404056b3a.28.2025.09.02.22.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 22:01:09 -0700 (PDT)
Date: Wed, 3 Sep 2025 10:31:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>, Sumit Gupta <sumitg@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/8] cpufreq: tegra186: add OPP support and set bandwidth
Message-ID: <20250903050107.sbri6snqrzq4hale@vireshk-i7>
References: <20250831-tegra186-icc-v1-0-607ddc53b507@gmail.com>
 <20250831-tegra186-icc-v1-3-607ddc53b507@gmail.com>
 <20250901055322.eorgaa3sycydjrrj@vireshk-i7>
 <CALHNRZ_EbtHSXaDQ+1gGf3HjdyW5Q54EDN901-r8A_aXLbDJkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ_EbtHSXaDQ+1gGf3HjdyW5Q54EDN901-r8A_aXLbDJkw@mail.gmail.com>

+Sumit

On 02-09-25, 12:21, Aaron Kling wrote:
> On Mon, Sep 1, 2025 at 12:53 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 31-08-25, 22:33, Aaron Kling via B4 Relay wrote:
> > > +static int tegra_cpufreq_set_bw(struct cpufreq_policy *policy, unsigned long freq_khz)
> > > +{
> > > +     struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> > > +     struct dev_pm_opp *opp;
> > > +     struct device *dev;
> > > +     int ret;
> > > +
> > > +     dev = get_cpu_device(policy->cpu);
> > > +     if (!dev)
> > > +             return -ENODEV;
> > > +
> > > +     opp = dev_pm_opp_find_freq_exact(dev, freq_khz * KHZ, true);
> > > +     if (IS_ERR(opp))
> > > +             return PTR_ERR(opp);
> > > +
> > > +     ret = dev_pm_opp_set_opp(dev, opp);
> >
> > Won't it be easier to use dev_pm_opp_set_rate() instead ?
> 
> I'm not very familiar with the opp system. If I read correctly,
> dev_pm_opp_set_rate() will round to the closest rate while this code
> will fail if the exact rate isn't found. This code is based on the
> existing tegra194-cpufreq driver. And I'm unsure if this was done for
> a reason.

Sumit, any explanation for this ?

> I have seen unexpected rates returned from clk_round_rate in
> the development of this topic, so that could be related.

Right, but we should end up configuring a valid rate from the OPP
table.

> > > +static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
> > > +                                         struct cpufreq_frequency_table *bpmp_lut,
> > > +                                         struct cpufreq_frequency_table **opp_table)
> > > +{
> > > +     struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> > > +     struct cpufreq_frequency_table *freq_table = NULL;
> > > +     struct cpufreq_frequency_table *pos;
> > > +     struct device *cpu_dev;
> > > +     struct dev_pm_opp *opp;
> > > +     unsigned long rate;
> > > +     int ret, max_opps;
> > > +     int j = 0;
> > > +
> > > +     cpu_dev = get_cpu_device(policy->cpu);
> > > +     if (!cpu_dev) {
> > > +             pr_err("%s: failed to get cpu%d device\n", __func__, policy->cpu);
> > > +             return -ENODEV;
> > > +     }
> > > +
> > > +     /* Initialize OPP table mentioned in operating-points-v2 property in DT */
> > > +     ret = dev_pm_opp_of_add_table_indexed(cpu_dev, 0);
> > > +     if (!ret) {
> >
> > If you handle the error case here, then the below can move out of the
> > if/else block.
> 
> I'd prefer not to deviate too much from the tegra194-cpufreq code this
> is based on, so the drivers can be more easily kept in parity to each
> other.

I am not sure if that is really important here. The kernel normally
contains code in this format:

if (err)
        return;

keep-working;

If you want both the drivers to have similar code, then maybe that
code should be moved to another file and used by both. But we
shouldn't keep them same when we feel that we can do better.

> But I will look at making this a bit cleaner as per this and
> the next comment.

Thanks.

> > > +             max_opps = dev_pm_opp_get_opp_count(cpu_dev);
> > > +             if (max_opps <= 0) {
> > > +                     dev_err(cpu_dev, "Failed to add OPPs\n");
> > > +                     return max_opps;
> > > +             }
> > > +
> > > +             /* Disable all opps and cross-validate against LUT later */
> > > +             for (rate = 0; ; rate++) {
> >
> > Maybe using while(1) would be more readable ?
> >
> > > +                     opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
> > > +                     if (IS_ERR(opp))
> > > +                             break;
> > > +
> > > +                     dev_pm_opp_put(opp);
> > > +                     dev_pm_opp_disable(cpu_dev, rate);
> > > +             }
> > > +     } else {
> > > +             dev_err(cpu_dev, "Invalid or empty opp table in device tree\n");
> > > +             data->icc_dram_bw_scaling = false;
> > > +             return ret;
> > > +     }
> > > +
> > > +     freq_table = kcalloc((max_opps + 1), sizeof(*freq_table), GFP_KERNEL);
> > > +     if (!freq_table)
> > > +             return -ENOMEM;
> > > +
> > > +     /*
> > > +      * Cross check the frequencies from BPMP-FW LUT against the OPP's present in DT.
> > > +      * Enable only those DT OPP's which are present in LUT also.
> > > +      */
> > > +     cpufreq_for_each_valid_entry(pos, bpmp_lut) {
> > > +             opp = dev_pm_opp_find_freq_exact(cpu_dev, pos->frequency * KHZ, false);
> > > +             if (IS_ERR(opp))
> > > +                     continue;
> > > +
> > > +             dev_pm_opp_put(opp);
> > > +
> > > +             ret = dev_pm_opp_enable(cpu_dev, pos->frequency * KHZ);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             freq_table[j].driver_data = pos->driver_data;
> > > +             freq_table[j].frequency = pos->frequency;
> > > +             j++;
> > > +     }
> > > +
> > > +     freq_table[j].driver_data = pos->driver_data;
> > > +     freq_table[j].frequency = CPUFREQ_TABLE_END;
> > > +
> > > +     *opp_table = &freq_table[0];
> > > +
> > > +     dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
> > > +
> > > +     tegra_cpufreq_set_bw(policy, freq_table[j - 1].frequency);
> >
> > Maybe a comment on why exactly you are changing the freq here ?

I meant bandwidth here.

> To my knowledge, this does not change any clocks. The intent here is
> to prime the interconnect data. In the pre-req series, there's a
> change that sets all clocks to max frequency during probe. Then my use
> case involves setting performance governor by default on some boots.
> During testing, I noticed that the interconnect data provided by this
> driver was all zeroes. Which led me to notice that set_bw is only
> called when the target frequency changes. Which wasn't happening
> because clocks were already set to max. If my understanding here is
> wrong or there's a better way to handle this, I will fix it.

There are a lot of synchronization issues here because we are trying
to set clk and bw separately. I guess other variables, like regulator,
level, etc. (if used) will also be out of sync here.

I think the right way to fix this would be to call set-opp for the
device, so all the variables are configured properly.

-- 
viresh
