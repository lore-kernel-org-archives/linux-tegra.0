Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5554259C9C;
	Tue, 13 Jan 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311018; cv=none; b=OB+j/8cbDIanfEEqk35OrVMc+EQeZudNB/0l8ZkogAouMT02K1IldqOm1kQ56ScEMriRTC3cTaVhyZZzJKUO3IFVCCUmmW8RxgG1Wk5ORc7ogtohddgvknSci/8ReWyPRjzXoE4P5RtIH6ZtQ/X4WBpbVUqAd5VyKRHib8/gEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311018; c=relaxed/simple;
	bh=4Vm+bNr65RTJVIIxCsU16vb3APhKDgGu8wOg6Irr2sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zyz90iPAgj+tTdkdmwRh4rV0EUpq/1uw1HeHKBH0SCvOOTRUR1bmvQqissNMHzXvqh7gd4yQpP7Nhn2PpxWgKRHKz2px5g3ZskdPMVUMfBkC1GglnPmM0gAm63ZC2CIEaNXl85AHJT+Dv/IRZQjDEYeC3VgL1GCmvRrC+W/deYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=bouw3uEn; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="bouw3uEn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D16B860020E1;
	Tue, 13 Jan 2026 13:30:09 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id HXHwJlX5thU1; Tue, 13 Jan 2026 13:30:07 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 07F1F6001428;
	Tue, 13 Jan 2026 13:30:07 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768311007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwarZgYPrLABi/etu50xEE5OV50XboMHuJPg3X2erGw=;
	b=bouw3uEnjuFfI0PXt/XNA54iHtwyIC06SUYhoz2Brhv36PBaQEfQl0rm5TRaNdd4YXzAtA
	HdLegFh8MXdxtSXTiKiPCcWtHymlr3h5kRaeUAswoiIVOkcrjTVjl+bY33dvwMSuVMfn0+
	4tQjJhHo4MtlnJ0F8PW35Uo5KlrmF2/ArGEM2t/SdNYN8PYfqKFX75Qeb1TYObdTyYIDnk
	6PRj8/6XbBuML6FK8eNh2OWLp6pZYyfVl61Mt37Ho7mhGP2AVX+Q7oiA78pstwLTDEmMbA
	e5ANvgIlYXfDh/kFScXhL5ZBsxbBFDyQWA4Px4stjcVCICYvn+cNOhAyJoU1Ug==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0443836006F;
	Tue, 13 Jan 2026 13:30:05 +0000 (WET)
Message-ID: <dcfe4159-48ad-4b28-ae3a-388e6d0f229a@tecnico.ulisboa.pt>
Date: Tue, 13 Jan 2026 13:30:02 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: tegra: xusb: Fix USB2 port regulator disable
 logic
To: Vinod Koul <vkoul@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
 <aUuV2ZYKmM_aYgTv@vaman>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <aUuV2ZYKmM_aYgTv@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/24/25 07:27, Vinod Koul wrote:
> On 04-12-25, 21:27, Diogo Ivo wrote:
>> The USB2 PHY mode handling on Tegra210 incorrectly relied on
>> regulator_is_enabled() when determining whether the VBUS supply should
>> be disabled during role changes. This is because regulator_is_enabled()
>> reports exactly what is states and not if there is an unbalanced number
>> of calls between regulator_enable() and regulator_disable(). For
>> example, regulator_is_enabled() always reports true on a fixed-regulator
>> with no enable gpio, which is the case on the Pixel C.
>>
>> This then leads to the PHY driver wrongfully calling regulator_disable()
>> when transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE since the driver
>> did not previously call the corresponding regulator_enable().
>>
>> Fix this by keeping track of the current role and updating the logic to
>> disable the regulator only when the previous role was USB_ROLE_HOST.
>>
>> While at it fix a small typo in a comment.
> 
> Never mix a patch with something else please. More imp if it is fix
> which will go to rcX. Please send a different patch for typo

Ok, will split for v2.

>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   drivers/phy/tegra/xusb-tegra210.c | 5 +++--
>>   drivers/phy/tegra/xusb.h          | 1 +
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 3409924498e9..63ad57d95514 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -1934,9 +1934,9 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
>>   			/*
>>   			 * When port is peripheral only or role transitions to
>>   			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
>> -			 * be enabled.
>> +			 * enabled.
>>   			 */
>> -			if (regulator_is_enabled(port->supply))
>> +			if (port->role == USB_ROLE_HOST)
>>   				regulator_disable(port->supply);
>>   
>>   			tegra210_xusb_padctl_id_override(padctl, false);
>> @@ -1944,6 +1944,7 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
>>   		}
>>   	}
>>   
>> +	port->role = submode;
>>   	mutex_unlock(&padctl->lock);
>>   
>>   	return err;
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index d2b5f9565132..273af147dfd3 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -317,6 +317,7 @@ struct tegra_xusb_usb2_port {
>>   	enum usb_dr_mode mode;
>>   	bool internal;
>>   	int usb3_port_fake;
>> +	enum usb_role role;
>>   };
> 
> Jonathan can we get some t-b for these two patches
> 
