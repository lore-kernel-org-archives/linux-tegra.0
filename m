Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53C279DC8;
	Tue, 13 Jan 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317090; cv=none; b=ILK8PdaAwvqciMXWPFZxTKPjzFbywuZgOSCUoQvpyBBqjEiATa7PFG56jZQD5pc1k2xFUIY7LXtW5fwBTKtAQ7Yjzrcww+fdfR2RFfUbQPGsxtzQOQPSAmFP3jzG01F0b7flJYy3zM38qLfqdCDLCIf0bzn17yKFvDp/Etchotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317090; c=relaxed/simple;
	bh=bytzEBphdnUDiq59jCY+y+9/lSfdJjO2JXZ6AF5/lVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXfA36ZP8gpWVTSx3CZyuq7YlICxw3fgjkwuxQdKNV0csp2ARrxCbbGjsUIAp1ramhhqiacNcEoTba7NHPjAldyzvrNtggWLsopN7r/xD3SPrEaecJdledK5rTASM+d7M8IpqQ01PfTibZjdOO8CIwkIU7iZ1+2qx8P54mwzFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=hQ8aVbNg; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="hQ8aVbNg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D414160029BD;
	Tue, 13 Jan 2026 15:11:25 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id EFa79Lnypwl6; Tue, 13 Jan 2026 15:10:55 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E9591600140A;
	Tue, 13 Jan 2026 15:10:54 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768317055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbxfq9jp74vtOydBQ9RJUch+aysnR2/gbokPt1O0PRU=;
	b=hQ8aVbNgfgrCXaG1NnhxmbPhehvMedmR85kuHoWkKJfQof85QlT61K7wLPQtao65dlgEeS
	pfAgnNKdSEz3gqPePO9+GB4XiOepQjmxDyiABWzmZ9trqhy8iM0MFZVSo7Eyl7HcX7vbFS
	hBNUfhA4S4XD9rwl5rJ8MCJQtjHw8NJXb1cbeWlnwuNSn2ZhjNh7y/1LrmVJOEcLtkfvIK
	32ARMFWkPMXN17ZtZXKgCHXcN00QRr+wtCDG0KMKrDI+tKzgI8mYaRiu4oLd2zRbXrbUAy
	U7XUYzexKWK/NEfEAj6SFpj7W5jgVQQH8BDHf1XrbrE3iS+mTk0EVzFRFgmb6w==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 7AA72360107;
	Tue, 13 Jan 2026 15:10:54 +0000 (WET)
Message-ID: <c3f54ffb-cf4b-47ae-871a-6dd60b17c9cb@tecnico.ulisboa.pt>
Date: Tue, 13 Jan 2026 15:10:54 +0000
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
 <86cd3ff0-1609-44cb-911c-f0e97652ca1b@nvidia.com>
 <ae36f759-e889-4371-8c08-b8ffd1b69250@tecnico.ulisboa.pt>
 <703a470d-87fc-4580-a743-952e422984d4@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <703a470d-87fc-4580-a743-952e422984d4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/13/26 14:48, Jon Hunter wrote:
> 
> On 13/01/2026 14:05, Diogo Ivo wrote:
>>
>>
>> On 1/13/26 11:56, Jon Hunter wrote:
>>>
>>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>>> The current implementation of USB2 role switching on Tegra relies on
>>>> whichever the previous USB controller driver was using the PHY to first
>>>> "yield" it back to USB_ROLE_NONE before the next controller configures
>>>> it for the new role. However, no mechanism to guarantee this ordering
>>>> was implemented, and currently, in the general case, the configuration
>>>> functions tegra_xhci_id_work() and tegra_xudc_usb_role_sw_work() end up
>>>> running in the same order regardless of the transition being HOST- 
>>>> >DEVICE
>>>> or DEVICE->HOST, leading to one of these transitions ending up in a
>>>> non-working state due to the new configuration being clobbered by the
>>>> previous controller driver setting USB_ROLE_NONE after the fact.
>>>>
>>>> Fix this by introducing a helper that waits for the USB2 port’s current
>>>> role to become USB_ROLE_NONE and add it in the configuration functions
>>>> above before setting the role to either USB_ROLE_HOST or
>>>> USB_ROLE_DEVICE. The specific parameters of the helper function are
>>>> choices that seem reasonable in my testing and have no other basis.
>>>
>>> This is no information here about why 6 * 50/60us is deemed to be 
>>> sufficient? May be it is, but a comment would be nice.
>>>
>>>> This was tested on a Tegra210 platform (Smaug). However, due to the 
>>>> similar
>>>> approach in Tegra186 it is likely that not only this problem exists 
>>>> there
>>>> but that this patch also fixes it.
>>>>
>>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>>> ---
>>>>   drivers/phy/tegra/xusb.c            | 23 +++++++++++++++++++++++
>>>>   drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
>>>>   drivers/usb/host/xhci-tegra.c       | 15 ++++++++++-----
>>>>   include/linux/phy/tegra/xusb.h      |  1 +
>>>>   4 files changed, 38 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>>>> index c89df95aa6ca..e05c3f2d1421 100644
>>>> --- a/drivers/phy/tegra/xusb.c
>>>> +++ b/drivers/phy/tegra/xusb.c
>>>> @@ -740,6 +740,29 @@ static void 
>>>> tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
>>>>       }
>>>>   }
>>>> +bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl 
>>>> *padctl, int index)
>>>> +{
>>>> +    struct tegra_xusb_usb2_port *usb2 = 
>>>> tegra_xusb_find_usb2_port(padctl,
>>>> +                                      index);
>>>> +    int retries = 5;
>>>> +
>>>> +    if (!usb2) {
>>>> +        dev_err(&usb2->base.dev, "no port found for USB2 lane 
>>>> %u\n", index);
>>>
>>> This appears to be a bug. If !usb2 then dereference usb2->base anyway.
>>
>> It is a bug, will fix in v2.
>>
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    do {
>>>> +        if (usb2->role == USB_ROLE_NONE)
>>>> +            return true;
>>>> +
>>>> +        usleep_range(50, 60);
>>>> +    } while (retries--);
>>>> +
>>>> +    dev_err(&usb2->base.dev, "timed out waiting for USB_ROLE_NONE");
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>>   static int tegra_xusb_usb2_port_parse_dt(struct 
>>>> tegra_xusb_usb2_port *usb2)
>>>>   {
>>>>       struct tegra_xusb_port *port = &usb2->base;
>>>> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/ 
>>>> gadget/ udc/tegra-xudc.c
>>>> index 0c38fc37b6e6..72d725659e5f 100644
>>>> --- a/drivers/usb/gadget/udc/tegra-xudc.c
>>>> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
>>>> @@ -698,8 +698,12 @@ static void 
>>>> tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
>>>>   static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
>>>>   {
>>>> +    int port = tegra_xusb_padctl_get_port_number(xudc->curr_utmi_phy);
>>>>       int err;
>>>> +    if (!tegra_xusb_usb2_port_wait_role_none(xudc->padctl, port))
>>>> +        return;
>>>> +
>>>>       pm_runtime_get_sync(xudc->dev);
>>>>       tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);
>>>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci- 
>>>> tegra.c
>>>> index 9c69fccdc6e8..9944593166a3 100644
>>>> --- a/drivers/usb/host/xhci-tegra.c
>>>> +++ b/drivers/usb/host/xhci-tegra.c
>>>> @@ -1352,18 +1352,23 @@ static void tegra_xhci_id_work(struct 
>>>> work_struct *work)
>>>>       struct tegra_xusb_mbox_msg msg;
>>>>       struct phy *phy = tegra_xusb_get_phy(tegra, "usb2",
>>>>                               tegra->otg_usb2_port);
>>>> +    enum usb_role role = USB_ROLE_NONE;
>>>>       u32 status;
>>>>       int ret;
>>>>       dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra- 
>>>> >host_mode));
>>>> -    mutex_lock(&tegra->lock);
>>>
>>> Extra blank line here.
>>
>> Will fix in v2.
>>
>>>> -    if (tegra->host_mode)
>>>> -        phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
>>>> -    else
>>>> -        phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
>>>> +    if (tegra->host_mode) {
>>>> +        if (!tegra_xusb_usb2_port_wait_role_none(tegra->padctl,
>>>> +                             tegra->otg_usb2_port))
>>>> +            return;
>>>> +        role = USB_ROLE_HOST;
>>>> +    }
>>>> +
>>>> +    mutex_lock(&tegra->lock);
>>>> +    phy_set_mode_ext(phy, PHY_MODE_USB_OTG, role);
>>>>       mutex_unlock(&tegra->lock);
>>>
>>> I am trying to understand why you opted to implement it this way 
>>> around and not add the wait loop after setting to the mode to 
>>> USB_ROLE_NONE in the original code all within the context of the mutex?
>>
>> I did that to minimize the amount of time we wait while holding the
>> mutex, as we can now possibly wait a significant amount of time for the
>> role switch. Is this an unneccessary optimization?
> 
> Do you mean it will be longer than a few 100us?

Currently the worst case in wait_role_none() is around 300us but again
this is simply because I chose the values with no criteria except that
in my testing they have worked thus far. Do you have access to any
internal documentation where the transition length is documented?

In any case I think that the underlying principle of minimizing the time
we hold the mutex is solid, no?

Diogo

> Jon
> 
