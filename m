Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342E327C18
	for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292067; cv=none; b=Icpv5okozt8//jLiUCclhrsUqMPKDOZwdOwWpNYx3YazHaY5m3aoU3qzeE9q7rQMTySRGIasVLg+HxAdPi9xAjJJYD1XX9k1N3pmRNfSoOjngZ9fXHfuNKqvJmA2vEE8psleSZCQIrQ0o1s7A7oCO5UZoLW25r5h0DA+can1fT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292067; c=relaxed/simple;
	bh=xzNhZ3CusPSO1J1Znrn+UVizVz7JUvH/VJLig13VWCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPAGXvoF3K0DfF/k0MMdE4YDfb1q9Cp+r1rNui/VmJiZbwMUHYonZnWAIH9TzDAWkddwC/NOrqqbBX+ho8JIacpxoayLIs4VgZUTy1IHVzNEwsT7o0sFjT76+b2zgBvD0LcTUzNtA/5hXZ76u8hsSE65EiQaPHQkR8we7wzvR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGkCFsBc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGkCFsBc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2375767a91.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774292065; x=1774896865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=R/LIDRHoOR5nh8Q3fCWPthR73ZHHv9nmxljWeuQGw2A=;
        b=MGkCFsBcmEji/LTZ2T1WGPEZupfX45nqV087NQiMrtO7e1uHPHGwpmbnXnkrdZwCc7
         3CxIjVvMLOUm9t9vW4MJeeSux9oSgLC5s3Mp872Ocin57kpbpv/IurYL+DjPIPiK3K83
         eG97WrfdGuOhCFaqZmMNWjUkFDDKxrt+GVecuLfLZLOrSKRFFuvYF0LjtBix0+src6bK
         7juw+yltrA3yp5FLXoohGCaAoqZOmQ1LLxyWHgv6/L0VhTdR83xpHp87A5+yYOlxIuY2
         7CaTsQODIcJHOyQIxR7ETuCIqK1Zw8N6ISx7+ePaoQYVH4GxMU9f88A8+8ekjOYNy/6P
         tTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292065; x=1774896865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/LIDRHoOR5nh8Q3fCWPthR73ZHHv9nmxljWeuQGw2A=;
        b=XDCD7E//A6lxin2DEcgXlgR6nqvaIg0r2V7dAps62BijkJNn2uejkoWVzf3vmLNJFS
         cNDnX1aZP0lWL9EPSqZrBQBwwoG8FCcnhYYQehGB8ds8o8kl1JeOk/LIjRDWorrfCHy8
         /iRfS70mAkvdl8uQcPpD/D2530cXUEBVmmuF63wQCFHa+snFiczDhRg8sd+5W3qZ5zhW
         agyznjt9m49le+9cmHPph0Kb204T8egprKemdLHpm9vN4uqRHIw/a8qBdaJoJxD/56ra
         XnRaweU3KJ4R/QaEJVB0jlFHXUNqWRx9qa5nv2zahUgjGhl04yOJYoXVmmIbuY3LOSsr
         l8kA==
X-Forwarded-Encrypted: i=1; AJvYcCWZSlHNn5mzPokzKvGyJiUvbfZbWHDsRAUtSD5qdi6PazELhL5lshWTCMbY1PQeTIs1eXtH8EDHx42jBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1MRL5IltCLoc38L+KqayZeyDQEF3lXNCzAjAMsc1GBam3cbZ
	9bj8iXCRZ1lgvceKpyX5MZ2mpysvbGv7d2Qibi0g2nHDmB3bIVZzSbpL
X-Gm-Gg: ATEYQzxFZy1+Wj2QOYe1UzlEpbyaeF39QRSQV4+BN1lvBaXjP+gKYRVglLkqMXOiakw
	Ghr6Vj9+nr1TDWkFFyaIAuHBXfI3oNymlzoKQsDz07KOFmn2SVto/M3f5oSlGm5/0sQnhQtdvQv
	ADFMo1GitWJrcgRdLAWG59JwBmL8O/k6fyeZ+afDN34o+eNE+AQFva7c6UWjvGVH+tN6SH5SBJZ
	b3os9q6ifVCWZV34tSvG0j0Hk3jALHAYXVm4/FqJuTBA69h/ZK3MSuT43zcqVPbNzTaCTs/6NAq
	Bk1zIDOoTEAKoMg7Lfjr3b8lkHacmOAfKwqiWAIIrygERY5hoMdlwoaACtAE9AohM8MztGu7J7Q
	d+WmvEGQGXWR+/O1fa5qfFL7trxMSsK8Jad8pYK/UN5QOQeqN5v8zzlLKdPQkyD8Jf1cOnlyGA7
	LNJm3VCuYEwzQkUZra/YA7QzpqJU21ptaWYvVtFkr6JZBtP8rz8Rv4rF9jmVMRWg2iULfU8djV
X-Received: by 2002:a17:90b:3dcf:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35c007be70dmr432915a91.3.1774292065020;
        Mon, 23 Mar 2026 11:54:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3eb46e3sm9800649a91.1.2026.03.23.11.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 11:54:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6cef4665-1678-41f4-9199-8e226f26e6b9@roeck-us.net>
Date: Mon, 23 Mar 2026 11:54:22 -0700
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
To: Akhil R <akhilrajeev@nvidia.com>, lkp@intel.com
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech,
 jonathanh@nvidia.com, krzk@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
 miquel.raynal@bootlin.com, oe-kbuild-all@lists.linux.dev,
 p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com,
 robh@kernel.org, smangipudi@nvidia.com, thierry.reding@kernel.org
References: <202603230124.VFt6CPBe-lkp@intel.com>
 <20260323184207.68515-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323184207.68515-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 11:42, Akhil R wrote:
> On Mon, 23 Mar 2026 01:47:20 +0800, kernel test robot wrote:
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on next-20260320]
>> [also build test ERROR on linus/master v7.0-rc4]
>> [cannot apply to i3c/i3c/next rafael-pm/linux-next rafael-pm/bleeding-edge groeck-staging/hwmon-next v7.0-rc4 v7.0-rc3 v7.0-rc2]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-i3c-Add-mipi-i3c-static-method-to-support-SETAASA/20260322-174037
>> base:   next-20260320
>> patch link:    https://lore.kernel.org/r/20260318172820.13771-5-akhilrajeev%40nvidia.com
>> patch subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
>> config: sparc-randconfig-002-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/config)
>> compiler: sparc-linux-gcc (GCC) 15.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202603230007.WOMwklQ6-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/i3c/master.c: In function 'i3c_master_add_i2c_boardinfo':
>>>> drivers/i3c/master.c:2449:23: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Wimplicit-function-declaration]
>>      2449 |                 ret = acpi_dev_get_resources(adev, &resources,
>>           |                       ^~~~~~~~~~~~~~~~~~~~~~
>>           |                       acpi_get_event_resources
>>>> drivers/i3c/master.c:2455:17: error: implicit declaration of function 'acpi_dev_free_resource_list' [-Wimplicit-function-declaration]
>>      2455 |                 acpi_dev_free_resource_list(&resources);
>>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/i3c/master.c: In function 'i3c_master_add_acpi_dev':
>>>> drivers/i3c/master.c:2556:9: error: unknown type name 'acpi_bus_address'; did you mean 'acpi_io_address'?
>>      2556 |         acpi_bus_address adr;
>>           |         ^~~~~~~~~~~~~~~~
>>           |         acpi_io_address
>>>> drivers/i3c/master.c:2563:14: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Wimplicit-function-declaration]
>>      2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
>>           |              ^~~~~~~~~~~~~~~
>>           |              acpi_has_watchdog
>>>> drivers/i3c/master.c:2563:34: error: invalid use of undefined type 'struct acpi_device'
>>      2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
>>           |                                  ^~
>>>> drivers/i3c/master.c:2566:15: error: implicit declaration of function 'acpi_device_adr'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
>>      2566 |         adr = acpi_device_adr(adev);
>>           |               ^~~~~~~~~~~~~~~
>>           |               acpi_device_handle
> 
> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
> are present in acpi.h. I think the bot checked this patch individually,
> or did I miss something?
> 

Did you try to build this code with a sparc cross-compiler ?
Because, as far as I can see, the functions are not declared or available
if ACPI is not enabled (or available, as with sparc).

Guenter

