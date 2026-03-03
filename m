Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F3B47DD78;
	Tue,  3 Mar 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549665; cv=none; b=DDu92WXS97frYjMVWvejQr1MWBtot0pzHaX+U4XGccv3zPDD3qo+KVlUSa9GbdBU8PrteNWNO2ygZJhA4EguSk40lxHsVf8Az/V3/CMl17IB+F4CljALpRDAWyvdxx4dHs4ZiE6wUbT43jYP4ihDyuHD0lj9nHTQD9YzlmydyY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549665; c=relaxed/simple;
	bh=Slb45QWwmAR2MlJYLyxHM7i5vjmCP+MZCFMlFewVzGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ba0rrJULO5OCjahlC+OBpJeOfoqC5JUmxkVtdlXd3kjKIBRQq4lcxKtiBKXpoQW0HpxANZ4RWKiJwIGbje/IwhnQcUWu5Xjjx1YR4gXToD5GoFMpfus6nuc6M+DZx05/movwR+r0zkK+vwtjQfN/JGJ9rjakSgEYu7S4myYA0oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3OnuGIA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3OnuGIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC70C116C6;
	Tue,  3 Mar 2026 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549665;
	bh=Slb45QWwmAR2MlJYLyxHM7i5vjmCP+MZCFMlFewVzGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k3OnuGIADSsLdlI8xZPEqDDKjRK8ycb5RmHYSLY7OAgQC1QfuXs2VnnDz54gNUYG2
	 tgPA8lJBYOJFhX/dqVq8T+RiSVvC1QSDlEYchLSUEC1xALOZg1zO7kgHUoZTVKX3VE
	 JpMKR5dOILbJDG53Yp9LWJrsImlVVAS5r8+XxQpyzTtffLUeJcyHc/emrjNQVUJfwy
	 /U77bFOjBh+mLgO069Ov6W6ez8URZTrC7+EG9jkQJ3qyUo+yCX9Ze23150SH5uBC7C
	 vFffB+x/clZd2O76RL4TGv9z/xA20TcwrsbSZIOZ5DI+mkkoGUeM3cLfceyPj91RIa
	 0gbSf4qNgeh1Q==
Message-ID: <38e38531-ad06-4971-b750-e77a3268b97a@kernel.org>
Date: Tue, 3 Mar 2026 15:54:19 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: tegra: Add support for Tegra238 soundcard
To: Jon Hunter <jonathanh@nvidia.com>, "Sheetal ." <sheetal@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aditya Bavanari <abavanari@nvidia.com>
References: <20260302085323.3139571-1-sheetal@nvidia.com>
 <20260302085323.3139571-3-sheetal@nvidia.com>
 <7447fde1-7eae-4bbc-b36e-fc0da9609c8c@kernel.org>
 <92292069-a60d-4ea8-9c3a-182a5c0cd267@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <92292069-a60d-4ea8-9c3a-182a5c0cd267@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2026 15:24, Jon Hunter wrote:
> 
> On 02/03/2026 09:04, Krzysztof Kozlowski wrote:
>> On 02/03/2026 09:53, Sheetal . wrote:
>>> From: Sheetal <sheetal@nvidia.com>
>>>
>>> Tegra238 platforms use different clock rates for plla and
>>> plla_out0 clocks. Add Tegra238 support in the Tegra
>>> sound card driver to apply specific clock configurations.
>>>
>>> Signed-off-by: Aditya Bavanari <abavanari@nvidia.com>
>>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>>> ---
>>>   sound/soc/tegra/tegra_audio_graph_card.c | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
>>> index 94b5ab77649b..b6dadd6a3d3d 100644
>>> --- a/sound/soc/tegra/tegra_audio_graph_card.c
>>> +++ b/sound/soc/tegra/tegra_audio_graph_card.c
>>> @@ -1,5 +1,5 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>> -// SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION. All rights reserved.
>>> +// SPDX-FileCopyrightText: Copyright (c) 2020-2026 NVIDIA CORPORATION. All rights reserved.
>>
>> If updating it, you should rather drop it and use standard copyright.
>> This tag is not supported in kernel in general and I document it only
>> because it already spread all over.
> 
> To be clear, you mean that 'SPDX-FileCopyrightText' is not supported? 

Yes

> Where exactly do you document it for reference?

paste SPDX-FileCopyrightText in lore


> 
> I know that Rob previously indicated that the 'Copyright' string in the 
> above was redundant, but we have been told to keep this by the people at 
> NVIDIA that specify how we should be formatting such tags when adding 
> NVIDIA copyrights.

For the kernel, for most of us, most likely legally it is redundant and
Rob was right, but some companies insist on it and I don't want to
discuss with them, because they never use actual arguments except "my
legal told me I must do", so you can have it. That's not a problem.


Best regards,
Krzysztof
