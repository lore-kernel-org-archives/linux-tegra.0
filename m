Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0771E2610
	for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729714576; cv=none; b=ZSd1SGB/pU50zsplYhsmsjb/JBl84s41cyPL6CwT6oR8tXIOqexh753+p/TxbDxHNIBt7lhS69NiaYj9YhHzcElaBmTBfEhhPk7PB/H4xqyeNG3jogOJxNXjALX4Oz4cnl5bI4yOR7xLlIHML9rjwqQ8viQkNvOWpU+rnmnYIpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729714576; c=relaxed/simple;
	bh=t+pBwRES099gjbIXm7AKphItx7J8kvYpUlt7TQ7aHTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puocVq+EQDLGAspM6TaAXgk+m82myT+LDediHkOaOmbJDF4lxgFT9r5cZyQR8Ci9EHYO7H7AXqL0ZECwe5a/dklY5x5nSaDqkbqwBQTYpvJl8BtYNJFuR5ytItrn1+SeK0VhXMcOO4JjFIKEwH6mq73RhbFCYnqTz2MYtGd8nqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f1DwpIO/; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f1DwpIO/"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-83ab21c26f1so6673139f.2
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 13:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729714574; x=1730319374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8kDCSZhRA7POBerNB1e7kbi71ZsjNfGfCME90BjKh8U=;
        b=f1DwpIO/aOuuk/h5qA/YXkBI+HjnYIuH5SCbgaiXXzKGIlzvPT59WPMSoqf85kaCeD
         gmFatEdohan57nZBqC74W9mRbKO+yGb20Rmt+UT8240/7Fj7pqQ5CG0xWgpf0ccKVrR7
         sX39l8GcufjrYRI62+pSi4OTTwPXv6F+7HmN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729714574; x=1730319374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kDCSZhRA7POBerNB1e7kbi71ZsjNfGfCME90BjKh8U=;
        b=HeL8gTCFGK7x55AdD+IcAFx9e29ch6GVjS+DzCSESS4XWnaOE5feHuPRAL1ZFxzMNX
         0H2HjU87hdZg2stNEffY9Men7/C2xo7AFpaAPqaV7IWtqrc0oJg8rfhYaztGSxyLaa6y
         7vh9icpmMJjuEVjtqbW0BJhEjEK+5PdI1/BFR4MicvvmlhaNlWPLHlFRykjNXfWO1Lye
         alFh4XAtj0SJ9Z5YWUpJjn6qdpsYDp2nHOxFQ5WVWmCZIRGGsVetBqZPBR5jslseLoij
         0UDG6zpGCUCAchdotosdKsUpmzdidgny/66/tW/u9jSnkxcriwYe0mphF5PEsBRxfILI
         7QlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFlC74DADrZpuX7BmKsa/2zKN99qyJpwCV+e4Bi414BrFUShzpdryWfgjBV/vPWJEBV9FqGQIugYJL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlO5nTAmmIhvmXe95/jrjkTN3HDywG/rB4otbSI/VxiLg1thB
	WaXlsq7cMDyfL/H6W1oZFUIvR2W9CvYitNxcNn1eg9oMJvQbJkAG32yJBXYzEXk=
X-Google-Smtp-Source: AGHT+IFxlWgPQhu1E+mBKyy2YSke5qTMx4jKDLlyDjXa5E0AFKuVNbwNPENGDajCm726+x5G05keqA==
X-Received: by 2002:a05:6602:2c94:b0:82d:16fa:52dd with SMTP id ca18e2360f4ac-83af6192782mr301558139f.7.1729714574207;
        Wed, 23 Oct 2024 13:16:14 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc2a65e512sm2226878173.156.2024.10.23.13.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 13:16:13 -0700 (PDT)
Message-ID: <2b3052bb-1235-4785-a7bb-a993332b4d83@linuxfoundation.org>
Date: Wed, 23 Oct 2024 14:16:12 -0600
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftest: rtc: Add to check rtc alarm status for
 alarm related test
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Joseph Jang <jjang@nvidia.com>
Cc: shuah@kernel.org, avagin@google.com, amir73il@gmail.com,
 brauner@kernel.org, mochs@nvidia.com, kobak@nvidia.com,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-tegra@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241021032213.1915224-1-jjang@nvidia.com>
 <202410221601561f631bc7@mail.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <202410221601561f631bc7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/24 10:01, Alexandre Belloni wrote:
> On 20/10/2024 20:22:13-0700, Joseph Jang wrote:
>> In alarm_wkalm_set and alarm_wkalm_set_minute test, they use different
>> ioctl (RTC_ALM_SET/RTC_WKALM_SET) for alarm feature detection. They will
>> skip testing if RTC_ALM_SET/RTC_WKALM_SET ioctl returns an EINVAL error
>> code. This design may miss detecting real problems when the
>> efi.set_wakeup_time() return errors and then RTC_ALM_SET/RTC_WKALM_SET
>> ioctl returns an EINVAL error code with RTC_FEATURE_ALARM enabled.
>>
>> In order to make rtctest more explicit and robust, we propose to use
>> RTC_PARAM_GET ioctl interface to check rtc alarm feature state before
>> running alarm related tests. If the kernel does not support RTC_PARAM_GET
>> ioctl interface, we will fallback to check the error number of
>> (RTC_ALM_SET/RTC_WKALM_SET) ioctl call for alarm feature detection.
>>
>> Requires commit 101ca8d05913b ("rtc: efi: Enable SET/GET WAKEUP services
>> as optional")
>>
>> Reviewed-by: Koba Ko <kobak@nvidia.com>
>> Reviewed-by: Matthew R. Ochs <mochs@nvidia.com>
>> Signed-off-by: Joseph Jang <jjang@nvidia.com>
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
>> ---
>> Changes in v2:
>> - Changed to use $(top_srcdir) instead of hardcoding the path.
>>

Thanks.

Applied to linux-kselftest next for Linux 6.13-rc1

thanks,
-- Shuah

