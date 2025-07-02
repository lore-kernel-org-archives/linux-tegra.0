Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABD235346
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443933; cv=none; b=H5NKw72nMiScHtvCi2FSYUx67XqoyoGnmqj0/+KLrT6IoHWfQZQ9Ivkr0UEcw5oa6aHjRdHhRJGb4sDV4v6dSnM7sM1L8DZ2W+k+DsiMKhA2vLrWi+0nXrni9CEGCAPxmTEABjSiKfIjtGbRKs+z1Z/ahfQgUC/cfE6lernHEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443933; c=relaxed/simple;
	bh=z0Z5jvK6xUvtBK4jnkZkseYCrZ79UTYnTdxbGRs6ZSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjWrZT5n+3E+neLX72VPzQr20GZRET3TnsBzE5HPZRv30+MvLXwn8aUVMGeACGnijIQT7gEs3wRQledLYyShCxPBXTTgwJ92Ecy/5dHP5Mukiyh4K532hgDK8FxgyKTmA9xQ+iknZKI9IVr+jtg+qoOj/AuRV5MDgbwKKwTPcgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2TeDSNG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2TeDSNG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2350b1b9129so27239255ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jul 2025 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751443930; x=1752048730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uy53KgmSlwJ+OJKWpNvJE3andfzWWOVCz+777PvTMw4=;
        b=i2TeDSNGtUgm+EL+XAnsMEId4NkbW1o96T2UmskStRLoLd/liWptHY13il2s8bhgBh
         CK7ANf4kJq4QMBGPwkkTstGujdvVwzhLrd1gmiseMNW6CxzYOQIyiEiPSXWqgOFs4phM
         PoZ8gPbmenJeXNHvqEx5XpXzKvSxePdXbMjuePNWqs9hxEKOxdtmK1PHBI9sqHCHkLIq
         28SOoBNWmn6Np/lfVzeV+WsPngwZ26yPB45TwgAFhHyGcbtdL9EFnTkSCfJLpbj6E9wr
         NY0SC1q87IQqJpJ2KMR6DVZd8P5RbgV2CnLCBGtb6DvLtFp3PCIqyiQmOrfXCtmZT6/N
         xM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443930; x=1752048730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy53KgmSlwJ+OJKWpNvJE3andfzWWOVCz+777PvTMw4=;
        b=Dv2vdMt8ZKsW1cayYQ67enuTRceEYcfR8NkKTF2IRFM17fNyXvq1N18FoASjMw69WI
         i87rH13kckttn0tdf4w7LBc9N/W7Jg0e8/WEHMsMMjMh0SUOeK1fCCi2YyYpjuzQLkQG
         NlqmSymc/2TEGHK/v0bvxLLnFtgaZ8h7SWKdWbsjCylVAbNbl46GoswYBZo4F1I3vaDH
         nNYGmVme0eD+UNIw/uXldM7nOzXeuDdtMp7pHfad0s+etvs2PURGkhMRlfpkbBsQUPOw
         B+TDXdUp+RL2+xB3K1zVvCzNVVZIr7GWQmb7k2u5xXOp/zYfjqTZlGtXvu56Oh2C1SKd
         83pw==
X-Forwarded-Encrypted: i=1; AJvYcCX4tNiLBioytJzUPjp/x3twyoRR6KozBWdMwS38uCKM2diChXW27xbcn34Swb/QN0va+Xz8MvgYVDyYyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVGR4XAkRApfWHli1hoOmIIRUmTlIgKe96glEsSddy3DLD2py
	CXZraBmPj9e35gvYRQ3anQRiNKZAlB9kwvxHvTRXXnCHKFIlT7Ux3u3ditp5s0IRhos=
X-Gm-Gg: ASbGncub0Lwf0yuwhMEfk9AXZz991xARUy/A0UMTyfWYPI+eRBK37AM4F1xJ1ym5wvT
	PnXjW+H3do1VnWQtjqOQrXneX6ie7Vsjrk+P9yrjh1/ffYlzOqy9fUkUsafcTqoO5Rs9Qq/dm/h
	Uk+SNCxnTqHdmcGb1N8Rax1NitnuCccGULjRDnBezB5yZf37F117oxlfp2VfvUjCoUXOTrZ+GKm
	jSgwmDZYw15Zo+wqMfQgHXjmZ6iRwTQWLgRRL4RBnHBlUji0w/V78WUNkntuGiYwtS2gpAeU5SV
	aabSbo0x4/WWIjnIOhZrZurEpTEwpWym3kHwG3oIVDyRyCUMSaX0vBXVeJdSeYk=
X-Google-Smtp-Source: AGHT+IE7wcE0iwVAH1jLYj4z9nMQShh8CBuXC3Zk4EQNxjP7Cck5KCN98jBFqey7FxfNbCfChiLb2Q==
X-Received: by 2002:a17:903:3c6b:b0:234:9670:cc73 with SMTP id d9443c01a7336-23c6e490fc1mr32796355ad.5.1751443930566;
        Wed, 02 Jul 2025 01:12:10 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1bc3sm121786925ad.28.2025.07.02.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:12:10 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:42:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/3] cpufreq: tegra124: Allow building as a module
Message-ID: <20250702081207.bzru3mtl56ns372v@vireshk-i7>
References: <20250702-tegra124-cpufreq-v5-0-66ab3640a570@gmail.com>
 <20250702-tegra124-cpufreq-v5-3-66ab3640a570@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-tegra124-cpufreq-v5-3-66ab3640a570@gmail.com>

On 02-07-25, 02:46, Aaron Kling via B4 Relay wrote:
> +static struct platform_device *platform_device;

Maybe initialize this to an error value...

> +static void __exit tegra_cpufreq_module_exit(void)
> +{
> +	if (platform_device && !IS_ERR(platform_device))

... and then this could be simplified ?

Or use !IS_ERR_OR_NULL .

-- 
viresh
