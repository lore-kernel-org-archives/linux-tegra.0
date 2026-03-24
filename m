Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE1E3E2755;
	Tue, 24 Mar 2026 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351889; cv=none; b=uIeITGA1IsFD5vtOhVxC78e5Unmo5nqWm9r+F3mu1LKHY42UVwc3PbDepul5MoKXDPQ7y9fxP8zNAuFBVhEpnMynLpDefRF2f2fWPyum5BFLx8CfoQO/5yoMkGLtQ498sqigC6O3eTsezCuFpNZHD0qqle/nBcX2baqaKZmp/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351889; c=relaxed/simple;
	bh=II2rZwZeLPXJZhkpJhi4wJRb5oOq3AIDy0SrqkkRGQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gouahX8QQ9CQdyWdJ7z1yrbz9X+LXsgnvQHuiEO65rWc9koQzc9xCO8mdP0I6xxzvswHAa1oi5SSvQM5jbFdpkbBrzpxQsrRywN2UAPpAt9AX4p7vfAOyumvNZKxGT1oCF3QZqfcsO9XfO363m63wXOfT4l/1UqrkjuAEosf6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=lgHrWBaH; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="lgHrWBaH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id EECEF6002439;
	Tue, 24 Mar 2026 11:31:21 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id YRfo6YsFNLkN; Tue, 24 Mar 2026 11:31:19 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 736066002436;
	Tue, 24 Mar 2026 11:31:19 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1774351879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSwCOD4R8nBRbYuCX+0wUTZPA2P7sMyjbzopSB4njWE=;
	b=lgHrWBaHuXpubfTTTI1CnMeRCMIPwkhn1V0/z5oDj59D4RJJS7er242v736fbfdxLlwj6t
	211O8rhOZ2/B6nEHXFV8kgrrI6bQfu6xTpoRqZEZI3AjyBLetL+CEQq70aZo3dG7zIbCdt
	GfPyYA6LVlmos7uq01plRG9SjiQGr1OjntVB2PPqeKUXCQR6ybTkphVYvLOi2Bwuc6moGg
	GOEQ0Ss2+7nUNLKb+7kSItPNdCbwDSGH28zKXyRGueeTIleNp6waxnXIKFHeYsTuy1ZZMX
	GiGSxZrZEbaemjGMv2jyJUJLjhdQU6Xf62+q4NYkAyBKSauFJgE7/EYcbfH8HQ==
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6EDB6360164;
	Tue, 24 Mar 2026 11:31:18 +0000 (WET)
Message-ID: <5a5397c8-cc32-4d6b-86a4-76f924ae6d75@tecnico.ulisboa.pt>
Date: Tue, 24 Mar 2026 11:31:17 +0000
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
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <af04fc85-1ed4-4046-86ee-1ffcec8c44cd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/24/26 10:16, Jon Hunter wrote:
> 
> On 27/01/2026 15:11, Diogo Ivo wrote:
>> Move the Tegra186 PHY .set_mode() callback to a common implementation.
>> In order to do this first revert cefc1caee9dd.
> 
> This commit message does not seem complete.

How so? It is succint but it states exactly what the commit does. It
reverts cefc1caee9dd and changes T186 to the common implementation
prepared in the previous patch.

> Furthermore, I am not sure why we want to revert cefc1caee9dd. We 
> purposely moved the regulator_enable/disable into 
> tegra186_xusb_padctl_id_override() because it is tied to setting the 
> USB2_VBUS_ID. So I would prefer to keep it this way and move the 
> Tegra210 implementation in the same direction (if possible).

I don't agree that this is the best solution.

We really benefit from a common implementation for the two platforms, not
only because of duplicate code but more importantly because without it
whenever a bug is found and fixed on either platform it most likely will
not be fixed on the other one. Case in point, cefc1caee9dd fixed a bug
on T186 but not the same bug on T210 (which then led to this series) since
the implementation was not shared among them. Were it the case that they
shared the implementation the fix would have come "free" for T210.

This will keep happening for as long as we have duplicate implementations,
which becomes more relevant since there is a severe lack of testing in
older Tegra platforms. I also thought about making the id_override()
implementation shared between T186 and T210 but that would be take more
changes since register definitions would need to be moved somewhere
else too.

Diogo

> Jon
> 
