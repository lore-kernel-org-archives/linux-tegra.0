Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7293922157E
	for <linux-tegra@vger.kernel.org>; Tue,  3 Feb 2026 01:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082580; cv=none; b=P+6suvntXDyAWw7j97Q4w7+dvjlCcsUhvc4hWOKaoRWz7T+ciuugifJykz5DDoCWxXvUO+EWDVR6queJgY33pVawBXum4f/4KMPrPg0bHFyKwrEVg8zbY46dTHlpHKYb6FU3VE7lgjgx9AGCgV62tO4DvkpxZnkiwFpnoGWghtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082580; c=relaxed/simple;
	bh=2X+mytXBtNSV0apIC0KsjvAvt2VlH2ZbcBkfrYklwOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqUlADEWIdsnCQbvSFnwb5PgC6Y24d8WqtMRsXBdKrUPpUXmYgKc8vfVEyBTtCfcZT4RaA8xJVyvEezTKnrGWSAQ7uHmnj6YoEaNB+0n4vd915w/f8U6pZuFu4XD7XlK6OERgehBBOtOLNznmYC9Oq4YrOkPMqV3epbb+pGRBrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLv93Bw6; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLv93Bw6"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64938fce805so4547888d50.1
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 17:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770082578; x=1770687378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IDGINNniODK4Zc3R8bth6pqq7qdppNjLL1gm7R6GyLM=;
        b=RLv93Bw6xpk89FZZDN9UOJBCxmu+ZX80fcvlX6bt8TqwUJTiClbdTH5AQD8E5w77/G
         EmANL4xl7htJb2EnggaR7Oey2IPQHsNxiJhn/qp1wRaN4TL9cFC2IaOwf80olBg7wgED
         Fl89qLbZ+dHAAjGRgL4KqL+UdRcPIWczq0jHo9rwVw4NVl6hy5Uon8bpCNIWOpXvn29N
         WYjhEg/iODYyxI4+zhoKTRsfw/GW7YfvfiamnYtVLIghpvMDOOyy6t+MJXT4cxjcPwkD
         KdiNUwbAjbe3Ea7Ku9JdabafkB+05C/KwUceMICFVY9+a40saVM2iBZ4/xO44EPHXENN
         nrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770082578; x=1770687378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDGINNniODK4Zc3R8bth6pqq7qdppNjLL1gm7R6GyLM=;
        b=H9Jg9ZyeLihtM+T5yYIIQSLKesyLARclmv4OQ+Y4AM/lfLk/HXsn/NhSkzczNqHaiC
         WRZngUYHbc+3yICPnCQfeF7cUi5dLkpPbtoNW3yxB+gvIQL3A6zcea7tfFgsmQhlD0Sl
         yfO8rgjxtXGk+YP1KSCZiC5PqCFlO0xRdScrazN+3KIQQB0/tiYyMh803UOIC0AbzMq/
         dEImQRGg7hrZ9cdnLhRpsbJVMinmOONVtNX2KThtzxmcWonKIcDI8IW37fb2aHJp10oU
         alU7mLHkvaYrOuNw4JgeP+dPGEIxk8u1hpTzbBXson/y7iEJOr10zrZqgySd4ZGzD1Si
         ywyg==
X-Forwarded-Encrypted: i=1; AJvYcCVxrLPcNE5tAVfQrICwqxR27BDWlleWBZGE8Mb54tCNeNDK2tm9k96Ypgr11m96M84lOouF1xN/pSeJtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gx1N/NT6uL9ef1tHEcr5tCY3CazBq6eUvK/fV52HXHlFJEtG
	l95h1aEbwxNKgEyQXgVOoXYuTh47TC4RK6lzfO/i4Uh/D/Ow5NTxyajZlzSIZg==
X-Gm-Gg: AZuq6aJ9KZ1GtAwZAXFR8FyLw0wf5H+CRJ4+sMJgSjMlf4aGtqBTvJiYMyt3GgEf1Iu
	ZEEpF559DYCnOPuV3XJB06mjicziRRXYbixXgHyMzDWzzEbfbYBsodfGnVoDMmAr5B9lFoESSib
	0kwjB683+mopidHrzQ+298RfFMAhMT4hAlTXOnxsGDJPKPQIhYq/Zr5VWhICc/kYdPV3Y3PbY+z
	hoUz4lG27I7+Zp6BXyztOKew1AzF0dXtxijz1ikJKPGQDp/RSq3wEwIYL8sWnCOZx3Js6hkC0Os
	MjjkPAxHCnsIKQLUMLL52ppcj4TyvSb8FErZuy9rsGMo/E/oy/CP0GMkTsWY6/dBxyWEAo/eSID
	1yC1t6bbpomqs1yWTiSuVQ6MItPd3fsUdSXqg4fWdZNFOkczuQypAIx8mrJrCFBjN6hPVBbsQj+
	iNfy1a5nRKT71RZkpeIymgS7YLf+kP9Flf0iiW2A==
X-Received: by 2002:a05:690e:408e:b0:649:523d:e701 with SMTP id 956f58d0204a3-649a852de09mr10271339d50.92.1770082578400;
        Mon, 02 Feb 2026 17:36:18 -0800 (PST)
Received: from ?IPV6:2600:6c56:7d00:582f::64e? ([2600:6c56:7d00:582f::64e])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-649d447df2bsm423325d50.4.2026.02.02.17.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 17:36:17 -0800 (PST)
Message-ID: <74f3e6cf-7c13-43e6-a8f6-2b46184b8ad6@gmail.com>
Date: Mon, 2 Feb 2026 19:36:14 -0600
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] ACPI: CPPC: add APIs and sysfs interface for
 min/max_perf
To: Sumit Gupta <sumitg@nvidia.com>, "zhenglifeng (A)"
 <zhenglifeng1@huawei.com>, pierre.gondois@arm.com
Cc: rafael@kernel.org, viresh.kumar@linaro.org, ionela.voinescu@arm.com,
 lenb@kernel.org, robert.moore@intel.com, corbet@lwn.net,
 rdunlap@infradead.org, ray.huang@amd.com, gautham.shenoy@amd.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, zhanjie9@hisilicon.com,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
 ksitaraman@nvidia.com, sanjayc@nvidia.com, nhartman@nvidia.com,
 bbasu@nvidia.com
References: <20260129104817.3752340-1-sumitg@nvidia.com>
 <20260129104817.3752340-5-sumitg@nvidia.com>
 <4432fa04-e67c-422a-aae4-2938be431985@huawei.com>
 <c96312c7-b13f-4f5c-9512-cc0382c1c77b@nvidia.com>
Content-Language: en-US
From: Russell Haley <yumpusamongus@gmail.com>
In-Reply-To: <c96312c7-b13f-4f5c-9512-cc0382c1c77b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/26 7:58 AM, Sumit Gupta wrote:
> 
> On 31/01/26 09:36, zhenglifeng (A) wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Sumit,
>>
>> I am thinking that maybe it is better to call these two sysfs interface
>> 'min_freq' and 'max_freq' as users read and write khz instead of raw
>> value.
> 
> Thanks for the suggestion.
> Kept min_perf/max_perf to match the CPPC register names
> (MIN_PERF/MAX_PERF), making it clear to users familiar with
> CPPC what's being controlled.
> The kHz unit is documented in the ABI.
> 
> Thank you,
> Sumit Gupta

On my x86 machine with kernel 6.18.5, the kernel is exposing raw values:

> grep . /sys/devices/system/cpu/cpu0/acpi_cppc/*
/sys/devices/system/cpu/cpu0/acpi_cppc/feedback_ctrs:ref:342904018856568
del:437439724183386
/sys/devices/system/cpu/cpu0/acpi_cppc/guaranteed_perf:63
/sys/devices/system/cpu/cpu0/acpi_cppc/highest_perf:88
/sys/devices/system/cpu/cpu0/acpi_cppc/lowest_freq:0
/sys/devices/system/cpu/cpu0/acpi_cppc/lowest_nonlinear_perf:36
/sys/devices/system/cpu/cpu0/acpi_cppc/lowest_perf:1
/sys/devices/system/cpu/cpu0/acpi_cppc/nominal_freq:3900
/sys/devices/system/cpu/cpu0/acpi_cppc/nominal_perf:62
/sys/devices/system/cpu/cpu0/acpi_cppc/reference_perf:62
/sys/devices/system/cpu/cpu0/acpi_cppc/wraparound_time:18446744073709551615

It would be surprising for a nearby sysfs interface with very similar
names to use kHz instead.

Thanks,

Russell Haley
