Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813454048B3
	for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107036; cv=pass; b=rijvgPhqLTnOCOCR+HslxFyXbh5zg7o7iO5AVCEAErPloYmi+OCZvLECyyryP4aBwEC4f5clhiHLMjjRfvAHy+1Pr1d5TOOWhlW5T4UfmSG2+t6oK7MRPmUpKS8hO4kxCImDMA/ioN2YA2MsXOr1XLsO70j2jOa156rncAlyAd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107036; c=relaxed/simple;
	bh=fSU/Nv50gQUXxxzoYFAghpmKq4w9ZnFqkSDSVnIbHqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+Fz+GlUxPuYTUTUctNMGa3nETvGjDmrvSbOCZAD1JgSkyWb/6eofY0OElyfdOQSYmTIiKCpEQ97sO6QZCuepRXsTXPOIrc3KntxHWwRfMAk2ufXA5HbL7WK3tdKy38nuUPlt9Jl/ANJl/DTGnKyacHJtZ771h2csYb4vzVHvWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3jeF28S; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3jeF28S"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso1039081eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 05:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779107034; cv=none;
        d=google.com; s=arc-20240605;
        b=gnxcDGML6FZfH/2jsd7Z9ofwichPqbyDQvdPovLjeT0r9YB6ePCh+ju5YQebT/wEY4
         9aUk3sQeuJCwXYECI8xLI9sicwEw28lcB0ofGKziv1MhXXe+nYJ9aKnSWy46B8GspUWe
         Xcu91yEtfPnWmH0YzSnq396ZhLE1KPBpRyTnJALVqUC1aluicuCl6sZs3otru6o8oYKu
         a6idzJZJRg/tx0EGt8937PPfwN5IXtLaFCw28kwcew2PMVLuUZugKT/b9sZINvBqFpo4
         fLashBpV2o1uKmEi00jmKV7Fos4pnDMlrWCnpIF0fltmo0PjJdUwMFHIhkJvYiEerwDH
         xQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sybBoxzQkI8aLI6NqXXkb4wIzeCWahvMKbXOpYmLoU=;
        fh=vcJsFiFoKc+5nZ/wDJfezSXGwLocZYwr4mVdA/eD4fg=;
        b=jwj6k5qffuN/m3t+KNMrSlJQapL3hJo7xB51imv8S4jgsbHRSNH1t09x0Rc3mLDkGc
         nTc5RsOojRHAVlRZE19jpXTnVWXFBRRqXTX2MYFAMSNnwuPd6kM98QWqAwc5VAQtbIap
         C8ccEcX11DgaWRjCv7Sb+2wDIn2igWHNOC0qtw2ngPP0KFRauhZVEvroCUgAKQLkkHbV
         i+Nh+w62u853bxQJ2BoLyMXKsb1GnNzHH9Ujqn2dozQUle5mgzc/XkvK0HdGJbwpNLyM
         UjgqkHBCOLQAij94jh03LKDk5ttP083kZhy9HCikzrC/mZ2ZAPmMtbUtPT+xVuUy+uOo
         shsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779107034; x=1779711834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sybBoxzQkI8aLI6NqXXkb4wIzeCWahvMKbXOpYmLoU=;
        b=m3jeF28SK1CuzUt6M+4OnYzbZvIx8KWEaXA2AEFiJxgjbZFS3PMv92wVmPBPeomoZs
         6CMZshDWsF5YHjqWxvbWvfyrfoKXLZJQKbPKvuB3i1xspRGhidOwFGRigBptY0UOAG+a
         ruQAgwaL9CDLIkj5JsXs0yvxxT6cM/YOYuIpKhOVUb+FKLCYoyaxNMf1+Ps+1Tf+uPXz
         7+hgjYw8XMuNidGEPADXGEwqpMP3R81SrYVEHu1XrLNfqlsvPZf4iVGp35M69uKerlbe
         HI6ZIvF4xza+W7nGjepPYeYYKZa79VxIqb7rAEoUkm4ZyQPVVVdX2IDsc7TpNNraI8gZ
         5SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107034; x=1779711834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sybBoxzQkI8aLI6NqXXkb4wIzeCWahvMKbXOpYmLoU=;
        b=AmOjh/yZfGayuUjw+HEtPkGW0VY+xk5EKd2OvooQkYEI41N7FccPHyokshB0AMRIwt
         on8oiZJzVbXkipSXiXPtcoaydpNSNNjDdiSjmtUdqizw0HFsNmbe4YW1JVmy/daFU4kb
         vyU9rI1f0yMz+nb0htxM4/7d2d4TPG8qLS9WBpA9uBUPmYGGJ//xxPWPbsV44Ruy2Ul3
         dAmoAuAHgrLiQFYP8tNydYfMiUViiWBMloQW0NaB/Cad8ee8NxVVsEbJ9Pwnu0gUQwOZ
         4v3cle0rptzQUgCxnhR9I7v6CKwaK39KM4jIKsBFFbdLgvj3Cnq3cTztNIwc8+tf5dS5
         RwbA==
X-Forwarded-Encrypted: i=1; AFNElJ83REaYGZKv34m3EoYN9aNVeEPsMd1r7EaHI0YzDY++7eO/L5PexoZRAoS8n+kwoLwP1ylGWgYUs1AsvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDuLQBDmCQuaML6JKWkl1PR2IySQcDBOHioMQPVWk5JY+qudWW
	PcZ4qJxKc/z8JIDtjPwMpqw80YZDF1wYtga/aXdybuhPF/oZAHfGMcZl1aSsOGy+hb3usIWJFd5
	IIa4FUys48g3TrdVDpEXiu8ynmNwTc6Y=
X-Gm-Gg: Acq92OGoF10Xj8H2USGzAaeOMQSTLtySNFxGtM1K75wTTjG4hHxOYLfH1S8DzQaXRrJ
	Ixkr9PxaxGSmDnORxrA7fWF6Dd6Wd4cVREWtEw3EcTBN73ctCVgWp16+y7n58oXGcLJf0xzuGbp
	k+EWLKVt83mMG3xiC50yajgwg9tiB3/Q+FzJX7vc2v5LZd7psAKAApVK5gQhqDqZp+yLY/zWgXi
	TXbecs2A/Xz1w4xS1vzabmnNS2gt35wVl/uma8Dcv385TmfhIChzIDCYi8ghaXGiLPYVhkMl1Es
	LcsvpRICw/IghexFQiU=
X-Received: by 2002:a05:7300:a897:b0:2ed:a58c:942 with SMTP id
 5a478bee46e88-303978ad90cmr5911766eec.8.1779107033494; Mon, 18 May 2026
 05:23:53 -0700 (PDT)
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
Date: Mon, 18 May 2026 15:23:42 +0300
X-Gm-Features: AVHnY4LNwA3nH_QM5Y-7LcPOdghwjQLoGIom9Y5M5xnInrZ8XmypJBIC54V587Y
Message-ID: <CAPVz0n1Q_5WYAE0GKzFA1SpW55GS3dCLgxcMzw-nOEMaYobn6w@mail.gmail.com>
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
>

If I integrate USB controller reference into the modem, modem will not
be generic since Exynos and OMAP don't use Chipidea USB controller
(both those SoC use this modem). Modem has to control USB controllers
init and deinit in order to operate properly. I have tried to resolve
this with PHY but if you find this inappropriate, maybe you can
suggest better suited way?

>
> Best regards,
> Krzysztof
>
