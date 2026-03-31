Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE023ED5B7
	for <linux-tegra@vger.kernel.org>; Tue, 31 Mar 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950622; cv=none; b=T9xDqFT4lrQjYY1aeMrdmvi981AJNOPGXGjv9RrB5Uz8gU34NayZc+M6FFD9rXuY/m7Zh27mzJLvIxXpFyYr6k7SMkqVOxgzlWxqTy0Up4DwUjz4UoxmWWbWvaeWIiCXCZKWkoJP5Ehl9AdiV9ibWVS6q8cU+aDYae07TXZkswU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950622; c=relaxed/simple;
	bh=aWbxshUwPK4b60zClDczV0+9UC7TIJa1vs0Y0c/ymcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/9JxEErapwgXUEew1w2hm+sdbLEp9ZFAUyLMM86pE6LlfsruJrw6fE1pgouOAiPUZLOoWgBh2Tswaa/kkrTj113GCsQ2vXXkBU9aGwGIG9V/ncPATqyw6KT0oh4WZAtgI93mcuOYLXt30aRE1ZqxcHvhYAEaTFRBPih3VrJrw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkRTc/dj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkRTc/dj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF55C19423;
	Tue, 31 Mar 2026 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774950622;
	bh=aWbxshUwPK4b60zClDczV0+9UC7TIJa1vs0Y0c/ymcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jkRTc/djmmyttyMsoPdCVWAxJmnk8db5UYv/6Z6uyd1DVOPeUdujgH1NE9X+7hw7a
	 soClCBBLrmWCGlC9ZRiiLnxTgZVMYRwAygv22/WDPJzFauPRV0IgoNPy+bFe+UuIf5
	 cxz/wJVwF1Ztjd5lH8CfPgOaUgPj2EOYB5/J/koiAbImluDRa3PGxM0XE2bMZNfFBn
	 Es4RZ/wj30XcKQKf124pZBxGBKGWTfZlrRCOYrMNTcZ7n9dH+//JMVuZqFpXGn9WKp
	 Djs9yTbUi+E+sxoeXkjywkiFlUfsvHADWU00oyhwpL8JInzLI1ReT26nQUwFlXYikY
	 6F492gwAX0oHA==
Message-ID: <1bdf911d-383a-4ea3-9a33-f8ee6e8f26e4@kernel.org>
Date: Tue, 31 Mar 2026 11:50:18 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
To: Thierry Reding <thierry.reding@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Thierry Reding
 <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <406ca5ed-4a3e-48ba-94ad-d88c53b09299@kernel.org> <act9hqxjL6wZ25dP@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <act9hqxjL6wZ25dP@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2026 10:25, Thierry Reding wrote:
> 
>>>       dt-bindings: phy: tegra-xusb: Document Type C support
>>
>> No acks, but that is waiting for one month so it is fine.
> 
> It's got a Reviewed-by from Rob and there were no corresponding driver
> changes associated with it. There's literally no reason for this to go
> in through a subsystem tree.

There are reasons - process and technical:
1. It's a subsystem maintainer's patch, not yours. You rather should
have reason to take someone else's patches.

2. Conflict in that file.


> 
>>>       dt-bindings: clock: tegra124-dfll: Convert to json-schema
>>>       dt-bindings: interrupt-controller: tegra: Fix reg entries
>>>       dt-bindings: arm: tegra: Add missing compatible strings
>>>       dt-bindings: phy: tegra: Document Tegra210 USB PHY
>>>       dt-bindings: memory: Add Tegra210 memory controller bindings
>>>       dt-bindings: memory: tegra210: Mark EMC as cooling device
>>
>> That's even my subsystem and I did not ack it. You did not even sent it
>> to me as requested by MAINTAINERS file (+dt is ignore alias), so
>> obviously I did not even had a chance to ack it.
> 
> Ugh... really? I was Cc'ed to you as a DT maintainer as well as the
> devicetree mailing list, so I'm sure you've seen it. This had also been

Really, you are supposed to use get_maintainers.pl. Not invent the CC
list, not come with own filtered list.

I understand that my non dt address disappears when running
get_maintainers.pl on entire set.

But if you sent that patch targetting subsystem instead of combining 6
or 7 subsystems at once, it would pop up.

And yes, you are not supposed to mix 7 different subsystems in single
patchset. That's basic!

But sure, let's skip memory controllers patch cc list and:

> reviewed by Rob a long time ago, and honestly, it's also quite trivial.
> It's been on the list for a month and there were no objections, so it
> does pass all of the criteria you mentioned before.

No objections because you did not cc people. How can you claim "no
objections from person foo" if you do not cc person "foo", because you
do not use get_maintainers.pl?

Look, find me here phy mantainers:

https://lore.kernel.org/all/20260223143305.3771383-7-thierry.reding@kernel.org/

> 
>> And we even had few days ago talk were I explained you how these
>> bindings must go. Seeing pull request completely ignoring that
>> discussion is just huge surprise.
>>
>> No, it cannot go in. Send patches to proper maintainers first.
> 
> Stop making these baseless accusations, Krzysztof. You were on Cc and

Not using get_maintainers.pl so not ccing right address is not baseless.
This is the fact.

Neither phy, nor interrupts, nor clocks were sent to right people.

You mixed 6 or 7 different subsystems in on patchset, but you call my
remarks as baseless. You use several adjectives "trivial", "baseless",
but no actual facts.

Final commentary:
Stop taking patches from other subsystems, just because you want to
streamline your DTS. You are bypassing other subsystems review, other
people trees, and that's not acceptable.

Best regards,
Krzysztof
