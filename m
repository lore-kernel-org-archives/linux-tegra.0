Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFECB14A4F0
	for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577980; cv=none; b=UIzNzLqtZy4y3kT7RQ3p/k1zBr/to8T6XN4eus/t1f59oG61Wlzs+AgniSVxf4j9ZbuF94K5Rbsipmd7ZTUySvnsycvrflvOQr7LO57DrqByfyS1WZWNJSlach8OVTub0ZJbXTFD/r96S89aYudOawknzKOtGy8yrZnzAxCtyn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577980; c=relaxed/simple;
	bh=QjlB3EVJG4noJpnYxkPnqJdza5KENH0qTqOv1DlQwsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzTZfT8jAZRAtG3lvCDUMKJP12UdkEmQjQzMaBWq/NKOlXsII6qIJr0iFUVF/mkQLWIzw7WXSeBCkXR6gkx0maTe4TSlYWXzvTREyye40doycgjkGQd8e+so7zwSP7A0bAzAfNizOt/1Ozk49OvaWWu+SuI/R7W+IegdnDxt4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evCpKkFR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evCpKkFR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so4111440f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752577977; x=1753182777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJh+7q1eOpzJ42XzUVjV8JoewjGDoVDjvqBvv7u2oiU=;
        b=evCpKkFR1Qj5ekP65cTIsLtM2ewO5dhQZnH9Rp2jD80pO8RfEyotqwe1PkWwJsGd7t
         veKkPAXzboPDC+YpSzA0+pFj3y2yFO+f/TbPnIOVn0Hutc0/P1/L9ts+6IMi9cKJJMtc
         4WMrI70CHOYnSla5yWipDcmAiKa1bh37B81k3ug0qJ4tzWeHEbf70aNnveY/3sSk2XRs
         KsbmMcxouIYGi68qeRAJNIfDvt0kT4ul6+YZfq3S37JTbK1PuJZ528cqOiRF0P4uXjIb
         +oT7i8w7UyqZCdYbWZjeFwaK5ahp5TX5YgENPDlxz1QT7Svcv5VAwk1gJW0RxMJsoyji
         cuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577977; x=1753182777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJh+7q1eOpzJ42XzUVjV8JoewjGDoVDjvqBvv7u2oiU=;
        b=wSiCy7MgO9NTBJq8Ltfl2OK1Tvvuj5SajxH04QgxmeJwinCa5KPv1BAvifK51qwNfc
         cd663G2x1wFQfVA4IV8kMnCbpHGhHnTw0NO1jKMwkj4Wqoy7Q7CZkvrCvEjgVMMdkx+Y
         MCIVZNw7GHFIM8i12P5o+AjOu1Ad2rhMH4A17oEyT8AR292Wyy5UJfGximkPZgVgPtul
         /aaR0SZfubUob6rdk+wrrSoXbPJ4c9Ea2zMAXCmT+x/2vUEbY+hIffTzZGk5eNtXnAn7
         aW0gaITp/BOUxAAKmqESowU2LpHh+sSSmbkpKYwiqbOBeqbdTbZ4k5B+YfMXSBgSvjHX
         9cMA==
X-Forwarded-Encrypted: i=1; AJvYcCUX7jRSNouTpf06PDXvjKNxHbSCxGksnMTtjT38mQC0oqqPtwOm9sOEy4STDFrnkyN+Zjvgq/0fsAEmEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiByykuMdk03Dg8ozIgXDPeao9QDd+b6lUKfm9oyzjf1QAHQ+N
	RYuC5OMoc6B2F5OOMcH44zeit8nKfIS+W2l6bu0xbOxC01x9OzqpU7/vBvTkxmMpeuZbk+0KcUi
	RCe1H
X-Gm-Gg: ASbGncuXF5HvXO/rQBubniHc2F/J/PQpRYm+G0LGkC8lbakcUMSVYdSLiQX/dAsT5AP
	ZiirxMYLpth/wQhqk3nGSCERb3y9USjMV2kYOY9kkxsdcV8BPgRLmYLOlH51TwHdOP7eiaKkicP
	XaJGii37RmbcxctUNB5KEdFuqWkD1P3VJD3k9ugSPWQJO+v2yRIPRmQDMHz9l/R1+8piiSDFBri
	dpoAbOwj1e5i4mi7MxjxUq17GXge2wow8M+UFMFMLdzWQcWvIf8iEGgblwb+ptxmcGwZFPe15lI
	gB3SsWK2QGfQIgWLbIoZRwrnGuOdp3qAI+CfoMEeI0pZ4QPfkwfmjxQATh4Jxoh21VLECfNRqa6
	7u0zW0PFzll+fZRI4TDNnZ5Fsa0Y1pHDoANKbiVV39gumanK0mLUYFweyRR0ZthxHxHADVsHmub
	2IjyuN0Q==
X-Google-Smtp-Source: AGHT+IGMVUMJguL2cflxNK43dXfTYFLsqWOHbh7yPT6QOS16E5yWVhsLbsn3U12gvujAWUSQV92MFw==
X-Received: by 2002:a05:6000:2c0c:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3b609537356mr2403931f8f.27.1752577977077;
        Tue, 15 Jul 2025 04:12:57 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:152f:ac33:4edd:64d2:2be5:6ffb? ([2a0d:e487:152f:ac33:4edd:64d2:2be5:6ffb])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1833sm14462172f8f.8.2025.07.15.04.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:12:56 -0700 (PDT)
Message-ID: <0e4bf420-2d4d-4040-9996-d6f439fa0763@linaro.org>
Date: Tue, 15 Jul 2025 13:12:55 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: tegra186: avoid 64-bit division
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Pohsun Su <pohsuns@nvidia.com>,
 Robert Lin <robelin@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20250620111939.3395525-1-arnd@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250620111939.3395525-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/20/25 13:19, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added function causes a build failure on 32-bit targets with
> older compiler version such as gcc-10:
> 
> arm-linux-gnueabi-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
> timer-tegra186.c:(.text+0x3c2): undefined reference to `__aeabi_uldivmod'
> 
> The calculation can trivially be changed to avoid the division entirely,
> as USEC_PER_SEC is a multiple of 5. Change both such calculation for
> consistency, even though gcc apparently managed to optimize the other one
> properly already.
> 
> Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied, thanks

Fixed conflict with 
https://lore.kernel.org/r/20250614175556.922159-2-linux@roeck-us.net



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
