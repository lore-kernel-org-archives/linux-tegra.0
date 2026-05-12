Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22E44CAD0
	for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566451; cv=pass; b=rf70PDAXqahXhFQ02XmQgHwHe7BeUhxxoDJWeXW0Wayrbr3jbRYCk7fyLaYdIqJV0kQXBdEW5aA9JS06yOUD+TACbEB+UC4T8wnupgjxwkctG882amgT7Ke5ko7a5GwX4dIwW567N25ru2NyVB0YLz+qWQ81sewxjmzwNZQA1LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566451; c=relaxed/simple;
	bh=3ld4zdEky9JiorADEB2JzKLMGmxL8CZq09SENbVMLTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV+ff5j1E6E6XxrCJ6fmzfhFIP+nNEH56bybA3wV8Lee/DJUHa9C1fHj7qZ45aYUXszj8uj+f8ISH0eAd/gJc/K1857nwUqDtDvfDhuge97jWYuwhhZAlLlqm6z1PwaYW/TBEhDQST3TIblRbNjFM7qpuBdFMkXHgSs4ZPwRQp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6JVSg17; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6JVSg17"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0ad52830cso7500711eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 23:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778566432; cv=none;
        d=google.com; s=arc-20240605;
        b=RUxP8sPu1EVLEFw/A5xMiFuWXBKP9revA05Dm9iTdDJzGQDZ0L23/RL1uaG0HMwy+D
         NcsEznwTDAWB3Ikmv9oHhWOwAxN+ENN2CfDqmeMd7i9VVflvZ3NQYt5FDfft0tWClQ0l
         OCTF8DTdLtbdOKxEN5ofE6SGZ1TytauBzXzM6kcFh4ViCf8bdmMeXWc9R3HbHZaDRMdI
         U1YxtU/tpRPou6pbQeknsqb51uNm0d7mgOQ36cR1wXCm9y3I6QW5zCsfTV0KtqvNkTig
         Rlv+jZZ3JuYIZegb6WVn0VlGCl7jTiMTbq0T3Djfhw66ze33syoGnEqN6gWnC5X8UhmK
         yb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        fh=RzmdklVRXZzPRVerR/3zO6dnQncgb500F8PpC2d6vpM=;
        b=CvFw53n6CDmAbgKRjCdkXnMVcEkjkJWbLx4QL3APBkqP8006Aj/pUNB4gOtSv6oX6M
         i2+LXZevkojZY1cH1BJX37yVYbDk126SMVNJ0lmSC/rQpg/FaacRuYCA99rpStPWER+A
         jgnsEK3e3+VlKszw/39+2Tk+9EngodlNle3SDPw+/Xz4Rf36pgKnwmCvHFRe8mJ5g3Vz
         z4AqAHzMNgfg42CXpH622CU3Z85a43hTlL6oM8it9trvFWmbs4E4A16TIaOovtr3RGUy
         5dv0jzC3rguRbgvNCwpwG4R8BSPIQ85SyvUE/EdUN7gR5I9lMM2Q+bZcBV1wnYMkRY5d
         L63Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778566432; x=1779171232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        b=P6JVSg17mfG3AE++SHupyqKkJLaPPzom6Hym1yhnh9DOVxBji9AnJ3hls5QLmWd2TG
         ULq6zRBIkTtCCKHl/RGgKcP3NwzPXDUGKuv3j9xOZ8IVvN7cTQQtKwh1xBmkhS8Ip/dI
         gwUXG/gIKMWiY/1fAKKkeyuc5gMhyUcg18cf0fLz4gsWYuyey29l/rgRHUkaqPujaeyM
         aTmavwGzzsnO71xErdMSJdx5/+ZnQ5bp+9d/1ZzFEsd8MYd3HdaAOrZhEBJa7d0v7i7+
         vNVEUMU3/83mySnyyEUsL1VgvgozYrJEg2+UG0n2xUEJj733OO0F0x7ngpNZ12iyOWIL
         JZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566432; x=1779171232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        b=LH82/J08MJ/l+5+Numqw0ky9S+V3ImAA9k/9dBGNQy9V3jQGztW0qK3GIzWV4Vc9Yk
         4Y0TG+3pdfTZT1Nqqe+Pk0Z7nn09Vn4oUi3/POEAh7TrPm7SPjgyCFKMLZ66YzuLhi6l
         /Y3skI2U7xyZqQij1C7fD39QCvhXfQYFpAqb68mdrVo3oZsbtAXR9s7JeDulwjHZX+O5
         BiuTpxIFl28mS2NoTzhtXjEhmTBnK94bGvIB4iz9gYDj27IYnALUf6bYiek+XSlWjFED
         TExpuccKrtfroieGYYtfRBD1PjVRUNo3x7H1/UmReCIPmEeWK8nZmJoaY9Gk+qf1ZBbO
         3SSw==
X-Forwarded-Encrypted: i=1; AFNElJ86FDw5epWjrOCrj57Utgua9Sc2VgqFbea0ZKWa53FVrPDkRg4VPhBm8qVrcnI1D8XjzSOA3wenxpLHTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDkWxGsXPZ8RT/7WNDyVhuJQ8NS6lQa+q8qFZbhAiDed9OtjCR
	d/Iiyt+HxOrn54fwSXhQvTb1JAxpNH+VU5hkmZpb6qK8qYUVmVLsR4P/tW4zsgZWKo3D15cLnuz
	Na05OpCf81h0IBD1Os3r53lj/qcEcxQs=
X-Gm-Gg: Acq92OHyREymM049bbe5D36SmI9taYAgo3gZ3xKWs7hNfWydWlJmFUtPvXBLAlA79pr
	XWtHpmSE6oFmPlMYEuaX3VzfPVP6T2rEuQjzTog7qYVlsPQkzUryrnCJ/mtIauFbVD2ee2q3S+J
	veeZZ7AC+4KAbQipcHwatudw3pNshQXMZxcYGCtOoH15AJfMitGYpZphJe+6rLwemICzJX9f3Xq
	JOpCTbB0QqqLJwdH0CLUarUbR4Fj2mYXGHhWv8ol6Nh+Jr2mX6fRQtOIWS5mqgM7mqAjwXjdk9K
	gflcfaUa
X-Received: by 2002:a05:7301:7213:b0:2e2:4979:ec7 with SMTP id
 5a478bee46e88-2fb4bff2949mr6162640eec.10.1778566431760; Mon, 11 May 2026
 23:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-3-clamor95@gmail.com>
 <agJ/T8nBGWEoblmd@nchen-desktop>
In-Reply-To: <agJ/T8nBGWEoblmd@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 09:13:40 +0300
X-Gm-Features: AVHnY4L1_bWZXCrp3MmGLMUWBEn-sMyg9m87GKXzm_vHqR-lTAFW3X_ZqIO7y3g
Message-ID: <CAPVz0n173syW9rXy7Qt_N=mChe6WBRLvjRDypcJEC50hPL4OMQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 04:1=
6 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> > If the USB controller and PHY are externally controlled, then the
> > registration of the controller and the PHY initialization should be
> > skipped, since these configurations must be done by the device that
> > controls the bus to work correctly.
> >
>
> I find you only control USB controller device add at PHY driver, most of =
USB drivers
> has PHY control, for chipidea, it has PHY control at core.c, would please=
 try to
> adapt for it?
>

Usually yes, but this is not the case for Tegra unfortunately. As you
can see Tegra specific section of Chipidea driver specifically
describes why it has to set PHY manually.

/*
 * USB controller registers shouldn't be touched before PHY is
 * initialized, otherwise CPU will hang because clocks are gated.
 * PHY driver controls gating of internal USB clocks on Tegra.
 */

So in order to provide correct work of USB when set by an external
device, both PHY and controller init/add must be skipped.

> Peter
>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipide=
a/ci_hdrc_tegra.c
> > index 372788f0f970..593390a818d1 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -32,6 +32,7 @@ struct tegra_usb {
> >       struct clk *clk;
> >
> >       bool needs_double_reset;
> > +     bool externally_controlled;
> >  };
> >
> >  struct tegra_usb_soc_info {
> > @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >       if (device_property_present(&pdev->dev, "nvidia,needs-double-rese=
t"))
> >               usb->needs_double_reset =3D true;
> >
> > +     if (device_property_present(&pdev->dev, "nvidia,external-control"=
))
> > +             usb->externally_controlled =3D true;
> > +
> >       err =3D tegra_usb_reset_controller(&pdev->dev);
> >       if (err) {
> >               dev_err_probe(&pdev->dev, err, "failed to reset controlle=
r");
> >               goto fail_power_off;
> >       }
> >
> > -     /*
> > -      * USB controller registers shouldn't be touched before PHY is
> > -      * initialized, otherwise CPU will hang because clocks are gated.
> > -      * PHY driver controls gating of internal USB clocks on Tegra.
> > -      */
> > -     err =3D usb_phy_init(usb->phy);
> > -     if (err)
> > -             goto fail_power_off;
> > +     if (!usb->externally_controlled) {
> > +             /*
> > +              * USB controller registers shouldn't be touched before P=
HY is
> > +              * initialized, otherwise CPU will hang because clocks ar=
e gated.
> > +              * PHY driver controls gating of internal USB clocks on T=
egra.
> > +              */
> > +             err =3D usb_phy_init(usb->phy);
> > +             if (err)
> > +                     goto fail_power_off;
> > +     }
> >
> >       /* setup and register ChipIdea HDRC device */
> >       usb->soc =3D soc;
> > @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >       if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFAC=
E_MODE_ULPI)
> >               usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> >
> > -     usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > -                                   pdev->num_resources, &usb->data);
> > -     if (IS_ERR(usb->dev)) {
> > -             err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> > -                                 "failed to add HDRC device");
> > -             goto phy_shutdown;
> > +     if (!usb->externally_controlled) {
> > +             usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resourc=
e,
> > +                                           pdev->num_resources, &usb->=
data);
> > +             if (IS_ERR(usb->dev)) {
> > +                     err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->de=
v),
> > +                                         "failed to add HDRC device");
> > +                     goto phy_shutdown;
> > +             }
> >       }
> >
> >       return 0;
> > --
> > 2.51.0
> >
>
> --
>
> Best regards,
> Peter
