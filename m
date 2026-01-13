Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B33921F5;
	Tue, 13 Jan 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312789; cv=none; b=W2RH7JuezE+TD8M+TQGO6HkS1wQ1VVrKisbq8CKjFh6F43Ea33vb2CfaZcpRfLnkRUsXEYDrRuSxdhLEdAZgoItzIv0Dh/1rO8nDdYW67iQ0W5fIFMW7p990ccs3O7RIPVovD7vG9FxryFk+E0JIPKSv/QBIYmHQxFrjCYFpFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312789; c=relaxed/simple;
	bh=1NOB23KjqkNEX2q85h9ijctm1Q+VBwHTGm+0eWFGdf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFgS9+KZX06R4cOPqQ0JKNwA/qXKmh/xsTFxnjtIojNknM4i+99ESo3s8x3AiUgi25ieB0Y/SpFvQbt8nC/Sd7BpoYlAbY6QNeLNzfiQFNRgJW/LX3BaM9HzDPoYU1qzh5hmrYKxjN4B8Hrqz/+jI6AcIQfBowr03AoJmhFczWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=nIMFDr1+; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nIMFDr1+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E745D60020FD;
	Tue, 13 Jan 2026 13:59:44 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id BgFzxKaSSs0T; Tue, 13 Jan 2026 13:59:42 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 157BB60020FA;
	Tue, 13 Jan 2026 13:59:42 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768312782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JO4R37mcEoyhSRhm7svRimrluDd63HB0W7nMcvakBb8=;
	b=nIMFDr1+HEkm4OwiWzcVOEr4CgcV1lko/yOAxN/wYpUZTVcKhsJZ1UXTeXAd0UyIk36U9Z
	sTMqPOXMvfbcykhY5X6dqFnrLNrCR9VNAsvtSYlIe6U2Nt4W31p4Z7a8mfATSO5j2OK3kl
	Cl6aln5IgDQdPY67JoxFIYc4VCNPYuklPYIuHdWWD2KH9xaUT6M3mocaIIhrAXSajh60s1
	LmIo+dqzSrQQROLk+osH3cYRCUdVgrxPan8g9I4955PASvXGvjj8br8XTYOonMmMIfIElc
	Yorw9jHL6zSbJCYslIG5eU/3u9JiyKJJ5OJyFzwx08dhFDtJUA3Ennrv8/td9Q==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C9BB8360148;
	Tue, 13 Jan 2026 13:59:41 +0000 (WET)
Message-ID: <87364ee8-4cde-49f5-949c-b01674798c37@tecnico.ulisboa.pt>
Date: Tue, 13 Jan 2026 13:59:39 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
To: Jon Hunter <jonathanh@nvidia.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-3-51a2016d0be8@tecnico.ulisboa.pt>
 <e9f18b0d-6462-43e7-955f-45337914b321@nvidia.com>
 <6a0d379f-d215-4efc-bdd0-c9a74d31614a@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <6a0d379f-d215-4efc-bdd0-c9a74d31614a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/13/26 11:44, Jon Hunter wrote:
> 
> On 13/01/2026 11:35, Jon Hunter wrote:
>>
>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>> The current implementation of USB2 role switching on Tegra relies on
>>> whichever the previous USB controller driver was using the PHY to first
>>> "yield" it back to USB_ROLE_NONE before the next controller configures
>>> it for the new role. However, no mechanism to guarantee this ordering
>>> was implemented, and currently, in the general case, the configuration
>>> functions tegra_xhci_id_work() and tegra_xudc_usb_role_sw_work() end up
>>> running in the same order regardless of the transition being HOST- 
>>> >DEVICE
>>> or DEVICE->HOST, leading to one of these transitions ending up in a
>>> non-working state due to the new configuration being clobbered by the
>>> previous controller driver setting USB_ROLE_NONE after the fact.
>>>
>>> Fix this by introducing a helper that waits for the USB2 port’s current
>>> role to become USB_ROLE_NONE and add it in the configuration functions
>>> above before setting the role to either USB_ROLE_HOST or
>>> USB_ROLE_DEVICE. The specific parameters of the helper function are
>>> choices that seem reasonable in my testing and have no other basis.
>>>
>>> This was tested on a Tegra210 platform (Smaug). However, due to the 
>>> similar
>>> approach in Tegra186 it is likely that not only this problem exists 
>>> there
>>> but that this patch also fixes it.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>   drivers/phy/tegra/xusb.c            | 23 +++++++++++++++++++++++
>>>   drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
>>>   drivers/usb/host/xhci-tegra.c       | 15 ++++++++++-----
>>>   include/linux/phy/tegra/xusb.h      |  1 +
>>>   4 files changed, 38 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>>> index c89df95aa6ca..e05c3f2d1421 100644
>>> --- a/drivers/phy/tegra/xusb.c
>>> +++ b/drivers/phy/tegra/xusb.c
>>> @@ -740,6 +740,29 @@ static void 
>>> tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
>>>       }
>>>   }
>>> +bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl 
>>> *padctl, int index)
>>> +{
>>> +    struct tegra_xusb_usb2_port *usb2 = 
>>> tegra_xusb_find_usb2_port(padctl,
>>> +                                      index);
>>> +    int retries = 5;
>>> +
>>> +    if (!usb2) {
>>> +        dev_err(&usb2->base.dev, "no port found for USB2 lane %u\n", 
>>> index);
>>> +        return false;
>>> +    }
>>> +
>>> +    do {
>>> +        if (usb2->role == USB_ROLE_NONE)
>>> +            return true;
>>> +
>>> +        usleep_range(50, 60);
>>> +    } while (retries--);
>>> +
>>> +    dev_err(&usb2->base.dev, "timed out waiting for USB_ROLE_NONE");
>>> +
>>> +    return false;
>>> +}
>>
>>
>> This patch is causing the following build error today with -next ...
> 
> Sorry this is not in -next, I had just applied locally on top!
> 
>>    MODPOST Module.symvers
>> ERROR: modpost: "tegra_xusb_usb2_port_wait_role_none" [drivers/usb/ 
>> host/ xhci-tegra.ko] undefined!
>>
>> The above function symbol needs to be exported.

You're right, thanks for catching this. I'll fix it in v2.

> 
> Nonetheless this needs to be fixed.
> 
> Jon
> 
