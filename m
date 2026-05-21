Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519272E1EE0;
	Thu, 21 May 2026 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371965; cv=none; b=D1RVsODQoN0f+LC7NQIIwJr5bpJBEtWno0bWngf3HO+RzTVZmxTjyXr2YUy/fU2AItfmZ9f10bEs2+OYhpaU3LwPW2ZUe+4hprMIwcKKKEIOaXi99pX+PdSv+T8FkUgo5X8zagmh0MG+OP7tguTy63qFHhj7ubU0LlPUeA71tIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371965; c=relaxed/simple;
	bh=ZSWlMcW5vXldfX2yFKpM/4Na7KqPIhU1xYmCcejyAuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2mHJNglTs/NgIiU5b5AnibXg6ie8P9k7R3YqeWpXVGSNuyrenSJh/zLBKy8eM7a5QBJ7KPJ4KcxTs4/reSYTo0BDGz5GACAv0Cp0ANFxz77hwS7tUNjJ4p2pd1A+6S7xvWbb3IKqQrcLHZHCKwtmFdDC0YBBjiiMaoesTMwxHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=qjWPx4IL; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="qjWPx4IL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 62C84600300F;
	Thu, 21 May 2026 14:59:21 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id OhRAXJUdua68; Thu, 21 May 2026 14:59:19 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 182B2600022F;
	Thu, 21 May 2026 14:59:18 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779371959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYRqvLNplKcHBpCSubZye+sJzBUl9lFEGv93iADHNo4=;
	b=qjWPx4ILk3hXKN8Kk2jhid2H6oIUEd1PMQaPeh7FJzZfQgzhYSQZzQQ9UtZ+IiXiKC4XwK
	/53AvDPqDRjMFBnXfbhZOsQZ8+yfU63iakF0DQ0UAAtdYKP3NyT8vLtM3+shhiaQCJeUAr
	QzzWGLSx9Z/F/w1ap/B+MA0KjvbGTWOaMH+gNh7u0OBC+f1X+byGIJC0xQkU56Y0lIQ7tZ
	Ah5kHzUxSlgGEBq7cZkgcbPJXZsZ+gwX+nlM+8YS1kW9PW2+RP/UXQhJv8gFd7HxuJezuz
	ylSHwV1z3qjZtjzkZFS3nSjIRUY1mh9Bxnyfri1Nrk5KzBLp4JCOMilSTbtoFg==
Received: from [IPV6:2001:861:8c82:4ef0:2bc6:7ef1:5c9b:813f] (unknown [IPv6:2001:861:8c82:4ef0:2bc6:7ef1:5c9b:813f])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 38C8136029E;
	Thu, 21 May 2026 14:59:17 +0100 (WEST)
Message-ID: <f98bcd81-29c6-4df2-8040-d17686b28f45@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 15:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
To: Lee Jones <lee@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
 <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
 <20260521104136.GA2921053@google.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20260521104136.GA2921053@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/26 12:41, Lee Jones wrote:
> On Thu, 21 May 2026, Diogo Ivo wrote:
> 
>> Hi Lee,
>>
>> On 5/20/26 18:25, Lee Jones wrote:
>>> On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
>>>> This series migrates PSCI and MAX77620 poweroff handling to the
>>>> sys-off framework and fixes shutdown on the Pixel C (Smaug).
>>>>
>>>> The first two patches replace legacy pm_power_off usage in the PSCI
>>>> and MAX77620 drivers with sys-off handlers. Besides aligning both
>>>> drivers with the modern poweroff infrastructure, this removes the
>>>> global callback dependency and allows multiple handlers to coexist
>>>> with explicit priorities.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>
>> Thanks for applying the patches! Just a question and an observation:
>>
>>   - I'm assuming you were ok with merging [2/4] despite the possible
>>     deadlock since this risk is already present in mainline in the same
>>     form so we're not actually making things worse, is that so?
> 
> Did you see the text below?

Yes, but patch 3 is not addressing the possible deadlock hence my
question.

> Both patches 2 and 3 are applied.
> 
>>   - The observation is that the comment about overriding PSCI is only
>>     true after (and if) a reworked [1/4] is actually merged.
>>     If it isn't then patch [3/4] is actually working around another handler
>>     in soc/tegra/pmc.c where a handler that only does work for the Nexus
>>     7 is actually registered at FIRMWARE level for all platforms that
>>     probe that driver (I will send out a patch shortly to only register
>>     the handler on the Nexus 7).
> 
> I assume the other patches will be applied soon.
>
> If this causes some kind of issue - let me know later on in the cycle
> and I'll remove whatever patches you ask me to.

The PSCI patch [1/4] has a fundamental issue and needs a respin to be
applied.

In connection with this it might then become easier to quirk the PSCI
driver rather than the PMIC driver, so for the moment I'll ask you to
drop [3/4] until I propose the changes to the PSCI maintainers and see
the feedback and at that point we can either completely drop [3/4] or
reapply it; sorry for the noise.

Best regards,
Diogo
