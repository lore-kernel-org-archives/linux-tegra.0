Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC828B3EB
	for <linux-tegra@vger.kernel.org>; Mon,  7 Jul 2025 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751925837; cv=none; b=ZWZt9aWNQwdx3p69tFFU48fJPWfmV6y3Osq2pq/H2Tv7wsC34gyQA9ZdIcBEkGvbS+zPwo04uhxMP0apSifPSkt7SsXvG4aQ1F4jBxiPYl8Hggj4iBRSL8MLh8Bl/ez+87veBAt4vob4KraJoXwbFXb2Jsw4Qtg5oQ1pL3pHFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751925837; c=relaxed/simple;
	bh=3+ZHbKkksN3tcAI2z+bM1ZZYWOFLSi7aPdLQlGUbAMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FX4PANCdPOYga1c48JVGEKOP0u3viVYVheRHe/a4kcYvhChJ4kfMcDAUIne2eVS8Kqg/8zmRl9Xjr1vUm54Gf88wvUZkjxkrJTQ5i5JbsQSAFC/m4qO14QK65gMnm9cyfZkfCTPoOUekYHst4c4SP0LpyOlE1tJP7oqiuL505jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXyhrt5s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXyhrt5s"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so32874225e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 07 Jul 2025 15:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751925834; x=1752530634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dogAwfSQpS99lvjgTk8yq+RnVhaWd2O8XC5gsnxqeJI=;
        b=BXyhrt5sZRiJXJEOzXZ5P1vJMKHA8QkHATKEsnergl99L75/XMzF8iARIrSYOitZQz
         ECH75mYMd7qYnR0a0WD7biW0X+T8Wt7gcw7i0n7jJuuE62p0GDKG+iTAxvQozX6CO86V
         ztLc0MKu4xfmKQLX42Kk9lXx+fV3ARE3aX1XEIo5shGIODYrwedXQLGo10CZdBWPxSYg
         q75nbiRUp8/7RiF6vfbrcRYDKDYeYCR8Y/FYPLAjuJYsJraLksurkTQ5Cn2fjGHcYAO3
         gr1C+3AOD6ujkcgQDdI5Y9mecZmBLiYIzMES+JcS8XhDBuG2z1o3miMQk8zBl8PtricF
         mY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751925834; x=1752530634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dogAwfSQpS99lvjgTk8yq+RnVhaWd2O8XC5gsnxqeJI=;
        b=H0wee+jBtCjzzru98Ge5Dg2n34ZFIPNC54NTH4z8UamktGfUwyJqcQDFwcLnwEWjMH
         jkZYmbDZlTQSrB7QTyKV4QlBszYwYM6huKjafpSILOGODvgpo/bzUZOrplbFxGxuy2cX
         1Hpk7/R70B8bML/QM2gw2JoJgkJT33yewJWGudiCmpFEoEk6PIbLChPByp64OKKq9Uqj
         hMY6+izT28hnFEEhtmuwBFm8onT/Qlq6lBpDUpcWVEz22JZ/j5s5pBvjfwScCxDvR+6g
         Ro22kAoHh+Iknx7rF+BQHCgd9N/SB5DRD9Kf3+Zkdi9iXw28dBPxPhFB+gz0oRg0QGFx
         pORg==
X-Forwarded-Encrypted: i=1; AJvYcCWlyA94/PwBVj1Vm8qdkW0Fbt69yOD7DakQTiJRvuEP/2m1yt+Hj2mn7p4ELqNWQWLNhvrBmhJ0QdROSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxAOq/ZtNwg8u8PC+VUpywrYZTQLHZ6P4oVnUU3BzjNq85CEE+
	3uapFv6QYuUhR0nm1cnx3/q8jnKOxXHaSHVMQ16XBltkpdBwsXMXiTmMvTNxRf4Jtge7LiL+mf8
	oufe3
X-Gm-Gg: ASbGncsiUbIrbFv7UyYYhIh7bkdbw0/yeqOkHAawSlXs5pUO49BsR2oAlfl5skEdivP
	ezhVGHdGpYdA8uGyZRbXAQjEptM9sO0LhHNAWSb/qJDa1clm4sKiVEwKPh+q/qxJZH7aSO4iPzn
	YD9juIRZLAYOx95MX4350LxV+ezOyLmRiDsCAWsl08g63yPkoDDwyw1NgGfyso7cj8LBh3I1ngD
	4RhaE/dDBwi7OmZjgdmmiPjjiIyiIMtQbz533sC3x/xtQFRvLALM4+r5ssDWTiwQPomyCWEc2KT
	efcuo8sYnB9iHTfDaRBgFSlLU2sGtmYvf9/Ohm9lFaIR1iw8Y9e+RZlTMWwYpXUiysoDy4bag8e
	qFg6N5SEZ5AafCejE8Iu6SXItmgwXSRNLoJzS
X-Google-Smtp-Source: AGHT+IGB3xOpoLWZizaIy6CWYyRq8Lhxm8frKGFEmvzu/zW7r5k6ohcmzl5fHAvHUJyguH+pkTOB3Q==
X-Received: by 2002:a05:600c:4706:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-454b4ead1c5mr145585835e9.17.1751925833699;
        Mon, 07 Jul 2025 15:03:53 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454cd38fb04sm3927855e9.8.2025.07.07.15.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 15:03:53 -0700 (PDT)
Message-ID: <5e8714a9-cd2c-4dfb-a624-8a1adba91da1@linaro.org>
Date: Tue, 8 Jul 2025 00:03:52 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
To: Jon Hunter <jonathanh@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>
Cc: tglx@linutronix.de, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703110415.232741-1-kkartik@nvidia.com>
 <aGuYuHx5qlKCur8P@mai.linaro.org>
 <58d948d3-bbc9-4fca-9393-ce995a4e2567@nvidia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <58d948d3-bbc9-4fca-9393-ce995a4e2567@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/07/2025 23:19, Jon Hunter wrote:
> 
> On 07/07/2025 10:51, Daniel Lezcano wrote:
>> On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
>>> Currently, if the system crashes or hangs during kernel boot before
>>> userspace initializes and configures the watchdog timer, then the
>>> watchdog won’t be able to recover the system as it’s not running. This
>>> becomes crucial during an over-the-air update, where if the newly
>>> updated kernel crashes on boot, the watchdog is needed to reset the
>>> device and boot into an alternative system partition. If the watchdog
>>> is disabled in such scenarios, it can lead to the system getting
>>> bricked.
>>>
>>> Enable the WDT during driver probe to allow recovery from any crash/hang
>>> seen during early kernel boot. Also, disable interrupts once userspace
>>> starts pinging the watchdog.
>>
>> Please resend with proper recipients (linux-watchdog@, Wim Van
>> Sebroeck, Guenter Roeck) and the changelog.
> 
> ACK.
> 
>> Can someone take the opportunity to split this watchdog code and move
>> it in the proper watchdog drivers directory ?
> 
> I understand that this was mentioned before, but Thierry previously 
> objected to this for this particular driver [0].

Yes but meanwhile we found that the auxiliary device is designed for 
this situation.

> [0] https://lore.kernel.org/linux- 
> tegra/4ks74upuufmt2ibh5ur5zpazvfj66ak4gyq7v4rtz2zi2u5wsi@rls64ws3rukp/
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
