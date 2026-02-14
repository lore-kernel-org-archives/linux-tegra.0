Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29F27510B;
	Sat, 14 Feb 2026 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101636; cv=none; b=ofL7eAjnbAZwbH1aO5h/KkQzMlltS7PpFnWi1MYbOFRIvKLOaCXFT+bschzeVSKK37vuMkx2u8vdYomGpzm4AsHay1hQuin+irt3AJvFka9zyjeFerovacufbY/PBrLKSAOYnQW+NrrLvtZIBmcJjG/WT+UlU1mAHArEJ9coMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101636; c=relaxed/simple;
	bh=8bMS4+GQ4cd16ll46yTSh5ZXSA/RK1lT37xMhKrflXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HWEEgXMM4+hpvaPPuFYoeQCU8VI1dmrIr6WArezW9UBIuebwxwltdydBlDfCGJmKZkwLmGTrC28xr0kjlEIpVlg83GaxepE7L29DcxoB3k+Gz0F5ZRoxC9BiSJEd3mLtEztQM0oqk9+Cv1F3yBrEeQPdTm032XzRkAPI09s6W3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=tzDf+tLB; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="tzDf+tLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771101633; x=1771706433; i=marvin24@gmx.de;
	bh=NLnCaprKP4UBtZCvMBX18KH5HzUs15ApzAZU9Xb+6CY=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tzDf+tLB3o0bmJ0m/rypvh3+kE8uaHKM6U2HpL+/oiH+CyAf8Qcu9YHSAj89jYM0
	 AbLjyuuuLCrgw3xx0/jDM0mMyJftar+Pie80tpcW/ecjxSEMGGdyyKc9xn8cXftQ/
	 VzBPvb01Yjx3rha0AQztYER8PPFW5MC64KG2Yhl1EfXjccaR7LWAR1hOZ/y6h2j1z
	 wNojoSNAb3LjR8Y1M0TOFEjab3QPmF7SOHWhb5Iv/wrQvjfIf0OvAeXWGsVp/oZyV
	 lW3DOk9fihf2luZpCgQyiiNuyZuXH9XWlz3I4Lhb4C5IL8jxkAadothTSrm/RoSgL
	 VLCDy2KJ/JKI+0KLGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from N8016W05 ([46.81.31.227]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKKX-1vyF8z40xF-00CfZR; Sat, 14
 Feb 2026 21:40:33 +0100
Date: Sat, 14 Feb 2026 21:40:31 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Chen-Yu Tsai <wens@kernel.org>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Thierry Reding <thierry.reding@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Jonathan Hunter <jonathanh@nvidia.com>, 
    linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
In-Reply-To: <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com>
Message-ID: <de212734-0b59-144c-7ec9-91d1b3443148@gmx.de>
References: <ZnzulZBukibZUXKM@google.com> <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com> <aY1GZQJLKAF0fsz6@google.com> <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de> <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463783678-1260179078-1771101633=:23015"
X-Provags-ID: V03:K1:HuJPiAf9z3Gya1XB5E5j5dEZ1pTEHLyuVBglwvbszUKnI3rZQwC
 HDeYh7xxZASw7THf39XXdeQJEpobQgSB9jr1rXxRXYehfxS0ZGxjxGlkJ8LPrb3U9MdzoYW
 D8QJzjgJm7ISe7rlkeCUVDBElpU2dypM0TwZBhHuETxCcTzNOVrQvfUv7GwaQs3OivOPy8I
 sLuFFCXKKvFuDshwhWR2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1FpNcIsl/B8=;OK3zw1UHQzqR6ck65CLTo6W1e2+
 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
 NjudIR0r/OHwtufQXUDj

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463783678-1260179078-1771101633=:23015
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hallo Chen-Yu,

On Sat, 14 Feb 2026, Chen-Yu Tsai wrote:

> On Sat, Feb 14, 2026 at 10:27=E2=80=AFPM Marc Dietrich <marvin24@gmx.de>=
 wrote:
>>
>> Hi Dimitry,
>>
>> On Wed, 11 Feb 2026, Dmitry Torokhov wrote:
>>
>>> Hi Thierry,
>>>
>>> On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>>
>>>> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
>>>>> Complete conversion of the WiFi rfkill device to use device
>>>>> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead=
 of
>>>>> a lookup table.
>>>>>
>>>>>
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiF=
i rfkill
>>>>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880
>>>
>>> Do you know by any chance why paz00 does not simply configure rfkill
>>> switch via device tree? The driver (rfkill-gpio) seem to support devic=
e
>>> tree...
>>
>> last time I tried this was rejected because the wifi chip is on the usb
>> bus and "rfkill" should be a sub-function of this chip [1], but that wa=
s
>> some time ago...
>>
>> Looking hard the schematics, the wifi chip does not have a gpio input a=
s
>> first thought. Rather it seems that the first gpio toggles a regulator
>> which supplies the wifi module (m2 card) with power and the second gpio=
 is
>> just connected to the wifi LED.
>>
>> Not sure how to transfer this into dt, but I guess this would be the
>> better solution.
>
> Then the first GPIO should probably just be described as a fixed regulat=
or
> feeding the USB controller that the M.2 module is connected to.

I think that is what rfkill-gpio is for, so the proposal of=20
Dimitry looks fine, execpt for the reset-gpio, aka LED which is=20
already included in the dt (but maybe with the wrong gpio).

I will give it a try on real HW and report back.

Thanks!

Marc

---1463783678-1260179078-1771101633=:23015--
