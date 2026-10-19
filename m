Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430601;
	b=uUu8ET3POzPkTBJcB8MiCbjSKowGBWjU8nnLO8F/AHfuyvwbb8ZXA+kG/tjvCY717cao
	 cx042zlDJ9/YUCLi2AsyLGYxEUA9PvSQ1jHQiDc3J2GYkYAlNl8/CtG3lt+te/6y2z5cX
	 Vdp6jNiIm4eGK43TVQM/sU8CNurUBh6Dgmi3PssHpjtFSzOTxCML4tIj0ITsASszvQxFq
	 8597nPMN/wwpXPcMte+koQvcwXL/64ay+s0d81ZSJrIG76R/Arc12e0mPG9hkSZZ+cY7v
	 eARZcbpr1udRiPpZ06cbxbkljiOtYVLVlEdXyscIH6OBT9DGEHhK0+tPM7Jnh9MEPJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
	b=1875vyD+utRj2dexfhSNWlXR1N/SQr6tTXwhxaKrFeRkguU6cFHHcvwUKr6qIoPEFZWW
	 HJ2giOY6hOH+09J7EsYN+q4P1CLAfoAm1cXgUFcXv12dDpaGvWId83W+TYywQozUuNTzp
	 +57fnj8O368s1VexXnrCzUCVf8S5JhdX1LfX9NvJ3NcNrXk/4oP8u0StoPp411CUw/24f
	 2zaZ6oApAksyFVeAfVZ22j7hP6AeljFxW3olIFTnq3zvQa/uPo1UySjsmhcOjReIJZu9M
	 pshkio3H7kPszdWAPyGLFGhLVCnk8h+MU5yM0RyvCDqZG4pjYqeLN2PeoZNc51t018g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xrJ3CVQS;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974A5606A324
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 17:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974A5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xrJ3CVQS
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1447759f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792430599; x=1793035399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
        b=xrJ3CVQSp123OrHRWakMwwLvRCPyALMdPVipV2UsJjCIoUTLR7morKTAk17lhHp6EO
         2DxdvTVRdC82uO9JgWxqroq4NbW+Lr/wBuyhfv5KU57y/dEEzWhlNxzmjDrzjvjIv51B
         vSxuCjn2AAls+yb4o3ajXqIegrWuRn20NPUhRIicbAYAiRS0zPYgovPKPESfcfL3yZ6c
         9UCKBgbkt9AgWODOWQg6mxsqqWdDjXXWEu4XNlT8LsVlAgP9l9EX/dWOQpZ37AEnLljk
         pXkT3rG6kFwU7Z0lPT/rCBg8MrH3TCDULMJl2iVxXlxezLooCY7+wjcpOK53ATfstfAI
         XhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430599; x=1793035399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
        b=DvKAbvAJGGyD5Dgj0hfXs8yP2zLLZrZnhVeqDWzs0fgLVzj/hQufOprb4MKOKbj9WO
         lBW88jYS83+njsHgUa58yBLsdavNxOLpOSm5AApTIlxqShANHqAo4I5vbNNSvYdok2ed
         MI2XORbxtXKzI3jHUq8KvvXYOCL/0cy6T4KH4DGGsuq3uE2IgmVOVyhdZUBd4XNdvF4j
         D/E0jIri8M32L33Gs3mKsqOM7AVsbSrXgRCNpAEsHB3dcdNBZgDz+rf36LL2jsVZDM37
         dq6epJDIJ13QtRDLCyTcGUx/RtwwyeKUB3gGqEPqDDiu19gKdyOknM5EVQQ8gpV4S+xa
         tA8w==
X-Gm-Message-State: AFq9FYKclhjDMVBaXVrbIUTchVgWKO0Eb+u2aTvxPWxhqNJjNFvLOfQ1
	Wp09+7eJfm/cTYby9QkDsE7GqXBroDgO7p4lrSabf2HxSzZhvIil7KsqZfWI/A5To/s=
X-Gm-Gg: AYBFou33VS5eMqYPgOHLETcYoEp3ro/mVVntXpGqRrQRuf3HRDN4Qu5OeFELXW9K2xh
	OnF3pWIEv0aBGD4snu55+36LdbCrB+l9bXLa9rSD8i7bi+0S3ixVjQIWVRbXJo/maEU/mWAV4Sg
	diNOJtq8eUzEjN8KRWnAdkSI949JnHFJOYzZVEyY5oLZpgH4sz9VowAG2qt5ZF6AS/4YFGOnF2V
	w16mAOeU3He0tnUoxoPs1d6Sa348uNIKQRmq4rI9fZDJcBMhncM4S7XQDshkt5oAwflkdyBwFqm
	9E1T4+mNNLqAEUZj2S4U9VF8JaG5W34xJF8mZwdyJXIsrcC0RuDzUmWYnx3SeDeB3nrS+wwXHXN
	cG49y1+/nU4w/93c80kejYcH6gYY5SO3A0dMIev0zf9iQqeNQKbUoSv6LQehIb9CFafBejargn9
	gHRMAyZKmg8Ej4JYYwGIznoPr1K6/yDlPH+JERlYB/U6G9Et7n4zEwHonMtPIrnu5jbBkOjIvoQ
	iE=
X-Received: by 2002:a05:600d:4447:20b0:4a1:d483:559b with SMTP id 5b1f17b1804b1-4a1d7612bbdmr129179715e9.24.1792430598956;
        Mon, 19 Oct 2026 10:23:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm184529f8f.58.2026.10.19.10.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:23:18 -0700 (PDT)
Message-ID: <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org>
Date: Mon, 19 Oct 2026 18:23:16 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com,
 rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com,
 john.garry@linux.dev, will@kernel.org, mike.leach@arm.com,
 leo.yan@linux.dev, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, adrian.hunter@intel.com, ctshao@google.com
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261019164241.403644-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/10/2026 17:42, Besar Wicaksono wrote:
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs.
> 
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
> 
> Patch 1 fixes a jevents ordering problem found with this layout: the
> uncore events live in arch/arm64/nvidia/t410/sys/, next to the T410 core
> events, and without the fix jevents puts the core tlb.json (which sorts
> after "sys") into the sys table, so its events are lost from perf list
> and perf stat.
> 
> Besar Wicaksono (6):
>    perf jevents: Process model files before sys subdirectories
>    perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>      aliasing
>    perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
> 
>   .../arm64/nvidia/t410/sys/uncore-cpu_mem.json |  48 ++
>   .../arm64/nvidia/t410/sys/uncore-nvclink.json |  75 ++
>   .../arm64/nvidia/t410/sys/uncore-nvdlink.json |  48 ++
>   .../nvidia/t410/sys/uncore-nvlink_c2c.json    | 129 ++++
>   .../arm64/nvidia/t410/sys/uncore-pcie.json    | 247 +++++++
>   .../nvidia/t410/sys/uncore-pcie_tgt.json      |  93 +++
>   .../arm64/nvidia/t410/sys/uncore-ucf.json     | 693 ++++++++++++++++++
>   tools/perf/pmu-events/jevents.py              |   4 +-
>   8 files changed, 1336 insertions(+), 1 deletion(-)
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvclink.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvdlink.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvlink_c2c.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-ucf.json
> 

Reviewed-by: James Clark <james.clark@linaro.org>
