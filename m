Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911A13A24D;
	Wed, 21 Aug 2024 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267179; cv=none; b=rRScbmcH9FRtwP1CbvWzlm8Jz0hd+K0aRvOANm3SR5wtMt48WSiWC4C6luFsQs7eJP0HLQurL4cPe2NBmOTjs5lLn9AeMpQzVoGqnCpz2gMvrBDsj2ZC5obhRm5lfXS3kYF3b6UPQ7AxPSaJtiNQHY1OlnpXk4ifKyBVIM2oUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267179; c=relaxed/simple;
	bh=a2K9ep/Oq4OWk/STP+n1dcQIFHnKsGlrgr5bW8mmux8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlmGlEe77HHobs1wQ5hvMb0uJNbOGeYzCh7UmKnY0a+/cBRbyA81CnGYMjdpm1yA4Hze7t5dft+594Ek7F1SCuY7eUDSd7Gh7hO3TbY0svp2r/51hK2KAHObG+kn3JC3DO/HT4LUH3IRgNnBzckYSO2ErBTMrNh2fyUOmTt/yeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3vxUnme; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3vxUnme"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3e9fb6ee9so369231fa.3;
        Wed, 21 Aug 2024 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724267175; x=1724871975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/LFh/529/O1hNqGzQvQg8poQ8UusGeR+HlHeywLeSU=;
        b=W3vxUnmeyqXRD0vwtXZ98zi5yaUGIgsmp0032Ms6/VBONGbwME237Zt+lcZE5a9i9y
         V1V6TYmgbvWetArFJSTkhOXHtRBYXakfsEoi8RL4bwb2NtDXKMSI6+Lnb7R1Es178hxm
         P1YFDUfP1b5bQW3IXst7JOgKoQG/V0t2jDXHR97ESORXrVM33xlYwrzYL+VLe5ZzP6dA
         LOYh0eN4BcOT/NAm1qVmCOLQHPsWzVchwbLLcy8lz6A3cIomMOSQd0RDW2i1VDObE98W
         9fF8ypzVBmjfesKoA1pDaC7JO888eGjP+eePAvNFjNeLHXVtJzDGmCl7ymD/ftCGbEKc
         5D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724267175; x=1724871975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/LFh/529/O1hNqGzQvQg8poQ8UusGeR+HlHeywLeSU=;
        b=wxecS3+anBLg8tQtIqvYtbacE96m6fPxKebo85b0pISyb5qiTj/qW6VM1A+lcnXk5F
         yC1SSGkAw1574qKKXKZMOCjYJGEArYz+rU3T5NwJiQJOIj39Q8+RM9hUEnWC0lfG7XO3
         1ZDgrtQpQcxhw/0zT3JPtdxe7HzAs/5NqWQTE8nwdjDQLlAc47ddvqpHwHR0x6k6xSox
         EAKzFN2YxAoakKFrlGeY8YwjjcKbTxkkgsWQqCiD86f6U0kYGxmuPr8vSe1DzlnyyQXz
         rI6ATUEghj3rOPPUeFGcDUMneEY48I9nqWucV5c+huE3U6ULYFQoZnnIIFMUDMYyH690
         MiKA==
X-Forwarded-Encrypted: i=1; AJvYcCUgwUyhkC/eZ7qFpmFT64PoooMTY1GlKOJX6LnfK/GtecblnqlnpM1eYfPgRCoUp+3NJRS/tcHjd9nP0xrl@vger.kernel.org, AJvYcCWfDk4BsOB2tAv6AUbo0d07XlF9MGi3Y1thNsh30kjkSvDRIV+9JFxIZD5A9ieu62ldjme1CVG67aHYy7k=@vger.kernel.org, AJvYcCXrpxWFyiKLCXIWvA69VdGdM245WXNmbAbEK69tO3VTIdH9jwaGhNHhreGo+EJbpqWJNSsJd7gCUutN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv+1mxAojDvHqVXpqa/7UOKcpr13J4CA4JWFREG7oaY83Ov2DY
	Q+P5C5WLDuI63crDY0QY4doemyfXlqWCNr4XLcuMfHtRZIzmj/Fn
X-Google-Smtp-Source: AGHT+IGi83nl9Zj3dneQZPP4Z/0BUWw9woR2JtWnrVsbthS+3eO5D6XD4mm5c06qbTkXv14B1+qZ8A==
X-Received: by 2002:a2e:9a88:0:b0:2f3:ea86:3719 with SMTP id 38308e7fff4ca-2f3f889da1cmr19126301fa.27.1724267174532;
        Wed, 21 Aug 2024 12:06:14 -0700 (PDT)
Received: from [192.168.1.101] ([212.106.161.95])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f403bc1458sm72281fa.63.2024.08.21.12.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 12:06:13 -0700 (PDT)
Message-ID: <fa06163b-cb41-4004-ae22-ecf9a54f7c6c@gmail.com>
Date: Wed, 21 Aug 2024 21:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
 <e544466f-8c9c-441a-a209-bda0b47aeb7d@gmail.com>
 <2qdy5ehshfslfuyqquycsirzx7ngbwbet2mzsrz6xitaa4pyri@oqohc4egyydl>
Content-Language: en-US, pl-PL
From: Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <2qdy5ehshfslfuyqquycsirzx7ngbwbet2mzsrz6xitaa4pyri@oqohc4egyydl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W dniu 21.08.2024 o 12:34, Diogo Ivo pisze:
> On Tue, Aug 20, 2024 at 06:32:44PM GMT, Tomasz Maciej Nowak wrote:
>>
>> W dniu 15.08.2024 o 17:50, Diogo Ivo pisze:
>>> Define the wp-gpio for the P2597 board.
>>>
>>> For this, patch 1 fixes the assignment of the vmmc supply's gpio that
>>> was incorrectly assigned to the wp-gpio of the external slot.
>>>
>>> Patch 2 adds the definition of the wp-gpio.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>> Diogo Ivo (2):
>>>       arm64: tegra: Fix gpio for P2597 vmmc regulator
>>>       arm64: tegra: Add wp-gpio for P2597's external card slot
>>
>> Hi,
>> for both patches
>> Tested-by: Tomasz Maciej Nowak <tmn505@gmail.com>
>>
>> PS
>> I case You wish to save some digging for other features I enabled BT+WiFi, PWM-FAN
>> and power sensors in this tree: https://github.com/tmn505/linux/tree/jetson-tx1
>> For passing MAC addresses for BT+WiFi from cboot provided dtb check this U-Boot
>> tree: https://github.com/tmn505/u-boot/tree/jetson-tx1
> 
> Thanks for testing! Are you planning on sending your patches upstream?
> It would be nice to have those features enabled, and I can add my
> Tested-by once I test them.

As Nicolas also requested it I sent the patches except the PWM-FAN ones, since
this will probably need enhancement of tegra pwm driver to handle inverted signal.
Also the GPU enable is left out, as pointed by Nicolas bootloader overwrites the
status of it to "okay".

> 
> Diogo

Regards
-- 
TMN
