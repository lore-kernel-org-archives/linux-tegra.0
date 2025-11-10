Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E03054CC
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772458; cv=none; b=oizWeOm8eWgHvldGl1CtG7scvXaWJdFIGsjroXqeiFnIVmN49ieFnrP81uFuopm7RmHWOM5fwAv8pwNQuFxurWfdnpNo+DllvJvkHSNDXi+XpZq0SECE/DyBYPaUqEsFHl0C1BS5n/wXsvx3e7x1DSdYgRtMoBo7B9FpnlROybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772458; c=relaxed/simple;
	bh=j/sDhA1BE/crBk5MB3jz5Gyqsa0mwcEpYJuOnY+51Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZBcHE4xawL2Ct+JBnjZRPy29MzUFZ+fJOxva2wtWRUXF/obBga8ybnnD0d/3vEDUMO2rJA9U7OUmg4ZaKgvu1MSjJilYhBYS38S9+L2QjMwMZH+eIRKRSmXetoWwbYoz8fFLfI8eS2UfqcwMzF+5nTf7cJXhIQDO9OPJgrhPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoITomXm; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoITomXm"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo2257359b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 03:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772455; x=1763377255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrIRy6Lhq+4eE5yPFjSN9IOBDP8Cyczj9KXwJvvJFlc=;
        b=MoITomXmIdl0l9mMoc4ILl2St6hK1A4HMUb0F493E4DjqRtYRaaHWITxuqAxyq4ZMt
         Eux6VA/tuOY/Phh+AcSizGAkdWdmdFpuWDuTX4jh4eLo+zxAkadFZO+DnDH9dLRMMPvw
         KM5rJ8gPZho8vx/xWz9zYmHpGbiQ0u+pNqXNNOG+Ohb69SzBHy7dy9Deb0Mh1kyi6bDr
         BLIjiHLZZrloc2S58aturYja41JAsiGJcgCQg1UGb0GcsXEDi64d/pQE6WK7V4y/SvN6
         HDod5am68vwzf1U+U9hlWeSGUECILkPgFoMuE3rFPrySIu3Ue/zZb9jRtE69mO6FLLwU
         5Hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772455; x=1763377255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrIRy6Lhq+4eE5yPFjSN9IOBDP8Cyczj9KXwJvvJFlc=;
        b=iAmkdFYLdtKEGpe9EtChSY11uOIrzuZ4ZiukiAQI/SiVBNnepsFJwkbExJn1uJCuu4
         ngeVwEffydYwqnYvEcJRGQsUrjeEqWU4DKolrdZote3mnurVGCk6yBcvNpftW8y6dcMj
         PVET5zoqu5oj8vpyW2nYOcPmMIzR7+bSmbAx6Q/JeX/GqIHzHe9NQRRO+Sgf521pQcwR
         t7JZp9cbuQeDLZQC3uWDelClSuIjQgt1QXBZcopm/AYe2YaNvzdcvauYmaCANsWritlA
         whfv6Dkbi946AocMrSNlnOquGpyVz/wc0vQxf/wuQZLIcc+NlFVR+SRpv5Oc4WPavR2a
         p6pA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1YRcKVjeXDDiRS3aR9qyoG1HeTo33CcQAKoogl7CvoUrckJ53yp58XjD+Iu5/U8ixcb0ikxR+JQPQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOXHuQJFgdjl1UNSOfMSSQbGX14OeCveKhbbisZvmne0FroK0
	o7L0zdGJSUyMkoTfezodbPOHqA6bSwzku/ze65L3ceU4htsMws6TkTE1vUsz7CxVwa4=
X-Gm-Gg: ASbGncurjDQbhA9ZrjjWbwrN/XX9EpWaSEVMSBeqSbeYMDTEpIVTCTa2q3t7wT7MAr4
	kIQysbkDP/X2aVv+W8ad8QEIQZxDumE3TP6P1Hr/aPTVo8SI645Z3tuWlsd0fb9JiDBo+flwMxF
	QRXhyV1TnvLbCEazI0iJT/Byxk0uBZhyPgFLZuzvaX7kD0E+vvr8e1JSWiyRmXyoHsIpczgMcTG
	LsSjX3nv9gzUq95HEMxBCzAfT2leRA5VL6ImdxDMIRJksuPTSvxrGrD93qizHsxIyQ/G/Aqsc9l
	Rp57gtmyOedrftX6T92uxMHEu3eDMbRRgIHXCQg8+TqdGFTDy8gG1TFJUSYpJRwf+lxdouR0U4V
	e0FiYZxh93UVV+Ji1eawBlKJqzyqgW6sdjArdi7jZOjng9bDVgNlV1ZUmSBEUZXG+btYiWcc4HQ
	1pF/gxFtDe5c8=
X-Google-Smtp-Source: AGHT+IGOFDbu7mquDmNhSqV97BdY6cG6MLgvb5Xp7QodBHXn8La7j+gNEL/xmdVl7cozIyrmwIAy9g==
X-Received: by 2002:a05:6a21:3291:b0:350:1872:7023 with SMTP id adf61e73a8af0-353a4163b2bmr9937463637.55.1762772455121;
        Mon, 10 Nov 2025 03:00:55 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c963586fsm11304602b3a.10.2025.11.10.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:00:54 -0800 (PST)
Date: Mon, 10 Nov 2025 16:30:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>, pierre.gondois@arm.com, 
	zhanjie9@hisilicon.com, ionela.voinescu@arm.com, beata.michalska@arm.com
Cc: rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com, 
	corbet@lwn.net, zhenglifeng1@huawei.com, rdunlap@infradead.org, 
	ray.huang@amd.com, gautham.shenoy@amd.com, mario.limonciello@amd.com, 
	perry.yuan@amd.com, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, nhartman@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v4 0/8] Enhanced autonomous selection and improvements
Message-ID: <hjrcoq7dapqcodk3iiyvjeuq3cwvyccqr4wnlcoi6eduqg5ahf@tszrjvfnkjux>
References: <20251105113844.4086250-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105113844.4086250-1-sumitg@nvidia.com>

On 05-11-25, 17:08, Sumit Gupta wrote:
> This patch series enhances the ACPI CPPC CPUFREQ driver with
> comprehensive support for autonomous performance selection, expanded
> runtime control interfaces and improvements.
> 
> It adds support for below:
> - Expose sysfs to read/write the Minimum/Maximum Performance Registers
>   using frequency (kHz), with internal conversion to performance values.
>   Also, update the policy min/max accordingly.
>     /sys/.../cpufreq/policy*/min_perf and max_perf
> 
> - Expose sysfs to read/write the Performance Limited Register.
>     /sys/.../cpufreq/policy*/perf_limited
> 
> - When toggling autonomous selection, synchronize the policy limits
>   by updating the policy min/max.
> 
> - System-wide autonomous mode configuration via 'auto_sel_mode' boot
>   parameter. Mode can be switched dynamically on individual CPUs.
> 
> - Generic sysfs helper functions to reduce code duplication.
> 
> The patches are grouped as below:
> - Patch 1, 2 & 3: Improvements. Can be applied independently.
> - Patch 4: Sysfs to update min/max_perf. Can be applied independently.
> - Patch 5: Sysfs to update perf_limited. Can be applied independently.
> - Patch 6: add sysfs documentation. Depends on 'Patch 4 and 5'.
> - Patch 7: sync policy min/max with auto_select. Depends on 'Patch 4'.
> - Patch 8: Boot Parameter Support. Depends on 'Patch 4 and 7'.

Beata/Ionela/Jie, any feedback on the CPPC changes ?

-- 
viresh
