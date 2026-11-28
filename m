Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885999;
	b=Mj5HZ+1zsBeaakxEypVVvUQxYeDxbzT7Rq1jp8YBwdG9GhkiaiYSjjKG7CiGDNw1XXgd
	 nNQdT5lUO00w9Kz5ZoB/CGWVV8x34lEs6wXWBJOrkaVruh63SEbYqmN2Qv+6aNQ8p5TtX
	 L8PuKQpGAuNXUwrSrgt24IFQrgK6GMKJ+ZI834ROdgnw00UDwxx36l6IAuKR9RHVUB4MS
	 2l3FOVgUK1wlu3IVbHyhDjXFsfKjbOZuIQzqnxMEddnYjCBZTPduEkYHL/7UGj+5oPh+n
	 NtjinavwuhmTCEYME4jHs0xhrpICiFVh8S46rlO0ffURZ6TZ1h8N1683UqOr+gExt8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885999;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=nyqQ2Y/k18evWZARIY0Q+QkN2dTBXvw9o30YUZVkXbU=;
	b=MsNzTcimPXdhSrWC6tuiQ8QsImniKbrTAv1XyAWcBInvVvCpOBEhj7EJagU6Bj7yliJv
	 76hHqzN5WVIqJSJr3B/MElXsgDMeGu4vAgU+bCbT/vL11LCF/vd28jxQFEHyad2F0YPgy
	 6O4b49g5BSCRH7/f6Ie1JFlY2ATxzd9jpBXTzmiKnjt4q9nBOM2/epysZKBfWt6TfS1B4
	 A7CQFdcpXB7XlyJwya8OKXkkh9lizMRbnVLxlCyqL/Vju58wgOv5sncej+L9L7Oc86JbF
	 ulLdZ/2eguYV4c/SdIm0C0+/Uj8UbLm4ZPoZTF9E0IyM1V49qpof8v+RcVLPmr/XeWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="dG3s/0f2";
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90A606A321
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 17:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E90A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dG3s/0f2
DKIM2-Signature:  i=1; m=1; t=1795885996;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:K0M38nIj+H2aLubXpXQcc9gu1rkM
   jnEzeonzJwZSKslIqTdaIZAljs3WP4jtbl6MYYAbDH0lgF4QIN+m1/sOQBddPWm5bQIF1eMVXld
   /o/efQmrSzf+g/zprVyvdohC1OmZZud/kQK8JneClZ/AZfevqUPOT8EDu4TEiYSp9IHnUnpsJ+w
   0J38SVQ23T31cqxXq18DHBVOva1YEZpDSGhdWzFUJX66DHjWucLlmxTDwgznJvTwbEl/ipUIZ0T
   g/sLUm6F6cAO0Yw9E/nlxEd6+KMK2UvJN6WUBzKBjvIBNVXETR/MNgyM6+ZZN2VnyBPEfdzCxjg
   rYaCHKWidz7gVA==;
Message-Instance:  m=1;
 h=sha256:
   7n6LCFWlvWowSn31u/xAmmLza30YrGkPNBKQGJKmeRc=:
   iGeAfQkMA4wKqAYmxQ100NyUILhLcVRGFK0jajLnPN8=,
  sha512:
   skfNWw3y31tSwD8NjBAjt5UxK6fS1HA1mqXaT1dfCbiIKCUcF/No4DGtmFym6PSroVCRdK7YYM0R0JfiW8KlHw==:
   zi1KuIdaEc9d1KlEiSBbvhf4h9aYHINcA6NdjD/spJcJ1ipXgYUIMTE9+BYdtmXOHMC8+Sl/an1E9b41+AQgMw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795885989; x=1796490789; i=marvin24@gmx.de;
	bh=nyqQ2Y/k18evWZARIY0Q+QkN2dTBXvw9o30YUZVkXbU=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dG3s/0f21MRuhaLfqMrNIDbeIdi2ATEWS+dJXGscfoe3xFrrZk7alnT5pDh1yX1f
	 Bi8QwU13Z/Wva7vsuwQGuHX0oZdErowsZFWGGa76A9HzXK01mcZWK0d8vMR/Tf6WW
	 VDEqd2VBtgPAP48IBOTvT1jJTBTmqGAXH+JPsWk2xalnGlZ1Yz7zfWrZmQGYIQIyi
	 s6KUYkGcn+wdcGK/AKerKfTiwbUuhFn6ptB+o9fdjwBkbB1KrIOnln0Uht/WvUBP2
	 8UxVnUzmLpYAuHOw9TgC2nGnr9ofjd+yBR7PBjj01tyGu+JDp1PY8anBbX/41V2jv
	 RvqUSPusF5QMea9B8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KYb-1yZ7e82RJ3-010UuS; Sat, 28
 Nov 2026 18:13:09 +0100
Date: Sat, 28 Nov 2026 18:13:08 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
    Thierry Reding <thierry.reding@kernel.org>, 
    Jonathan Hunter <jonathanh@nvidia.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Tegra20 I2C target
 controller
In-Reply-To: <20261123-normal-resourceful-cockatoo-acdd68@quoll>
Message-ID: <3995cf20-63e1-969a-02fd-2a9d573012fc@gmx.de>
References: <20261115204522.360063-1-marvin24@gmx.de> <20261115204522.360063-2-marvin24@gmx.de> <20261123-normal-resourceful-cockatoo-acdd68@quoll>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:JqfVUC3G/j/kSA0s1gRF3NdF82QCXxVgR9eNPfx83StiWJngjPZ
 GCM1Bgc2Kbj01tBiA72K01s84yVv2qoMxcYiUqjliWk/vwMDPRJuteOb9C8NVHbcSXhqy56
 6+eJuHhtVyVKhBiJT6iYXfvYMwjDUDyDjjnhxPxEpok+PGDfLJvdLsUoofbAOZJ7HSIo6/7
 v1WG/ViPBrHQSPPVmB1pw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NLfKRUtIebs=;rqoV38ErgR3HFzdW6iHOKJFna5X
 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
 mf0QRvWhBDZwuU/aIHurjeMxv6k8d79Fbh
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Mon, 23 Nov 2026, Krzysztof Kozlowski wrote:

> On Sun, Nov 15, 2026 at 09:45:21PM +0100, Marc Dietrich wrote:
>> +      - description: Tegra20 has 3 instances of a generic I2C controll=
er.
>> +          It supports controller and target mode of I2C communication.
>> +          The i2c-tegra driver only supports master mode of I2C commun=
ication.
>> +          Driver of I2C controller is only compatible with "nvidia,teg=
ra20-i2c".
>>          const: nvidia,tegra20-i2c
>> +      - description: The i2c-tegra-target driver supports the target m=
ode of
>> +          the generic Tegra20 I2C controller. Driver of the I2C target
>> +          controller is only compatible with "nvidia,tegra20-i2c-targe=
t".
>> +        const: nvidia,tegra20-i2c-target
>
> This looks like the same device as nvidia,tegra20-i2c. Plaese document
> hardware differences on the SoC. I see no DTS in the patchset, so not
> sure if you are duplicating hardware or adding new instances.

thanks for review. From the TRM it looks like the target controller=20
is a separate hardware block inside the "I2C Controller". It shares the=20
same ressources and also the bus lines with the I2C (master) controller,=
=20
but I'm usure if they can be operated at the same time. There are even con=
troller
instances which don't support target mode at all.

I chose to use a separate compatible (and driver) because the I2C=20
controller driver has already grown a lot in order to support the various=
=20
Tegra variants. By adding the target driver to it (possible also including=
=20
more SoC generations) would blow it up even more and possible make it=20
unmaintainable which is not my intention.

Hope this explains it a bit, but I could also try to integrate the target=
=20
driver into the controller driver if requested.

Best wishes,
Marc
