Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5193C0633
	for <linux-tegra@vger.kernel.org>; Mon, 31 Aug 2026 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162996; cv=none; b=QISH4cuXID/GF4QQaQwq0JEkhawyRaJ2FmjbuWV78/9w9t7oJ0eUoiS6efDdTclLCU4JwBvS5z8OaFoZ43tYKNLHkBqH55i/XRvJZp9YsCb4ARlyfIjW0Hju5AvknFKsvffkV/EOchkRXgI6Zyhu2m6Es6Bm5magGXSUeyFJkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162996; c=relaxed/simple;
	bh=/5KBAkXNsAoZ0dCdyXwjvLZJnV0sY2YkzB0CpxvtEFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opVw0UD8rTM+bgJyWyYIfI8eyM7Gjo8iSqG+zVSbkY8kLTDKgOti+S8ub575uNsHoPzUTaQ+XKf9Yy2KhvA1vTB5tcViLwbzQrdTvljZsX8DoFaKJqBNK9TLXyIZYqvP+H3sQCk8BztDn45J+KWyqykDnZgTsIaUmwpJRjU2590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwtU1PxZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwtU1PxZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84830c774a0so3427729b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 31 Aug 2026 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788162994; x=1788767794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTj871xlqaHMwYraZdh0kFP+rAgpCuDmxV4vm0NFxw4=;
        b=FwtU1PxZ3sv00HIYkScT9jNLH1hDhZ0/bDCpL3wwVw0yXXwIWN7hkW1Qyj4Q6W27mv
         oY88V1kc8gRSgT2DE5Z4Hb+zrwc9h7sDWBYWNdHNH5KRtmRayIbEqF3g/4DjtsdWRtYg
         4yOW5d/ymUa0v0lTxkEULSow1QiKrtlY3Qlzz/ks9pvOl+p34uTzABJ3W+Xxe0hru6by
         lYWDCe0fDEju8pczRp1ONLDSlYy3j4NPAaLfivvnBGA6QFEOKsl3g3c0oRrUIYp4eGUg
         cVW1up/zG28ppOBEgzlNr7VaU1Oel6GHjneX+raCY+aB4T6cS5AXrZr70jtaMbDq4ULX
         57pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162994; x=1788767794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTj871xlqaHMwYraZdh0kFP+rAgpCuDmxV4vm0NFxw4=;
        b=FlErh81hLxLtghBnt3SbFocURHygSaO8XiozeWc4nyjOVENt0l04zt6GaAOV1Rl6WN
         36OX3GIduH4taTR2l4K0qWnErr4AhAYDNYC4+9Wr3guvrTjfYxGQ00mIwEsyAxLAoFS8
         cDcT5mBWlUTu48whpy+57E8eaNbANE1QUarjNsPRmof59UZmpFcaIy4C+WM/LbxUZz9p
         V2wscDvec2V32JRbxax63QapAzm3jHVN9MQuNM9fXCUKs0CTubkwLLbcOouOfhL2g1HK
         srU1uMBIm3Yjp3WPU2SiMGLZvjFrOY9TmuHcEIdlsFBJe4k4PfMqOEmObif0QzZWOrNG
         V0ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNpmDRqyLkMIowNC5OBKI2xdNSb+TShlYHBWZRnWFeR44VIz641JLfFGQ9jacgrSWRufGyFS8qEZ7afw==@vger.kernel.org
X-Gm-Message-State: AFuF++lpefRSoe0tz/cmXSbCMhWJSkanLxtxeZS9HSoCeRDFq4LMJPNT
	EExk3dsx8qG6lPKGGN1V1LK4HwxOTCI6+t/GN1g/ZLk6hd/qV2DJOE0tHMybna6OdJ9LB498LA2
	+05hLpik=
X-Gm-Gg: AR+sD10ZdrWrdL7l3htlqI4dBQv52OTgiS5OH6bzhlIDpy5qOJZnUAuGw4vSb11u5EY
	7YzB12szWkqI5LQZdT2dCnc0pU67h2MhHQYfxD9rsmmf+yjD7LAVfAf/0YUONyrfnklAi62g1Jx
	OxpKHlPfixh6H7dB2m55vo+3+uzfREK6WsrHibbkwf4EnZmW4Fkpim5Kio4dt0nL+q7Giw+3gnD
	C7zfj6u+OoVGoTGP1xuJgVynZDl2UPz5LfE7uwgCSDB2efaiKn8NrzHdtg1BmJ5FxI4GYSFShaw
	CuqulhX7UlBa/AAZB2msz5Z+bafprAhHKtkTqi1ECBnFWv6FrbxvxjELxcm6YF4GYkQ5xpZLWiP
	WZmTo8Zcj7JQeCF8ltLz/dYrkUZ359tcbH1ypPB+zwO0hh03lAgfHFWGIOZocsdxvF19Tmytm8O
	w15XDbRPqYMD7GPdP1KeRevB48OdGmPtPnjqe7BB037EIZ6A1jN+3nfqeQ8aAQt+I=
X-Received: by 2002:a05:6a20:a11f:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3d269a4d3ecmr37174478637.17.1788162993984;
        Mon, 31 Aug 2026 00:56:33 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm26529255eec.23.2026.08.31.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:56:33 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:26:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: rafael@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com,
	sumitg@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra194: fix double-pointer error in
 get_cpu_ndiv
Message-ID: <apUzriIXGmxf-PLc@vireshk-B250M-D3H>
References: <20260831073009.3772408-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831073009.3772408-1-luoxueqin@kylinos.cn>

On 31-08-26, 15:30, Xueqin Luo wrote:
> ndiv is already a u64 pointer, passing &ndiv to smp_call_function_single()
> results in a u64** being written to instead of the caller's u64 variable,
> so the caller always reads back an uninitialized ndiv.  Drop the spurious
> '&'.
> 
> Fixes: 0839ed1fd7ac ("cpufreq: tegra194: add soc data to support multiple soc")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
