Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE133993;
	Tue, 17 Feb 2026 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316303; cv=none; b=CNKFWaH9VJy44FCQ7U4DYYIzEm9ETDVfClkshagf/Znfv9+MJd3WeY+Zn5d6D74mjdrvAkjq9ogIfATDISC1qdhbTSwpdxARD9sPUg5OFAd5xgTfLNE8H0WsQFPadviqyu/Aqc5TBYwxRvqAPpbAx7/XPxfYx0pKsXYXDqoXTAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316303; c=relaxed/simple;
	bh=t8EF5zJ4Ib7/+4xeguOma5i5fWqBUayxEnM7ya6pBBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwojWWOu0lPOT6wasnlp9ijnBx5/yQMd2K8LMcVmxeBLL9jTaC4hY5s+faJyHRBUuGFwtHPz4d7eKs8YicJZ7zOXKWxcYQMtiS0gJvlHbiTXBFbf+EWoeLjjjXdxxG7sVliC5duYOmxKUAI6FdAJH+b4ySWX8CA52Ex7w7OjBt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMb6DctH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMb6DctH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6128DC4CEF7;
	Tue, 17 Feb 2026 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771316302;
	bh=t8EF5zJ4Ib7/+4xeguOma5i5fWqBUayxEnM7ya6pBBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FMb6DctHZVuywSaP+NkDxnexlYugvAiynmlkT4/PsIJ8qJWY8F1/kZoeqWsrRi+sF
	 p8uBT+UtOeEnNWeifpZ7shY5GHFsS5gMm53ZQotRec/Eog2MDJeSWlxlJw592MyNxy
	 GQRAzYfLTPWh1+Scim9N4A+JiEDX/+B2ZTU2j+I5KWoPl7qkOeHEajVIu+H24yeDND
	 iOQ8iy/+1bDQxkVwpi/Cyxr0GOJg44vYekI1D37IJFhwm7z9Krgtx+VYvEQYAzXPCp
	 EUZf0vwlOQHrCDfXOMiDdOKFka7Tswv61alfdCiXE4Jm3yMxFngoCnkzJ/w1xyj78N
	 B0ye3VUOWxHaA==
Message-ID: <b19dcc48-33be-4eb7-8b69-d7ddebefe257@kernel.org>
Date: Tue, 17 Feb 2026 09:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] memory: tegra: Add Tegra114 EMC driver
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260126190755.78475-1-clamor95@gmail.com>
 <20260126190755.78475-6-clamor95@gmail.com>
 <6f143fdd-1e2d-428d-9b05-cf1124b179e8@kernel.org>
 <CAPVz0n0Ep_YAJfm0R_PexKo5WwrTDbJfFKUbLVKtG5q1qLONUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAPVz0n0Ep_YAJfm0R_PexKo5WwrTDbJfFKUbLVKtG5q1qLONUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2026 08:51, Svyatoslav Ryhel wrote:
> вт, 17 лют. 2026 р. о 09:21 Krzysztof Kozlowski <krzk@kernel.org> пише:
>>
>> On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
>>> Introduce driver for the External Memory Controller (EMC) found in
>>> Tegra114 SoC. It controls the external DRAM on the board. The purpose of
>>> this driver is to program memory timing for external memory on the EMC
>>> clock rate change.
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>>  drivers/memory/tegra/Kconfig        |   12 +
>>>  drivers/memory/tegra/Makefile       |    1 +
>>>  drivers/memory/tegra/tegra114-emc.c | 1463 +++++++++++++++++++++++++++
>>
>> Please rebase on top of Mikko's patch removing duplicated code.
>>
>>>  3 files changed, 1476 insertions(+)
>>>  create mode 100644 drivers/memory/tegra/tegra114-emc.c
>>>
>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>> index fc5a27791826..11e7cc357d39 100644
>>> --- a/drivers/memory/tegra/Kconfig
>>> +++ b/drivers/memory/tegra/Kconfig
>>> @@ -35,6 +35,18 @@ config TEGRA30_EMC
>>>         This driver is required to change memory timings / clock rate for
>>>         external memory.
>>>
>>> +config TEGRA114_EMC
>>> +     tristate "NVIDIA Tegra114 External Memory Controller driver"
>>> +     default y
>>> +     depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
>>> +     select TEGRA124_CLK_EMC if ARCH_TEGRA
>>> +     select PM_OPP
>>> +     help
>>> +       This driver is for the External Memory Controller (EMC) found on
>>> +       Tegra114 chips. The EMC controls the external DRAM on the board.
>>> +       This driver is required to change memory timings / clock rate for
>>> +       external memory.
>>> +
>>>  config TEGRA124_EMC
>>>       tristate "NVIDIA Tegra124 External Memory Controller driver"
>>>       default ARCH_TEGRA_124_SOC
>>> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
>>> index 6334601e6120..6b9156de4b66 100644
>>> --- a/drivers/memory/tegra/Makefile
>>> +++ b/drivers/memory/tegra/Makefile
>>> @@ -16,6 +16,7 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>>>
>>>  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
>>>  obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
>>> +obj-$(CONFIG_TEGRA114_EMC) += tegra114-emc.o
>>>  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
>>>  obj-$(CONFIG_TEGRA210_EMC_TABLE) += tegra210-emc-table.o
>>>  obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
>>> diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
>>> new file mode 100644
>>> index 000000000000..789b8e959a68
>>> --- /dev/null
>>> +++ b/drivers/memory/tegra/tegra114-emc.c
>>> @@ -0,0 +1,1463 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Tegra114 External Memory Controller driver
>>> + *
>>> + * Based on downstream driver from NVIDIA and tegra124-emc.c
>>> + * Copyright (C) 2011-2014 NVIDIA Corporation
>>> + *
>>> + * Copyright (C) 2024 Svyatoslav Ryhel <clamor95@gmail.com>
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>
>> Where is it used?
>>
>>> +#include <linux/clk.h>
>>> +#include <linux/clkdev.h>
>>
>> Where is it used?
>>
>>> +#include <linux/clk/tegra.h>
>>
>> Where is it used?
>>
> 
> All 4 by tegra124_clk_set_emc_callbacks

What? That's not how C works.

There is no definition of tegra124_clk_set_emc_callbacks here in this
patch, so the headers are not used. Point me to any symbols from these
headers being used in this patch.

Best regards,
Krzysztof
