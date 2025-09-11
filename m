Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7846B3F9C5
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 18:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616977; cv=none; b=uBFFcAziO3Hh2HOIojS+V1VgFoivM22V4R8t21QKWGiGVa3EQiI+D+M+75cYvnApa4vjFFlLXuTqm0I1nnKUuzrlx/56+wop3H3FEMTFa7r+cdarUecX8wW/jTDcHW3J/no833+x2U3iFiJMKjDv8jNyeTL8jOJ6tLSWQmp6aqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616977; c=relaxed/simple;
	bh=G9PVOicImObvMdXVVb+6plfEYjjJkzKtfTB6xhY7oiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ezugph3W/+Ae8rvc/t6LhU5KADhH21m0O9a0tj2EGFxVFOUtXQLszm64LweLRsU7uUqQr+RZqLEycq95robNvXW3c0MaN72mgweNngp2EAiTQ+hT01Otn27wvGyt+iGpkR1gAvG470lt3lWIk7eekZl/X1JYqv00fDw0K1psma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzr2+QVj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzr2+QVj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3e7622483beso604573f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757616974; x=1758221774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rekHjTbST2J3gdgDOG8ibNuPO2c1lzAXyA1v5TU/iWo=;
        b=mzr2+QVj6hfChvNZtEBi7N5IVkR8wG7RNXuLgNFMC1IuIAL8olZtuyX110M3WscCYR
         XshgRYC6teY+fUJVGfbApIzhhVw2A8kyQXoJikTwdYIhmhuCYZ8MnCB5f+EjpFdCHdar
         1rSNYn9dEiMQ8nOxDIr1UC3fwQIRRJIQJVklQHgqT2XnJHvXls1AjqC1Ykzd9A4bIC/c
         G5pv1G3Wt14KqtCmIf5pCV3hGXhL5oY0/ow4I34/qeitfkOEjDkO2a9gZdAxBbF3uBcI
         MJFHSIpBNjanXcyu6Dflur/p2VQCxT7MUuo7QsAYygrq4lBNHu798a4d+Ueo90JtTROf
         BWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616974; x=1758221774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rekHjTbST2J3gdgDOG8ibNuPO2c1lzAXyA1v5TU/iWo=;
        b=umE9dSC+/Y2jqaB/hAV1pE1VxAYMk4xISnJvpoEshiE8wcGNpekcyGo9hyb/g0RX5p
         SzPHzC1gFZOOOL+hmP/22/9M3jKDuv15emKku9wCpizb3PXHhmOke65R2Q62Vp+bZAAW
         Z7nxgFjRJ60+rl2jyrm19AIw/c21MY9FvcVSudgGnkChwlb/2D2npww3fWEguauhw3mN
         fKM8RfljIKaxh1x18jZUuhBAky7EnDQWujiLJh7YnMMux/na1VoST5lCuoFteTcFE/oN
         HMfvw8y+/kbe/91Uc7gVJnUNjlg2nk6C3AC1YmOzeKtvrI/wHSHmBe3TJ2J5LbUNqjCG
         aHsg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ66LFX+Wcpd+21I5f2ZYP3c8UrwtZ4MHj1y4egbQlzAHslyM4p5poRUW7HmD9vq+99n+SiGfJ4WtRfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsdm1AALTSzaeL5UaPakIwwbnJfZ1sBBCtPpaCe7Abz4/0AEcl
	YDzU4rDGrPiWm/4LZQ63sVVEzkyfiPeicvnkM0LB06cDDwKJKoRQOdRjBPyjYgWZtKk=
X-Gm-Gg: ASbGnctcaMUfvWOrbwWhXoWMywi6HLkwn8RYT6cfWR7eU7e5OFmnZ75AEVjNSWKwIDp
	Jv63xoOaK6HK2NVfITLzmkHCdWbefBoS4L8yjqdP907daPY2nYReBSSHW5WPXeIAlu0k2ZANogm
	sVnvgzwb2ZF+K6Qw1PsJd78W96YSeTyplcjRPwyvR5wlz9kutxvrhF44UDhZn/W9+NmYScEE2aq
	BydbQu3fhXbJuQqBPZOm6kVoWbxg1FtawR7EOwSYIOdoL0RcSo2ExR9bhdFLsRXHWhTgjUd79Sx
	ClTjsrI8FRoLb3n+p2LQnApNb3VJNGUlQ5Itq0VcaxbeNZ9mTpgE7qHKwMydFtWjmfku+9Wj89W
	fVZey+y7sNEHZVsYhZxpb8IvYwTOvspPL8loWLQfU5/irr8krR/WOB8//dmwDwlWucPth91qzYY
	OOjZhqDW4aYK98
X-Google-Smtp-Source: AGHT+IEuCngj6El+msipl1V3catUDI1SMJQ5OlW0Wjxj8ggiY+iRRQHMDi9h8+t5G0p3xbR8aE2/SQ==
X-Received: by 2002:a05:6000:2509:b0:3d9:70cc:6dd0 with SMTP id ffacd0b85a97d-3e765a05342mr397079f8f.33.1757616973832;
        Thu, 11 Sep 2025 11:56:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d521:838e:7c69:f457? ([2a05:6e02:1041:c10:d521:838e:7c69:f457])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e016b5c5dsm37360275e9.14.2025.09.11.11.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 11:56:13 -0700 (PDT)
Message-ID: <da8aa4c5-4aa0-42f6-acb6-55d37cc29774@linaro.org>
Date: Thu, 11 Sep 2025 20:56:12 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <tdknls7jieu4ple3qhmdqntllmctks2auxhxzynwjjmgl3hnx2@nubqlzpgohwf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/09/2025 18:27, Thierry Reding wrote:
> On Thu, Aug 28, 2025 at 08:50:58AM +0300, Svyatoslav Ryhel wrote:
>> SOCTHERM is thermal sensor and thermal throttling controller found in Tegra
>> SoC starting from Tegra114. Existing Tegra124 setup is mostly compatible
>> with Tegra114 and needs only a few slight adjustmets of fuse calibration
>> process.
>>
>> ---
>> Changes in v2:
>> - no changes, resend.
>>
>> Changes in v3:
>> - expanded desciption of "thermal: tegra: soctherm-fuse: parametrize
>>    configuration further" commit
>> - changes title of "thermal: tegra: soctherm-fuse: parametrize
>>    configuration further" to "thermal: tegra: soctherm-fuse: prepare
>>    calibration for Tegra114 support"
>> - Tegra11x > Tegra114 and Tegra12x > Tegra124
>> - ft and cp shift bits dropped
>> - clarified tegra114 precision
>> - lower_precision > use_lower_precision
>> - nominal calibration ft and cp hardcoded into SoC specific structures
>> - added tegra114-soctherm header into dt-bindings
>>
>> Changes in v4:
>> - fixed Tegra124/132/210 cp mask
>> - dropped TEGRA114_SOCTHERM_SENSOR_NUM from header
>> - TEGRA_SOCTHERM_THROT_LEVEL_ made SoC specific
>> - adjusted soctherm node and inclusions in tegra114.dtsi
>> - dropped use_lower_presision and nominal_calib_cp options
>>
>> Changes in v5:
>> - fixed CPU and GPU hotspot offset values
>> - added static_assert()s to assert the TEGRA114_* and TEGRA124_*
>>    counterparts are equal
>> ---
>>
>> Svyatoslav Ryhel (6):
>>    soc: tegra: fuse: add Tegra114 nvmem cells and fuse lookups
>>    dt-bindings: thermal: Document Tegra114 SOCTHERM Thermal Management
>>      System
>>    thermal: tegra: soctherm-fuse: prepare calibration for Tegra114
>>      support
>>    dt-bindings: thermal: add Tegra114 soctherm header
>>    thermal: tegra: add Tegra114 specific SOCTHERM driver
>>    ARM: tegra: Add SOCTHERM support on Tegra114
> 
> Hi Daniel,
> 
> there's a build-time dependency on patch 4 in both patches 5 and 6. Do
> you want to pick up patches 2-5 from this series and I pick up patch 1
> and hold off on applying patch 6 until after the merge window? We could
> also do a shared branch, but it may not be worth the extra hassle.

I can take the patches 2-5. Regarding a shared branch or wait for the 
next version, I would prefer the latter

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
