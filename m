Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8EA2D9EF4
	for <linux-tegra@vger.kernel.org>; Thu,  3 Jul 2025 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546528; cv=none; b=lXxgy3j6KMME39DLtHXvQk2LNQVItEQHLSzpq8QmplzRZxauTIFb5d48JbKwLxDQLw86OZ5k6IFAhYh/WXpY6OGbcR4+oMTXjxudobmFvkc9wEtMzxYmhEJ94OubHzcH/oIUvUTIHXfG1rvtxGmVzh2IBm0uZki/qw8sqryO9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546528; c=relaxed/simple;
	bh=0l0g609HVyh2VkxVYU15QrjPHSnVsY35u7bAI8jISDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFy2sp4C39PduBmqKxVTpQvfix3uv92ZiAw9z4mizYmFZy7xngf0ndeCuf3h91V34kYhJE0ASmw5W1YBmwy3Eo7WEa88g3tGc/Y4z808asHEZgXx18B6RXGjWcqC1OQzgsaQhU+lJAeVLtriGENJY+DqSnx3RBygozdvCEYB56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NupuFHo8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NupuFHo8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so33218705e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jul 2025 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751546525; x=1752151325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5p9HSXMAZ0v2wNzjZpRgTRLF0wQRlJMdXlU+Zo+kCWg=;
        b=NupuFHo8xkvLzI6hU9QX8Fc2vCx2KitcSTFwk2GbciPWyn46QgzMbcm+s5DvDeZMDz
         c9mg5GliHC7tI80BfOoZGysHB32dga+PcJjYHTFl9uUUBOFx4FauLG63DnYSsuIhLitD
         d9XceErksyUEiMnzdkg8dqKXFV+D/Z3qZ6W/rR6EK0TkNMO7z2FhaKpOGW07VlYZwMt2
         MI8ApXkQBQg4va/Ho0R3xr+gdNDTd1ooAnRIR8CXBD9nJAboDNeaeSdXYCk7wGYYgDaq
         hQ0WUYwTb7qXErx0+xA0C5DC4UMnUyxsPR7TTqq1TYTwKSFBfn9CGIaZxV27cW5AXarK
         k6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546525; x=1752151325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p9HSXMAZ0v2wNzjZpRgTRLF0wQRlJMdXlU+Zo+kCWg=;
        b=qGmeUK3+Ya9bgFyiG2Lck1dt4XymiXICDAFqOhK+EJ8SisUq02ju18zwHUOGsfma56
         WHjSB+kXRP7dOgQSqu9/U3UTSXtDCxoOL8EkNax0hSuIYXMUlVGb519wZ3twFDZ21YKi
         IvF+W8/osMP4+nK72GA52kqo2g5zbB+XRMEB/B6peSal8qz0swWVesFGFrTKWv3m0D5Z
         bDPBzxsJQShcSuXPHWW6c8xDCMHb8vEMjibJojFh8e9B2g8bQUakK3WZs8OSQd0p3/kP
         O+1Szx++XIKM4vlGFSZFiL3KBq3IjZSCthMhjrmUSXVKHGw+AVv4Ycex1pUQQK4oHbpy
         zonw==
X-Forwarded-Encrypted: i=1; AJvYcCUNaIjDm8ol1nv2FKbwrygXrlI3/EDY7pINyZT3mRs8XOenBU5ADHZyvGXItAeIcicRAg3x2QE8kDQhMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAmOhCBfI5QGimtJe6P6GwNBWFWyxgPdiEv4gjvKUpR0NDi7u
	j97oRJ5V3w6bbufx/7a9JIPCGnlQS5dX/ALjrGJ6RnRqdnhR8N90RsqWj4cU71kU4L8=
X-Gm-Gg: ASbGncv05tgdo0GiLi/NcAjk1/tIQeRobi9/UWUXYkt46wzI9noTKwwonAM5d/NTLDF
	unxFFdJqmI+5PqzIdCjoVJ05rXYsNIfesEIAphml7BA48hO+z6SyXoD5JhbAOtRRluMCz7dqa9y
	QkKG31Fjp9W+BwVwc/5BuucPP4K1L0IW0Ln/1YzK6euL1RrLtG1y+JoQ83dGPmewvkWR96lebD0
	J6Xy6ypArJ3KsZBMRZJsRNKUzy2FqW0NocjaUwszSbARyTJfgpLjiXv6vdnuP3jLx0qJv8tX59u
	QOjiLFoKFD6vt3qyEcTLqGhDVXrs3fJE8DXoiO7OupbMJE0N5uMSntq9kpdb9fhk5hpOrnh0NJE
	aQX7DYwJcfeVpb1uJvEJptvfPAA==
X-Google-Smtp-Source: AGHT+IFkwCUP2Or9pxGcJZO0ugBdGvWqQnDw6EDu/auVXc2pvANU2o3HxgEpV11kUFoe/iQLZyFidw==
X-Received: by 2002:a05:600c:1383:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-454a9c62561mr32788245e9.1.1751546524956;
        Thu, 03 Jul 2025 05:42:04 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9beae81sm26706105e9.40.2025.07.03.05.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:42:04 -0700 (PDT)
Message-ID: <42399fd9-0fad-4770-abea-90511a72e0e1@linaro.org>
Date: Thu, 3 Jul 2025 14:42:03 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit
 divide operation
To: Jon Hunter <jonathanh@nvidia.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Pohsun Su <pohsuns@nvidia.com>,
 Robert Lin <robelin@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
References: <20250614175556.922159-1-linux@roeck-us.net>
 <aFq29Fr5c2TAZOYO@mai.linaro.org>
 <b77c900b-3b54-4cb6-8057-e5b7ca0fdfa8@nvidia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <b77c900b-3b54-4cb6-8057-e5b7ca0fdfa8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/07/2025 14:34, Jon Hunter wrote:
> Hi Daniel,
> 
> On 24/06/2025 15:32, Daniel Lezcano wrote:
>> On Sat, Jun 14, 2025 at 10:55:55AM -0700, Guenter Roeck wrote:
>>> Building the driver on xtensa fails with
>>>
>>> tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
>>>     in function `tegra186_timer_remove':
>>> timer-tegra186.c:(.text+0x350):
>>>     undefined reference to `__udivdi3'
>>>
>>> Avoid the problem by rearranging the offending code to avoid the 64-bit
>>> divide operation.
>>>
>>
>> Hi Guenter,
>>
>> Arnd posted a version which seems more complete.
>>
>> https://lore.kernel.org/all/20250620111939.3395525-1-arnd@kernel.org/
> 
> Actually Arnd responded here saying this version looks better :-)
> 
> https://lore.kernel.org/all/5a571236-7de0-42bc- 
> bfb2-52a57e210852@app.fastmail.com/
> 
> OK, to pick up this series now?

Yes, I'm ok.

May be Thomas can pick them up for the next -rc ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
