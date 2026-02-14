Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68C22A4F8;
	Sat, 14 Feb 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771079229; cv=none; b=BDzSXrZyBabMH121e/qE5q3gEHp4n+WS19zg/cHXtSEyBgW171ylnJjszKD905SjWNenCa3TlnnCVlmy1JS/p1I2khSXauAqhJvKJtG1ms91WcPyVnwwxacv9RX10lt7QIgp83F50AxY+A/1FUSm0bvImgcboyrAYDda8OO+TLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771079229; c=relaxed/simple;
	bh=zitT+gJYeIxToSCCEUcS7Yu80sppd+AKNqr6MoWSmbs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e4nXeBUbNi8wEMAAdEbfriAL38KO85Cgb3YHynFgrRNNjZ3SrrSoB77tPPUTGl9ziVkPmsUlmj1WOH7+x/QUMjlZ/1bllQvnPJPuIMMgyNycTlI4Lh5Jw/o9qCU4CyTvdQRODcUWnC6XiUw6QsyoLVZMgWRo6sEsCpwx/5XjEd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=XkR/l52L; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="XkR/l52L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771079211; x=1771684011; i=marvin24@gmx.de;
	bh=DDwaxiMeZzwaOXZPCPKh53VFZtBJVOMxe4p4Gz+02PY=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XkR/l52LLECPJlod2frsS2+Mb0oLngYSCUAPKhboSDY8qRFHo8FQSztXCRe6Q3H8
	 tOu5VulbZIF2HeutPZpXh6cptwn7Ex5bLgdXtrzTa1M7ktqr5rNY7EvjcFsgq+7BI
	 UaqmeNrUlaM+wSw89U41LZbFs64Jt3H2fv5eXcgXuvv+PGwBvY+GphiSK50tuhvXC
	 ZhYbfgGuXMWhNGWoZY2mcMmzrJem6/w47VPD1PeN5yYhh4OycWFxUsd/5QtT2vAD1
	 CjyTXhObaqp/ZbqDJE85ZnOpyEFrTcYvl7yvCwA7QvlC2H+u948nWf7jjXQzSWxtz
	 vKbeNfNJeswOUDYO0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from N8016W05 ([46.81.31.227]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1w1TLC28TF-006MKZ; Sat, 14
 Feb 2026 15:26:51 +0100
Date: Sat, 14 Feb 2026 15:26:47 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Jonathan Hunter <jonathanh@nvidia.com>, 
    linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
In-Reply-To: <aY1GZQJLKAF0fsz6@google.com>
Message-ID: <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
References: <ZnzulZBukibZUXKM@google.com> <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com> <aY1GZQJLKAF0fsz6@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:EZfNcs3KzJpqYIW57mnKVk/1XI5d1Df1LkqHVQms8mrxyYfsFG0
 TJa3J5UcTtNTw79ca+3b0E58zEuxCU5f/rB1VMct9eXT7Lzka3Ixd0TB/3rn55ly2RStDcs
 sFVtkoCSuDTqtOed6BsMeBrtXgErcnU+q0GfEc2s+T0RNpbMJ5UnPz2hxgzD0BT2jfyYb+3
 4c2D4M9mtDwhi3YHRRUYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rJFZlL3F0Yk=;Q27uSlGYkitXx9Y22onOtEdDr/f
 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
 TzuG9UOY3fy5RyCgomPd/mqmSkAL+
Content-Transfer-Encoding: quoted-printable

Hi Dimitry,

On Wed, 11 Feb 2026, Dmitry Torokhov wrote:

> Hi Thierry,
>
> On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>>
>> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
>>> Complete conversion of the WiFi rfkill device to use device
>>> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead o=
f
>>> a lookup table.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi =
rfkill
>>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880
>
> Do you know by any chance why paz00 does not simply configure rfkill
> switch via device tree? The driver (rfkill-gpio) seem to support device
> tree...

last time I tried this was rejected because the wifi chip is on the usb=20
bus and "rfkill" should be a sub-function of this chip [1], but that was=
=20
some time ago...

Looking hard the schematics, the wifi chip does not have a gpio input as=
=20
first thought. Rather it seems that the first gpio toggles a regulator=20
which supplies the wifi module (m2 card) with power and the second gpio is=
=20
just connected to the wifi LED.

Not sure how to transfer this into dt, but I guess this would be the=20
better solution.

Marc

  [1]=20
https://linux-tegra.vger.kernel.narkive.com/hRFke8jh/patch-1-3-net-rfkill-=
gpio-add-device-tree-support
