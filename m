Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C920DC4
	for <linux-tegra@vger.kernel.org>; Sat,  4 May 2024 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714825213; cv=none; b=Jx6Y23tZ1rvXBqKy4LOWGYc2V9qeGf5jnIfLXWJ9BQzCVwg5jStljuT3C5/g/Tjbos0JJILSXkFKQzsmRzSPFhRnbcl6jX7vBPojzlxQ0QxDly/szCtcEHbyU9IPhMR+cQFz2RaPW0gpYDt4Xd5rzA3kom7IQWZQ3YnEdkeZ04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714825213; c=relaxed/simple;
	bh=FX7V+9wVvkr48XR4v3xJoIGUmCB4DyZG677snsG+CBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o1GU1xHn2GB7wgD5qw5WyWlhrFKAVG1eurL1hmt1NQL+9twgbFeGz2XfSsogLiIq3FWXW2AXIi7G9y/k+83RFhoZ20yS3Tvu85lvQMnsp1VzuengkEcULM4K6cWSnhF4QIF6uZO7boEGUxXDk9lL8XxyLbEugP2ZlozL/49yvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsUgWoHi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsUgWoHi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41adf155cffso3748325e9.2
        for <linux-tegra@vger.kernel.org>; Sat, 04 May 2024 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714825210; x=1715430010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPF/Hn0p/4Gbl6AJFa71x8oXhaS7YL65AcNMD2/YSKs=;
        b=JsUgWoHi7l57JGFEWSbt6gUI0RobOoJxDM/PMJergSJdsRA11R2G7zvWT4kMGoeP7B
         C/bZdTpWN014RqkosIMIFQUnl7r7OLL0R0l42lUtrgzDyOhYR0oa50SItk72SvmEl1Mo
         Aa9jjpsSfVwvOq4tjU3NqnrNjm1Poh/QttD4Ae6HqsiUqQG+qiTXNcgfytYRDHsUAOZS
         HWJt3Lat+q3rjepWaeFtn2CF4FwhyWsgK3Y7IfkumsmgqIvhXlib9RxFUQAJyF33iLwZ
         RGtgdfi6B47BqeoBN+N+ZOJeupNluCOi2325UkLPuBFcrHiDHx5dxLCL1S2csjKDWX1E
         BBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825210; x=1715430010;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPF/Hn0p/4Gbl6AJFa71x8oXhaS7YL65AcNMD2/YSKs=;
        b=TxJ4OB9Qt4FP0f+U0oSwMYnL/JLx3bW1LrGx9956Oui9sVeGO2okq2MB3E79NgShuL
         GlYOqtRpx7HH+f1cgfhRbmYMWRMUrxAn21HMYwfbeeS7QyX6Vld/7bp39p9v2qnNv7pl
         ZcQtMZPFfspHE/XwtS6aqTvcdPQCd+NMBiOEdP5cU0P17BSWMEpGmk3A9aYbjy8HB8m/
         GR3+SEDhoH9Ple1JbAZMVQu29jPDZOxIQZyu2R4K5g+39zqWOrjcHrEjkhCTKibgchAo
         xereAA/7L5Ow1+qD6c50cj3wfEiQpZZzAnd92Kl7BEBlYuozfOGdVDvyFG0cVskgf3+5
         YrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOcO9cCnj0i2NvZZS+DBpMKjFQyOYTvZZjUmfdudZIC55FJZv1zg34pjdDcHthXVxHqJarPfqHrT27bSAr79hMLTkH7QVajoM6hXg=
X-Gm-Message-State: AOJu0YyoZdJcpN4DuYJmv9WIj9l2T/nzIEfJBGsIiMUShcphzL4kY3ab
	on4usvsLRDROF1mv8tgvOiHoDB0wQDo5wREC86uRmMCVLpXbQjiDu0ySeAQJWJQ=
X-Google-Smtp-Source: AGHT+IG/g4CmsO0FXQ2Ul7yp+WBoNYFdbyexFhbSNg66ETHKOWZJL2qx+irCMP6zvS2L+QtX4qx45A==
X-Received: by 2002:a05:600c:1911:b0:41a:aa6:b68c with SMTP id j17-20020a05600c191100b0041a0aa6b68cmr4114943wmq.6.1714825209815;
        Sat, 04 May 2024 05:20:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c470e00b00417e8be070csm9025520wmo.9.2024.05.04.05.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 05:20:09 -0700 (PDT)
Message-ID: <0aa33c8b-5167-402d-83f4-c65b22d1c257@linaro.org>
Date: Sat, 4 May 2024 14:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Cleanup Tegra210 EMC frequency scaling
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2024 12:19, Diogo Ivo wrote:
> Hello,
> 
> This patch series consists of a general cleanup of the Tegra210 EMC
> frequency scaling code for revision 7.
> 
> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> that is responsible for too many things, making it long and confusing.
> The general idea with these patches is to simplify this function and its
> surrounding code, making it more modular.
> 
> The motivation behind these changes (besides improving readability and
> maintainability) is to make it simpler to add support in the future for
> frequency change revisions other than 7, where we can reuse a large
> portion of the modularized code rather than essentially repeating 2k
> lines of code with minimal changes.
> 
> There are no functional changes with this patch set, as it is only meant
> as preparation for following patches where revision 6 support is added.
> 
> The second version of the series can be found in [1]. v3 contains
> changes only in patch 02/07 where a variable is renamed in order to fix
> a build error on some architectures.
> 
> [1]: https://lore.kernel.org/linux-tegra/20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt/
> 
> Diogo Ivo (7):
>   memory: tegra: Remove periodic compensation duplicate calls
>   memory: tegra: Move DQSOSC measurement to common place

Thanks for the updates. I was hoping for some reviews and tests before I
try to apply the next version, thus I want to give it few more days.
This also means this won't fit to coming merge window. I plan to apply
the set after the v6.10 merge window.

Best regards,
Krzysztof

