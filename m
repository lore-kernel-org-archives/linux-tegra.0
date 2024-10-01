Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575F1B5820
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727810412; cv=none; b=OakusK0onTBCXb4Hys6iLApw4c+iRTJNse1oQ6UPlXeSeqOlV0mIncXesuzAYkYCcYbY61OF4icLKO6PrgjgEhdV1NpC2XWkqmWvdMfriPaFZyMaBPTrj8LCH1IU0jy6BAw88u+VznV8KEAgIZfmMAa//gxmuBkYccPgjtTplMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727810412; c=relaxed/simple;
	bh=kq2xvLZxdaWkcmB+MAhw0yku2vbSpZAKRH+Avibs23s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDuIYwpHkAOmZmcJAzzHjQnDJ6gAwHmqG71JyFX0nuCDLM/xG5Q4ZA6I2vMsk/fSzRHOFcthjlEktAJdBqNuYy9K+P6Cl8NcOchOcosGTCU0hcgWrRpbbMOLfZdpuv25aNBX7jkV50ac//8OBHBJ0tCI4JaRgTzs63jpJl5cgKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaZGXIzX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaZGXIzX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42e6dbc8c7dso7816365e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 12:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727810409; x=1728415209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X7oUfHVD/zSBV5/vtnDIcOyKi4N3BVSy+Hr79G29wfI=;
        b=gaZGXIzXyEG8/zF7LbZ9nfwLSjrI1VcVnXyTPX/i+04MbSyGdS/ncMGcgUeynA7X+A
         rzwarERf5iSbbudIw+p5dmlfZuTn6FkgJfKQgc/H8yV45B/cyCqJtPTWK66iSPC2C0ac
         /U6NkIm7ZaIztvCobwfByzQ2liEYFu1i12RbBkjgpwGz8LIv9ovhZ6IMEnnnzZiVtpsB
         xewrqfznuI8RokUluYbUPjLHFTl4/5w8ZZKkLSb/w1mETUXw7Qq293iVjsXFgQI3LQRn
         5MAl/tCCe2nCH7yejAm/yYzqQDK8UJsLZoCPx9n0CSDwtSNXASDyMl8uSj8bCYhseC9g
         qNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727810409; x=1728415209;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7oUfHVD/zSBV5/vtnDIcOyKi4N3BVSy+Hr79G29wfI=;
        b=jo+oDVjYzLHctboDF5TyVidZmQ3xnEHkymPYj1sEd0UTRyXXuBC5uHGJR/6HgJfmDo
         0Cgnawt+AhWZXJIQ4qc9baWjWCoUip/T0I3efuH+azHp+TEhpb9PXOUfGRRNhLHn67DG
         kRLZ6BYtCTTbBoFxsMI8l/2aE7xQsfquXDQFZK6LshLtOCDsqyq+y56X63p7qWFF5p4y
         3UFVlPPcb80T1kJ3v/mJK3VZgwZNbYHnanNswu64bKXxY5DJiLNzVTThrOEokTon6SSE
         YV0+153iTod6tfIzHv3PtL+Dx075Jkhd6Qyo37lI/juWjF81IM2NAGUnvAG8dZP6IY7V
         nFMg==
X-Gm-Message-State: AOJu0YwBf4k52zjyKmXPIrptEs98isvkHohBG85tpaUyW0MQH/Wiog7T
	L0Qk/Tv6/wiWX151+/Co+PCNz0FYJmTC2M5JcioEJ9wg3PrEMdhtjJ2cJbGR8Cw=
X-Google-Smtp-Source: AGHT+IH7n5Z7vnNOtwgXzi/wiEFtziE1F2Uw6ldOh6JcGBoycMdXqACzNUx2e4CT9eS0LPWkXj+cNA==
X-Received: by 2002:a05:600c:3b87:b0:42c:baba:13cb with SMTP id 5b1f17b1804b1-42f777affd4mr2024205e9.2.1727810409051;
        Tue, 01 Oct 2024 12:20:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6857sm12517132f8f.51.2024.10.01.12.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 12:20:07 -0700 (PDT)
Message-ID: <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org>
Date: Tue, 1 Oct 2024 21:20:04 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
To: Gax-c <zichenxie0106@gmail.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, sumitg@nvidia.com
Cc: linux-tegra@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <20241001190953.31152-1-zichenxie0106@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241001190953.31152-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 21:09, Gax-c wrote:
> Like commit 90ca6956d383 ("ice: Fix freeing uninitialized pointers"),
> automatically cleaned up pointers need to be initialized before exiting their scope.

So where is the early exit?

> Additionally, device_node() should be replaced with a proper freeing
> free function of_node_put() in this case.
> And the pointer need to be initialized to NULL before any return statement.

And it is already.

This looks really bogus.

> 
> Fixes: 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node handling to simplify error paths")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Reported-by: Zichen Xie <zichenxie0106@gmail.com>

Hm? How is this possible? You are writing this patch, aren't you? This
is bogus tag.

> Reported-by: Zijie Zhao <zzjas98@gmail.com>
> Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>

Where are the reports? Why three people are listed here?

This is an open source work and public collaboration. The "Reported-by"
usually means that the issue was reported to us, in some way, usually in
public. Can we see the report?
Otherwise adding non-public, non-verifiable reports is useless and
clutters our report-credit-system.


Best regards,
Krzysztof



