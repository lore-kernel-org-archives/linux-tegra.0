Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B8130EF95
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501274; cv=none; b=SzT/cVTcn0zxnord4owkVkIzW9nvaeHmbHva+mm5iYfYAM+aEE4BgJ0sNykPbAUNdytsqVLJYYzJk57FA2HycAPXoxKryXxxFGCT7uOD+6VGf8wjgScVnV4TZD2mGfFD3Bw2ptCDgJfOjgyWH8IGgn0stbYYNpXQO6OQRzknwp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501274; c=relaxed/simple;
	bh=9Hp9ejvaQMN0Yp/1s9eHGyHfNz2szACAPW7IT9Burtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXdD5efi5nTL+BsnVJ7L93q7WZJTs66+RT3I/3C4lwQ0MV5nldiFi5R99G0OwZQwSA/QIp6W5xhGvmqOYpB8KS9bkRQ6JcoFke5Fcvxv4b9+Ps8jq6Y8Lc72AL51tcVBssiE16yMBZs44jpxwL/zWFkTj9Jv9kkVXDqyQ4x/ST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhIeVqL/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhIeVqL/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso1497157a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501270; x=1758106070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Hp9ejvaQMN0Yp/1s9eHGyHfNz2szACAPW7IT9Burtw=;
        b=bhIeVqL/T0gEMDH1DqojWdGbjnKGFDMCA3fRtUfjrM9Beb9ncUQ7UxB8SlnSdfpkEU
         mekHaigLdvb2F/aiwLZd6FktV0Wn0Bb1/N96Nb78Jz8/Jj35MWiCdF3bSD3l+g/8Mhf2
         Zk5CGkTO1srYe0uzL2UyAtG7py3ElKiYh+86RQdXdQuzwVRkKVCdUr4lw8Lw3yC9RAou
         bn6N9xcRw5UOVPVBha00iJ56n6KSv5OzZmptfNKtuLuh7r0EgjDKRuB+okxLGdqqGKbw
         NT3PeMO2b7hbr4SZinMkNQMjFC1/Ampjgr0ynnmJ40gWUeKBVZdSZ7dfpimcD61XKpDE
         jt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501270; x=1758106070;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Hp9ejvaQMN0Yp/1s9eHGyHfNz2szACAPW7IT9Burtw=;
        b=dTE6EYhJLrmWeFL0su48drYSYFwvsc4znGC7EWqZoGm+amtAiGFbF2QKdmZreVWlNx
         n1olk5TXYICVf9YD4ac37xVpNg01aY25XNfTB48o655uuAxffFBenpVgPv9cx+YE9Qzq
         D3LRjAVwVQfIZKWqe9ukECaCiUq6dKpC0WID5+LZBs5zUfQhszNf15mvjkmP+XzO01ab
         uoN/Rcg4J0k6xe5BeDP5caICbgKDdudp8XgVvIgYeaA8NgYtpkjxxD0jkNfBbyV0rYOQ
         oehIrX9dJrMQO2yWNFXDBAsl39iceuqKOAwBK68tQgeWgj0zsDJVcM55zs3ky+3K72XT
         v6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVz4H/A9hnPY8TK7vM+Khx/JiBYmz8OlQVetHYJ+rMGWamICgTtUzt6PnzuVB7Hg2Ayv8VJHxJLq8ECTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LVDDMcm3tojEglT28saWZXPZc/4bzdSXsOFDzJd4KSV41sCM
	eCT/skhvrO+CQ5Mx82jzR195sZVOdClDkA3709I12FIrd7bJX/YfxE8kmm7ytw4LO9Y=
X-Gm-Gg: ASbGncvWv1QSMMLzeHJ+Tjbh+AI12DZrSnzAlheHUowtmcqWYhYb0an5TV4qMc+YNbo
	aWpOU/lpBL+i7U7RGY+qHDWdzrtlFkdK4cY3oav6SOsSpr53CFuzKZ8lKsKeODQBLvlysPNgCWT
	7TzZ/vzeYhv90YqmCEzOL9UAn3Ps6/WPILxgaD/2ONi64FctVbZej63MyhKgPyiysyG4L/mlOnu
	Ztl7hR/c1BNGax2s9elPYhuk31aRY7Xlfg/xE+MPhtck/0xPpU8EmtXFr+TWVXV00AaTJ5fRtfI
	yMLB/2a3jNu3zOxpkjgTHunYrlUxsi4ClVaLGrH4z8obyTWCqEGd5hsZtClqqHIPoAxDLLcvZMO
	z67/UlAGATDnrtFypZdYr3B/MDAp7MBUaOrHH5dQmz1w=
X-Google-Smtp-Source: AGHT+IEtrlqjfQ2FykxeoxLOwp0RvmlUbcK7ZTNxgfqDcDiY+m0P629zQJQOgd2W2fKCZCm/oWIZ8w==
X-Received: by 2002:a05:6402:42c5:b0:61c:b796:6e83 with SMTP id 4fb4d7f45d1cf-6237a42fc43mr7772122a12.1.1757501270531;
        Wed, 10 Sep 2025 03:47:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830451a0sm144342266b.21.2025.09.10.03.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:47:50 -0700 (PDT)
Message-ID: <115e4411-587e-480a-b196-a15a7187d486@linaro.org>
Date: Wed, 10 Sep 2025 12:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] memory: tegra186-emc: Add the SoC model prefix to
 functions
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
 <20250910-memory-tegra-cleanup-v1-11-023c33a2d997@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250910-memory-tegra-cleanup-v1-11-023c33a2d997@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2025 12:44, Krzysztof Kozlowski wrote:
> Replace "tegra_emc" with "tegra124_emc" in all functions to:

"124" is obviously copy pasted. I'll fix it in v2 some time later -
maybe some reviews happen in the meantime.


Best regards,
Krzysztof
