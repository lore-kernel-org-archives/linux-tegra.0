Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457C28FFDC;
	Tue, 22 Apr 2025 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338787; cv=none; b=tifsRdSVbbGFuFHsWUO9j6Ghv8M4rmIXMEueCQYsjgOhMJB8rkhomXM4rwu2VzvZG4vvCVk1PMgdOspCYvZyKS6uDp2zQzoKrk8z5m7ETuNU1nHg010X8eNVTYh1EieLOhq9ZPXViFfjFxe1hUPwybr7p7XlzIe/WWSdLSs51fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338787; c=relaxed/simple;
	bh=dN7Mt5TorzVoMYGZdVetUiCkAl6mNCbac79NSHf0Em8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLL7qhtqLs31i263TA1+OVOzPlK/OdKOGwRMuGLokGvKJplCFRa5G4s44/mQ7djwOKrS/qRgDogxKEKg4cSsu6rycAUnfurF85sy9Q8N5cdNWLVtdtl2IMho5w9ExircKpiyFMZxFzP5jDcZhNZlkQIOtsgIND8+87pNxnk1RrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvMLU+UY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvMLU+UY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25d2b2354so768375966b.1;
        Tue, 22 Apr 2025 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745338784; x=1745943584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ppOGdF97zWFtuKzRjRN98rOTHK/l63TFgXsLiYX1bs=;
        b=mvMLU+UYiZwz77gtGCIVP7LXxFUHvcWfCvaQ35Ez3G/mpuVkat/tLGciy6ti8SXyzB
         1T0Bzk8DNFRa25QqOMzJwLtot5UTLehUE1xknWwd3h+EdxZElqr/xcJuuKkApwQ7EMxG
         6BsmJ2UV3LOOB/+j/P7jA5/ic1ABnE0XgnXWO/MTYuO7gZGa9f0M18sZ97W5j8HxuZBK
         1mJu8HTarZkVnlY60n/ZMHYg2jixreGxp+8k3mkDXZaKLkGHqPKtv9IJrNzdKSzT2yUK
         vfK98PZ5SVPo9E2QnxMCXenE3HK9MrFDdpUCb3Xsx6XeEGhVFVTEJH6KhgG5b3NodphQ
         kf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338784; x=1745943584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ppOGdF97zWFtuKzRjRN98rOTHK/l63TFgXsLiYX1bs=;
        b=usrFFRVGCSuXTYXlvz+Ns4fwEBLNbqNjmN83AjSMX9PNayYsQ3RWE2Yb3YGe8YoQrS
         nTOPCCeSXkljQycxvYrXZS0Wv6Hh+rWwBd3p9R9w6PPJoxh8KqVsLrjpm9DG3AeohyFG
         kf8dOT391hlOpJiDmyGYJSsqB6s99jFRQRh7UpxDzzXuqj95KGwQJFgu6tBkQGo+Ynlk
         S21Q/26K+f4nJa5SkFGGa5QudxyQr5by97rGfqGJvUfT2t6bHzG6iX6R9PrRMRBJ8Bjt
         9g3Eb9czB6WkgZEgUT0bieOoQUW2FF1FzWkwJJlh+gjL+wRe7NWgPDwN5WByHQSginbW
         udAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU98TOsLKAMrergpod8yuZh33U1ySqNq6XExKaUN3C4SIUWWPPo4Cs6ZdSbCCogiL1sZyd4E8bPvdP26rIU@vger.kernel.org, AJvYcCUe/pCcV5PcSQSMzihSbx/da/z1D43D97mO4yyKqPrUFfDQ0GCixhtPbiELoqpllv1OLjRQyXV1G+iqxOM=@vger.kernel.org, AJvYcCWMzujANzCz5BuLy1ZP91UyPbtMBgs0Ovgo93ulx3T1TcA3l0FfVUqM4Mkg/+5eERXO5B5sVLSfOLCK@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0YRsM1ELn1r2Sj913X7i9hpuGAUL6vpeD5Ovp5uZ0vC2N5Bi
	Bl69UJ51fUlLIfP0COcyMC6LwCueHQKyKWTvr8s4Hq54Ub9HpNU257zA7eO1
X-Gm-Gg: ASbGncvgovHEsMQW3IPvu/01gjeLcdJ6OigkcbW9eFgbXviuHnqGD/U1+8oae7vFc67
	EfROSY3XGgAiFvhVc+HmNhJ34Fh49F24CZLczYfKAVR8BQHBUgDMPGs4OsbfXqq4VphiIWOCHDb
	Tm1nynD76+rY0CQ2wP4kk1WEeKdYhqIVrEXR5LLjJv/GyJRFWvowBZI0uzw3nulWwMUkt7m0UQS
	2H6rvaNRD43vOjzUIUXCaZOZP0MMY1EiaC5/N6XwCvP5yP6KkiEqL0asIBdUCSc8W+P/AatvJ1Q
	Df922Q8jlYFhnwDMmFRDqsbh+QYIg4xw9PQ07fUS+Qs=
X-Google-Smtp-Source: AGHT+IHfl2XQtnaSx2j3vKdBPOXuWNe5bCLhrTs+iNeH6kfcpMDx7j5jZN9MiDroQP8c35r7+KFODQ==
X-Received: by 2002:a17:907:96a4:b0:abf:4708:8644 with SMTP id a640c23a62f3a-acb74d85693mr1305866766b.43.1745338783359;
        Tue, 22 Apr 2025 09:19:43 -0700 (PDT)
Received: from [192.168.1.101] ([212.106.161.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef475c1sm664932066b.126.2025.04.22.09.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:19:42 -0700 (PDT)
Message-ID: <03de9272-dbcc-4473-a267-c3a32e3fd844@gmail.com>
Date: Tue, 22 Apr 2025 18:19:41 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
 <d0da9dbd-7ea7-4047-bab3-22f416c45938@gmail.com>
 <CALHNRZ-1wY2D4FOauh7tD+2QKBfhtfdJcvpV_B9Y0tEpE1kTVA@mail.gmail.com>
Content-Language: en-US, pl-PL
From: Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <CALHNRZ-1wY2D4FOauh7tD+2QKBfhtfdJcvpV_B9Y0tEpE1kTVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W dniu 22.04.2025 o 17:58, Aaron Kling pisze:
> On Tue, Apr 22, 2025 at 9:52 AM Tomasz Maciej Nowak <tmn505@gmail.com> wrote:
>>
>> Hi.
>>
>> W dniu 21.04.2025 o 00:42, Aaron Kling via B4 Relay pisze:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> This is based on 6f78a94, which enabled added the fan and thermal zones
>>> for the Jetson Nano Devkit. The fan and thermal characteristics of the
>>> two devkits are similar, so usng the same configuration.
>>
>> Does this work on Your DevKit? Doesn't on mine, the fan won't budge. Maybe the
>> revision difference? What I'm using ATM is [1] and [2]. Because inverted polarity
>> of PWM, not submitted since that'll need the driver changes [3],[4].
> 
> I would have sworn I verified this before sending it in. I've had the
> patches for some time. But you are correct, this does not work as-is.
> Maybe I lost something cleaning up for submission or just plain
> misremembered the verification. I will send a v2 once I've fixed and
> verified. Apologies to the list for the bad submission.
> 
> For inverted polarity, listing them backwards already has precedence
> in mainline, see the Banana Pi R3 dt. This makes me want to double
> check the existing Nano pwm-fan entry in mainline, though. Cause I
> thought all the t210 devices were the same in regards to pwm fan
> inversion. And it doesn't have reversed entries.

That Banana Pi R3 reverse levels look ugly, but if it's permitted I'm not against.

I would assume they fixed that in Nano, since PWM controller doesn't implement
inverted polarity in hardware. Looking at Switch [5] it seems the TX1 DevKit was
used for developing, since they replicated the issue.

5. https://github.com/fail0verflow/switch-linux/commit/b23e8b89081415f2a63bc625db041c8092e2a8a2
  > 
> Sincerely,
> Aaron Kling
> 
>>
>> 1. https://github.com/tmn505/linux/commit/a78c520ec94aeab2c9dc8e1f46597c4174ff957d
>> 2. https://github.com/tmn505/linux/commit/99beee4f0cd5d3a6f30e1829d823c11cb8b54bac
>> 3. https://libera.irclog.whitequark.org/tegra/2024-07-19#36707118;
>> 4. https://libera.irclog.whitequark.org/tegra/2024-10-14#37145211;
>>
>> Regards
>>
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 60 ++++++++++++++++++++++++++
>>>  1 file changed, 60 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>> index 83ed6ac2a8d8f403fb588edce83dc401065c162f..bc02f2eb14bcbd99627c58b398bbf43061c8110b 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>> @@ -1623,6 +1623,14 @@ key-volume-up {
>>>               };
>>>       };
>>>
>>> +     fan: pwm-fan {
>>> +             compatible = "pwm-fan";
>>> +             pwms = <&pwm 3 45334>;
>>> +
>>> +             cooling-levels = <0 64 128 255>;
>>> +             #cooling-cells = <2>;
>>> +     };
>>> +
>>>       vdd_sys_mux: regulator-vdd-sys-mux {
>>>               compatible = "regulator-fixed";
>>>               regulator-name = "VDD_SYS_MUX";
>>> @@ -1778,4 +1786,56 @@ vdd_usb_vbus_otg: regulator-vdd-usb-vbus-otg {
>>>               enable-active-high;
>>>               vin-supply = <&vdd_5v0_sys>;
>>>       };
>>> +
>>> +     thermal-zones {
>>> +             cpu-thermal {
>>> +                     trips {
>>> +                             cpu_trip_critical: critical {
>>> +                                     temperature = <96500>;
>>> +                                     hysteresis = <0>;
>>> +                                     type = "critical";
>>> +                             };
>>> +
>>> +                             cpu_trip_hot: hot {
>>> +                                     temperature = <70000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "hot";
>>> +                             };
>>> +
>>> +                             cpu_trip_active: active {
>>> +                                     temperature = <50000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "active";
>>> +                             };
>>> +
>>> +                             cpu_trip_passive: passive {
>>> +                                     temperature = <30000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>> +                     };
>>> +
>>> +                     cooling-maps {
>>> +                             cpu-critical {
>>> +                                     cooling-device = <&fan 3 3>;
>>> +                                     trip = <&cpu_trip_critical>;
>>> +                             };
>>> +
>>> +                             cpu-hot {
>>> +                                     cooling-device = <&fan 2 2>;
>>> +                                     trip = <&cpu_trip_hot>;
>>> +                             };
>>> +
>>> +                             cpu-active {
>>> +                                     cooling-device = <&fan 1 1>;
>>> +                                     trip = <&cpu_trip_active>;
>>> +                             };
>>> +
>>> +                             cpu-passive {
>>> +                                     cooling-device = <&fan 0 0>;
>>> +                                     trip = <&cpu_trip_passive>;
>>> +                             };
>>> +                     };
>>> +             };
>>> +     };
>>>  };
>>>
>>> ---
>>> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
>>> change-id: 20250420-tx1-therm-9fb3c30fa43f
>>>
>>> Best regards,
>> --
>> TMN
>>

-- 
TMN

