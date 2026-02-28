Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6641C2F7;
	Sat, 28 Feb 2026 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274357; cv=none; b=EqyP3RuuS/8OUB/ZcqeEwZAmUF11U5umeUg9U6IzkMdWoIr0TvmXLVHWKF+uJzQ28QbTEmZYOflwwkEKlrUkdhNziEo01IRtMKbY7tIi1zYNiqSiJ0XPLlc7njLB5Aj3xMP3/iMUYy1xlAiwPfJ0Renx7agKAsupKJiMbie5qk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274357; c=relaxed/simple;
	bh=HzVPqmhFVnua0O/4GOkTrFvph7OyS7aPjL9fzFTawmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RjMqfD4RKSWTeXQQAEQPcqU8YB767rJAN919USxwHWL7gvcGU77NQuevaYAfq7m1bccrzl1Qjzdqxfrzda5dDbTWEsv2gEVQgBeUHkOiCV3/T/gPZfkhc78Y3cJhWb44ZVj7DZ8aqaB1Zqp1opU/3+ot6PyMDIBbPEjyIi9naxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=cjPMD3yh; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="cjPMD3yh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772274353; x=1772879153; i=marvin24@gmx.de;
	bh=/PbibpWMEuYQ+pbvAfm7JGy8FaKcGt8mKobcMG5mXLk=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cjPMD3yhBKg9bZLBGGHttsp9nB4rIdPgrQCSuzQr2pIMFkNKm3FkiWBALvwWpFX0
	 tpY3wzpC8o0w5xHVKP+Vb4k0hmDM9JCEyWyW54Rzm0btkz6WfV8FmkDRT3WmJ1X6b
	 l2TyoZub1yYqgLUxLC18uhayZ774OKcQ9Lwe7ztUhVukC/IdS6Pq7zDJEwH3u2Mrz
	 ttq0cjWCU0HqKR9h5L4G/wBhiTFEI6G+pciSv7mgZh9EgNlFbpqsk/1WRzuFOV5gA
	 UZEcGGjPsZ81RuuF3f0td4VBMlGort4V7usnbw2rxBzbeggMecTzMMeZid0MUrdIX
	 qOI//WGczFNQ5JBbAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1w2dAo2LJz-00CvSG; Sat, 28
 Feb 2026 11:25:53 +0100
Date: Sat, 28 Feb 2026 11:25:52 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
    devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
In-Reply-To: <aZvdDIYlCjg8sVGT@google.com>
Message-ID: <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de>
References: <aY_BpRQmLdqOOW2K@google.com> <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de> <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de> <aZvdDIYlCjg8sVGT@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:R18DcLVz+9a3ytTUeAMOevDiDmWXbbQR8F9kh43gCosQf1uJjK9
 WrRTCg8YLchu43G5kWQFhd8LFeVwCAQWIv5Rc01YJ3gyHR2dKyCKr3mgcsHrrrniYFAkgC5
 P7y5c0E8aS1UobaPQtuP3tHRonVIAhivyYAv2F6hn02TIoJoqePxmC/zS0RhdG5StWyKs+Z
 NOsJBIzos/gzkrsk94T8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WiFC3kTE+L4=;cBSjYWgRT2nB3a0LKevEew7XvJn
 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
 xDyC/NdOsFqoDYfZ5E4sM8gu3r+BG
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sun, 22 Feb 2026, Dmitry Torokhov wrote:

> Hi Marc,
>
> On Sat, Feb 21, 2026 at 03:24:35PM +0100, Marc Dietrich wrote:
>> Hi Dmitry,
>>
>> On Sat, 14 Feb 2026, Marc Dietrich wrote:
>>
>>> Hi Dmitry,
>>>
>>> On Fri, 13 Feb 2026, Dmitry Torokhov wrote:
>>>
>>>> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
>>>> device can be instantiated via device tree.
>>>>
>>>> Add the declaration there and drop board-paz00.c file and relevant
>>>> Makefile fragments.
>>>>
>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>> ---
>>>>
>>>> This is not tested on real hardware, compile tested only...
>>>>
>>>> arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
>>>> arch/arm/mach-tegra/Makefile               |  2 -
>>>> arch/arm/mach-tegra/board-paz00.c          | 56 ---------------------=
-
>>>> arch/arm/mach-tegra/board.h                |  2 -
>>>> arch/arm/mach-tegra/tegra.c                |  4 --
>>>> 5 files changed, 8 insertions(+), 64 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>> b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>> index 1408e1e00759..d1093ad569e6 100644
>>>> --- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>> +++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>>>> @@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
>>>> 		enable-active-high;
>>>> 	};
>>>>
>>>> +	rfkill {
>>>> +		compatible =3D "rfkill-gpio";
>>>> +		label =3D "wifi_rfkill";
>>>> +		radio-type =3D "wlan";
>>>> +		reset-gpios =3D <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
>>>
>>> I guess this can be removed, as it should trigger the LED, which is
>>> already included elsewhere ....
>>>
>>>> +		shutdown-gpios =3D <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
>>>> +	};
>>>> +
>>>> 	sound {
>>>> 		compatible =3D "nvidia,tegra-audio-alc5632-paz00",
>>>> 			"nvidia,tegra-audio-alc5632";
>>>
>>> I'll give it a try and report back.
>>
>> rfkill (and LED) works as expected. With the reset-gpio line mentioned =
above
>> removed, you can add my Tested-By.
>
> Thank you Marc.
>
> I am still a bit confused about the reset gpio. As far as I understand
> looking through old commits reset gpio (PD1) is distinct from the LED
> gpio (PD0) that is currently being controlled by "gpio-leds".

well, the situation is a bit complicated. First, D1 gpio is eletrical ORed=
=20
with the Wifi LED gpio (D0), which you can confirm by checking the schemat=
ic=20
(google is your friend).
The said schematic contains two nearly identical devices (Toshiba=20
Netbook AC100, aka Procyon and Toshiba tablet Folio 100, aka Sirius).=20
GPIO D1 is also used on the tablet to rfkill the wifi/bt module on an M2=
=20
card, while the Notebook has wifi on a separate usb port (JP2) (and G3=20
modem on an M2 card), where D1 is not connected to at all. At least that's=
=20
how I understand it.

> I guess the rfkill driver needs at least one of "reset" or "shutdown"
> gpios, and that is why it continues to work with only shutdown, but I am
> trying to understand if PD1 was never connected to the WiFi chip reset
> line and instead is used for something else, or if it is indeed a reset
> line...

see above.

> Was the patch not working with reset-gpios present? I am trying to
> gather data to craft a proper commit message.

It also works with the reset-gpio, but just because it is not connected to=
=20
anything beside the LED on this machine.

Maybe I should also add that there are also variants of the Netbook with=
=20
integrated bluetooth (and without 3G), but I don't know where it is=20
connected to (maybe also to the M2 socket). In order to support such=20
machines, we could use a second rfkill device for bluetooth only I=20
guess. The original code used a single rfkill device in order to control=
=20
both gpios together for a common rfkill I guess. I just don't have such a=
=20
variant, so I cannot test it.

Best wishes,

Marc

