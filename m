Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E726CE02
	for <linux-tegra@vger.kernel.org>; Tue,  8 Jul 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751983846; cv=none; b=gmQbLYpOPpYSrfJj7n6G7e1aT+6IhBZEGlavgb0jXxY5jKTr8XG1BL8Q3g+SWSi7LmGm5rgxy4LvvHr8uiuNTWyvxgvUlxNruMDv92HQhzldGA8QGGozMc/zlcAJAilPYx122bsTCCsmWVMcFiGUIRH1TSfesIt4jiZzR9TW2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751983846; c=relaxed/simple;
	bh=6qVC/81iUn3tvRiNiz2aMOEHOZyxb34pDt1UwQ+S4AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFJZs2n2YzhekuIEUYOB3w9IfFikhvN0qHkj9U8bdc0xnYdOuU8VD2IYGtsG7r59wBkZMCKQqrup+BII2npa9ADMIms1Ij1r/MD3PQYU1ju86ADRRUxp2DZWvteGbpr9qNE/0AaqhcSWqO50F4H8q2KkvwY/tSRrRTzaZK3CMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RI/W+5OD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RI/W+5OD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b45edf2303so4156462f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 08 Jul 2025 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751983843; x=1752588643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbFRXo7PvgTjLeuBlkvvrU8m32Gx42ivaN7h1EVraoQ=;
        b=RI/W+5OD4JGeOgco/m1iHxKano6L3aZTkvGscBqbRU6u2aAWnSsA6M4x5I7eTWe2W+
         ulPBIn13053KUvO9Iq9JJdsLmHPKWT8vEGJagC2nxthe+KEwN4eaaNFI+B7jOp3KX8BZ
         1MrqpyPxyo6EOTwkWM1DlIUdVxo0Kh3nFQSdZuRUmJ1bImXPHDYgpNN4K6UhlebVAVkw
         H5y6aDF8+/6M0CztG/SWhyEUBx3O+axohvGaIKs5L94UB2D0olhVyn6VS4dvs6qtxVNJ
         hw9tkfOCkiPRdxmf/BZsppC69/D4661OoIYeaHtfAcmErUtt+WZjMsdX7yl/KmpzOHc8
         6PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983843; x=1752588643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbFRXo7PvgTjLeuBlkvvrU8m32Gx42ivaN7h1EVraoQ=;
        b=e8sr2sw9ciQ/Zwgs8cflVVEokdJy3PbZhwGBEnweIy/BIOy1y5frAWWnj8bvj/xiV6
         EIbjVHZlj6xmdCa2uAG1f60U0KvgKJbCtZhbEY1LDYGbuT6d2yzzzClBqVeaP8f2PtEV
         sy1LR/gd77hYRG8NLdz+utn4nRJyUiPnWVAsKXJz1VF/znE+OhygIc+Yz1EtqKETSpTZ
         DbBwCv3G+UbSUU5hMQoYlvPOWKZp4jvy0NkFM4O3EmVpa6FlapefJB3zv/kKIlb3snsV
         dXUzZd0P7DzfmLihP6zy1aZ1EuLF77s8HaVEf4v5rnN0MNyCuZjtbpT4ymgLWsm+op/m
         r5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyca533TSncFNBbS5WNncknLE3pw6Ri1IOWp0tUM5nmfoSJnx2g2JaPhW1mvH99lz0Szml5O7YFFJXdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkAS5yR2xpWs1S6nKSDZcTnblqdHvkPammRYl/pknyOEKas8L2
	k8VF/iiKd2jYVrgF83fcd+jY7t/g48ZsKRL8hTtcbNd0iAVyCqxH3S7vQPuxtlhr4tyhHosKcFZ
	JUHBi
X-Gm-Gg: ASbGncvWF+6ZSUUebknGR+j0aRP/Af3XKuhgluvaLbFD/9RSrZvYKgXxYXFWGHw+DoB
	bLjXVCIyyRNdDdJ47SouJvjK3vbLsZd0HRzh8/IAvPau7QEGgOoOIbTgNDC6emq7m1ET4ukbrYl
	4ZEP90qfPOroOmi0VR5T/vi6xDSRshZKinBlwPrVncPJhVBHnsDAQq95jA5rVXMHSIw52terUae
	3AK5sXiWIEWMbP4/Pb+Qdk63cqf1orfDsFma4tGpGSOWE18nWOnXSAcjnUCJUho0X6aOOUBssLU
	VE112aaLGjwH4L6QhfS7XXOeE8EK6LDiMQ8zl1uD79nngSG2QXesy5c0UHPpwwxwB8X7hnyTmJE
	CVGC/VWSD1LhsUSyO28VC+qOdqA==
X-Google-Smtp-Source: AGHT+IGpLRnIy1Pa7Ys8993jpdk99/IfEELNXoxq2vTwNBbSHflnXa/ydsmKxydaHxoVrMXZjys/ew==
X-Received: by 2002:a5d:64c4:0:b0:3b3:9c56:49bf with SMTP id ffacd0b85a97d-3b5ddeccdf1mr3118796f8f.56.1751983842948;
        Tue, 08 Jul 2025 07:10:42 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b47285c6c9sm12946983f8f.89.2025.07.08.07.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:10:42 -0700 (PDT)
Message-ID: <fc2956c4-4b09-4573-abcc-df5258488e6d@linaro.org>
Date: Tue, 8 Jul 2025 16:10:41 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703110415.232741-1-kkartik@nvidia.com>
 <aGuYuHx5qlKCur8P@mai.linaro.org>
 <58d948d3-bbc9-4fca-9393-ce995a4e2567@nvidia.com>
 <5e8714a9-cd2c-4dfb-a624-8a1adba91da1@linaro.org>
 <rq2mdqmg5hnyg6tqluw6vsk4iecgvcm7muhwzr2bhwoi4y7bvi@3cvxzduzw5og>
 <031fd310-f484-488e-a6e3-88802f42d821@nvidia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <031fd310-f484-488e-a6e3-88802f42d821@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/07/2025 13:42, Jon Hunter wrote:
> 
> On 08/07/2025 12:22, Thierry Reding wrote:
>> On Tue, Jul 08, 2025 at 12:03:52AM +0200, Daniel Lezcano wrote:
>>> On 07/07/2025 23:19, Jon Hunter wrote:
>>>>
>>>> On 07/07/2025 10:51, Daniel Lezcano wrote:
>>>>> On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
>>>>>> Currently, if the system crashes or hangs during kernel boot before
>>>>>> userspace initializes and configures the watchdog timer, then the
>>>>>> watchdog won’t be able to recover the system as it’s not running. 
>>>>>> This
>>>>>> becomes crucial during an over-the-air update, where if the newly
>>>>>> updated kernel crashes on boot, the watchdog is needed to reset the
>>>>>> device and boot into an alternative system partition. If the watchdog
>>>>>> is disabled in such scenarios, it can lead to the system getting
>>>>>> bricked.
>>>>>>
>>>>>> Enable the WDT during driver probe to allow recovery from any 
>>>>>> crash/hang
>>>>>> seen during early kernel boot. Also, disable interrupts once 
>>>>>> userspace
>>>>>> starts pinging the watchdog.
>>>>>
>>>>> Please resend with proper recipients (linux-watchdog@, Wim Van
>>>>> Sebroeck, Guenter Roeck) and the changelog.
>>>>
>>>> ACK.
>>>>
>>>>> Can someone take the opportunity to split this watchdog code and move
>>>>> it in the proper watchdog drivers directory ?
>>>>
>>>> I understand that this was mentioned before, but Thierry previously
>>>> objected to this for this particular driver [0].
>>>
>>> Yes but meanwhile we found that the auxiliary device is designed for 
>>> this
>>> situation.
>>
>> Honestly, adding auxiliary bus into the mix is total overkill here. I
>> always thought with all the tools we have today it'd be easy enough to
>> have drivers spread across subsystems if that's what's best.
>>
>> But if y'all think this is the way, then sure, we'll do that.
> 
> 
> Yes we are happy to conform to whatever is preferred. However, this is 
> really a fix and IMO outside the scope of any refactoring work. I have 
> been pushing the necessary people at NVIDIA to get fixes upstream so 
> that any known issues are fixed. Hence, I would prefer to handle the 
> refactoring separately.


Yes, absolutely


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
