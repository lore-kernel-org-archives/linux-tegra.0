Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A423AE713
	for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577258; cv=pass; b=hE92WCuixp3SF4QJozRzMNLhTpchOqwnxdTkhaGL925ZuQt46WUKRmCrIWtVuC1GljnK9/Ki8dudE+glgr4cAaXaqrTSSuyENfjIause5a1FbQFvlaFEKAsOzKJ+T+fo5eRDnKy3gqs/krq2ufb7/JHAXZsWLGZuDPQKPY25Zag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577258; c=relaxed/simple;
	bh=U5Mj/jS6IBak6dPGMQzKnxIz7rYyqJxSv4wWkZocyPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeoZ2DNCaDFkk28rc/XiraLTK/jX9uB1C+TgSrWHuymSTb4qbT8hBHL5eIb7GrC5dxHm/0k1fR9BjVvVw9ks/oJobK28SRaK2ygghuArOknGj3NJ/APhEd7/tvo3JGHPONS2bxOlmKxkzX5oPFY5TOr6r1O7NRE0vIWoyaX9ByI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSPEDZuu; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSPEDZuu"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so8049984eec.1
        for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 02:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577255; cv=none;
        d=google.com; s=arc-20240605;
        b=U36DMU15eiJsjLUz6k1or1YxtoGQLDvstwvVNwTvzi4ZmGdjPJwVtwa128ByuCe9P/
         jM+0GPw4korqurRSzojot7LEeOZH+th5EZdPfyQ4q0LMrcOKsjt245/Nwu+1HXzNuS/j
         ysQTdBRDmcsYAWuxYJ6i0ipUcjUJFOpRMvOTqMncmJiTydOQRdimAxK4lu3Q1MeHEBq3
         4IkSiSW0PuLgYD8ZXKnP7XKDrjRqGBm9OgS4P1WZoOkgAENLyBh15i19oLO5x00PDK9b
         mPHswXoSQ++CUlPTflhMDnwrJX9bquhTozPxEORrX+7lHfH80h8InUOF+C/SY3tT4Utk
         TgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        fh=Bd3j1/khKajDZj2togUh654V2ULWmyblLZGiMbCoJ3s=;
        b=EYUHDIsQf3yt9o7YApm8QofZcgEzt0lx4Q1YQ5UwTb/5OlxTURtEIXyBkE17Ouve4C
         p7kMa/Iktemk3omQw5IjdoSZnhIYSrABZJWXd6VI6MSnx+1IIoV17Zs0nWlVPpYg6pId
         NVFdIlw14m/IrcOeG3At+0qIFj9N0wcIW31ezxX5c/2E2xZVyP4scK4nMmf8qNIHPeSL
         cE4imozJzF+ojf7H5poUokq/HQl4AOSeeQl1CzYAAkt5l+TpKZm6k+5ADt8LwjrQnNVr
         VUWQFeCFSGeAsYbWCUqGnqpbYCLTP01//onHY29NxUgdlmwuTJ/HWCUCEn9v/heMYIgH
         Ie0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577255; x=1779182055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        b=GSPEDZuuZ31Z+22dTEDRByST0/vCvq68t1D91nerRwYoArdfxg7W5/Mme1qiOlepi6
         FRLzMnKPG/Tt1+YCHHImv/D0RmhNeMBfJA+SPH2lm2AQx8od/5IOkc1WOOQSXCgCHnrg
         1W4k710vYtjIOut8/9X6vWP3IUF/jy6semioFVQLKlJFCtnqht/jwnhEojw1Uc0KO5qh
         9Faqalbmk2+j/2LIIS2sYCblIukJuzBWESC+v/pAVADwfvDL8XmurbTCugzhCXJfSa39
         AawmXB2O1sSVRGAPCtVNnFmiJL49ZELzH+vIfuxXTjdtp+wWLOLutDHoXOdJqJ8PaQsc
         dz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577255; x=1779182055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        b=d/79GhZXVOkU1rXHB40UPQiEVH4zSARn3JAphHlcbVa98XAafb1QQ60zjujIiFOdKs
         1d2EidnUorsiEDAkpetfDYueuo1DkuXaKInWvErKFyBVO6zUEUVVCzpqeDHumVIEohxd
         WJVsYnvihUz6l1qhysA8YGI5i8Uird+WKOT4GJxmf/nwlt/yidjWMbsfIDKNMsUS0YKq
         Ygbbq85utFS0Z8Y9f2AQbuCV/wj0XldEcMmn2EwlTUfZVcnmHdXHsur42N+yyy3D1Kbw
         //7X9QYPxORAHuejhMPruqiAV1s/qoeMDhxmJWILIuF439FiBG2e9/Q5WazGyDuDIdTZ
         MJuw==
X-Forwarded-Encrypted: i=1; AFNElJ9sRKAGDW/RngolCvSpMbatX43duOLzD3ApXyFoRoiAvy+CdEikgjlveHYGvG04PF4cfRkwpdEKsFvzsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eyHB2egqg87TOydHjtUGCu1hwPoeM8jkyz3RhC5lZv6OxzhO
	Ha/5U7mW3g8QMXndtOm+YBT3DokF2JyaN/1bfipXy49XglvQxGd/LAr/rQ/BUjEhyORrvw4+TM6
	5a1/5Z+aO/EQGHE8liQXMp+9S5hPWgcI=
X-Gm-Gg: Acq92OHRG0LXkBrX1ye3JvX4OGvIL4UL1+JGM5AulFQtpjxd7mYHvmHu7Dvn/Z/CJ1l
	1tPhGGP0G8QcfuWqJx5JVN6fOyQsTqrMb1SeUfQ+rO8TWXVdt9QtfuSLwUjyEzuOXSki9YutfRA
	e0np/aDHohoGcbx0ZisR77CMIonHFTROaDl3BgjXsvPlZh4A1McGgIc0vC7S+FiPIvciJ3UuGka
	wU0/IW+o1gkwuuWjbg31flMExNp2wNuPjn3MEFZy+YWB3Qz6I5ffBNxDG41ZmYp3AeKPVH8BwLG
	JFC4y1j6
X-Received: by 2002:a05:7300:6da2:b0:2c5:50fe:c795 with SMTP id
 5a478bee46e88-2fb4bffa2c9mr6829180eec.29.1778577254951; Tue, 12 May 2026
 02:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-3-clamor95@gmail.com>
 <agJ/T8nBGWEoblmd@nchen-desktop> <CAPVz0n173syW9rXy7Qt_N=mChe6WBRLvjRDypcJEC50hPL4OMQ@mail.gmail.com>
 <agLb6mgP45jHjvNt@nchen-desktop>
In-Reply-To: <agLb6mgP45jHjvNt@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 12:14:03 +0300
X-Gm-Features: AVHnY4Ll14i93n_o4smARXMAmGSl_VWfrjFQ8sVQ8lXsJQoJqBmOJp3dhjRuJ_8
Message-ID: <CAPVz0n1Cgbik1_HvKO9i7ATr4OkS6yE_bwMw__yY_pNi0gQJNw@mail.gmail.com>
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

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
1 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-12 09:13:40, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
04:16 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> > > > If the USB controller and PHY are externally controlled, then the
> > > > registration of the controller and the PHY initialization should be
> > > > skipped, since these configurations must be done by the device that
> > > > controls the bus to work correctly.
> > > >
> > >
> > > I find you only control USB controller device add at PHY driver, most=
 of USB drivers
> > > has PHY control, for chipidea, it has PHY control at core.c, would pl=
ease try to
> > > adapt for it?
> > >
> >
> > Usually yes, but this is not the case for Tegra unfortunately. As you
> > can see Tegra specific section of Chipidea driver specifically
> > describes why it has to set PHY manually.
> >
> > /*
> >  * USB controller registers shouldn't be touched before PHY is
> >  * initialized, otherwise CPU will hang because clocks are gated.
> >  * PHY driver controls gating of internal USB clocks on Tegra.
> >  */
> >
> > So in order to provide correct work of USB when set by an external
> > device, both PHY and controller init/add must be skipped.
>
> You could call generic PHY APIs at ci_hdrc_tegra.c, after PHY init or pow=
er on,
> call controller initialization.
>

And what it will give? Modem used in Tegra devices exposes its output
as USB device on an HSIC line. At the same time modem requires a
precise control when USB should be registered, to be able to register
and unregister it. This cannot be done by linking modem's phy to usb
controller, quite the opposite, controller must be linked to modem's
phy.

> >
> > > Peter
> > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-------=
----
> > > >  1 file changed, 22 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chi=
pidea/ci_hdrc_tegra.c
> > > > index 372788f0f970..593390a818d1 100644
> > > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > @@ -32,6 +32,7 @@ struct tegra_usb {
> > > >       struct clk *clk;
> > > >
> > > >       bool needs_double_reset;
> > > > +     bool externally_controlled;
> > > >  };
> > > >
> > > >  struct tegra_usb_soc_info {
> > > > @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_de=
vice *pdev)
> > > >       if (device_property_present(&pdev->dev, "nvidia,needs-double-=
reset"))
> > > >               usb->needs_double_reset =3D true;
> > > >
> > > > +     if (device_property_present(&pdev->dev, "nvidia,external-cont=
rol"))
> > > > +             usb->externally_controlled =3D true;
> > > > +
> > > >       err =3D tegra_usb_reset_controller(&pdev->dev);
> > > >       if (err) {
> > > >               dev_err_probe(&pdev->dev, err, "failed to reset contr=
oller");
> > > >               goto fail_power_off;
> > > >       }
> > > >
> > > > -     /*
> > > > -      * USB controller registers shouldn't be touched before PHY i=
s
> > > > -      * initialized, otherwise CPU will hang because clocks are ga=
ted.
> > > > -      * PHY driver controls gating of internal USB clocks on Tegra=
.
> > > > -      */
> > > > -     err =3D usb_phy_init(usb->phy);
> > > > -     if (err)
> > > > -             goto fail_power_off;
> > > > +     if (!usb->externally_controlled) {
> > > > +             /*
> > > > +              * USB controller registers shouldn't be touched befo=
re PHY is
> > > > +              * initialized, otherwise CPU will hang because clock=
s are gated.
> > > > +              * PHY driver controls gating of internal USB clocks =
on Tegra.
> > > > +              */
> > > > +             err =3D usb_phy_init(usb->phy);
> > > > +             if (err)
> > > > +                     goto fail_power_off;
> > > > +     }
> > > >
> > > >       /* setup and register ChipIdea HDRC device */
> > > >       usb->soc =3D soc;
> > > > @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_de=
vice *pdev)
> > > >       if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTE=
RFACE_MODE_ULPI)
> > > >               usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> > > >
> > > > -     usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > > > -                                   pdev->num_resources, &usb->data=
);
> > > > -     if (IS_ERR(usb->dev)) {
> > > > -             err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> > > > -                                 "failed to add HDRC device");
> > > > -             goto phy_shutdown;
> > > > +     if (!usb->externally_controlled) {
> > > > +             usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->res=
ource,
> > > > +                                           pdev->num_resources, &u=
sb->data);
> > > > +             if (IS_ERR(usb->dev)) {
> > > > +                     err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb=
->dev),
> > > > +                                         "failed to add HDRC devic=
e");
> > > > +                     goto phy_shutdown;
> > > > +             }
> > > >       }
> > > >
> > > >       return 0;
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > --
> > >
> > > Best regards,
> > > Peter
>
> --
>
> Best regards,
> Peter
