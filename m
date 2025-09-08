Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D162E62A8
	for <linux-tegra@vger.kernel.org>; Mon,  8 Sep 2025 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315034; cv=none; b=IeCrHqiTQe3gPYF3DY6MGbYIZm5n8OXn1GMVyJKTkv3g3MzP6XDkUA2ZsX5KjXt/Yp5vS4WUzM86ZBh5wvzxw6jN6+HQLSNyWdfiKqYMhZvKGaf9RAVLdYiMQC2EJAPWGLtmKbJIZU916BABTuTZV/OX9QT+GAlAK3QKgQKzjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315034; c=relaxed/simple;
	bh=IFQSsw7X2lJbg2eU0tkmcDM/OFT1IO01YnqUQ2sDIUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtPDkd+JfDshKTwvn+6+fExEASA4tk4Q1Rzj395XdOXv9ddVMRlZoaNrM7x/XdtE8D0mUisi0Yh3Hc/nq+q7cCpk2XOf8JeRc3FYgJMvjzaAfW+GcRHwIF+LApB2on1g8LiFcBr+JhHXCdGGkylN2tyhTIOjd+lSS7qhkt1EbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ml2mmTlo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ml2mmTlo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24c863e852aso36555775ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 Sep 2025 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757315032; x=1757919832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xM4p/zyaJz7z9vlZN3il8DQFkpBC93i/XYk/dKxNDs=;
        b=Ml2mmTlol0pjRBy/jnvuNKbuhrHj9lRhfet7IVe3yw3n6zObqXEZDy7fTvfbPJ3bVU
         4dNMOZb85Q6uvEcV/aoT4CSY3UbdIR3U4YL0gCxTaZsH7DtaG8hHurdOXIQsX3NsXc2E
         eRCa9wYguwux6t3DhUn2sAG/iZlEsPg3kjfqkG2yVJmfSMZiFdDJvjlP1QoE9OXuqp9a
         9JhEaPsLn1djpX47bE2Bsy+eBi9cj9i+8+XKhVWrnIyMgYYQtCiGBKJIkj1O8ZuKS7Ja
         lv04Pgg3nsSEb8jsitFpO+yXSsJt5qxUZid7eNSyB4OWEhjBfVM64R79U2PJCWVA2YKS
         vrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757315032; x=1757919832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xM4p/zyaJz7z9vlZN3il8DQFkpBC93i/XYk/dKxNDs=;
        b=F8XFGu6KM2bjKb920sxrYqctsRcjy3Qia9re1J6h3BRyrDvAmrVHPBx/weKFVcRw8h
         9/R7qgfJvgIySVQIfeGcA82aeUrB9CYJItOLSFMZXWaqCr3/W2vxSbniypFBsW4QFy0V
         tolkLrNHjlnZ6HAThqOzApawi1+CpxIxho0VDQD+NI0XTcfAZH2mkpS/IBPYhQza1xFy
         UfRovcVIub8L5foKk9iOuF5D/XHINzV89I0j5k9VQ+udoVrxtU1kCBukMdoZn2KtptBo
         0DoPstBMsp8qwzl46L03iAOa0AHVn/KXO+9c7IUhXHclORnM5TA9zgIaXyCvCqI7hsHd
         M1NA==
X-Forwarded-Encrypted: i=1; AJvYcCUUwGMsJ44gcoFi0I0GW9mFKhfxM/QfPkh8k8SfpmCbJ8Uq5Jf8l+wmgjhNGlNnOPXrEovhGwdONkG8UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWkn/lRAwhHNMwtNM1xNNyAfXnFu9LJxXCBkf1BbFDqWOJqNde
	+Jhoe6H4ETZwcDxii1i7V5Hgk9WaWQyCvSXOfxhaqpj6b8YKBGBINd9tb83ERkjueHM=
X-Gm-Gg: ASbGncttoZ1ec4lHLg9Xl79VSp/+wn32+iUGf+Dfdg2EW4gSb3oEnXiAOqyJ94W8Yws
	ofyo9a//E6yYMgRHElfIyDvTl+4e8BRPRfqmoRpTJsnnDripXuP3CwkFSzfzv8/7ClwsAX68zCp
	ZIrpALmfkWa80nsPNrupG4tNIfagfPmvpeBtiackA7X4Nx1xcKWDiHTMyJl87xJpF+oYqh6+kgO
	NMRnxNFgjU5gUXiwtHIcTzEGrBdTumN0CrDrJmeKlby4AAyfpX3Rho5EJU6b8igK73OB7artEXl
	LdL8ywd2tg83CK0XGtUDpx4cSkX2AdgP6SaN1SeFJ9XLLPtToYqAJrRJP5X86yFVGwREx9ZQmAV
	FUIS9+d7gc2zCJoAkVWbgDcBOjyqju2J26ME=
X-Google-Smtp-Source: AGHT+IGdeCh/rybFQC/2arp3UhBEUX+o56WdtJ71SfDZ99wsZPoSxMLD22J5lDCxlaU3DSTir3vf/g==
X-Received: by 2002:a17:902:ec8f:b0:24c:7862:41e2 with SMTP id d9443c01a7336-25171cbdecemr112986595ad.31.1757315031785;
        Mon, 08 Sep 2025 00:03:51 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77248cfbc9esm23739860b3a.99.2025.09.08.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:03:51 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:33:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <luceoscutum@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 0/2] cpufreq: tegra186: Fix initialization and scaling
Message-ID: <20250908070349.nsep6ekt7g426txq@vireshk-i7>
References: <20250828-tegra186-cpufreq-fixes-v3-0-23a7341db254@gmail.com>
 <20250904050358.kj7gxypu5mmov4f7@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904050358.kj7gxypu5mmov4f7@vireshk-i7>

On 04-09-25, 10:33, Viresh Kumar wrote:
> On 28-08-25, 21:48, Aaron Kling via B4 Relay wrote:
> > This series fixes an issue with shared policy per cluster not scaling
> > all cpus and with some cores being initialized by the subsystem.
> > 
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v3:
> > - Use more clearly named variables in patch 2
> > - In patch 2, fail probe if no cpu rates reported by bpmp
> > - Link to v2: https://lore.kernel.org/r/20250828-tegra186-cpufreq-fixes-v2-0-fcffe4de1e15@gmail.com

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
