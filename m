Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E329B79B;
	Sat, 28 Mar 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699899; cv=none; b=G1EIgw0sV5pVJV3/sXgSyHO1JqdAfPX8pyqTDN1Wk9dgkmzyiZyMCzZL6siXehVCk9HqJ03Y7ep7XK5K0+6DeLG/DUHcygcp7FFUXBPbU+kP2yKD5j3U06EYohQZFZLNo7aiV5WDc/JOhx8Y4ZiC5WHXJMoq6QdUVd+AeMzV01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699899; c=relaxed/simple;
	bh=T1rQdoDS0LoarUB+nkGrdm0h29NyFp24QwHsPZCsmxA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SHxXoVOigriNQY+BX/PEfBNa+vroTioLl5+7gCqEx7dn/JmrYOE0+wGZZauyfCZRJ+bjBfHrzTyQWAoA8CJXttdjyAaZ8fLtZM7dDyZXICZS+e/U+VdQZOVPy2UwFK1Fb24SVge/7MJiltWVRGqwjfrQhuA8FaoxVIDYpRUQ+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7GdXhZ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7GdXhZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A625C4CEF7;
	Sat, 28 Mar 2026 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774699898;
	bh=T1rQdoDS0LoarUB+nkGrdm0h29NyFp24QwHsPZCsmxA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=n7GdXhZ07vaMmaveysW4ZwyepLbMs94utWTfwO+mEoNRDadQuRExo4wyIU/B6o0oa
	 AdaaZvG5RIY5co1DIz052eD8tDlpJcx0DGiC5xjJe1CmdQqU9H50MddSUwL15sYuat
	 ULMIBMn7yj8N/WOIBk//VFrimSD3IycXcHFbPrc+SizVkdaEduyt0Mt31k6Kq029te
	 qzOzBMolV3YgeDiGWzfbr5zjHZD2sr9ElXLKAGL9JBGkRAHJ2h0N1ZskPIS2YgErx1
	 ekk4G3MSdm0HEJpKTg6IoEBtb7+JkeqSN5vihgdXDmiKaQVHNAFScoNVO0nk0gp36e
	 5cGGtq+jNZNpQ==
Message-ID: <2b3b4c35-06b9-460b-9488-5da6f43fc069@kernel.org>
Date: Sat, 28 Mar 2026 13:11:34 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] dt-bindings: memory: Add Tegra114 memory client
 IDs
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260126190755.78475-1-clamor95@gmail.com>
 <20260126190755.78475-4-clamor95@gmail.com>
 <54043284-141e-421a-a54d-a018c884b324@kernel.org> <accXjw2BSCbzMyak@orome>
 <22870432-521b-40c0-8f4a-93d2c605baa7@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <22870432-521b-40c0-8f4a-93d2c605baa7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2026 12:40, Krzysztof Kozlowski wrote:
> On 28/03/2026 00:53, Thierry Reding wrote:
>> On Tue, Feb 17, 2026 at 08:22:24AM +0100, Krzysztof Kozlowski wrote:
>>> On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
>>>> Each memory client has unique hardware ID, add these IDs.
>>>>
>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>> ---
>>>>  include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++++
>>>
>>> This is never a separate commit. Squash with the binding.
>>
>> You have previously requested that bindings and driver changes be
>> applied together. If this header file is applied to your memory tree it
>> means I cannot apply the corresponding DT changes until a release later
>> because the defines are part of the header included in the DT bindings
>> patch.
> 
> I cannot apply the driver either without it, because it uses it, no?
> Otherwise what is it doing in bindings if the driver is not using it?
> 
>>
>> Seems a bit suboptimal. Do you have any good ideas on how to solve that
> 
> We listed five already in maintainer soc profile. Are they not good?
> 
>> particular issue? The only one that comes to mind is for you to pick up
>> the DT changes as well, though that obviously runs a greater risk of
>> causing merge conflicts down the road.

One more thing:
There is no DTS here and nothing explains (commit msgs, changelogs or
cover letter) that there is any dependency and this was supposed to go
other tree. So the squash-or-not-squash is absolutely irrelevant to your
question/problem how DTS should deal with it.

Best regards,
Krzysztof
