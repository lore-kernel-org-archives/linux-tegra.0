Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9FD2522BE
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 05:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760332125; cv=none; b=th1MCUMiPlaJtCilt65Cvdg7f9x74HjIOsqA8odyRpw0NlYmCP5cK2M1tbm7P5OnL+dHNYhrmDn96+WkfZfAHQVJREexoMtrw1dcecAUB/yYW6JFT+TCYxKT0AM4RRmFj7TDmIDUFGgIjUtwxdPlAJqhA0/8HHhOCIR4o+zQj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760332125; c=relaxed/simple;
	bh=JW2KZzHBHGQ+XKshSFr20YBoYNWz1TvAot2oKeFV9kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ady97R8L1RPVIwmoZKNkuI7thdH5/dp6zqE+ATibY5XvXJNrGyu+0tuA2bDZDbrbnUCxsp5gGdaWRBYY/Sf7EcE408iGoBC/nRvAOqj2jYtF44sID/QcwtTDi+1Qmq8TRjGtl7BE6sAB3zRwKMnVkl7Z7mCU5F2uwtK2Mqrsico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGcSJ2Af; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGcSJ2Af"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3239553b3a.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 22:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760332123; x=1760936923; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvMGF2m9NKomiMPkcFDrgY9B/XQ2FXotq7iRDHPw2HM=;
        b=DGcSJ2Af6VYmbrtuCzQG3CMmb1RhZwaLy/chU9o2lUUr70Bx2+z3r/OMvV0xYYZQaP
         eA16OXeckD7LDEPs5jQU6+fV23sXpMRaYgbQ6ObGNFp/Jg5iHFT2ZcNlHPoO55kIH4Tf
         VvbRMvZdohIEapQ9BF/G6g2n2nHsWsVs3c6TuRAKPbOwpLuWIhTCmCsToee6YyUG+Xwj
         zlL3m1vxw7MJoZIMh2wJ26ewgNdyVNUko7VgXB4Poad0kFnqgWm+AKYxtseB3POYaXQr
         +XLJ/2bvwsqb/VW7BhAwPG8K8AyGuxtOh5GkLvxpI12AHo/S+oYzfoSEjL7NDdwlNNcr
         8x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760332123; x=1760936923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvMGF2m9NKomiMPkcFDrgY9B/XQ2FXotq7iRDHPw2HM=;
        b=tHY8aayoHhVNbpLXD10AI4d9XcsseOgCrsAKZnNziHzUEqEnc4IJEt2YlH9G72E/Yg
         JtZTWgIzh3vRtL0CWXHMOHhEsBXYQIoOkmSVrjYTRyUHKVrS776T1CFRJ8LYQWbm6jAb
         LbA73m3ccCic1qFNxyLuR+AY9k7I/wE3urR7j6daaxlhhmVjsdNuRQcNvYH2pdEQiVyl
         Ytk+Gz0TTVsategzpZFIEDgwFoU6KTR3Kirn4YH0m0YtyN83MqR7nEuRuYWIhfreJEt2
         Ye9YH34xz8O/RehqXFrNQEJ2Kq9ErYwkg7aXbRzp+n4FDs9kf55OsGzUeLEH+0pCrddY
         7YdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXzolVX3jXp+z9AOpbBnNBMpIuzivqc4uO2ab7Uf6jjuCjDSPzgZIMpJXixxwTtJkRwJO9bvimG2tdaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjp7eMwc2/XHcUNlKzSJgwxdLP6kqXui8W8AgkuCpB6nts7GLO
	qQNGsDxReuxO64EXDPgIlJUF3JBbuRQHVhOJVLfm3W7zF4ZGwxZu3s4DLO1HcwBBlWU=
X-Gm-Gg: ASbGncs7rAuEW8e97yUFBugJVJGejThuCBWRHvJ9S4ZlA0f71WDgs6GBPrutuezEVio
	gtB0m0mLygBlXYgjb+ID9eZBHB1DsJrYNyRBUeYAPRj7HvS4NnHXPeDz4gXoT/AErEdvQHk71BJ
	nu48WZYMbNIcm4A53Ad3yeRQNwB+Gfr7CU71W7M8Nk3w5ZpXdMw5SVWDo9FeA/qfiY4TbWnIyKK
	z/Fa1+3QWGxc8jp4eWjriUD0SjmzjTb1AGGWhVukKYa/J/ETflnoZ/4BLC3fqm+JEICV6SGIOBp
	9FJzf+Ulk/n+MLxxGnA2LrCcud0a09dqzpetrZYnap2vwnm3tZ8X6dT1/lT+egxJS31Jtf8TXO2
	y1lzlvVO1IT1K+o1uaFtOSSg/wjIIznHrmUoTuuyTtp9DRVuRzFl5PYWVCPiuXyV99SyY
X-Google-Smtp-Source: AGHT+IFr1jDMWruKiXaI53Y1xIrFgDt+3JcFOtGMWWSDIGVWWBQCIaxajxNyZnXlqxumYlg8hTxd+w==
X-Received: by 2002:a05:6a21:99a1:b0:302:c800:bc0b with SMTP id adf61e73a8af0-32da83e64d7mr25164345637.44.1760332123377;
        Sun, 12 Oct 2025 22:08:43 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb11ca0sm10155168b3a.32.2025.10.12.22.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:08:42 -0700 (PDT)
Date: Mon, 13 Oct 2025 10:38:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/8] cpufreq: tegra186: add OPP support and set
 bandwidth
Message-ID: <5ind7yevxsrsd3ws5rkl5z3zuxw4yrqoclqg7q6beunc6kgr2n@qmgbgw5q2ltc>
References: <20250909-tegra186-icc-v2-0-09413724e781@gmail.com>
 <20250909-tegra186-icc-v2-1-09413724e781@gmail.com>
 <20250930103006.octwlx53p2shwq2v@vireshk-i7>
 <CALHNRZ84s8rxQKWZeF-bfS31nK6ay4_MspmYa4+qapf9gtk+Fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ84s8rxQKWZeF-bfS31nK6ay4_MspmYa4+qapf9gtk+Fg@mail.gmail.com>

On 12-10-25, 21:32, Aaron Kling wrote:
> On Tue, Sep 30, 2025 at 5:30 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 09-09-25, 01:21, Aaron Kling via B4 Relay wrote:
> > > +static int tegra_cpufreq_set_bw(struct cpufreq_policy *policy, unsigned long freq_khz)
> > > +{
> > > +     struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> > > +     struct dev_pm_opp *opp __free(put_opp);
> >
> > The usage here looks incorrect..
> >
> > > +     struct device *dev;
> > > +     int ret;
> > > +
> > > +     dev = get_cpu_device(policy->cpu);
> > > +     if (!dev)
> > > +             return -ENODEV;
> >
> > On failure, we would return from here with a garbage `opp` pointer, which the
> > OPP core may try to free ?
> >
> > Moving the variable definition here would fix that.
> 
> If the var was NULL initialized, would the free handle that correctly?
> Keeping the declarations at the start of the function reads better
> imo.

include/linux/cleanup.h has some recommendations around that.

-- 
viresh
