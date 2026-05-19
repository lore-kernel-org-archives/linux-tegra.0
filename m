Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837F37D118
	for <linux-tegra@vger.kernel.org>; Tue, 19 May 2026 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171312; cv=pass; b=a2O27VVWaj2jrBNnk3Y6F4Um3QpWbY0CieIgRHRk1SnfIviw/0gJU2SVqAVYGLzBdkx8iksVWiuFFKMKWRnNcN1n344EMBOHzxmQQqWkKH8mCkWTuGAQNV//Gmrz/uMHSq3v+i/66MZbtJJPrY+aWod4329l22WMMTDkm64QD/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171312; c=relaxed/simple;
	bh=QPv9NrKqks25XdbSHhPFI546BElb5U2rT+BiAzKQ+7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fe/MGyBKYa4ZZSAmji2c6Ia2TN1LP+Tx83iOJK5JE0o4S+FcYZ9Z/4q2RWBQfj320rg+v+EJsX65LMoANM9WlnOhhR6cjPhc68EXGOeLaqFg44OiAIaG5eeukMSpR7mjbU4vHJdzLf2jvOlnQvt/DbIz1jl6ZNI84wEXvi2yZPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0xIF9nJ; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0xIF9nJ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1329fc4bf77so8847834c88.1
        for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 23:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779171309; cv=none;
        d=google.com; s=arc-20240605;
        b=ALhUxyRsfmOaWAqEaPer5KjgIkb2GbQsVtqDzmxVH9kBKrMtdRP5V6njkU432hHiUv
         S5Nw6xo8EUoNXPdubVYn5y9p1Mm6Zvz/d3PDUH4nF7dakDCqzTM3nQwcAK4FOzH0zZzA
         u5wVC5ZA8Qm1+SKXgP09bhcTGXpQ9BIILFxASTK0wQpWXFHoPp9HOmpCByU/seKYPbl+
         PcPfeM1ViN7QsQGLGqwDEXaySlvJu2M6osrI/9ajC471myv5DgQtMR7dZy9BCnovNyKr
         sclejfTbg/wPfR+TKfiP5xjPMPXKiPHkMAXrdkrlE1y52hRzcX+fBVlYM5DRhRvAc63h
         9n9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e3rxUJ/0l+GpFnRLs/exHMJwdlcSweb1iM7tuoW5l3A=;
        fh=7KqVzQWBi7nm2xsRO+cgCj5mQVuxO1yZ+E46qwS35vg=;
        b=ZMuFairHm7yqZalNzYYcYyGpXVD2dt3wecDDDjyK9SUvPTFAVIg/MwUGzvAnW7fVrT
         hjjr/R6z7URdZ6FKRRCLFXLbbYjV59juEEkaxrJlBWVznHct7b8yx+b1dmJibyJ3n7DS
         VwDNYsME0hEFIlLi8UkkAfG84CS+UbCDu5Lcb4i+NK38TBnQa4vsBMy0f3a1/GMr6RQe
         kGI18V1sp0tu9eVJZTVsY+fCFvaSJ6LgCjnJkSRH0Wdzusjxq+WxTY4MPa3OuXoY9R0k
         Lb1AcZawVpCnzwG2XfRZwgUjHRO4Alj+8cXTQnQs4S72mKaThmtmijBnT1X0uppdgpHz
         CBpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171309; x=1779776109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3rxUJ/0l+GpFnRLs/exHMJwdlcSweb1iM7tuoW5l3A=;
        b=K0xIF9nJkPkPRVvHiSwlUbkwOna/D1U7CNVoC2deCiQWXFHenpjXwiBqd7Bie5r6fe
         f0s1+5TexX8TcakVB9gHtxoPgrwxm4OhTInS+wgU+mftW3dCw/H37e9b038U+6FwD01K
         dSVH+FVkOdKXctiGcv3+amRo9xlhA+zwudrZHN4ZjF2BFzHCg+Es2NwVu9AHsSxWwawH
         IO0GT42qOuSSHbSNs7Md4qBoSck17yZoG7gVmwcst4LlV7TXLiUnHAK9XXDMFClAzTCx
         1Oh+2vneMPrJqRQwxynJvAXSK1oxcHjHt6rIdtCch1ca5pWXivYNbPO4fmIlsvFgsnsW
         ig2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171309; x=1779776109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3rxUJ/0l+GpFnRLs/exHMJwdlcSweb1iM7tuoW5l3A=;
        b=IvTfHRgI5NsJnWnBNUCw05dGFmNUR45wCcyVN4uhofBTMn3esOg/B5krKXrPNuXyDK
         I3WK5tNIFwy/9XSlc9EfC0oFM/fAW155fJQM/TSAF3mOzXFizY5XL4b/diT7cqhm+3eJ
         XRDktZxtpS/oqrmlHITsPrJD2kSvwVHp/AMEoRdGxJt2s6LdTg46dOaO5lzGiYRyo6vP
         E1RccFMrGNzVK1S84s8I6Ww/8jk6pT0uGfI04jl6/MIMOdYgQP1WUb1r/c6+qFczy4w8
         bbLQZFRCb1pscfsDXhOzz4QLdEceIZkVPzObH2vm/SHq7c3G6pH8/vFVZJHHdUpVao/6
         tlIA==
X-Forwarded-Encrypted: i=1; AFNElJ9yaq0BCYKkzmMkXQbMQzmCFobGncQIhMGqpFziyL6yn5EY6veycP8jkw98tDh2OKgN2echLdoe1a4d2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Mwl4WIx9LIqbmPFQpLW1X0Grih4OcSe0YGgT6Hf2wL2Mbqv3
	5xoyiQyP1ynzoWxXOiGZ3RmBU5plr+AaF43P0CtXoJv6cAFaUnRB81d108narb4BRXPDr5Gj4/5
	vFasgA3AIv2EBZyOYdaebo17irCJ/9fY=
X-Gm-Gg: Acq92OFpLdNwm9S8wPcAZPGh7tUqT5uNJYYfN+VzOjpxual185Lm2dt/dNVn7snTin/
	S/iOlLZ/gZ4Q9NR51lHDxd6O7aeKnQVfvyZsGPOBxVKI2OsQbI/X/DC4WPVw9k3hioIP+V+RwfB
	YBXl0L1Mn9Z8v8WxfABn1MGKH2uP7aoNgUgT3tOw303K91f9yWrEXhOkj+PNCSVjPI4LYOkC0xL
	ljWmL3ycqXSYk6LyzDK8QK0n5Gw6Bl/zaemb8M3Z6xSZQ+59yR/yL58LrS08CpayfKYO2wvivRF
	GWkNaruR
X-Received: by 2002:a05:7300:a984:b0:2c5:b23e:48a9 with SMTP id
 5a478bee46e88-303986a160emr7175515eec.25.1779171308865; Mon, 18 May 2026
 23:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-6-clamor95@gmail.com>
 <20260515-utopian-malamute-of-patience-367e8e@quoll> <CAPVz0n2wrAdU0JKx7eb7uosCcoGayqNchK591VPph-5_nBAMXg@mail.gmail.com>
 <20260518-mustard-rabbit-of-ecstasy-eed3b6@quoll>
In-Reply-To: <20260518-mustard-rabbit-of-ecstasy-eed3b6@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 19 May 2026 09:14:56 +0300
X-Gm-Features: AVHnY4IxlqAJY6NaFP2GVNqF_snPzx1hM2RZ9fLkqEGHKp_bJ_sC8-qzf4i8pFA
Message-ID: <CAPVz0n3C+g9zLaq9gN1OFnC=19oRwoZon_E0q0oFKbn-dG-FaA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra
 XMM6260 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 18 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
4 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, May 15, 2026 at 11:37:34AM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
11:20 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, May 11, 2026 at 04:57:00PM +0300, Svyatoslav Ryhel wrote:
> > > > Document the XMM6260 PHY used by various devices based on the Nvidi=
a Tegra
> > > > SoC, describing its usage
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++=
++++
> > > >  1 file changed, 58 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,te=
gra-xmm6260.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm=
6260.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > > > new file mode 100644
> > > > index 000000000000..0346433c9772
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.ya=
ml
> > > > @@ -0,0 +1,58 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Nvidia Tegra PHY for XMM6260 modem
> > >
> > > XMM6260 is Infineon modem, so any combination with nvidia,tegra is ve=
ry
> > > confusing.
> > >
> >
> > May you please suggest how to adjust the name then? Thank you.
>
> Depending what is that. Start describing hardware, not driver behavior
> to help in that.
>
> >
> > > > +
> > > > +description:
> > > > +  A hardware configuration used in Tegra SoCs to provide proper in=
teraction
> > > > +  between the application processor and the modem, as well as cont=
rol over
> > > > +  one of the SoC's USB lines for the modem.
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra-xmm6260
> > >
> > > Also here.
> > >
> > > What sort of phy is this? So far looks more like a software construct=
.
> > >
> >
> > Infineon XMM6260 does not work as an ordinary USB modem, it is a
> > standalone CPU which just exposes itself to AP via USB. In order to do
> > so, it has to have control over a USB bus of AP which is dedicated to
> > it. In case of Tegra - XMM6260 interaction it looks like this: second
> > Tegra USB controller is set into HSIC mode and is dedicated solely to
> > the modem, modem controls this USB bus. Then the main XMM6260 driver
> > performs power and init sequence and once it is ready it calls phy to
> > register controller. Phy has its own supply, controls USB controller
> > de/register and using enable GPIO sends signal to modem to proceed.
> > Additionally, since some XMM626 versions have a few steps to setup
> > exposing different USB devices, phy handles controller reinit for each
> > step. If treat XMM6260 as an simple USB modem it will never init.
> >
> > One more benefit of having PHY is that modem driver itself is generic
> > and PHY handles SoC specific configurations required by the modem.
> > Since this modem was used on a variety of different SoC's (Exynos and
> > OMAP for example) they can reuse modem's driver and provide only PHY
> > which handles modem interactions with the USB bus.
>
> Without any registers here, this is not a PHY but a power sequencing,
> just like we do for other USB or PCI devices.
>
> Optionally, it could be part of existing USB phy, when configuring it in
> HSIC mode, but it seems you add here supplies for the modem, not actual
> phy as the phy is undefined.
>
> The problem is that in the patch and explanation you mix driver model
> and driver behavior, so I really don't know what is this hardware. And
> it is not my job to guess, btw. A partial argument/proof why this is not
> a PHY, is that you reference the USB in the node, so phy-provider
> references the phy-consumer. That's reverse. If this is PHY, it's USB's
> HSIC phy, thus this needs to be referenced by USB.
>
> If this is power sequencing, then it can be represented as USB device,
> just like we do for all USB devices, but then it is not PHY and
> phy-cells are not appropriate.

I was looking into power sequencing and using it instead of phy is
perfectly fine for me. How I see XMM modem configuration:
- main device which handles most of generic power sequences,
init/deinit and detection for USB device (both, target USB device and
intermediate stages for fw loading)
- phy or power seq, does not matter, both fit, that performs
manipulations with SoC specific USB controller in order to ensure
correct modem boot

If I use power seq then modem will require link to power seq and power
seq will work with USB line, this should not create confusion of phy
acquiring USB that is phy consumer. Will this approach be acceptable?

>
>
> Best regards,
> Krzysztof
>
