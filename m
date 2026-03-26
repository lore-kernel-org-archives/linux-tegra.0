Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7C3947A5;
	Thu, 26 Mar 2026 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534675; cv=none; b=SGs/lmcX0QLiLiRrmgp7YtTn9rZziApV+d5f+dFIZ4e6V4kUJiFcqAKGRrTNPJW0agQVJLmsXz7U2fOsCF7Lcnf82isLsX5PTRG5x4bPva0rnvpiNxze18F9LEL3zC2kxGmfmuEuO2dyXdJ0sL1mwq5qS3PJh5m2pixZaii5FRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534675; c=relaxed/simple;
	bh=zwDDkhJK0AE6U2QDF4UZEa4mUik/b+6/BEss8fkIWhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AB9IK1DPaPMui4Rv1WoA1tX2E6NTZ0GDQXRF7v8ijIrEpkb9sZVvcrd8V7ZLCB2Mi6FSQfzuel3vT66CbY3fmmDj6ZRaSBHk4rTJNxNnZU/n65bMtxfVA5wdNWW8/OdckYhMQmcvd2kN7o8PIZSBvqBtaKx+tAOq3OwbclWNZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=SzQXiluf; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="SzQXiluf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 453936005407;
	Thu, 26 Mar 2026 14:17:38 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id wr8wfvIZqns2; Thu, 26 Mar 2026 14:17:36 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id CF460600541A;
	Thu, 26 Mar 2026 14:17:35 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1774534655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvQsKEXQhKikL43r2HYSuOkLKDFB3Ln6VwgjO0Zbpus=;
	b=SzQXilufkaGFcdTXbWmAnpt7L3WG3ak/VhAsrAWKhIivce0zdSsPJ3fSmhLbF+sTE3q+CS
	fzGhaYwpLBiDalAesgJ1f7sXJpgLAYgnCu4U2fC10TmPOyDIVON0F9+4VGdUC0RLR/6/7i
	ZMX23wH5TymhgF/6NB7gbgCGEhR/rLzr/UbKF8aDcO1lbQVmZ24lb3LYyDBiMk4shW1cLe
	jfCS0fYT4W/dJ7WCCoSvKDtyyY2DqPeYwKWd71a6BDdCrJ5scOAZNW1XvsK2a235LEyo1P
	s3/SkloqIhxs5fW5oBdPiO8Q40v2sqxTOzNgaj5C0VHWabmoj3LGL/pDxrvCcg==
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 374A9360243;
	Thu, 26 Mar 2026 14:17:34 +0000 (WET)
Message-ID: <00aeda7a-e5e5-4779-b212-6e56c2c5ec31@tecnico.ulisboa.pt>
Date: Thu, 26 Mar 2026 14:17:33 +0000
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

Hello,

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

After taking another look at it I think I understand your point for the
mutex, but in that case wouldn't it also need to be held in the writer
of host_mode, tegra_xhci_id_notify()?

This patch has been picked up as-is into usb-next so it would be nice to
figure this out before it gets merged in the next merge window.

Diogo

> Thierry
