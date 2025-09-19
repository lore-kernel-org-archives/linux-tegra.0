Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE80306B3D
	for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296110; cv=none; b=RVXpv4U1O9MPYC7iXH6l/t5SpdrOHqbxXQNsZGVpGbTjK14+m2ui8iRf6YmwGHiWVPCBPCmqoFjnt9BcfPGSSBTs4+ZoFdi1/dlJPIfTEq2YYomaXvsVbo+wxH7eXXFpd8clWYFT2JLgKKohnsw4+rxxINR8h7J4jenTIPWKK5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296110; c=relaxed/simple;
	bh=eTWf0PO9mv+rTbVMmJ0b0B+mt8XNGOqlZu172ARy+Zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmwOy2XCiJ/7fEK11jQlO4GyltLDYUiHoQ3PFHwpCt3nkUZ78sqrWG8/ZPsarPp2nqrZtD+EEl5LREsX6mMVLyxUAHETYEtK6b+xXd28ce843lgPJZ4zVd3l73XkB0Oej2jA/C3AeHVxJbDJpz5qOixpuBF/ryWS6bYVesINnA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AoKi0E0+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AoKi0E0+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4619eb182c8so21283015e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758296107; x=1758900907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sg77gnAfv1VmZ7w/Slv7Z+RDQVw26Pq4VwEULeHQZFo=;
        b=AoKi0E0+zbXV6pwQhkC5STDf/iOc7ZySP4oGbYXB2bBuMzX6g7sBnknSRVK1PWag/t
         UmlmKiijet+6tegsWbw/izjd4Iw0UfyJ+ZkpLqGWXgB8iXggHTZPTbz6iToyahK+b5eW
         xRpW1W8V/a1psM7bic4Mu5JG70LzVv9KeT6fGDLc8KCIPnA6qG7Pzn10T0ot/CfdC8Lc
         ZoOrQIs8jFSYxeN5yNHub57zEwoLKX8kQeMuGb6qVdjul+hEOBOSDq1KR9jwz/3O/b0O
         k1lf1dPMs2XQiTPms8sIHTn4qcfu2+tecx0fs0PtxKpPBaXVve2IjUvesxy+K+DDjGsE
         gJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296107; x=1758900907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg77gnAfv1VmZ7w/Slv7Z+RDQVw26Pq4VwEULeHQZFo=;
        b=umHAz4XSnqE68AXBFB9+HxKlRBItdJbqH8mWcN9EAAr6kRDVVA0BOQ6u5p7M8iQ5AS
         kXg1WbUGLRdZAroz+tQ+VSLlk3IKl/NWunYliF+yRuWDV5RujyKLAEpsfPFMBlBZlzyF
         pI8SdY43PyNSl8KPpr2khf0jJjIZTYoO6UfZCBI8Qv3kfdys7kMxBvfC9p2obhTILgik
         jVnqwUCnQ86ILiWITZvm4QI780GO4TkTg5TONluVUEtSFdsbKrFg8i1g3j5jCyoalDFI
         geS1lYKnO8QByQGuFwV1lv34Vh4wV5TmgFdCLs7C1induXval/SwZpS4kxzoLvfRqFnU
         MrpA==
X-Forwarded-Encrypted: i=1; AJvYcCUdAuwmAUATG2kwNQbp4XW6ors3XGXRPV84anSbEKMwBlFco6aT6iPQiGdqNo7weghT82GtsC+cGMhD4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YykD6EjVyXj2r10paLbuRHyXHiGNkz+xF3ROAASa7EIqv/yNDzJ
	RZQKwWOSjjnLimvMUY9ATZj/lfRpSdWmyUe7zw4jnCbKAB7VZWNLEQmlpzz4NRki91I=
X-Gm-Gg: ASbGnculYWIHMF0BnT6vDg++5OOq/5g71yJgHqc+ZT+te8ml6HXGcV0mBHXucxVTMGZ
	GYdXIqFOfYk3YPkEosYwxQP0t8Mn0tP7XACDy/B3tLqA636JsZ9t+x7u2i2HcYcf6uE6AjTmksO
	3UkFdD3+I7rkl5ctDgc/LK0vbNrnPIUITtt42bJij9upTbFD9l9P8HzC7DOs4vstVVPmf6EPseH
	fYMgMHWW8AF8k/vwujmw7urzQXnWH/4dcDjyYP1KyalC7d7OHibBBTvkYejghlU7N7fXco+l58S
	I24dAURLo5Athg/dyPzjG+KZMyXWTg4qJnDybCrMSheu6j8arLsLycpuoPf6DdsVmeR2xNO7ER9
	iz0VkRgVso2hDdH91zW+5u2XEKxOADcx4TSgdynB11jSazLfLzJY1gUo8uWJ9pdlq//KLnh8dCm
	k+mA==
X-Google-Smtp-Source: AGHT+IFy7Dj8N6gYfL+jhWcvEkvYrz3Su9+hU8mu+33/hZoSVy239ih6pL/rb05L3vQtZWkPx65Y3w==
X-Received: by 2002:a05:600c:3587:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-467eb603b52mr32347595e9.36.1758296107505;
        Fri, 19 Sep 2025 08:35:07 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46139123102sm128369815e9.9.2025.09.19.08.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:35:06 -0700 (PDT)
Message-ID: <013d1911-50f8-4891-823b-566bd90a0601@linaro.org>
Date: Fri, 19 Sep 2025 17:35:04 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] thermal: tegra: add SOCTHERM support for Tegra114
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250828055104.8073-1-clamor95@gmail.com>
 <tdknls7jieu4ple3qhmdqntllmctks2auxhxzynwjjmgl3hnx2@nubqlzpgohwf>
 <da8aa4c5-4aa0-42f6-acb6-55d37cc29774@linaro.org>
 <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/09/2025 12:26, Thierry Reding wrote:
> On Thu, Sep 11, 2025 at 08:56:12PM +0200, Daniel Lezcano wrote:

[ ... ]

>>
>> I can take the patches 2-5. Regarding a shared branch or wait for the next
>> version, I would prefer the latter
> 
> Alright, let's do it that way. I've picked up patch 1. If you take
> patches 2-5 now I'll pick up patch 6 once v6.18-rc1 has released.

Applied 2-5, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
