Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE172F5461;
	Sun,  1 Mar 2026 20:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398565; cv=none; b=l8V3gqxScnxddal04SF5BOPefVp+Pz7+GdONtw4dQggONWdim8F7cKiCDdXAY5s8xiS5T+QnnZfUvM7OFp9KrDGShbzgTNsR/1vqUEv5aLfZqSukU5fe3LHsEBmAikVyJIzJ+wmogLdFHhI3nHZbT8ktsqXH2b4S31XDyUFDqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398565; c=relaxed/simple;
	bh=/UAP3zia+zgLbS/kUB5a/6dM1IeIAwp34ZtChhw2YOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AONVmM/JrWBF+ioCN3oqwb4zgNe0MpclFUNEEMKK5S5k/BBdKVVfVdF78T+mEFv9zUWQ5ozgVhZPil6kkiKEpl4+teHDnPUKj14j/YGgM6W3/fHDa+wOAdC6ab5wX28Pw6Ts/kvlT6y7b71xbrrIvk42rCLTkS/XQoWgt1kOycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=nfkJO/x5; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="nfkJO/x5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772398546; x=1773003346; i=marvin24@gmx.de;
	bh=CiboNVxnSNYqbRebdlc5BCnPVn2mCUoW9pkOXR9BpSI=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nfkJO/x5k+o0AWdyjKwtuzsK4cZNn1Yke/zOH4JELZj2ADpPcj2gnoWpZqPAWUDZ
	 l7x/h8We1dH/636NdB45p+2Y/n06BIcrujiJqSoxwLC6+QG5BBvkGiqCceMM8XEsR
	 uFT/5isinLPeOt5EcTOUvQujzblVd0hVxNXXBHxt/J2Nwf8HC5kHHd17M2+2YqjzP
	 zGDWlBy3aDieexDLJswMSoiTeohOYjLAwHB8ut0OdB9pSunepwxGYHrWCfX+3YL9M
	 Grrk+0fuCfB/xL+keSxfMaIyyxg3pInmJ+S7ZK9NgwPyd26p7Ft6t3m8WG1VTa6zv
	 a9MENvqrbGY5v3R8DQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1wI3ZH2xxl-00XxJY; Sun, 01
 Mar 2026 21:55:46 +0100
Date: Sun, 1 Mar 2026 21:55:45 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
    devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
In-Reply-To: <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de>
Message-ID: <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>
References: <aY_BpRQmLdqOOW2K@google.com> <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de> <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de> <aZvdDIYlCjg8sVGT@google.com> <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:xqvammk49x/ErVeZSCbEYV/vNk/JpUsa4cKCr9k13xXqdfi6CBT
 3rqIqU8vkN67D2hhmIrD5vG4m1EPOca2X1ADqQ8hcL/pV7GZ0SUd2s7LCYrGpPP36LZ+6tI
 xwirtrZsVbtP6XbgUIG8UigvzJDaQ5CFgvNSVN+3wDQHfMdUkvz1TRoAocfs21QNQeP8nFp
 biOoUC75e+gvgpmcEog9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MiovSkaK1H8=;awDbtqNg8vysbw6vT+WwIpBCVwF
 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
 IipaRxsuNDQpxq7HBd98a1Bsc8j71
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,


On Sat, 28 Feb 2026, Marc Dietrich wrote:
> On Sun, 22 Feb 2026, Dmitry Torokhov wrote:
>> On Sat, Feb 21, 2026 at 03:24:35PM +0100, Marc Dietrich wrote:
>>> On Sat, 14 Feb 2026, Marc Dietrich wrote:
>>>> On Fri, 13 Feb 2026, Dmitry Torokhov wrote:
>>>>=20
>>>>> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
>>>>> device can be instantiated via device tree.
>>>>>=20
>>>>> Add the declaration there and drop board-paz00.c file and relevant
>>>>> Makefile fragments.
>>>>>=20
>>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>>> ---
>>>>>=20
>>>>> This is not tested on real hardware, compile tested only...
>>>>>=20
>>>>> arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
>>>>> arch/arm/mach-tegra/Makefile               |  2 -
>>>>> arch/arm/mach-tegra/board-paz00.c          | 56 --------------------=
=2D-
>>>>> arch/arm/mach-tegra/board.h                |  2 -
>>>>> arch/arm/mach-tegra/tegra.c                |  4 --
>>>>> 5 files changed, 8 insertions(+), 64 deletions(-)
>>>>>=20
>>>>> diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>>> b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>>> index 1408e1e00759..d1093ad569e6 100644
>>>>> --- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>>> +++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>>> @@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
>>>>> 		enable-active-high;
>>>>> 	};
>>>>>=20
>>>>> +	rfkill {
>>>>> +		compatible =3D "rfkill-gpio";
>>>>> +		label =3D "wifi_rfkill";
>>>>> +		radio-type =3D "wlan";
>>>>> +		reset-gpios =3D <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
>>>>=20
>>>> I guess this can be removed, as it should trigger the LED, which is
>>>> already included elsewhere ....
>>>>=20
>>>>> +		shutdown-gpios =3D <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
>>>>> +	};
>>>>> +
>>>>> 	sound {
>>>>> 		compatible =3D "nvidia,tegra-audio-alc5632-paz00",
>>>>> 			"nvidia,tegra-audio-alc5632";
>>>>=20
>>>> I'll give it a try and report back.
>>>=20
>>> rfkill (and LED) works as expected. With the reset-gpio line mentioned=
=20
>>> above
>>> removed, you can add my Tested-By.
>>=20
>> Thank you Marc.
>>=20
>> I am still a bit confused about the reset gpio. As far as I understand
>> looking through old commits reset gpio (PD1) is distinct from the LED
>> gpio (PD0) that is currently being controlled by "gpio-leds".
>
> well, the situation is a bit complicated. First, D1 gpio is eletrical OR=
ed=20
> with the Wifi LED gpio (D0), which you can confirm by checking the schem=
atic=20
> (google is your friend).
> The said schematic contains two nearly identical devices (Toshiba Netboo=
k=20
> AC100, aka Procyon and Toshiba tablet Folio 100, aka Sirius). GPIO D1 is=
 also=20
> used on the tablet to rfkill the wifi/bt module on an M2 card, while the=
=20
> Notebook has wifi on a separate usb port (JP2) (and G3 modem on an M2 ca=
rd),=20
> where D1 is not connected to at all. At least that's how I understand it=
.
>
>> I guess the rfkill driver needs at least one of "reset" or "shutdown"
>> gpios, and that is why it continues to work with only shutdown, but I a=
m
>> trying to understand if PD1 was never connected to the WiFi chip reset
>> line and instead is used for something else, or if it is indeed a reset
>> line...
>
> see above.
>
>> Was the patch not working with reset-gpios present? I am trying to
>> gather data to craft a proper commit message.
>
> It also works with the reset-gpio, but just because it is not connected =
to=20
> anything beside the LED on this machine.
>
> Maybe I should also add that there are also variants of the Netbook with=
=20
> integrated bluetooth (and without 3G), but I don't know where it is conn=
ected=20
> to (maybe also to the M2 socket). In order to support such machines, we =
could=20
> use a second rfkill device for bluetooth only I guess. The original code=
 used=20
> a single rfkill device in order to control both gpios together for a com=
mon=20
> rfkill I guess. I just don't have such a variant, so I cannot test it.

thinking about all this a bit more, I guess your approach to just convert=
=20
the driver to device-tree and not change any functionally beside it, is=20
the best solution for now (and good pratice in general).
Maybe I can get access to a machine with bluetooth (or some other user=20
steps up), so we can try to find a better solution, if required at all.

Thanks!
Marc
