Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8941F4613
	for <linux-tegra@vger.kernel.org>; Tue, 11 Feb 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270673; cv=none; b=FivfTzGwQR9eji7s+yZvdF6BpZ47st/+90k9y60qtnLOEOvq1dTb7GD+JScrDQju78QxXqfc+5VgiBAwjDA1xg8jFsmQSYuFo94a/dRW/L7iJjW5FCkCJTEaRLs/L6q+sMguDHjfeMszf2bb8jTJ+5XLa/RpCZpTs+Gt3W1ntr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270673; c=relaxed/simple;
	bh=lyQGPOiFZfI8iuJQWeJ/ZTEHobti30YMVFPeLxYKCIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2J9F3RYxhxvYmx0ewD8GTksFk7k9zGVjPG6HtFdpqi6FOYwwQvuHUnTtvCsPWESErm/PsxSe0l8ko2zDmHd9yjCmFG0M8b7hPx0tSegRSyZSyB6jhxtmKkEYa2i5BemGf3ccMUxiWGFcpP1WJhaXVICfoEqnrOhh7bTJsFB3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jtt77E+k; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jtt77E+k"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f2339dcfdso84315275ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 11 Feb 2025 02:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270671; x=1739875471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGyAcIVzwdxp3SxUx+rEML92I4jzvu6KhWaUMgM+hIg=;
        b=Jtt77E+kukLcHVB+chYhAjiR76Ep2Mz6XaUZtkCLsDfWw43zWq5NR/uK9B3VZu6Oa9
         qdQzo0DnA/pt3E1t3S3L0wWo3npbdMcBZGnF0ObtPLbggyYc++liFDwIsAaEag9TUrNh
         55GyOSyP+8PHwhyesYzngOMKXspeB45iaj20ZcxtPczfS+Oam97+2hsG3qyTgtKPW5CR
         AL3lSQdFtkKXr5m0NKZ62mr4yMz5vwlIJgAtMUKNCeCBXXUqQSqTJyenDWXv7LzLD531
         O69J5bt8NbKIKIsVPFKFdCIvjx+nsNattotk9Qp+fYLiZ+/q4ZRswfzjD8Q6MT5oO7oP
         S3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270671; x=1739875471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGyAcIVzwdxp3SxUx+rEML92I4jzvu6KhWaUMgM+hIg=;
        b=nvKjgRieVFDOe1zPqjZRwCQLekTjDZInuesSd9w3ca52gICcbYwXLvxDKX05D/9eo+
         wQyU7fHI2T721EFgHNjJY7UL3hePx7xJ1yF1OQZQcEag/gUp1H5haRxGi/rTy23eqmsS
         Y34kV6nmChiadpmyA8gvDJnwykP3Xry+mxEAsKyu/6EkMOluP/tJgqD3d5eg1sabuMS2
         t/CHQIo+du9RHyUAXE9gRXe4m5cTJxZYmutaF8XZrddelfO1Sx453wL5l8v3YEj5P/H9
         1yymDRg2aYX3YBJZQAfDAcK4LY7Ad5ijJUAFr7wzRqvkD0mF3SkjrN6z8/gEv1SYHvHN
         +xpg==
X-Forwarded-Encrypted: i=1; AJvYcCVaB3zPwq5uNv40zTalRLvtfgG7ab1FJxkxKl0m0Cx2V0fa871IyKXi31QMN63JWBXyx6D9c2oxmo/uTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRluZn4K5ymjeXogVBqEHOkuw4TY7JRlbfQbiXlwxL5BKpGiYl
	qge9cLaxsP0T7+xaewbyy63Fi5i34mREZKpSY4YcFov9Xv++HBAHufak61CFZLI=
X-Gm-Gg: ASbGnctnzI5DlQnjPjQolHTeFPLip67lGfDrhy8rUggAipmlJj0CZDTlI69/B4zSfNK
	9DGo3CMLauHnYSC+ZV4rI+c/LNy8d7ei5A8uOb/74deoR8zVFY2yLhvoRAwyHRtAKpI63IvvbuP
	kJMTBk4Yp5GsDztOURMa9ksVHOA+gj4LcQ3VvDYnsicj2Ddmhqo88+RqgWAVZLa+iEs/uc3w2mU
	O4iPuSnWOB5doatrO4Z3dZbrStWHaQbiFCFeoIBFRiBG4/BiCZRjd6wAfoXkl9JVmOqph+sju2p
	9wZNx7IAPLr1Qv0WcA==
X-Google-Smtp-Source: AGHT+IFkGzG5Hx5dxP8FNIuWUPeK9ACiFX9V+SrVY6ss/7yixFEmLNDBn5grfGl0BrfxDpYTkhCtJQ==
X-Received: by 2002:a17:902:f641:b0:215:9eac:1857 with SMTP id d9443c01a7336-21fb6bf622fmr47511905ad.5.1739270671078;
        Tue, 11 Feb 2025 02:44:31 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm5506354a91.41.2025.02.11.02.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:44:30 -0800 (PST)
Date: Tue, 11 Feb 2025 16:14:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>, Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com,
	corbet@lwn.net, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, treding@nvidia.com,
	jonathanh@nvidia.com, sashal@nvidia.com, vsethi@nvidia.com,
	ksitaraman@nvidia.com, sanjayc@nvidia.com, bbasu@nvidia.com
Subject: Re: [Patch 0/5] Support Autonomous Selection mode in cppc_cpufreq
Message-ID: <20250211104428.dibsnxmkiluzixvz@vireshk-i7>
References: <20250211103737.447704-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211103737.447704-1-sumitg@nvidia.com>

On 11-02-25, 16:07, Sumit Gupta wrote:
> This patchset supports the Autonomous Performance Level Selection mode
> in the cppc_cpufreq driver. The feature is part of the existing CPPC
> specification and already present in Intel and AMD specific pstate
> cpufreq drivers. The patchset adds the support in generic acpi cppc
> cpufreq driver.

Is there an overlap with:

https://lore.kernel.org/all/20250206131428.3261578-1-zhenglifeng1@huawei.com/

?

> It adds a new 'cppc_cpufreq_epp' instance of the 'cppc_cpufreq' driver
> for supporting the Autonomous Performance Level Selection and Energy
> Performance Preference (EPP).
> Autonomous selection will get enabled during boot if 'cppc_auto_sel'
> boot argument is passed or the 'Autonomous Selection Enable' register
> is already set before kernel boot. When enabled, the hardware is
> allowed to autonomously select the CPU frequency within the min and
> max perf boundaries using the Engergy Performance Preference hints.
> The EPP values range from '0x0'(performance preference) to '0xFF'
> (energy efficiency preference).
> 
> It also exposes the acpi_cppc sysfs nodes to update the epp, auto_sel
> and {min|max_perf} registers for changing the hints to hardware for
> Autonomous selection.
> 
> In a followup patch, plan to add support to dynamically switch the
> cpufreq driver instance from 'cppc_cpufreq_epp' to 'cppc_cpufreq' and
> vice-versa without reboot.
> 
> The patches are divided into below groups:
> - Patch [1-2]: Improvements. Can be applied independently.
> - Patch [3-4]: sysfs store nodes for Auto mode. Depend on Patch [1-2].
> - Patch [5]: Support for 'cppc_cpufreq_epp'. Uses a macro from [3].
> 
> Sumit Gupta (5):
>   ACPI: CPPC: add read perf ctrls api and rename few existing
>   ACPI: CPPC: expand macro to create store acpi_cppc sysfs node
>   ACPI: CPPC: support updating epp, auto_sel and {min|max_perf} from
>     sysfs
>   Documentation: ACPI: add autonomous mode ctrls info in cppc_sysfs.txt
>   cpufreq: CPPC: Add cppc_cpufreq_epp instance for Autonomous mode
> 
>  Documentation/admin-guide/acpi/cppc_sysfs.rst |  28 ++
>  .../admin-guide/kernel-parameters.txt         |  11 +
>  drivers/acpi/cppc_acpi.c                      | 311 ++++++++++++++++--
>  drivers/cpufreq/cppc_cpufreq.c                | 260 ++++++++++++++-
>  include/acpi/cppc_acpi.h                      |  19 +-
>  5 files changed, 572 insertions(+), 57 deletions(-)

-- 
viresh
