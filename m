Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5B286881;
	Tue, 13 Jan 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314041; cv=none; b=dThi5j149Qt3XQEv3s62GwUMR6xd6EiZw1L8b3WaOqkSSc5KX7M3ic+9gXOemxadpJaJg64Vqh6O+HK5ETbau4ASnsGSZKxX6o9LPWds+ViCUFZvepl+vhU7c6cXvuhSNTPB0yJF3w4fKGozq5YprsaFGOl0V0BU+5a+5UmotSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314041; c=relaxed/simple;
	bh=XgmtYky/vQ9E76Bok9Zee6YvcNrFlfq07wYTyrlfKQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReMEj4KhfD/NOMvnNj6y58A7ZZALesGpVe8DruMpEL98r8xSBVMBmEt4IAI/jhEByfRz+O7S+VdPNIBt0L3k/3nrecvGE7EhfRvV8hMiNqJIadYJUvj1RyKvh36ecufGOUrNkxGs8h6KAjZbXVyQFy6YUoRba0dnGZKSmf2Bgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=SpNlV70t; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="SpNlV70t"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5139F6003C03;
	Tue, 13 Jan 2026 14:20:37 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 9-I0FvP7k-o5; Tue, 13 Jan 2026 14:20:34 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 3A9A16003C17;
	Tue, 13 Jan 2026 14:20:34 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1768314034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtTEO7u089b0r7hQr05Hu+7UDpMKL6cZI20/qSEFFrs=;
	b=SpNlV70tDLvGsv3x3Ag8L3/ByS87trHOSx91ZCtzendOUhrwPQsi0TkZCwEVNuO3gZXq2Z
	NK+kwyAE39sWcdvU6G5T2y5HfERW9nro0D4aVMxFZNUBsVPj+1ITsAp+MsPl4k6UEgLG/n
	+jeB33YNN/WSK2qc4k97aj+APwgzT7ypkJ3fVE+7EmjwgFFD5VzJn0j7YK++BF7ID9WRWS
	5MRuYHzJl6YzrMACiS9jbqT/gPuQKnkIwtO3AxiCoQpPph92k4HHbiUheYaWfOo/MI4/1v
	JjqHti0vi45JCB4yadfb9HHjhm2ps3cu1K3JWAfrkP4Hifytk/zEJtT3RK41cQ==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C170A360147;
	Tue, 13 Jan 2026 14:20:33 +0000 (WET)
Message-ID: <ea4ee289-fb46-44be-b5e6-9d3beca7c0d8@tecnico.ulisboa.pt>
Date: Tue, 13 Jan 2026 14:20:33 +0000
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
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <ea60f024-1f39-483c-87e3-36624bd58d49@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/12/26 22:03, Jon Hunter wrote:
> 
> On 04/12/2025 21:27, Diogo Ivo wrote:
>> The USB2 port on Smaug is configured for OTG operation but lacked the
>> required 'usb-role-switch' property, leading to a failed probe and a
>> non-functioning USB port. Add the property along with setting the default
>> role to host.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/ 
>> arm64/boot/dts/nvidia/tegra210-smaug.dts
>> index b8d854f90be7..49bf23d6f593 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> @@ -1809,6 +1809,8 @@ usb2-0 {
>>                   status = "okay";
>>                   vbus-supply = <&usbc_vbus>;
>>                   mode = "otg";
>> +                usb-role-switch;
>> +                role-switch-default-mode = "host";
>>               };
> 
> 
> This change does add the following warning when building with CHECK_DTBS
> ...
> 
> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 
> (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' 
> does not match any of the regexes: '^pinctrl-[0-9]+$'
>      from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210- 
> xusb-padctl.yaml
> 
> I know that there are many warnings seen for the smaug DTB, but it would
> be good to ensure we don't add more.

The 'role-switch-default-mode' property is read by the driver to set the
initial role for the port [0] and is needed in order for the port to work
when booting so in order to fix the warning this property needs to be added
to the binding.

As for the other warning ('connector' is a dependency of 'usb-role-switch')
again I think the binding needs to be adjusted since in the Pixel C the
connector node should be under the (as for now not present)
cros-ec-typec node and the usb2-0 is then modeled as a remote-endpoint
for the full connector. I am currently working on fixing the cros-ec-typec
driver and already have a working fix for automatic role switching but
in any case I think the binding is what needs changing. If you agree
with this then I will add the necessary changes to the DT binding in v2.

Thanks,
Diogo

[0]: 
https://elixir.bootlin.com/linux/v6.18.4/source/drivers/phy/tegra/xusb.c#L730

> Cheers
> Jon
