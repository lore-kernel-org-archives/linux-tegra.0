Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5D2046A5;
	Tue,  8 Apr 2025 06:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092485; cv=none; b=mTjWRKvQPKg+VXZTevQPT0gp15HKBrJCwAJEdJJOaOX9tK/+GfEQRYu5qFa83W241BO2IKkluyy9t4zz7Njr+kVmnHwAJzHesbtUlqXqOYjuQXkSpk23+CejHISeMxVyuo8ZoierYW/DTuHHJewQezl6Y4snP+lPiPgA9s+5ujg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092485; c=relaxed/simple;
	bh=4EXbaWHpYi8DQSCUTq4v19YcmvFXSvgrzytJ0LYYrew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXIyCEQB4q1LtfktkWRaczFhXbbASggsq2kIYKwF2A/2FFPa4i/FcaMZYF3Cn4sgRZJNVjm/2qILa08ptBO/ANXkj86hyJ259BMiUnnBEAOY+scB6nthzga6to2fmLh/epwWrsJoDlGwLmwwHe5i9BTaN+Lyd8uHOAECiTQHSqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8bAWxti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8bAWxti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54F9C4CEE5;
	Tue,  8 Apr 2025 06:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744092485;
	bh=4EXbaWHpYi8DQSCUTq4v19YcmvFXSvgrzytJ0LYYrew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i8bAWxtiJl/Zc9F70+mWYW1dpffCfK+raI81ht60ZhM7SQncYApnR86ZPj54cbPVm
	 qx9IJjFyJ4OiHxWrooltbxV5F/NMxJ4A2e5miF30zZMvx9HzwW9yQlQoOM5bqYkzUr
	 1RgKTWJKWIXrdiGUSwUbSvEaGizUSZxKwweIRZQSdgHzg3O+UyNNRt9mhcAms3LiW5
	 ka2kCYVJdd61MiT8/vkhwvXd+gADMsKj8N/LFf58ZzbJdN9ZWdbLShjjlAI3j9yme3
	 UZ5I92MnUfHw7AuuGdIZAYdfrsEs2GPC3aPR23fssng7r6mk1uZvAHvO2pBWzjvTey
	 dWh3TVd4SKf5g==
Message-ID: <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
Date: Tue, 8 Apr 2025 08:07:59 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
 <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org>
 <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 18:00, Aaron Kling wrote:
> On Mon, Apr 7, 2025 at 7:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> This allows using pstore on all such platforms. There are some
>>> differences per arch:
>>>
>>> * Tegra132: Flounder does not appear to enumerate pstore and I do not
>>>   have access to norrin, thus Tegra132 is left out of this commit.
>>> * Tegra210: Does not support ramoops carveouts in the bootloader, instead
>>>   relying on a dowstream driver to allocate the carveout, hence this
>>>   hardcodes a location matching what the downstream driver picks.
>>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the address and
>>>   size in a node specifically named /reserved-memory/ramoops_carveout,
>>>   thus these cannot be renamed.
>>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node based on
>>>   compatible, however the dt still does not know the address, so keeping
>>>   the node name consistent on Tegra186 and newer.
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
>>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
>>>  4 files changed, 61 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd754e42dd03f5a1da5079971dc 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> @@ -2051,6 +2051,22 @@ pmu-denver {
>>>               interrupt-affinity = <&denver_0 &denver_1>;
>>>       };
>>>
>>> +     reserved-memory {
>>> +             #address-cells = <2>;
>>> +             #size-cells = <2>;
>>> +             ranges;
>>> +
>>> +             ramoops_carveout {
>>
>> Please follow DTS coding style for name, so this is probably only ramoops.
> 
> As per the commit message regarding tegra186: bootloader fills in the
> address and size in a node specifically named
> /reserved-memory/ramoops_carveout, thus these cannot be renamed.

That's not a reason to introduce issues. Bootloader is supposed to
follow same conventions or use aliases or labels (depending on the node).

If bootloader adds junk, does it mean we have to accept that junk?

> 
>>
>> It does not look like you tested the DTS against bindings. Please run
>> `make dtbs_check W=1` (see
>> Documentation/devicetree/bindings/writing-schema.rst or
>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>> for instructions).
>> Maybe you need to update your dtschema and yamllint. Don't rely on
>> distro packages for dtschema and be sure you are using the latest
>> released dtschema.
> 
> The bot is reporting that the reg field is missing from the added
> ramoops nodes on t186, t194, and t234. However, as also mentioned in
> the commit message, this is intentional because it is expected for the
> bootloader to fill that in. It is not known at dt compile time. Is
> there a way to mark this as intentional, so dtschema doesn't flag it?

Fix your bootloader or chain load some normal one, like U-Boot.

Best regards,
Krzysztof
