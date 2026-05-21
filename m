Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8E937CD30;
	Thu, 21 May 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356970; cv=none; b=l6e1NBVotCjfUwuk7eMgo0vj+OJ4bDJ81RcEfubbIdyzel1t7qcx5pHvo6CcawOlvyyKio+mDY4t7izLe4/9FbroXE1aimTBH/fuvQn+5jZdudRsSp72uy4we0r/hLE6Y0uLEoE0WhvEkRv+04LOrKtY588oPDGKjAFLeJ31X0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356970; c=relaxed/simple;
	bh=XXIblHaD2bQTj8TeaG5tE66Z3kaRT8xT0PidTOZYtOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2TycA2zAlqVYXOiwlykphOAR8sqLhIXdVC7bqPbaDxCbcadLhzE/6TErvbTbchppc3Tj3mhh8uTASAlRIUGaRm4O7CMi+syEkb58gqeyg3CSSdxhC+oqYUPKECb5o1sPLxJUgpmk5mlnHVDfqUIJa39tyGYHpIMOYo/ssmR6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=latHICr6; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="latHICr6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F16D960020E3;
	Thu, 21 May 2026 10:49:26 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id VaVwv1Ns4UOO; Thu, 21 May 2026 10:49:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D651360020D7;
	Thu, 21 May 2026 10:49:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779356964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KeSvtGBh4cwVUpcf4H5O9Hv1BHhD0wSQKZJns6/kAy4=;
	b=latHICr6zRUQSjfkSaydTbcYJ+bX+E3GXuhr7oNHQ7G4NNFDFTj1Ebi9ASn7jW8o9Ed9AN
	xvppIpjSU6pKo75lQgfoIpJjX2Kr3qgn0+0+iJ8AIhmQ4Osu9UDyIxozaPZOteHVU31/qk
	DereUVugwzHiyCJpVBUrMJO3g/fwNXLBWELozd1tOEgARjmChQWywLp0Z/ULrBjKVRSePy
	YUms/kjWzEqnDqY/J1ge646Ye5uhL1OxDnPr/etG/X0uBT6QsrPeu1ZgP/1SWC4B1wAVNc
	mlxsGIuMvINX0lAAMRRZXOmSW1GIUn/calPcLkN1KiSy0Re7mRz4CBSA93Vcvg==
Received: from [192.168.96.1] (unknown [89.214.153.114])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 10C613600A2;
	Thu, 21 May 2026 10:49:21 +0100 (WEST)
Message-ID: <2dceac0d-8a1f-440b-ad9c-cff14a9a56f5@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 11:49:17 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
 <ag65LXrLLbbeTbTb@orome>
 <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
 <ag7TenB3GrdLABuk@orome>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <ag7TenB3GrdLABuk@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/26 11:43, Thierry Reding wrote:
> On Thu, May 21, 2026 at 11:23:11AM +0200, Diogo Ivo wrote:
>>
>>
>> On 5/21/26 09:52, Thierry Reding wrote:
>>> On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
>>>> On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
>>>> than the PSCI SYSTEM_OFF call, whose firmware implementation is:
>>>>
>>>> __dead2 void tegra_system_off(void)
>>>> {
>>>>           ERROR("Tegra System Off: operation not handled.\n");
>>>>           panic();
>>>> }
>>>
>>> Ugh... sounds very familiar. We have similar stub implementations on
>>> Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
>>> seem to have proper implementations for these.
>>
>> Yes, on my TX1 I was encountering the same problem. However in that case
>> is it possible to update the firmware with a proper implementation?
> 
> I tried, but there were complications, both technical and logistical
> because of the point in the product lifecycle. At this point I don't
> think it will happen, unfortunately.

Ah, I see. Then in that case this approach seems like a viable option
for those platforms :)

Best regards,
Diogo

> Thierry
