Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7078D17A31E;
	Tue, 13 Jan 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316727; cv=none; b=IAcFzpU3kbHn9mBwJ3O08KLyp6cDn6e016K2mtUX3Ol+mRYebZk8JwhMJZ3X/irC2OUvxvkDdQlt5O7Yf6IzAf8Cn24jjx89E5j3Rq522Oy0aw6SYegJ6RAcbXa62ADgwG7O9lD54i5WuNW5GfhXZ6fduNd8EEDNIrX1f2FLqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316727; c=relaxed/simple;
	bh=CK8+T3XHgaRp2Ua982EyXh6oIKCY8+OOZQTJ5cRE9LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4DWUNyXl423Meh9yHmOT5FtV0fx93daTW1IDqm6+s8IvYF/Fsxuu5UuT/mIyQqIvbFGcjXABYlqsdIkgtq6WsO2rw7FIWGKAP1tp6yJvOEaCDS89yV34Y0f/wg8DpNkT6Tjeoj20LWIqe0KCESROxAQjzYVhUmTvCSzyA6lFKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=lLmeBwXH; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="lLmeBwXH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4AFDF6003015;
	Tue, 13 Jan 2026 15:05:20 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ylJm_Cvi6WdJ; Tue, 13 Jan 2026 15:05:18 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 9F5946003006;
	Tue, 13 Jan 2026 15:05:17 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768316717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZOf9DBWzhOubMrj72rv5+jVNjLliSIo7m9F4zNgEbA=;
	b=lLmeBwXHWaaX8/+ae4RoeFcX+wfMxwh7HhKAXlFS+gLaHlTHlFjCuVFqfiJTwErirH7PFI
	4AeNZWFB9HXEiFtm/s+zp/7a/q87k+ixkKDRoAOm30uCDcy+4F5NWmBGLeYWBQuZhB8Lbp
	Q4HEEu8fug5mJVPXgl1eZfxZjco9+V2DVlC1wX5/2/l+w+pT9SD2DzPKG9omLjeY5vfITp
	TLyfDwq2VD4xOvMuZspzzziKePL42L6XpeDEjbjg3YykmySGRfefpHoRAipsL3PY6LYhV7
	LgJ+s4srcsONfx2u7FauiQQshh2fN1hiCFeFOMEUP+O5AKKH7qmqQCKb2BD1Kw==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 11723360147;
	Tue, 13 Jan 2026 15:05:17 +0000 (WET)
Message-ID: <f942f18f-76f7-477d-8861-6e9d1a29655c@tecnico.ulisboa.pt>
Date: Tue, 13 Jan 2026 15:05:16 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: tegra: xusb: Fix USB2 port regulator disable
 logic
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
 <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
 <c5450fc7-230e-4435-bd1d-3db4f1f6e736@nvidia.com>
 <54afff11-df9b-4c25-bd1d-8134196ce093@tecnico.ulisboa.pt>
 <043663d0-d592-432b-8550-10669674d17a@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <043663d0-d592-432b-8550-10669674d17a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/26 14:42, Jon Hunter wrote:
> 
> On 13/01/2026 13:59, Diogo Ivo wrote:
>>
>>
>> On 1/13/26 12:01, Jon Hunter wrote:
>>>
>>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>>> The USB2 PHY mode handling on Tegra210 incorrectly relied on
>>>> regulator_is_enabled() when determining whether the VBUS supply should
>>>> be disabled during role changes. This is because regulator_is_enabled()
>>>> reports exactly what is states and not if there is an unbalanced number
>>>> of calls between regulator_enable() and regulator_disable(). For
>>>> example, regulator_is_enabled() always reports true on a fixed- 
>>>> regulator
>>>> with no enable gpio, which is the case on the Pixel C.
>>>>
>>>> This then leads to the PHY driver wrongfully calling 
>>>> regulator_disable()
>>>> when transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE since the 
>>>> driver
>>>> did not previously call the corresponding regulator_enable().
>>>>
>>>> Fix this by keeping track of the current role and updating the logic to
>>>> disable the regulator only when the previous role was USB_ROLE_HOST.
>>>>
>>>> While at it fix a small typo in a comment.
>>>>
>>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>>> ---
>>>>   drivers/phy/tegra/xusb-tegra210.c | 5 +++--
>>>>   drivers/phy/tegra/xusb.h          | 1 +
>>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/ 
>>>> xusb-tegra210.c
>>>> index 3409924498e9..63ad57d95514 100644
>>>> --- a/drivers/phy/tegra/xusb-tegra210.c
>>>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>>>> @@ -1934,9 +1934,9 @@ static int tegra210_usb2_phy_set_mode(struct 
>>>> phy *phy, enum phy_mode mode,
>>>>               /*
>>>>                * When port is peripheral only or role transitions to
>>>>                * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
>>>> -             * be enabled.
>>>> +             * enabled.
>>>>                */
>>>> -            if (regulator_is_enabled(port->supply))
>>>> +            if (port->role == USB_ROLE_HOST)
>>>>                   regulator_disable(port->supply);
>>>>               tegra210_xusb_padctl_id_override(padctl, false);
>>>> @@ -1944,6 +1944,7 @@ static int tegra210_usb2_phy_set_mode(struct 
>>>> phy *phy, enum phy_mode mode,
>>>>           }
>>>>       }
>>>> +    port->role = submode;
>>>>       mutex_unlock(&padctl->lock);
>>>>       return err;
>>>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>>>> index d2b5f9565132..273af147dfd3 100644
>>>> --- a/drivers/phy/tegra/xusb.h
>>>> +++ b/drivers/phy/tegra/xusb.h
>>>> @@ -317,6 +317,7 @@ struct tegra_xusb_usb2_port {
>>>>       enum usb_dr_mode mode;
>>>>       bool internal;
>>>>       int usb3_port_fake;
>>>> +    enum usb_role role;
>>>>   };
>>>
>>>
>>> A similar fix was made to the Tegra186 code by commit cefc1caee9dd 
>>> ("phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY 
>>> mode"). Although the above looks simpler, I am wondering if we should 
>>> make a similar change to the Tegra210 code so that they both are 
>>> implemented in the same way?
>>
>> Looking at cefc1caee9dd my approach leads to less changes but I do agree
>> that standardization benefits us here. However in that case I think we
>> can take it a step further and actually just have a single function
>> tegra_xusb_padctl_id_override() (and likewise for vbus_override() and
>> set_mode()) since they all seem to do the same thing in both platforms.
> 
> Yes I think that would be fine. I can't say I have looked at that in 
> detail but that would seem like the logical way to go.

Ok, then I'll do just that.

> Jon
