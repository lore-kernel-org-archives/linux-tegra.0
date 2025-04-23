Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27627CCC7
	for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420237; cv=none; b=aJKbLUaaFqsMA4nRkRtNSMYik2liDyTXu9+Lqu5ISAC4T1GYj4Cet0568K8kLiM+wpCpvm/5A6i20RVIgDp1zrIdKiJPSOsIBsXjgeLLlVIiIgWArjL7ikHF9cDhxsxWQPCcPMBtdO3zESoyAnteFGwKY+IG3RztYrbbVRAHZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420237; c=relaxed/simple;
	bh=L2+fFsOOIiiVFpcGVxzqurqwQu7AtginQsSOZ6MVl7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWDeuv5KQIzMSuH/uw1XzvoaB+W5zwI0Mx5z3Q9FO5sPut/Khqim9UyGQqwPZlFAQ7lB1YWy+MK7Kk/jX+SfY32f6doUTHzG0Xtr+mCrrVDGslQthyp+pBnmbfOe9AL3h2RViGnq0YZuzKYKuTUXhE9moHr4YBsGqZ3yfhuKkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KlqLblJD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KlqLblJD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a064a3e143so1144065f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745420232; x=1746025032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUDCtlDdD9FnwLrhTU1YzOhKTBBommPMrgobNX2rsFQ=;
        b=KlqLblJD/GB/8kX8O4kM4PJ5mTKFCZtbfhAnvz2OImjG+PfplT1w6/rko7CrJYuDB4
         Sg0zfPKbGgzOC3L/kyU8hr8eF9wwfboFMgS/4MVjfUejSVCOp4b1C0TUrngcMrvOFNdl
         H7piY/AfpGe+RPX7cgefEgXJFH9iepGblfIOAWuqFOAlTcuyL7bkCDpIM16Ugo1kYpan
         FTgH27+RWPjjGVOXi5ZTrjL+GMHi+mWCkZ+etq/UiRFp/T5B6eoL77zwRgWg6uMOeryc
         yDClHefgivfpXM1LkOPMhiok6iFHPDUs9foKKGUvby67tN76D5yBW16gLjgxb2pvD4MB
         HPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420232; x=1746025032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUDCtlDdD9FnwLrhTU1YzOhKTBBommPMrgobNX2rsFQ=;
        b=IrLi8GQuikrznmYlVAgAgArRzQm9rrFw/71lpvm5IG2Eyz7yvOou6Ois/QXgltNV8m
         Q5/mHXbTmTsezmMev40IDMRuGCKYTYZxoQ7ckDWJA95KoraRfA4xK/S7fKu2VorfboUK
         f4tZDhEHjqXmyhFdY0nnQogMGlmWPspzDRzHT+dm99rrm/3FQm4djIdNj7LFDX4erPon
         WY1zDb9zEno+DxQ/RIGxSex6axVd4mbFhw0dUNvcCj8l6DP/lFDNEiyLxXU2QnPUSOiy
         f7q16L1Mc85u2VUNTDvIaD/RYyVsFwvUm8FxQ90LE1CHat/FmHFDylmhELHf1XeCoRaI
         XH9A==
X-Forwarded-Encrypted: i=1; AJvYcCVpZtsYbxEA5sqHUV8si54BO5d3VOEdJEFFdgfxRYiqWTwcdjvQ2CjKhqDoGAHrjID+ac2SUOGGoTmLFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLYoNVg01tDeNd4uKKEM2v9X+i3qFdPJtdHGwI4aVUqoWvUaA
	vbGIER3IL2B6etm64Xf1IJgigiDeuwZ5vbRFX1sd/46hzKLsg3zKSAinr9NwcC8=
X-Gm-Gg: ASbGncvDrmubT9u+EpP4LJtGno5Fc2XrIGrvEYPblIUF1ai6WPtAGveUS5I7DWj7z24
	5OT6qltMJBE9oIHCJQOAfpxn3qDT7UiCvTI8IQp1tWL4coJjjGW/sFanj8TteB+4U6R8PHhrj5Z
	MXudrbN2HEODbJVGYrnhdDYG0DNOwVtMIxbKgfQ9cUaq3UDMM9fnUHGNFhgzZDwgP+G2eCgYgrp
	nn43xHsRGclK3abXBY5LD6uE8Yjo/8H/HKRLeCG0MxytFWaCzv4ORXDwx1eAGq9R8HydMt22MAK
	4l0e6UpdTx9TxQ4LvAWqBosBo8/Fk1zm1nHS4XUfuOo=
X-Google-Smtp-Source: AGHT+IEPainaGmGjpIiItMGlmlLgvOsPNvqLrthDPksqJiSBGTCfDQ36eqcMYcBmtNhgVr1tdiOcrA==
X-Received: by 2002:a05:6000:2409:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39efba2ab3cmr14435427f8f.6.1745420232327;
        Wed, 23 Apr 2025 07:57:12 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm19239229f8f.51.2025.04.23.07.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:57:11 -0700 (PDT)
Message-ID: <b2a5cfc4-190f-4983-8d5e-3483a02be980@linaro.org>
Date: Wed, 23 Apr 2025 15:57:10 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] tools headers: Update the syscall table with the
 kernel sources
To: Jon Hunter <jonathanh@nvidia.com>, Namhyung Kim <namhyung@kernel.org>,
 Arnd Bergmann <arnd@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 linux-arch@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, Kan Liang <kan.liang@linux.intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250410001125.391820-1-namhyung@kernel.org>
 <20250410001125.391820-6-namhyung@kernel.org>
 <f950fe96-34d3-4631-b04d-4a1584f4c2f1@linaro.org>
 <95c9bd53-ccef-4a34-b6d2-7203df84db01@linaro.org>
 <4c042dd9-50d6-401a-bce7-d22213b07bca@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <4c042dd9-50d6-401a-bce7-d22213b07bca@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/04/2025 10:24 am, Jon Hunter wrote:
> 
> On 16/04/2025 14:26, James Clark wrote:
>>
>>
>> On 14/04/2025 5:28 pm, James Clark wrote:
>>>
>>>
>>> On 10/04/2025 1:11 am, Namhyung Kim wrote:
>>>> To pick up the changes in:
>>>>
>>>>    c4a16820d9019940 fs: add open_tree_attr()
>>>>    2df1ad0d25803399 x86/arch_prctl: Simplify sys_arch_prctl()
>>>>    e632bca07c8eef1d arm64: generate 64-bit syscall.tbl
>>>>
>>>> This is basically to support the new open_tree_attr syscall.  But it
>>>> also needs to update asm-generic unistd.h header to get the new syscall
>>>> number.  And arm64 unistd.h header was converted to use the generic
>>>> 64-bit header.
>>>>
>>>> Addressing this perf tools build warning:
>>>>
>>>>    Warning: Kernel ABI header differences:
>>>>      diff -u tools/scripts/syscall.tbl scripts/syscall.tbl
>>>>      diff -u tools/perf/arch/x86/entry/syscalls/syscall_32.tbl arch/ 
>>>> x86/entry/syscalls/syscall_32.tbl
>>>>      diff -u tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/ 
>>>> x86/entry/syscalls/syscall_64.tbl
>>>>      diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl 
>>>> arch/ powerpc/kernel/syscalls/syscall.tbl
>>>>      diff -u tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/ 
>>>> s390/kernel/syscalls/syscall.tbl
>>>>      diff -u tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl 
>>>> arch/ mips/kernel/syscalls/syscall_n64.tbl
>>>>      diff -u tools/perf/arch/arm/entry/syscalls/syscall.tbl arch/ 
>>>> arm/ tools/syscall.tbl
>>>>      diff -u tools/perf/arch/sh/entry/syscalls/syscall.tbl arch/sh/ 
>>>> kernel/syscalls/syscall.tbl
>>>>      diff -u tools/perf/arch/sparc/entry/syscalls/syscall.tbl arch/ 
>>>> sparc/kernel/syscalls/syscall.tbl
>>>>      diff -u tools/perf/arch/xtensa/entry/syscalls/syscall.tbl arch/ 
>>>> xtensa/kernel/syscalls/syscall.tbl
>>>>      diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/ 
>>>> include/uapi/asm/unistd.h
>>>>      diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/ 
>>>> asm- generic/unistd.h
>>>>
>>>> Please see tools/include/uapi/README for further details.
>>>>
>>>> Cc: linux-arch@vger.kernel.org
>>>> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
>>>> ---
>>>>   tools/arch/arm64/include/uapi/asm/unistd.h    | 24 
>>>> +------------------
>>>>   tools/include/uapi/asm-generic/unistd.h       |  4 +++-
>>>>   .../perf/arch/arm/entry/syscalls/syscall.tbl  |  1 +
>>>>   .../arch/mips/entry/syscalls/syscall_n64.tbl  |  1 +
>>>>   .../arch/powerpc/entry/syscalls/syscall.tbl   |  1 +
>>>>   .../perf/arch/s390/entry/syscalls/syscall.tbl |  1 +
>>>>   tools/perf/arch/sh/entry/syscalls/syscall.tbl |  1 +
>>>>   .../arch/sparc/entry/syscalls/syscall.tbl     |  1 +
>>>>   .../arch/x86/entry/syscalls/syscall_32.tbl    |  3 ++-
>>>>   .../arch/x86/entry/syscalls/syscall_64.tbl    |  1 +
>>>>   .../arch/xtensa/entry/syscalls/syscall.tbl    |  1 +
>>>>   tools/scripts/syscall.tbl                     |  1 +
>>>>   12 files changed, 15 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/tools/arch/arm64/include/uapi/asm/unistd.h b/tools/ 
>>>> arch/ arm64/include/uapi/asm/unistd.h
>>>> index 9306726337fe005e..df36f23876e863ff 100644
>>>> --- a/tools/arch/arm64/include/uapi/asm/unistd.h
>>>> +++ b/tools/arch/arm64/include/uapi/asm/unistd.h
>>>> @@ -1,24 +1,2 @@
>>>>   /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>>> -/*
>>>> - * Copyright (C) 2012 ARM Ltd.
>>>> - *
>>>> - * This program is free software; you can redistribute it and/or 
>>>> modify
>>>> - * it under the terms of the GNU General Public License version 2 as
>>>> - * published by the Free Software Foundation.
>>>> - *
>>>> - * This program is distributed in the hope that it will be useful,
>>>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> - * GNU General Public License for more details.
>>>> - *
>>>> - * You should have received a copy of the GNU General Public License
>>>> - * along with this program.  If not, see <http://www.gnu.org/ 
>>>> licenses/>.
>>>> - */
>>>> -
>>>> -#define __ARCH_WANT_RENAMEAT
>>>> -#define __ARCH_WANT_NEW_STAT
>>>> -#define __ARCH_WANT_SET_GET_RLIMIT
>>>> -#define __ARCH_WANT_TIME32_SYSCALLS
>>>> -#define __ARCH_WANT_MEMFD_SECRET
>>>> -
>>>> -#include <asm-generic/unistd.h>
>>>> +#include <asm/unistd_64.h>
>>>
>>> Hi Namhyung,
>>>
>>> Since we're not including the generic syscalls here anymore we now 
>>> need to generate the syscall header file for the Perf build to work 
>>> (build error pasted at the end for reference).
>>>
>>> I had a go at adding the rule for it, but I saw that we'd need to 
>>> pull in quite a bit from the kernel so it was blurring the lines 
>>> about the separation of the tools/ folder. For example this file has 
>>> the arm64 defs:
>>>
>>>   arch/arm64/kernel/Makefile.syscalls
>>>
>>> To make this common part of the makefile work:
>>>
>>>   scripts/Makefile.asm-headers
>>>
>>> Maybe we can just copy or reimplement Makefile.syscalls, but I'm not 
>>> even sure if Makefile.asm-headers will work with the tools/ build 
>>> structure so maybe that has to be re-implemented too. Adding Arnd to 
>>> see what he thinks.
>>>
>>> As far as I can tell this is a separate issue to the work that 
>>> Charlie and Ian did recently to build all arch's syscall numbers into 
>>> Perf to use for reporting, as this is requires a single header for 
>>> the build.
>>>
>>> Thanks
>>> James
>>>
>>> ---
>>>
>>> In file included from /usr/include/aarch64-linux-gnu/sys/syscall.h:24,
>>>                   from evsel.c:4:
>>> /home/jamcla02/workspace/linux/linux/tools/arch/arm64/include/uapi/ 
>>> asm/ unistd.h:2:10: fatal error: asm/unistd_64.h: No such file or 
>>> directory
>>>      2 | #include <asm/unistd_64.h>
>>>        |          ^~~~~~~~~~~~~~~~~
>>>
>>>
>>>
>>
>> Hmmm I see this was also mentioned a while ago here [1]. Maybe I can 
>> have another go at adding the makerule to generate the file. I'll 
>> probably start by including as much as possible from the existing make 
>> rules from the kernel side. I think something similar was already done 
>> for generating the sysreg defs in commit 02e85f74668e ("tools: arm64: 
>> Add a Makefile for generating sysreg-defs.h")
>>
>>
>> [1]: https://lore.kernel.org/lkml/ZrO5HR9x2xyPKttx@google.com/T/ 
>> #m269c1d3c64e3e0c96f45102d358d9583c69b722f
> 
> 
> FWIW I am seeing this build issue too on ARM64 and these changes have 
> now landed in the mainline :-(
> 
> So would be great to get this fixed or reverted.
> 
> Jon
> 

Hi Jon,

I probably should have updated this thread, but the fix is here:

https://lore.kernel.org/linux-perf-users/20250417-james-perf-fix-gen-syscall-v1-1-1d268c923901@linaro.org/

Thanks
James

