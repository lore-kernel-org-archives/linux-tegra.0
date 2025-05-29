Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018B1DFDA1
	for <linux-tegra@vger.kernel.org>; Thu, 29 May 2025 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748495813; cv=none; b=Rylc1qRAjp3Yp/s3JB1gQqZ9Qlz9tqRJflZQAoX+4mUiZh4NepAQCIcnpgsdY5SdyNCv4kEl6uzCKgwcjCmnT4SbKc944cqf61UgyJYLihF0JWMbQisVEETqGJPNYzJ8FENv1i+/OuI8SE/vjx0gsEs4nyd35luytagp1ndcqC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748495813; c=relaxed/simple;
	bh=TV45GHhtGOnRyTBAfSGdXdDInmU9h/yXgKV5kru+fSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IefP8J/Z2KhO2qbHg8YwJq2YRcujOD6j7tj/8KhL2S/SeD+bD3v/KBZsEnFb/aewgZiPKIahdZXW6MYXwlu8xXOCkS/Ggg60fcB8IqRGoY8xqqa5GMEx+y/mAL8p8PcNcAdwQjG6ATmqgyixdjkxDRCWsChPrB4U38ScFp8668s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGkLYK9Y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGkLYK9Y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e331215dbso11597625ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 28 May 2025 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748495811; x=1749100611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwAROE/Iu0xe9jaIyFDWRqVVq6KxWwVTJxazuJbd0tw=;
        b=kGkLYK9YcyVhhCcMk9T7wenLoNAyQ+V9+ehAoh4jfgX7jfAvXKlRFZrVuNoFutKVRk
         z44IrO1CA7jWMMYbd/3zgQ8IpAUioE9QFWVay8/v3IIq9YV4414mg+1+JfNsDiQ5H9Qi
         ExKdVVMxquBayhlGB5clxCX0BfrYORkme2HCSQukPyXzwK5Y7QleycliDAuulG57M0Qk
         aRr7Yhu4iix3Z16yFOMX7HRwt6D3oyyCJpLfVC/xt/n25NDxSv9QwTiru+8PePj4dZn1
         emxLm5Ox2l3kSfP3GWC/x8XSW9UOYDX/XCdY591AHiZDKilzwnuBlEj032qMXGq/C2w9
         uaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748495811; x=1749100611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwAROE/Iu0xe9jaIyFDWRqVVq6KxWwVTJxazuJbd0tw=;
        b=cEaYyw0VCQzWXtgzEzeOTqMjEL+Grw0aXcaqNVVV6Rx6iKE/eT8jejFzTz9cMQH8c7
         s1awJrdawEWOUvLaq9njDlkDnUAyFbg7+1BxMHtQgWTwx0Lp4LqBucNCD0hrEStOHmko
         CivyK8ZxpGG+B4PS9ki7eSIYVs5bnBDK5DoP6Lg1/Vn30ItRm7ZqXYjkeUOJWC0YVsZT
         SBqWGtRKC3IjPxSFkdxCD8EQ9wZzG2ckxnDkJTAfDlYQke4KX8JFFX59XpGYpofYDbJU
         IMaF5eE1ueormgFPUjeW6X+PbCMnGDIVqOv1oka59aw3b0rrOnEoUR2waZ/6h5dYvEQF
         8Hig==
X-Forwarded-Encrypted: i=1; AJvYcCUwfL93RVgDrrNmw/H9WsCcCr8E3YIo+lct3KlL9pB79HYl6X3dXt/y3rk4rw6gzQ41g1HA7fzuDL7M2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiK/NS+C2q47ogqlbync13zcFtOpyZYmi0PsbBj/3pzonFB3Kt
	RUbIlSW9rGIN+RYLd72LOamWh39VPDKI4o6YO4a0TpugUJCPMPAW7y3oC/tsbW+lICU=
X-Gm-Gg: ASbGncvdza423KS3Mk7gYAmh2TOX+kReKkRgS6OD/iVF6yII1xq1ef7W+ZgdKKQm/Ce
	tJVLUJsOhhxvytyNc1WwioI0bQNTZ0aLDIkrF72gNjqx/ULxTORkqusTYJoX/HRvVmytoX/z18C
	ySanas22amUlELqG7asg7PJCqskHEq6mPnaZ4mjhsBuWq+1qn/Uk3S+xlyJu35lssbVTjkxrQkF
	XYc4srCEpjVT/+hi2Ly1FUfBKBp508RXphim9tRfgU6OPSAXYqgKRxaqd7H5THiKUG2JnLkqiAc
	RkRMg83FJ/dgTSjOAsKTxcW0BlYpe/SAl1BE9DcJtkJxxcmTrDZg
X-Google-Smtp-Source: AGHT+IFCUOB6AzVLuihAxx+qpBUabNryOsY6YuDFDgZ+ERpJUDUNP/BhRLmVicYoSS77fIKt7beIXQ==
X-Received: by 2002:a17:902:f546:b0:234:a05f:46df with SMTP id d9443c01a7336-234f67a7a6emr28192605ad.7.1748495811169;
        Wed, 28 May 2025 22:16:51 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd362fsm4570345ad.116.2025.05.28.22.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 22:16:50 -0700 (PDT)
Date: Thu, 29 May 2025 10:46:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250529051648.axvnwxvqf5zgroy5@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
 <20250519101725.k644wzizjwygtwa7@vireshk-i7>
 <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>
 <20250520100218.te5i5ltrx43zjsq6@vireshk-i7>
 <CALHNRZ_NtdiOek_bEABYpkW+p=c2RgCC4o9EXmqmAkdv3o9i6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHNRZ_NtdiOek_bEABYpkW+p=c2RgCC4o9EXmqmAkdv3o9i6A@mail.gmail.com>

On 28-05-25, 12:29, Aaron Kling wrote:
> Is there any consensus on the best way to handle this? I'd like to
> keep the series moving.

I was waiting for Jon to provide further feedback here.

-- 
viresh
