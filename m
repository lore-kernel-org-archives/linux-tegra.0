Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8763D6CB4;
	Wed, 25 Mar 2026 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444220; cv=none; b=q0or+9FpZExkTFJVxV/wonZhGwECDlJMHpg3ir5Gi+lkql/lgA3OF+E7a5Hb0/+Ow34gv0pkO5yF6j3Y+dIuFY7g6i7C22NFeMTjIO3J0BybcrTcN105tXhKaxk6l549O3hCTSMV1snogzv4R9HjBWRB0IIMh2TlB4pNdowVKTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444220; c=relaxed/simple;
	bh=hri9O7RDzVRUa1dc4kn+6ScPE1cGtXfcQojPOZKDPTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZ0jvKZS7FL8Cmu1/j0K4tjFlEelj+uve88GdJLDg0PQiAoY1sqnrkA+W3J01ho+4JfbHa24SE3oAoT1G5PfBYKVrl6sDw+PnonUKLXZHxQdD8Ii6S0QAIeCrIsdXNt7++wdtI2MFQJh+4GdUxvt4FwNQRg96LABufnsBlhajYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsB1uzLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsB1uzLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AACC4CEF7;
	Wed, 25 Mar 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774444220;
	bh=hri9O7RDzVRUa1dc4kn+6ScPE1cGtXfcQojPOZKDPTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OsB1uzLOiWf2WTln/PW2F2D5STWpR2zFMLycuuNcL2u+7M4n16Gb0wif/W2/Sor7H
	 2eK3XjwT5hrgZwCLFeKimSM6H6eaCZKwmgFevhVH+tw/NrQrlfglbrENFQtj+FKnQ1
	 797D1YZBvHr6WVFYOk4yhs1RV/aSKfd8hIlgBbU09+Lycn/127DYwqr3sryFJCt0Ls
	 9PagWo0GGuMxxWM3YEjzQBZJfqZgtaFGlmhKAv64dmakaOkzldylsIVxTQ6srSFDpT
	 bgqx9OwKAgsKTaSlQf2kVylvJohnVJf9CaimxuiRtf28yBuxSis28+6orhWDT0j8DP
	 eDg/dRg5qxvvg==
Message-ID: <d5f5a1c4-cc3b-4bae-955e-05c20d08602e@kernel.org>
Date: Wed, 25 Mar 2026 14:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@nxp.com,
 acpica-devel@lists.linux.dev, alexandre.belloni@bootlin.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, ebiggers@kernel.org,
 fredrik.markstrom@est.tech, jonathanh@nvidia.com, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com,
 p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com,
 robh@kernel.org, smangipudi@nvidia.com
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org> <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
 <ed3828b9-fd2d-46c1-b486-c5172f61eafa@kernel.org> <acPX-clIX4UfBNdM@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <acPX-clIX4UfBNdM@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2026 13:58, Thierry Reding wrote:
> On Wed, Mar 25, 2026 at 12:03:37PM +0100, Krzysztof Kozlowski wrote:
>> On 25/03/2026 11:59, Krzysztof Kozlowski wrote:
>>> On 25/03/2026 11:31, Thierry Reding wrote:
>>>> On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 19/03/2026 18:09, Akhil R wrote:
>>>>>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
>>>>>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
>>>>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>>>>>> SPD5118 hwmon sensor as modules to the defconfig.
>>>>>>>
>>>>>>> Why? If there is no user of that, why would we want it? Your commit msg
>>>>>>> should explain that.
>>>>>>
>>>>>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
>>>>>> I will add this in the commit message.
>>>>>
>>>>> Board or products. Not SoCs.
>>>>
>>>> Is this a new requirement? I see a bit of both in defconfig changes.
>>>
>>> Almost every review from me has it for 2-3 years... And it is a known
>>
>> And I already explained this to *you* 3 years ago:
>>
>> https://lore.kernel.org/all/ac8f30a7-fc72-9a44-74b3-a69001bfdaaf@linaro.org/
>>
>> So how this could be a new requirement *now* if three years ago we had
>> exactly same discussion.
>>
>> I understand question for the first time, but why this being brought up
>> as "why is this a new thing" again?
> 
> I have to admit I did not remember what we discussed, so I had to go
> read that exchange again. It sounds to me like we were not discussing
> the specific issue of a missing description as to which particular
> product needed this, but you were instead rejecting the idea of
> enabling drivers that were not strictly necessary like those for PCI
> devices because they were making your life more difficult by building
> drivers by default that you were not interested in.
> 
> Here you're arguing that you want proof that this is going to be used
> by some upstream-supported device, which are two different things,
> because they might very well be drivers that you're not interested in
> but end up building if documented properly.
> 
> So I find it a little hard to keep track of what is acceptable to you
> and what isn't. Are you objecting to this on the grounds of it bloating
> the kernel build or because you want documentation for what platforms a
> driver is being used on?
> 
> Our action items will be different depending on what your answer is: if
> you want documentation about what device this will be used for, we'll
> get you that information. If your concern is that it bloats the build we
> drop the patch and will have to ask users to build their own
> configurations.
> 
> Maybe to avoid these kinds of discussions in the past you can write down
> your rules about what should go into defconfig and what should not. And
> maybe we can eventually find consensus and find something that people
> can use as a reference.

I think answer is pretty simple and comes from the reason WHAT is the
purpose of defconfig. It's purpose is only for us.

Therefore defconfig can have anything anyone will find useful, when
building and running vanilla upstream kernel on their devices, with
exception of explicit needs for pluggable devices because then it bloats
the kernel to impossible stage (otherwise look for me sending all USB,
PCI, MEDIA, whatever devices for defconfig...).

For example:
1. Something used only by a DT board not enabled upstream: no, because
you cannot run upstream kernel on it,
2. Something used only by a ACPI platform, which require some out of
tree patches to build: no, because you cannot run upstream kernel on it
3. Something not being part of the device but pluggable: depends,
explain why upstream contributors would want it.

Look at the commit here:

"Add I3C subsystem support, DesignWare I3C master controller, and
SPD5118 hwmon sensor as modules to the defconfig."

Does it say why doing it? No.

Nowhere in this posting I was objecting to actual change. At least not
yet. I only ask WHY you are doing it.

Why is it so hard for a contributor to know and express why they are
doing something? If one does not know WHY they are doing it, then why
the heck they are doing it?

Best regards,
Krzysztof
