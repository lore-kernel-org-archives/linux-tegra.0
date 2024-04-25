Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB6A3D3AC
	for <linux-tegra@vger.kernel.org>; Thu, 25 Apr 2024 06:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714025487; cv=none; b=Dcv+ZJxdF+VjsmiudWCglvKscekqHCnsNs6X3/xCQQOqV1tvPzMCy9VF0cIwqahZz2eir1e0yvs+Vhx1VoMnt4DK+5NEZhFfWgnoaFfU6v5R8dZi0T7phIS7EVYeVSbucCvPqnNBIIwpO6TimycdQb6jh2GAJKh2Ma91rxZxXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714025487; c=relaxed/simple;
	bh=xnu4UKmo5Q8dr6HLjbo4xpAXFOLpzSVQrxrb0zdn7As=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=A/WTNLFjL3GBNO5LbuN2+A52K1XGnaKYifpCbR0FlwZB/uAD/+WOJYkjNmaWK6j7jG6zsU+70pEhZQ+U82sDj0wV+8YRvN7mERExEAMo4/b1sayH/MkwvkNjZKB+F3UhEcW5zcT84PqB0xPZSEUm+ZYaPegYktSZc1pVucKXYEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qytBopPV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qytBopPV"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d2600569so707011e87.0
        for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 23:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714025484; x=1714630284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQz3hch+XZa42VTrlV+hdzD326xqyj6i8n2uq5agwDA=;
        b=qytBopPVCEPURKBisg/hivvexxDWCUDCxnPe5nt82JZbA5nZgw8UrpfZUI3t0KOYcU
         L8ExGhBLFpYZmuETHGEP/hyG15tXzy1KJ9Xe2L00QLZayfVw0kiDCviJNTRQB0Smv2w1
         zPx3/98y9gOrH2CfpixwfGWpoe8S0YUWFb6hTEqsdi6QQzdU4Py/Z8FBbOGuedfyJxKH
         bUt5SSdmomKVjr6xI4q6e+zTVrDmO2PZAuJQFZ4MfwrcFf7+BBL+gwMgrfWfx10ktzLJ
         +MKSK65cStcrQkh9y8zNjkZ88UrjjXUBKNSwuaDjEm6TIIYac0z7WK7r8X/1NwTf0LYi
         Noxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714025484; x=1714630284;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQz3hch+XZa42VTrlV+hdzD326xqyj6i8n2uq5agwDA=;
        b=oOnTToIqJqoKTQqDAhtQjiC52s+kKx3G0PBzagIHdB5D1UzP85+IdaZR1ibcW52+u3
         saUuTzxX2cV5WoSl7ZEm0REjDO9DdOKorgaoA6gEM46yAjUrxpDsL2fKvPDBR11Ro3Ud
         6NdnedbC20I9I4ACvCi1KGyj+3SThjqVyamPi3mVRKEnm/BnIwHgWUgYQ5ILYtcvWDZ/
         SL6wGHrL1/IXjIwi2oXgEf1cg23pCQqaFTQg8/jNFnvgA5ghBGCAI1m4DE9JPmg/eKt0
         bBiJC9oQF396PRrEYB4jYcJT0STCDovqgmfNmzaPW44ijRoNRN8TYo7tma8U9gYwpLiR
         LSDg==
X-Forwarded-Encrypted: i=1; AJvYcCVM2f5Rlu7gGlBmw18bN5W6qF58s+cEDE9KxN0iISpQCXa7IRy6Vm3l2d+1baIBFxiJfgouPCNnjQyWh3Yt4+t0Unukuuez1tQkvzc=
X-Gm-Message-State: AOJu0Yxx+RMbgXN7QJcCXOj4JVpB+YNxUdv7NqBDKPziLWBUTTvwD2tu
	auSSuSv8CkvhvXcmHQmFkPSlQ/+dJH6+sYk1HEN3eTVuMOSmlMTOQpuOOdp2RGE=
X-Google-Smtp-Source: AGHT+IGD27H6V3jgOJ3BpJ84TVYszemj2fDqaBMIgy1l87iDhpQ/djjNDVNieYGWfu3JT8k6tKobbQ==
X-Received: by 2002:ac2:494a:0:b0:51b:f78d:c189 with SMTP id o10-20020ac2494a000000b0051bf78dc189mr2142433lfi.14.1714025484069;
        Wed, 24 Apr 2024 23:11:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7de82000000b005720e083878sm4109207edv.49.2024.04.24.23.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 23:11:23 -0700 (PDT)
Message-ID: <a84e606e-ac7d-4f93-9be4-144acbfe10b1@linaro.org>
Date: Thu, 25 Apr 2024 08:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Cleanup Tegra210 EMC frequency scaling
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
References: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
 <171398258237.275534.7331223388966262711.b4-ty@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <171398258237.275534.7331223388966262711.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 20:16, Krzysztof Kozlowski wrote:
> 
> On Fri, 19 Apr 2024 11:45:08 +0100, Diogo Ivo wrote:
>> This patch series consists of a general cleanup of the Tegra210 EMC
>> frequency scaling code for revision 7.
>>
>> Currently the code is relying heavily on a function, update_clock_tree_delay(),
>> that is responsible for too many things, making it long and confusing.
>> The general idea with these patches is to simplify this function and its
>> surrounding code, making it more modular.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] memory: tegra: Remove periodic compensation duplicate calls
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/f8037b3d9a75f4963c1fd3eaf39b968f206d37df
> [2/7] memory: tegra: Move DQSOSC measurement to common place
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/09dd3744d7c02a3844e8a6c96ab2fb3c1e94de52
> [3/7] memory: tegra: Reword and correct comments
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/d48076e5bb9be787b769efb3e6439902dc8e99f7
> [4/7] memory: tegra: Change macros to interpret parameter as integer
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/56c95667042ba12a66157477282ca73605a25481
> [5/7] memory: tegra: Loop update_clock_tree_delay()
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/0d647b9031fe4f6b20d2f18b3d087dea740eecf1
> [6/7] memory: tegra: Move compare/update current delay values to a function
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/c1a70060c654327be4aed6e617f53bae5af8625f
> [7/7] memory: tegra: Rework update_clock_tree_delay()
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/edbf2db5ae95c4d8f189d05e827d9dd3ea75cfbc

And entire patchset dropped because it fails to compile on several
architectures.

Don't send code which does not compile.

Best regards,
Krzysztof

