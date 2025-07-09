Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF2238C21
	for <linux-tegra@vger.kernel.org>; Wed,  9 Jul 2025 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048765; cv=none; b=B6AMAWB3rJGkAfJsKlsfJGs6wNVj21jzG1tJy8cHZou+8oRZCoRXKHQ8FRUxySoPWgWbuyVwmqQZcuCXMg7M8kRHgWgYtehgFvHH3Nq6ybf5MfBh+XcGtoOVMjhlJ38xZmzJTYtmPWIj7Mc3RAIcoq9C4FmkmFIC+JALo1+wXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048765; c=relaxed/simple;
	bh=/zZwSYh2vU/5k39pFJ6jmYxsKtGH5f1vixahgGk51Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSai9pOSgeQiEidZEqWEGRMrxWzVkAgLN8SBOwo1RlUhoQSg2bAnv95F63nKMUImWf/Uecc39Y9vaw1JVMysBhUj6gh8vNxC7tG9E65LCw4+L/H/TpK12NP+YNerobHEKOksKd2oAETEZWEqeIleyAcyuAGQqqlRhtomsbyATbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEBgJEku; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEBgJEku"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167afeso52650715ad.3
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jul 2025 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752048763; x=1752653563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5RyC7LXvFVaBKX4nsxZCPQg0l7p2DFOwCn7njR7ZoLI=;
        b=xEBgJEkuEF3a4t4DRNaa1vtbDBhD3XroghoTzlHEBI9yVTv4GCxJ+iylZfjv2LgWN3
         +qCyFzLO1DDUWrJaHhKVPy5TA8jF14GIhxtUmmbj10uaPlhplF2XmSxlJsBw3EOMQ+Vi
         rTl5I9f79weQ4mO5oSIUyzYaaX49LrtfNZO6mqHLi3SbicuY1lTq0+g9EAHlIH8dPtSU
         imEcD7Xe6Hn0xYnPiUDj2PWfHoEpWt0J6E/1z68jpYIZ6b3+i8Azh/2oBXVrz2Kvkf3x
         Ih+q5XJlYyDfJzo2a354RF7ouo6OiyfmN9ClPjRFFoKDfbgGgRRYwVRElpIo5f3c6qDi
         A/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048763; x=1752653563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RyC7LXvFVaBKX4nsxZCPQg0l7p2DFOwCn7njR7ZoLI=;
        b=MI36uVIrugYMyTb6AHNwYGM90MbOmg5YeCoKeUPCXZWsomFfH7hXuKpfvLqCFYHPLn
         PDRbgkHKIgUZnUld6dqYsl3JJAEr9DqTlSXalE8zzw1WbBexVjNuWMEgvUiM0RVixsBf
         2GSQmgIYlFb/no5mKUX64t/1IcHPB7/MQkITdNmJ85vycYZAq2jdQGAYypdZGPZ/YYqz
         mtOGjdTqxaZKaz8XHvFZV97Vr3HO8GxW2dRWZT+fDN0ekbyfUbhId1ZV/BQk7O5+m48d
         ykP/w2nDXYq9v/GXxJ/O/jTjpK3uZtgQTVXL4IWW+rI9h0RKIBaD8AJ8bbm612ujLXqB
         4pFA==
X-Forwarded-Encrypted: i=1; AJvYcCUTpjRa0M/yuhbn0JCZpyCQdHIKZklBVlePhxMYXbPsd3MMfQ1j+4WCosTh+Kcw1XmXHSUTOgeE2db7VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJIDbMHK07Tt0povD6HDQwnycRAnvl5Hzlt2n+Dy/p0Ommd1ZM
	Jozd8XTicVVshzRmGjs+o4Hy5nERVL9ppxx5V8ELXs+W+XuonbvDlq7Pgq8FCKt7O9c=
X-Gm-Gg: ASbGncuFpmjva3kzz5pLweodDx5d2g1JcYeUjS/iE4tEEL0AmUvqFBzKLGqgHte1YGB
	XdUJgCLga6cdbRRBKSXb87YVTHkPJw7jzXE4xHUnw7PQNlVM3/OHv3qOjh7JW5ZiQp+Tg36HuEd
	MagDYkjDFzGxQCZaoAFk+Bhd1tSsy7M0tahu9tRaxEwGNq4UE0Q1UHqz2csHNh18C7WU9/ul6gw
	4/GLRE/kAufEb31eaw+LAwORqeBcJMyfwZVr3RE+Iylxf0fhAm0GKrE69ecn+aw1qQV9KFdy+L1
	/HPj+hYLek8I2kQ9AqQTfyTMoxEcQ6ug32QuHHuSGQAQN0VXjWbA81cKsZjJK9Oqt/2QDLMAdQ=
	=
X-Google-Smtp-Source: AGHT+IFiRMnSHmNBvUClpBlaNrV3TBD2G3A1eITscwtWGj20grwDeZwpsDQEjZBDH9aGNpfCQqSsrw==
X-Received: by 2002:a17:902:c412:b0:234:bca7:2920 with SMTP id d9443c01a7336-23ddb2e82a8mr32305155ad.24.1752048763584;
        Wed, 09 Jul 2025 01:12:43 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e673sm139950205ad.174.2025.07.09.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:12:42 -0700 (PDT)
Date: Wed, 9 Jul 2025 13:42:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 0/3] Support building tegra124-cpufreq as a module
Message-ID: <20250709081240.wycbxl6fc2mmkmlz@vireshk-i7>
References: <20250707-tegra124-cpufreq-v6-0-fe69c0f9bbab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-tegra124-cpufreq-v6-0-fe69c0f9bbab@gmail.com>

On 07-07-25, 16:17, Aaron Kling via B4 Relay wrote:
> This adds remove and exit routines that were not previously needed when
> this was only available builtin.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied. Thanks.

-- 
viresh
