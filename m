Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124FD2D1917
	for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932771; cv=none; b=ibad+hsXu30RS7z7o2if0SbVOs2PsBeCPbOWs7kfYemLqGKjdaMuJLkiMh5jCF+/Di+GFCofQKPSGuF0j4aUxRUK91l2VOgqYogKuwxh9oJnKFkGY0IgT6wpdGY6pNzUEolom+JBZTLTfxFSAS+WSiJf45sO1Bhb1rFMUA3MNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932771; c=relaxed/simple;
	bh=XePYFUZFOmGANaCFVWnQbmv+MH6vntg+h8qSytSplf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ok7QhpkYrx/KffMXO1VvsRJLYgG9CvTQzgz85KLmT6cnPyUUFex6y7wGer9ag2PZC/oVVUnvN9v/I+cmS7ZQldyHZoQ+oM1Yv6MlggHZYYHCB23lmI8mtTJOKUIP3wH7hr9Wznn++Aqv/cnGyMsksbvt3CaAiOaIf+xW5E1cQ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfLos37w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfLos37w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so41658225e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Apr 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745932768; x=1746537568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSBA2FVneKH15/yfDJmf3I99yTke3ZzCIPR7/+gqo2M=;
        b=MfLos37wyS3I5VBUmgD+VaBnXnH40VtAmbdJhaBIIdWhc+ox6RjTxT4fwk0xmxeNDL
         chdR52l/LX+Tikd12zB/oeMvtJFRSqgsjL2rnPLFe2ycgLao2rcElTPNWDp48roq/XaY
         NewmLaQ+Xx1BiWDYzgxK/pe2kzaBY+tKA2fEiYD/PMTajJ6xS/ZwXtrUc/R0W+s+SYGz
         jjA2LvB/SkcqpWvqY6QHCSi5Ulh87lRROAteFBAAd/s7fo3yuxIMp/p8MeqFfEYSmoZB
         58Bg7gZFOdMD8/Pv+RNxP+LvDE4QLM3p51DYw1HVESa2LmXbpEtYXms/ZYw46gn5/uvt
         bJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932768; x=1746537568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSBA2FVneKH15/yfDJmf3I99yTke3ZzCIPR7/+gqo2M=;
        b=uyZQ893Z0jL3G/X8jNGaty0yFiXI0I7mkzbdTENO/HZe2VIlUNgd6Q2nmznC/j/cgi
         wsNrz2WUKi7bYUDOBgi+xBHOkTQBXlkM0dwrexK0lx2cP9K8Rl3LaCXdKsJ8gDUDf/HT
         YI3KXmpJzPpZZeDgzubpBZ8cMQCyvpCcwlhdbYtCgBoCbJCoXtru//RzeUX8WgbDvPgY
         7+wk5Ak9xmCjNHeI1Vy53kjGX1lx/O5sEwRlT8VozwVsmIdU2KGxLgT6zmQDEiHCZIOQ
         0tZstHaHdFyX/bcUrfz9+UofdKpGBAvfXb7R3qARvM8npkj78JXgBkt+bVjbzARBVTzG
         GSqw==
X-Forwarded-Encrypted: i=1; AJvYcCXQlyyzBgyePlwhdU8w8eabLLGmVC+LQRl9iIfKY8gNa04qPdmXOF/P6FwmuFRxVf3Vo/kDCAGGmIUxaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPHmsT7gl2ncYa1q1DQE1kz7vqOcCKBY3iQMU7TPSaXZ5NB0O
	biARexLlLHhQEyWC+7hBfVWzL8DF803nA3Qtusbt432P0Dw4GjvW6qxE3HuncuM=
X-Gm-Gg: ASbGncuZwlj3TEQnXi48PbKqcqxgjUSCN0/mRZQ+WwgawbUg4fJmIuJ/c5HIf6uAHcA
	ZJbn/MTvJ8fqcm8n46Cif+lSpL9Ddi9SWz2gQxacccEP64QXtVX7aO6lc8HhaNKoQ+reGQUKZsh
	PDtodFNhMsTx7OMXNF4hkLlfnb400IcaTwaFhhCM8CqrtIGFySQ7Z+a2NqyVr+YCbLNpVmrfOWo
	JY7KYs6ZaZBdBlUM1aF1n0nS0YjF/UxY7z7Zpo1+2Uc+3BpjE+dQEDvbNS4XhBqRVLm+6LpD6pA
	td4ehKc+IHv+T2CvbxVxt56ijPirSO+C+VoOoiq3EyOsJD83ToPpEmoQIqTKaCMKzHmdYlsxK0L
	DztQL
X-Google-Smtp-Source: AGHT+IHAYw0/lwXakKmjaC+/n7Ew4ZuEbD1KGM7D3NN5C8KbtKmvLbCZ8/H5NgImD03ODoBSykVgJw==
X-Received: by 2002:a05:600c:4ece:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-441ac91d66dmr27017825e9.33.1745932768416;
        Tue, 29 Apr 2025 06:19:28 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-440a530324dsm154990655e9.10.2025.04.29.06.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:19:26 -0700 (PDT)
Message-ID: <0fc89d71-6510-4ca9-a789-290e1818798c@linaro.org>
Date: Tue, 29 Apr 2025 15:19:25 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Jon Hunter <jonathanh@nvidia.com>, Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, tglx@linutronix.de, pohsuns@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
 <aBCU5vec0XMX5VRz@mai.linaro.org>
 <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2025 11:15, Jon Hunter wrote:
> Hi Daniel,
> 
> On 29/04/2025 09:59, Daniel Lezcano wrote:
>> On Mon, Apr 21, 2025 at 06:08:19PM +0800, Robert Lin wrote:
>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>
>>> This change adds support for WDIOC_GETTIMELEFT so userspace
>>> programs can get the number of seconds before system reset by
>>> the watchdog timer via ioctl.
>>>
>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>> ---
>>
>> Hi Robert,
>>
>> I realize that this driver should be split in two and the watchdog 
>> part go
>> under drivers/watchdog.
> 
> Are there any other examples you know of where the timer is split in 
> this way? It is not clear to me how you propose we do this?

Just keep the clocksource and move the watchdog code (everything related 
to the watchdog_ops) to a new driver under drivers/watchdog

BTW, there are three clocksources with the same rating, what is the 
point of having them supported ?

Is it not the architected clocksource enough ?

May be the clocksource can be removed and the driver remains a pure 
watchdog driver ?

> BTW, for this series, I just want to get these updates merged. Any other 
> re-factoring we can handle later.
> 
> Cheers!
> Jon
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
