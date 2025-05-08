Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C22747B;
	Thu,  8 May 2025 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704835; cv=none; b=awkciRHE/xHZEk12o0yJLrF2oQ5BVFfhxyx4CKwkH0D1F260w7pFG6Jj8qiUzrvqZy/Flvu1TYkwJjrSVmKvY2nyCtFCP6eTwu4AfylTgBg7gwCvuafJNSH8D/yRo5IX3aAAQaKhw8eIbIqlf8VzaJEZZvCtuz4ZzpQJ58k31wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704835; c=relaxed/simple;
	bh=dh/jkJ3ZWl+P3fHQePAIxW7GaUXYmGgSnXKCQfEXiN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0GzNEnczZQx9cS0ToYG9WcbC+otz0srE7H0p6Qke2svt7JkH0SR0ZzzDAlQqYa/9K4LPgDC+UAP3qZFBADp8AwjRY+gZqZB9xSsIkNrXObGxMIzbhBmtQxBfB7dga54e1f7WsUUe+XEx4Zgu47sV7iAdnRhwEvuxces5GSPCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwvb6zwq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwvb6zwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2277C4CEE7;
	Thu,  8 May 2025 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746704834;
	bh=dh/jkJ3ZWl+P3fHQePAIxW7GaUXYmGgSnXKCQfEXiN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwvb6zwq0+Id+yM5MmY6AVCzwfRJLimqMZTJLu8VnkvVHap4bwq/uTqGMUsCw0lKz
	 QuinhbudqV4D9LBbnG+J+CcbLCvbQUujKOo2/UjnuqyK28MSn2WyaL1F6igrRagjug
	 tgo3qqWGbI5p1OTF3dll6pwf+KvnvGdECL45J4tZ5kLelE6xaoZEFZpfX0MX2L5XNB
	 PcV2UKoE2qajU151ILYp6b59wp0DJSMrYZzN9fYyWa/XNLdigth+nd+pw0XxvOa9YP
	 CPhknudflUHpNmagab5XVPNW+Gxyajk+t29Fka0gIxwk3E9T5Fz63nbnBTybomjPzE
	 cp/B8KTdlhQ+g==
Message-ID: <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org>
Date: Thu, 8 May 2025 13:47:10 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
To: Aaron Kling <webgeek1234@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2025 13:37, Aaron Kling wrote:
> On Thu, May 8, 2025 at 2:41 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Thu, May 08, 2025 at 01:07:37AM -0500, Aaron Kling via B4 Relay wrote:
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Add patch to describe the emc table bindings
>>> - Add patch to allow a fallback compatible on the tegra210 emc device to
>>>   match firmware expectations
>>> - Add a patch to include the baseline emc tables on p2180
>>> - Link to v1: https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com
>>>
>>> ---
>>> Aaron Kling (4):
>>>       dt-bindings: memory-controllers: Describe Tegra210 EMC Tables
>>>       dt-bindings: memory-controllers: tegra210: Allow fallback compatible
>>>       arm64: tegra: Add EMC timings to P2180
>>>       memory: tegra210-emc: Support Device Tree EMC Tables
>>>
>>>  .../nvidia,tegra21-emc-table.yaml                  |  1692 +
>>>  .../memory-controllers/nvidia,tegra210-emc.yaml    |    44 +-
>>>  arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi | 49749 +++++++++++++++++++
>>>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     1 +
>>>  drivers/memory/tegra/tegra210-emc-core.c           |   246 +-
>>>  5 files changed, 51721 insertions(+), 11 deletions(-)
>>
>> We've had discussions about this in the past, and I don't think this is
>> going to go anywhere. Device tree maintainers have repeatedly said that
>> they won't accept this kind of binding, which is, admittedly, a bit non-
>> sensical. 50,000 lines of DT for EMC tables is just crazy.
>>
>> The existing binary table bindings were created to avoid the need for
>> this. I don't know how easy this is to achieve for all bootloaders, but
>> the expectation was that these tables should be passed in their native
>> format.
> 
> Mmm, this would definitely be an issue with my long term end goal of
> supporting the SHIELD t210 devices on mainline. The bootloader on
> those devices cannot be replaced due to secure boot and that variant
> of the bootloader only supports this dt table for emc. And support
> without emc reclocking would be rather unusable as a consumer media
> device. Unless the devices could get a bootloader update switching to
> the reserved memory tables before they go eol, but I don't see that as
> likely.
> 
> So I guess the question goes to Krzysztof. I didn't have the bindings

What is the question exactly?

> or a copy of the tables in v1 of this series, mostly due to a
> misunderstanding, and was fairly asked to add them. That's this
> revision. Would you consider accepting this after any fixes? Or is
> this concept entirely dead in the water?


The binding here is far away from what is in general acceptable DTS
style, so in general this won't be easy to upstream. If we allow any
crap to be sent post factum, what is the benefit for companies to
actually took to community BEFORE they ship products? None, because that
crap will be always sent after release with explanation "we cannot
change now". Old platforms with Android bootloaders are in general
encouraged to move to something decent, like U-boot.

50 kB DTS is another point - I don't even understand why do you need it
if you claim this is coming from bootloader.


Best regards,
Krzysztof
