Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CF21018F;
	Thu,  8 May 2025 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693757; cv=none; b=VY9OUsQ0DGUXhf2Z47/y4g4GywNxxN5T9g22fTlm2paWeVM/y6A67Fgrxz+k0t/TfusQcwIzqJEl2ldbTkXBwhViajQeGZQkzHm6HWVlbqIko721bVNfQ16eFqPwchbgeE8XnWyQK9KPjXOkponqBxnCqqkKjYkT97lm77rlNl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693757; c=relaxed/simple;
	bh=P+E3NNjEk7mDbGoMuwRiIBIXW3l8dZzpasnSJi954yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qL/7xOABrxseDtjpA1G1QEU5mlgp8odRBYSDjJHJj2FLRVCHHNsFJIJyN9Ojfl3jEJRoyDHd2Ae5qyydxHkY18AZIAk3uDvYnwTWUH7MMHujGGKqeRJy7uka/GW79TNLvasIDRJeyghgdFX9hwKRMzNOYY1ICv7GbbU9UcYBafQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuHeH5Sh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuHeH5Sh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34804C4CEE7;
	Thu,  8 May 2025 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746693756;
	bh=P+E3NNjEk7mDbGoMuwRiIBIXW3l8dZzpasnSJi954yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kuHeH5Sh0nD/r5HLG1hp0CiM+1Lkc8z/qqMF7RHFI1PvGn7dqtl02dWR5TrLzp0Hd
	 0FAylV8OyW3MUkwcHoh9GwHW1O8McNcCPcvFH05f92I2Z9raYujhNamPWQJd65bzOH
	 jjVrrrmfvdlY7zd/vo3YGBUdwuAbuTXkOPl2ALa1FmVtiNv98s1Jyhs81zXSF9uXpv
	 K/Me1kgLQkHTKE9plJUffAXkMn3rZT35mvJ8YZm66e6WRIzlAhiPNBcuoKvpoLk6l8
	 rHzK68KceHudJBa9sbajJRAlVewddYawfKbX/6+Dm7/cJRpAXagCK5ytjwgOB0v1zj
	 4+L0XevzkRXmg==
Message-ID: <b20ad0cf-f49b-4c78-ab67-adf3a4c55cf0@kernel.org>
Date: Thu, 8 May 2025 10:42:33 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
 <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 09:53, Thierry Reding wrote:
> On Thu, May 08, 2025 at 09:40:02AM +0200, Krzysztof Kozlowski wrote:
>> On 07/05/2025 16:37, Thierry Reding wrote:
>>> @@ -0,0 +1,9 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
>>> +
>>> +#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
>>> +#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
>>> +
>>> +#define TEGRA264_CLK_CLK_S			2U
>>
>> Abstract IDs start from 0 or 1, not 2. Also drop "U".
> 
> These are not abstract IDs, they are defined by the BPMP ABI. We cannot
> change them, otherwise it'll completely break.


You mean from the firmware? Sure. You have entire commit msg to explain
all unusual things here...

> 
> For similar reasons I'd like to keep the "U". These definitions are for
> the most part directly imported from the BPMP ABI headers, though we do
> try to be selective about what we add, to avoid adding hundreds of new
> lines in one go, and several safety-checking tools run on these headers
> that happen to require the "U" suffix to make sure these have a defined
> type.
> 
>>> +
>>> +#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
>>> diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-bindings/reset/tegra264-reset.h
>>> new file mode 100644
>>> index 000000000000..31d89dcf62fa
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/tegra264-reset.h
>>> @@ -0,0 +1,7 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
>>> +
>>> +#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
>>> +#define DT_BINDINGS_RESET_TEGRA264_RESET_H
>>> +
>> This is empty, drop.
> 
> We have three people currently working on additional drivers for this
> SoC and they all need to add to these two files. Adding the empty file
> here makes it a bit easier to coordinate things, making the resulting
> conflicts trivial to resolve.


Bindings are supposed to be complete (see writing bindings doc), this
means also bindings headers. If the constants come from firmware, they
are defined so I really do not understands why they cannot be published now.

Unless you mean that this is a new SoC and the firmware is not yet
fixed/finished, but all this must be explained in the commit msg.

Best regards,
Krzysztof
