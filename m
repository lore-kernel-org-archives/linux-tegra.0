Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AF3F7ABC;
	Tue, 24 Mar 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355305; cv=none; b=Y8h/7SXO1MUcJCXSKHejd4eQ8wmgFesq6Llfqr/C86k/feAK2vhpEnyDF1YzMs4s1KsSMxjPRlKEF0lIxz/xG6JuZ3jcSBjdvEBOCP2d5XavQMFxui3t6rUGbpUF6gbtbxttJ6HLbwbqT9Ba/Fo3x267hVeGjaV2xBVRV1ErzCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355305; c=relaxed/simple;
	bh=3VnP6m7etZxs7IKEhPIG4ni84DChqCCpSXhE7LlGtIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlg+CeooZ6aM9HbUIUAEJQgcBmrg433BUIajfPgQQarBgxnanoQF6HVa/WOf5GuVn0HhF1ul29PH7vJVTOzOgWvbK8wn7qSU+p9NqE9zOioaAHIjLr76ufArUM2F1hPZa4e0p1FfIZjlYGL4dE6v35wRtPRswAjkvfBn8VR9Rl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=R1r/LdNx; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="R1r/LdNx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 44CD0600085A;
	Tue, 24 Mar 2026 12:28:19 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ZSyy3OFlWjsN; Tue, 24 Mar 2026 12:28:17 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B7CE36000872;
	Tue, 24 Mar 2026 12:28:16 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1774355296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0H07sbfA7geFvMVbwBHgjO9Zv4YRqDulO8wi0QJ4JIg=;
	b=R1r/LdNxDWwh5jSyABP8e+EE3vZwy4hwHQI6Fb+sHg77++Ws2tOUkybACtMSYyv1beB9bT
	Ia7pVb1GUjrjT2sWiAmuZ3wT/znd3dEBIyiiUMMrMnnwiVfSJzSELd9Saj9OrIN+xyRqlE
	5qYq/U02pF8nrIhBKMGz3rn03bRE/suN1vgf4jNFJ7YFeXEHg63FH+Btc9D66tGirT6a6B
	rfIervl+oGLlR5NxihO/gaz3dcI2Xswn7SISTuXtkl5Zz/FFJp87s95VH7dcZ1hUzVon+c
	cK8xdEWDNzomsLF6f7CSX+AbM77BXQio+Y+acBK9zAl6pilcUQbqHWZtIXvr2Q==
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 466F1360187;
	Tue, 24 Mar 2026 12:28:16 +0000 (WET)
Message-ID: <991ecd66-9db0-468d-b3b0-570ca89191bf@tecnico.ulisboa.pt>
Date: Tue, 24 Mar 2026 12:28:16 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] usb: xhci: tegra: Remove redundant mutex when
 setting phy mode
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
 <20260127-diogo-tegra_phy-v2-2-787b9eed3ed5@tecnico.ulisboa.pt>
 <acJ50sQraVmy4zXs@orome>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <acJ50sQraVmy4zXs@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/24/26 11:48, Thierry Reding wrote:
> On Tue, Jan 27, 2026 at 03:11:48PM +0000, Diogo Ivo wrote:
>> As the PHY subsystem already synchronizes concurrent accesses to a PHY
>> instance with a core-internal mutex remove the driver specific mutex
>> synchronization.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>> v1->v2:
>> - New patch
>> ---
>>   drivers/usb/host/xhci-tegra.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index 8b492871d21d..927861ca14f2 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -1357,15 +1357,11 @@ static void tegra_xhci_id_work(struct work_struct *work)
>>   
>>   	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
>>   
>> -	mutex_lock(&tegra->lock);
>> -
>>   	if (tegra->host_mode)
>>   		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
>>   	else
>>   		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
>>   
>> -	mutex_unlock(&tegra->lock);
>> -
> 
> It looks to me like the mutex here is trying to protect against
> tegra->host_mode changing while we're setting a different mode. That
> doesn't seem to be taken care of by the PHY internal mutex.

I'm not sure I understand your point. Do you mean guarding against
tegra->host_mode changing in tegra_xhci_id_notify()? If so I don't see
how it would guard against that.

Diogo

> Thierry
