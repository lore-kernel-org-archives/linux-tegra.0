Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D04279DC8;
	Tue, 13 Jan 2026 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317098; cv=none; b=a4Ae+DOaZZAGvkYC9BikMkELWL+dKH11v7QiJW+9e1fnfnPfGxLUZcKahKKbQjxEyJkjEf7N0QDAjVgEFSdovnc1DrA6Ic9YEq6qT7tFrz/9ze8swgKit2Z1h0NWRRnFooDJoMJavr5j71zmDWD504M40qHRUsMea7FJDQ2WUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317098; c=relaxed/simple;
	bh=oYURUZDdfxqaujzRgJFyJvgic5MypRI4QKnO/vJyFxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1zQWw/fk5TcJ7lT1It8ETKwwgSURJLq0Mq0BXBFFMMKRQxYZHg1YnJ7519eqqdgLnF8tQi1iph6gzFggUVq/7BeD+Vq9Rg7lIQv3COSdibABXcMEe7DlwwSwDoHVTdUwocOk5yiq1fdXLNWM2bjufNj/HODg+Oasgn7SVUSuyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=XhasqdgP; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="XhasqdgP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0DA0D600084C;
	Tue, 13 Jan 2026 15:11:35 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id aulEY0Telgc1; Tue, 13 Jan 2026 15:11:32 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 91B8E6001401;
	Tue, 13 Jan 2026 15:11:29 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768317089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V20ZBD9CJ8yUjiXed4dOqLBy4fH72bgYz4DmEJlM3Y8=;
	b=XhasqdgPmo06L9jvO+SGzbdwCXghoeYvU2TV+6ad1ux3djoWNiHgZ5DsGKOTSGrlmmRU6e
	koctDBA09Zpz5ejInp7Z3oCPAdpSUbsKU+tpfCz3ecrgu4zF5YpbBbaN6uBW8fip2tsPrl
	+kJabVIEi6/1pk57SqHYwHTN/Z81G8CquEnLahApyLauXA3EZJ/izwsDe7NLDEDyBdyHZA
	CV81OyulP3MRC8lWhLzkvgIOnj1Ux9LEdAy0mYOHlyLCnsNYkss0oZ1sOI2tlNVTEYShPv
	drio9ynDGPZPIvVIecXHLohKYtPcQ5WdPJ/FOhjo/ctmeRzSVYaHlF8Zlsa6NA==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 57D68360148;
	Tue, 13 Jan 2026 15:11:29 +0000 (WET)
Message-ID: <d2f01fe4-f92a-408a-890c-7e37f7c414c3@tecnico.ulisboa.pt>
Date: Tue, 13 Jan 2026 15:11:29 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: tegra: smaug: Add usb-role-switch support
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
 <20251204-diogo-tegra_phy-v1-5-51a2016d0be8@tecnico.ulisboa.pt>
 <ea60f024-1f39-483c-87e3-36624bd58d49@nvidia.com>
 <ea4ee289-fb46-44be-b5e6-9d3beca7c0d8@tecnico.ulisboa.pt>
 <42df7bb1-c587-429f-88ac-1e5ffa7c2b3f@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <42df7bb1-c587-429f-88ac-1e5ffa7c2b3f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/26 14:49, Jon Hunter wrote:
> 
> On 13/01/2026 14:20, Diogo Ivo wrote:
>>
>>
>> On 1/12/26 22:03, Jon Hunter wrote:
>>>
>>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>>> The USB2 port on Smaug is configured for OTG operation but lacked the
>>>> required 'usb-role-switch' property, leading to a failed probe and a
>>>> non-functioning USB port. Add the property along with setting the 
>>>> default
>>>> role to host.
>>>>
>>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>>> ---
>>>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/ 
>>>> arm64/boot/dts/nvidia/tegra210-smaug.dts
>>>> index b8d854f90be7..49bf23d6f593 100644
>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>>> @@ -1809,6 +1809,8 @@ usb2-0 {
>>>>                   status = "okay";
>>>>                   vbus-supply = <&usbc_vbus>;
>>>>                   mode = "otg";
>>>> +                usb-role-switch;
>>>> +                role-switch-default-mode = "host";
>>>>               };
>>>
>>>
>>> This change does add the following warning when building with CHECK_DTBS
>>> ...
>>>
>>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 
>>> (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default- 
>>> mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>>      from schema $id: http://devicetree.org/schemas/phy/ 
>>> nvidia,tegra210- xusb-padctl.yaml
>>>
>>> I know that there are many warnings seen for the smaug DTB, but it would
>>> be good to ensure we don't add more.
>>
>> The 'role-switch-default-mode' property is read by the driver to set the
>> initial role for the port [0] and is needed in order for the port to work
>> when booting so in order to fix the warning this property needs to be 
>> added
>> to the binding.
> 
> Correct.
> 
>> As for the other warning ('connector' is a dependency of 'usb-role- 
>> switch')
>> again I think the binding needs to be adjusted since in the Pixel C the
>> connector node should be under the (as for now not present)
>> cros-ec-typec node and the usb2-0 is then modeled as a remote-endpoint
>> for the full connector. I am currently working on fixing the cros-ec- 
>> typec
>> driver and already have a working fix for automatic role switching but
>> in any case I think the binding is what needs changing. If you agree
>> with this then I will add the necessary changes to the DT binding in v2.
> 
> Yes in both cases we need fixes to the DT binding that's all.

Perfect, will do for v2.

Diogo

> Jon
> 
