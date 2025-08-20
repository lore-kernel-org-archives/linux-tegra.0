Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5521B9FD
	for <linux-tegra@vger.kernel.org>; Wed, 20 Aug 2025 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671482; cv=none; b=sjausCVLvyI3nMXbXn9lQ0tdgj9nU2aMvnvoCKDvNnwvizmto0DUQG4xLX4ZHF1niexKdzUUNONhAUgBHNBvbaqOQogevGh9x/30IgN4vdmBFiMSk8cvgUg4HuROtQtWPVe+C+N2XAzStRjYZt2KqOHvoK3GsRyyph/4HxN1324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671482; c=relaxed/simple;
	bh=/zY5PMOi310ktVYGpnYfeiQf9K4srfJWKah+xam5yrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdwJ9NNnxBfFxxMHzc30pfRAbINVBxHZIzwCLsj3w0dNpJsizLm8LGXv1juUU4d1UwAQJW6hDDX9sIyq5qD6IHZf/q4PjtkuSNkzx9W0r/S3jhFzhdfNLjM8q9lG4DCy9yo3IGm9seUnLKG2JcjbYqWMDlrpLSvf0UYZ4K5GMU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8brhnrO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8brhnrO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so50217295e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 19 Aug 2025 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755671479; x=1756276279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm2V1odyqTiqeUQ144+lcYOoX8xxycxwVvudsLtseZg=;
        b=A8brhnrOQxnEZFyuTyfbF7e48dRJyo6tdkw8dfDNYcC9AQT3dnQLwpAj+wP888IXW0
         7f004OI1t4NHmPO4jtu3CmWTA+vKsawnXSk5fpMqjk2nWT3Pz8GB8mLPknVh75h2Rx69
         jSI9TJSJntxHayXZ03tlHDCAzgEDrIW/HJLnmWLGsvNDsvYkr3LAUYPa+ipoJzilJpVT
         940/copLF9WrQKGIhxDirVBOOj2GMps58SmaIQcQKE6aA0NkGlpE/fOtMF2h1GhPvXnG
         cgxbhhYNjvUIhSv28p1vnC93nciRU6dOcYXL9rOdgbfVV8Hkl4IBCEpIPZQW9lbyPz45
         iU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671479; x=1756276279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zm2V1odyqTiqeUQ144+lcYOoX8xxycxwVvudsLtseZg=;
        b=U1TD6hfF2LOVSX9O94DDWvbNLtaDrUISFgIQr2ndqx4jMJw70JYxY6kuL11n/DF6eN
         r4F6yibcvDIfqTneS/k2j6yi7mgKQukAJexXiS927YBtBzY/sj8afaZPOZ5rNa1W0GfG
         aNb75ViVA438vpSZj/KKuR4NwTEs/N2o1ngvAEZ1/Od+VB+79ognAV7YpPGC8Amrk/SZ
         vpCTqnzv0GFqaR8nJ5M7Y5dbENMbHBUeC0yK0Z/ZiF/iNF2hXpeRZeu6mY9jmZQGvFGA
         YpibCaxb554mKJzaAHdiUmPfPE+iiXVKXUP1GbvZeASNQ2Hu+PMwt4COos/ZwSyDpyze
         VL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAeHizs7SjyWfo0Evj9jpXTH+SyRVHWETkjnJRJBmJ6i1c8vNa/U/cwpZ56YD1EZmxHeI1PUL+6RhfWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjMp8yvwcdvj9VhJAT1XAleMInvN3LubE8haX4XDVdehUbFhz
	W/Tchh8Y0TStp6u/6qmasR5y9msYCdiHqoPd3R1dEP67HUrvpa8tVauO/aLWSOYIbV8=
X-Gm-Gg: ASbGncumhBS9fuDkdpr0lZG6/E9kLYTNIwrs9lKsC2OVsp3DqxObAOoOY5+tlHMiel8
	568SpxOexQwTkc8xgYE/PJgGwt3n5NxXB/9Z/+uWg/cS8Perfo8iFvV3aoQHCDC0ihRCrjzOPa1
	ysDhq8hVkAl0MqjxpoNbF6nHzG3PUN/WfK/Sm6bjLSkV6XOCD1q+Oux8PRzsCaBIbtrOO1j1B4Y
	u0xbm2DRL1A1fEROV4NkkBimp2SzLrglho+CpGMjzGD1TgF7QnAFimqoHXkZZZN/sbmQB8wb/wd
	fZ+KqZl02kT9p2M4W7qCfBzopWC6a8UjUFuIqvfO4JmmJ96w08rtPkRYAYWkdz4Ar0Z97rAh7bU
	sVXK8MAyTPv1r51FYmk3fMUTRSLQegXwdpcusAawUC1EiCcumuWXbVQ==
X-Google-Smtp-Source: AGHT+IHD67e0X5QiTWO18n/Hjm63pK2HXsKittHH1LjgztM5w2vz+Tz+Iiy0mNFamv15+XzTSBAF8A==
X-Received: by 2002:a05:600c:4fcd:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-45b479a3e26mr11414505e9.12.1755671479001;
        Tue, 19 Aug 2025 23:31:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47cac162sm17779485e9.20.2025.08.19.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:31:18 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:31:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: nvec: Remove unused NVEC_PHD macro
Message-ID: <aKVrsrvMrTEgAY4R@stanley.mountain>
References: <20250819194430.4525-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819194430.4525-1-mohammed.guermoud@gmail.com>

On Tue, Aug 19, 2025 at 08:44:30PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro is a debugging helper that is only enabled when
> NVEC_PS2_DEBUG is defined. As this flag is never defined in the kernel,
> the macro and all of its call sites are dead code.
> 
> As suggested by Greg Kroah-Hartman, removing the code is the cleanest
> solution.
> 
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

