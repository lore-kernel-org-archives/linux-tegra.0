Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C23FD121;
	Tue, 24 Mar 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363019; cv=none; b=UliiiskPms3EYtA7sYOYiqioLQTLvWD1Bjh60/VWRDLvScEF076IU9IsuCBF7/En0PkpcDL+76RlqfvzeQ8mpYnTMkUyCqLZ36TXyaXAcBhj5ssWKOYx8bsEzIww4OwKcmzJVK199zzG68Dal+TZ+zBfYtE7GRChMn4NtXzj0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363019; c=relaxed/simple;
	bh=oJP7qI2REKO4LiflVR31WZ7BIRLbL4ifu7guzzThvyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1Phn2mbwyWtfkbcCGGSEPCH+J2Ai74oLaUoWC+V290++GMqTKXhja9BunUIvZJ9whoq3ZIvWcNtHaRZJfLyWA6Oq82nEwuB4muS4vnReCXVl1+KzoZAgnIKfXw5xdtJQ0cmOAcs0rQr9MQNRC+ekvaMfCR2zzuJcIPCyF/XY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Fpx0AwDk; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Fpx0AwDk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3BCAE600230C;
	Tue, 24 Mar 2026 14:36:52 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ZFZeKCH7NTFC; Tue, 24 Mar 2026 14:36:49 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8F9D960022FE;
	Tue, 24 Mar 2026 14:36:49 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1774363009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zWSTkt+TZRxqfL4or/GcsQYMaV+0vZsmOBl4HXog6Y=;
	b=Fpx0AwDkYLWE5tsos9uLbjPzDgbdmM4oPrNAjmV5hWv/npcEazDQyw7pdrNmDrzsFrWZ3u
	sAJx58RBRUDAebkdnpaRxj2DRU4fchddeTeY2JWgqfy+nNSFtNdLpL2xL4V8zDW8sxOusL
	SivlaHAF+/O7PZtvMVEOUrYwDqykgw0FaxDHX/aIG+0p2LH/pmQUOxSkHko8LDJPrd+Pfe
	hHEbGYCJ8QrFyG1GOLQ6TGt/wJxi/TDEHt/9NNzoCyv9mR4w2dTgLyVueqdUlGGBjRogDr
	bPZAkwUJ3Jtw07pcg14V8QLrMz0ZNPqAnln6Be3qad7beJgjr8HQfYggksykRA==
Received: from [192.168.2.116] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 44B1D360194;
	Tue, 24 Mar 2026 14:36:48 +0000 (WET)
Message-ID: <2c7fa782-f7f1-43c6-bda4-296fa7ab88c2@tecnico.ulisboa.pt>
Date: Tue, 24 Mar 2026 14:36:46 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] phy: tegra: xusb: Move T186 .set_mode() to common
 implementation
To: Jon Hunter <jonathanh@nvidia.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
 <20260127-diogo-tegra_phy-v2-6-787b9eed3ed5@tecnico.ulisboa.pt>
 <af04fc85-1ed4-4046-86ee-1ffcec8c44cd@nvidia.com>
 <5a5397c8-cc32-4d6b-86a4-76f924ae6d75@tecnico.ulisboa.pt>
 <7a6f8967-c635-4d84-bbab-9e019ff79134@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <7a6f8967-c635-4d84-bbab-9e019ff79134@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/24/26 13:33, Jon Hunter wrote:
> 
> 
> On 24/03/2026 11:31, Diogo Ivo wrote:
>>
>>
>> On 3/24/26 10:16, Jon Hunter wrote:
>>>
>>> On 27/01/2026 15:11, Diogo Ivo wrote:
>>>> Move the Tegra186 PHY .set_mode() callback to a common implementation.
>>>> In order to do this first revert cefc1caee9dd.
>>>
>>> This commit message does not seem complete.
>>
>> How so? It is succint but it states exactly what the commit does. It
>> reverts cefc1caee9dd and changes T186 to the common implementation
>> prepared in the previous patch.
> 
> It does not read clearly to me. The 2nd sentence sounds like that's all 
> this is doing but we are not, we are reverting and doing the move.
>>> Furthermore, I am not sure why we want to revert cefc1caee9dd. We 
>>> purposely moved the regulator_enable/disable into 
>>> tegra186_xusb_padctl_id_override() because it is tied to setting the 
>>> USB2_VBUS_ID. So I would prefer to keep it this way and move the 
>>> Tegra210 implementation in the same direction (if possible).
>>
>> I don't agree that this is the best solution.
>>
>> We really benefit from a common implementation for the two platforms, not
>> only because of duplicate code but more importantly because without it
>> whenever a bug is found and fixed on either platform it most likely will
>> not be fixed on the other one. Case in point, cefc1caee9dd fixed a bug
>> on T186 but not the same bug on T210 (which then led to this series) 
>> since
>> the implementation was not shared among them. Were it the case that they
>> shared the implementation the fix would have come "free" for T210.
>>
>> This will keep happening for as long as we have duplicate 
>> implementations,
>> which becomes more relevant since there is a severe lack of testing in
>> older Tegra platforms. I also thought about making the id_override()
>> implementation shared between T186 and T210 but that would be take more
>> changes since register definitions would need to be moved somewhere
>> else too.
> 
> I am all for a common implementation. I believe that in the 
> tegra186_xusb_padctl_id_override() function the only thing that is 
> different is the offset for the USB2_VBUS_ID register, which should be 
> easy to handle.

Ok, I can make it common there as well. However I still feel like
reverting cefc1caee9dd leads to cleaner code since vbus_override() and
id_override() will look similar and only do exactly what they state in
their names and the overall logic looks cleaner.

Diogo

> Jon
> 
