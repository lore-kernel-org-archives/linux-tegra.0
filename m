Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4916F0F0;
	Mon,  1 Jul 2024 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862010; cv=none; b=hpfIlhMFugZbQCXX/fane+KV2ay4PrNuVlnnbJDLr9EqCJq9XzKE28dtymqvSuDmS0dn+B+k2p/r0+G+EQ61ocxkk8N9VCkWeUKWpC6M2sPn/9O7xWWERJyxy0cL3S4yEC5e57kZ7RQzghOWCRApHbaAWLlcU4ozRL02H2P49aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862010; c=relaxed/simple;
	bh=LHk7eROmcWbnYfS7vGmlALNYA1Wkpd69NP4AeKt/6wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZI5FJRzMjGjEU8GAL+qTjnbfQvffYu7tw9bD2O4eGf3T9XmSAnOFgTiA4A+2tXLSWTIPyKqHDX8WKNcP+zo/smF/n9zuy/JeBtiMEBY51svjjqHJAZXWOS1vM05Dg145jF88Bp1ZHjekQ/YCr/Pn3M95jR0/Pbs81M9SUqEKww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvZUtmsr; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvZUtmsr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-586de6191c7so67019a12.3;
        Mon, 01 Jul 2024 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719862007; x=1720466807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfdinNK4I+EoPid1lO74/d3sekkGPezRAAen9ZXKCjo=;
        b=jvZUtmsr60zdUWJOUoq4MAUY7yHfYztWiMEdxlVQi8yVlQhXlYnqTczsl1JfmB3HYp
         V9u3Vax4Wpk0glWEJj1wkNnBbh4jXsaZmk9MiQEvNSflefib6laxT72/865hfvZryAQH
         3UPCn0JMWKpjKbSyXuNVX2E+YXXraM2QnTwwS0gv++RasuxMNj4Y72DqvZraxSvq+7JA
         7YTetmvY5Ir+lnzlB2P6zod/HQ6hTkuvwqdwRmYTvl0fcdCB7mkG3VGU3l3pw2e3K8xj
         ZcLZSXFp1AxsG/k3uDGgojbi3NyyB3izfxgJYPSOKM7E9vdcup04gZpWMVGhVbLJH+A5
         pJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719862007; x=1720466807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfdinNK4I+EoPid1lO74/d3sekkGPezRAAen9ZXKCjo=;
        b=EYsVZQoH/AXIdsiBNmy5m8QDUQKi/VwyH2iB33xibIOaS87HP+meZPNJmOC8TCs5QB
         71ABI+3UMoUODOEgXo4P3wGYecSFd7gayRv/QGWBQqgFJu1hx8yr2bE0Evot1uYFPAiy
         YQHpiO8j+EzvPNqQJtf1DGNA1ZqF+YB1QUoewJN8ZMggj1GU9milFQ5f+fuy8IM/i4Sb
         O9p6E1CtU/pFNo5vpmfiQVQ34pyKKgnbWdg3mTZJr0ZMgvLpSuGs6Kc6BW1UMH7Q5Xtd
         zuJnytO2Pfo4KJ3/Hao5/mnPwBKnM2YAEAnd84sOxZtES9a1NIOYl5I+RZPF0ytHO71m
         u43w==
X-Forwarded-Encrypted: i=1; AJvYcCVcoCYyj2SbrvbUBEmtGKNmyFl514SnMv6IFwP3pOZZUltmVC9EZqWWRWpNo6+QHKmeV+moE12ogdHweQ/qh/s6MqMaH66xEYpkUMlm
X-Gm-Message-State: AOJu0YxDGbOY2f/TvUoHN7+YrX81bT7jW4wXPLhOO//JZtstVIDE4eHb
	K0vW9gUE4Mjqt95+rOIpllky2Ql0XUPvc+wQRlJW9eQ3RISFzhwD
X-Google-Smtp-Source: AGHT+IFIldSyzbbCJ+hsZsoZunyrocfc9ycgS0pL5fYmvUqQyAR2jtyv2kjmcAuWJPQInx+F8WFnGA==
X-Received: by 2002:a05:6402:14d0:b0:58b:e3b:c5db with SMTP id 4fb4d7f45d1cf-58b0e3bcb29mr393220a12.4.1719862006584;
        Mon, 01 Jul 2024 12:26:46 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50da0sm4761129a12.59.2024.07.01.12.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 12:26:46 -0700 (PDT)
Message-ID: <e4006c92-b5ff-4f28-9cf7-3f5c2a808234@gmail.com>
Date: Mon, 1 Jul 2024 21:26:45 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] staging: nvec: cannot configure to compile driver for
 testing
To: =?UTF-8?Q?=C3=81gatha_Isabelle_Chris_Moreira_Guedes?= <code@agatha.dev>
Cc: linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Tom Mounet <tommounet@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, Marc Dietrich <marvin24@gmx.de>,
 Greg KH <gregkh@linuxfoundation.org>
References: <13cd3ec0-0f4f-4119-b2a5-f74e33e3c862@gmail.com>
 <yhpx2piocn5bkzaqec7mdyosb7x5zpws5l52lmx4xnejmr5xeh@6s3oe4cagcen>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <yhpx2piocn5bkzaqec7mdyosb7x5zpws5l52lmx4xnejmr5xeh@6s3oe4cagcen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/24 04:13, Ágatha Isabelle Chris Moreira Guedes wrote:
> Hi!
> 
> On Sun, Jun 30, 2024 at 12:37:53PM GMT, Philipp Hortmann wrote:
>> When start make menuconfig
>>
>> and search with / for NVEC I can see:
>>
>> Symbol: MFD_NVEC [=n]
>> Type  : tristate
>>
>>                                         Defined at
>> drivers/staging/nvec/Kconfig:2
>> Prompt: NV Tegra Embedded Controller SMBus Interface
>> Depends on: STAGING [=y] && I2C [=y] && GPIOLIB [=y] && ARCH_TEGRA
>> Location:
>>
>>   -> Device Drivers                                                      (2)
>> -> Staging drivers (STAGING [=y])
>> 	 -> NV Tegra Embedded Controller SMBus Interface (MFD_NVEC [=n])
>> Selects: MFD_CORE [=y]
>>
>>
>> But I cannot jump or go into "NV Tegra Embedded Controller SMBus Interface"
> 
> Have you checked whether you have its dependencies enabled?
> 
> It seems like you have STAGING, I2C and GPIOLIB, but not ARCH_TEGRA.
> 
> Is your kernel configured for the right architecture? Are you using
> ARCH=arm environment variable? You can do this by running the command:
> 
> $ ARCH=arm make menuconfig
> 
>> In my .config file there is no string "NVEC" at all.
> 
> If it's generated by `make menuconfig` and you don't have the
> dependencies, as far as I can recall it's not supposed to have this
> string at all.
> 
>> How to config this driver to be compiled?
> 
> I haven't worked much with kernel for ARM-based SoCs, but I think as
> soon as you have your kernel properly configured for the correct
> architecture and having all dependencies met  you'll see it there. I
> just tested and it shows up for me
> 


Hi,

thanks for the hints. Here the steps I took on my x86_64:

saved my .config file.
sudo apt install gcc-aarch64-linux-gnu
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
make defconfig
make menuconfig
	used / NVEC to find driver(s) and set them all to modules
make scripts prepare modules_prepare
make -j6
make -C . M=drivers/staging/nvec

Thanks for your support.

Bye Philipp











