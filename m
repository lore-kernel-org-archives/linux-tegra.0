Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FD13AD19
	for <linux-tegra@vger.kernel.org>; Mon, 27 May 2024 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716805212; cv=none; b=JHUGgSokDCdPKhgjbB/7rR8UMgX3WSpk9IydEFyJ64WpVWvjHDbf4FxfOuieU7rWO6FPA9k17rb00QwPn2CgAloKaq7FS0xqNDY2xoCrGhesPeR5kUBtVZ91B/XZErw7VboBWFAqmxHys6Shk5hzViF2Qimng33LyDjnI3bdBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716805212; c=relaxed/simple;
	bh=gihBiJIcw8sj9dmTxq/+XnN6tPPEclWQ5/Nm62Ns3cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dXTOEbY7eK1pOj/FbsomnxDjqbH15qBwGOHpHqV3I5OvuTf+1jnnwE/DAKkm4Yi/Fpta1slRK/G0SKSq7z2FW1rQuMkjcTamiaTTrGVvI9SRS4TbDw/bnyjI3tGnrH1DBwGg4v9ddDiaRqThZ/1J/vADrXbKE8EZ+JaNjkcUwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D6vhFTQT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D6vhFTQT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6303e13ffeso53361766b.3
        for <linux-tegra@vger.kernel.org>; Mon, 27 May 2024 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716805209; x=1717410009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqVLy4BqKCVpGMmzuIy6L9HtarmoOn7AYrsMEQ/kn+0=;
        b=D6vhFTQT4pVJpD0HcF4lk7i7sXx6KInXDajLVgNelMBsE6mj7hRP26QGDc/DpADuI3
         k8ogJZ3umw4jqn4WqK3W4NaoAPB03mZxwqtw+XxBFhwtqpBAhv7s1+VAF5puFZEESDEv
         aa74tjXEzGDJyWOsqXqQxvxjaPDIlXzh++RePGRkRm7In/2hBCNGR3EVMNX2moDAptDF
         Itb9vSqJwEpk2S7219Ftf5bojKKp5DiOH25KHtfUG1PSm9FUBESmDBxYH92dqbQDTru4
         JUwJ75DJNl/iM4AVCUaTH5r4A3zv+RVElIVbkMlkzDwrPYEtSwok4hBJObkgJHsjUQuG
         ri0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716805209; x=1717410009;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqVLy4BqKCVpGMmzuIy6L9HtarmoOn7AYrsMEQ/kn+0=;
        b=QeuXjhcKgNo2ub6lZRQR1FH1do85u10NEbjVIpGmrQxcslVJmNV+LZ6aCV0Fwn67TB
         ii9hraDQUAjueX4U+k8Ws1AIVZXAY0+vK0sr/kOoq6gLCO4VwK/TpFpMWl8zs1H53Kfw
         mvP/DKly0mSCjEOHaHgcMVwpGb2Jkp5WkP+Jb2+7XDtOZr4mJ57hp+Ddx13jX+baD14h
         trzm6sjuLElSA4gsRnl/kIh7+YAGcKxJ4X6ABnMUtIqV23ZIK7aSO9LuWqGnCI87HRey
         KBeBuul3lYCutGsG83L92cAeGtM/EPg/r0AQLBfZKZ9jHoqdNBCFd/m54xjaZmoW5snW
         MdIg==
X-Forwarded-Encrypted: i=1; AJvYcCV7vf1qRYz7eBMmvhc6ocnCUGQ51JyKEB4UMjVEFbcaWmfv0O0xzLhTB3FFuF4ZEZzLoOnlgWc/+yLF7DhF9m0f9CNFxD4P7Yh/VNs=
X-Gm-Message-State: AOJu0Yzt+gDmzjvLfayX8dGafz/hKPQclieN8ZSfdOx3vDpjfWglnNBI
	yyHVPs2ZIIgy5GhV44PhlICrxh9cAvWdL2VmHEm8slyiX/JKIkpdEQcE+Q5nN7Y=
X-Google-Smtp-Source: AGHT+IHA6kbBM7DLzQFaJIfNbRorrDAEIb7Dgj2UwsEP2QpYVZYp06UjiYss3m+wTKNBel/jSCfvYQ==
X-Received: by 2002:a17:906:aada:b0:a59:9eab:1630 with SMTP id a640c23a62f3a-a6265134cc0mr548260966b.69.1716805209019;
        Mon, 27 May 2024 03:20:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda843fsm474092966b.220.2024.05.27.03.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 03:20:08 -0700 (PDT)
Message-ID: <56345d8d-ec1c-4ff3-b278-f66f2a1f9f84@linaro.org>
Date: Mon, 27 May 2024 12:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 0/7] Cleanup Tegra210 EMC frequency scaling
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt>
 <scjwzfj3jiyqh2hgomlfpdxjpyurkhiyy5bks3damficnn3bc3@vogn5wp5exoc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <scjwzfj3jiyqh2hgomlfpdxjpyurkhiyy5bks3damficnn3bc3@vogn5wp5exoc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2024 12:15, Diogo Ivo wrote:
> Hello,
> 
> On Tue, May 07, 2024 at 10:30:43AM GMT, Diogo Ivo wrote:
>> Hello,
>>
>> This patch series consists of a general cleanup of the Tegra210 EMC
>> frequency scaling code for revision 7.
>>
>> Currently the code is relying heavily on a function, update_clock_tree_delay(),
>> that is responsible for too many things, making it long and confusing.
>> The general idea with these patches is to simplify this function and its
>> surrounding code, making it more modular.
>>
>> The motivation behind these changes (besides improving readability and
>> maintainability) is to make it simpler to add support in the future for
>> frequency change revisions other than 7, where we can reuse a large
>> portion of the modularized code rather than essentially repeating 2k
>> lines of code with minimal changes.
> 
> Gentle ping on this patch series. I think this version addressed all of
> the review comments, is there anything missing?

I think I explained you the process. Merge window finished yesterday
(today for this timezone), so why pinging the same day? Give some time...

Best regards,
Krzysztof

