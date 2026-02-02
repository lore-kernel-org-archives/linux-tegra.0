Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758F353EE1
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770020663; cv=pass; b=D7AqNAdwWgMQKxRtSoAqFJYCjjHQxQHT4lnPljLzq8lFu9FY0twztp9rUonUrLM78tlrmXEhQnmQtt0Q3d4bS4TvXC6Ea9/iCIgDEs/WwLPySpYQCrbLCAWTdjdxLWJr48tKKk4TqwrL8nMKxmcxRozyoNDf/cqkquI13Hg1zQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770020663; c=relaxed/simple;
	bh=nCJwHZwYsH/XXrMX2LVTrLBUrBij6ZKO67jRl7VsH2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4/RENP06a1MRkKeCZ99gOJd2sWZmOcDaMiXumFJ1JXBiBXyytztgCQwRjBi4BfGrsdIImk2pxMhHH93jHg+929SYYIkWXASU0cKiyJJXvBBRcYqizd8B1D/+MSNcrcHHMWs/7t1ha/zjmJMAg1yC4QCT7+r/GaOSHZBRgIL/po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYYUv821; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYYUv821"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc305882so2557148f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 00:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770020655; cv=none;
        d=google.com; s=arc-20240605;
        b=WdxJPFHvTiZU2Nkug6ktX9xoeTs8+i7RBQpnh0Jd9hIPc0j+XxzTTUjMU+jZ2NhC4n
         wQH352T9uflDU/NTtKHC9NNtLxJi2VpcNzOGWou1ODacS/uP2w25dvom4woneiQcJ6Iz
         JdNer0REd9J6+34zqiqJn4XjvhK9Ew9dR89megOHpa4wuZacaCD9yFVal77nfcWrcIdi
         oqmTdeOAsRCKeNNTGprQ7DM4iBRHPcazc/OVRu1UoX7mRlKWkjaQSyTzwC9tK1bzDLOE
         PMf/MUdAsHOyQ4Qbzz7zlJqfdVLCjEcfAe7Q0OVKavn/vY4+K/Qnd8i8TbcqqNQdGfyp
         vUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1RyF9+sNePlBjrihwCTgTMvXw1Ck7aGk6ank57Xtvs=;
        fh=H6erFguEDZCinVKua+A80dO2bHqdFsIvUr4GdRQPfwM=;
        b=P99MA1frynL8DUC3wLi+nR7PdI85i4iH/p3JjyrzbuzmV5CE2yuaxUB25RmW98xwKp
         4kd22f0H2xViYWYoA9GAjJPWQzb3e4k2P1aAs27PXH/YFO1YmZN84ZZpDnRMYQs33fFx
         wMFCpTwFOtVCuiM+1JA0aAj1HBB5JJWtg6WBvMRTSICH4FqpJtiagJ0XmxYSpoY3wBno
         NeHYQWtur0DxISRHAykg3rE6xS/3f4It6nfyirgNXpqd9sXXNeh0BeDujbiBqcpZWSKb
         2dzTiXNhQG6UEMyXSSCPrGRoaDRiSjuJBryWamFjPU+kuJiApWdrM11fGSy2R80fbdqW
         25sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770020655; x=1770625455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1RyF9+sNePlBjrihwCTgTMvXw1Ck7aGk6ank57Xtvs=;
        b=RYYUv821n6+bDWkf+tFYLcg4JuUzbtYuY6I3027F7JsQCiQh45ma7+amPyEXnovmhn
         cr4lwkkpi6WwvwKcxbAbEpNBqNomIhYTSPJwPBE4n9bZOQXzlmo1hPjn9DvESeXKclZ/
         wiNJTlsF6FP+qjGcyRzgRD0E/CebdLpC1PAluYv1zwfgH5/rQmaVtFZdFhotWYFXlvNC
         LUTJoREUOGk6dYhf3yqDnwgVHi71iBaMH6X0RpUS6g0+NReX2yj83CwqriMSW5COZC5a
         JeZsOeF0iEeKEWq+eUBWeWFZIj+QW5ApTSTKWAIG/5COEQLhqUkEOzs6H/119ONZJ+xZ
         B7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770020655; x=1770625455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P1RyF9+sNePlBjrihwCTgTMvXw1Ck7aGk6ank57Xtvs=;
        b=ZbxL1wYnOZZqzj2WLfrJfdlK+Zh2tybFAYhUPxEM0u9T0U8lCDnAZT83efc1v8DvJZ
         8HhsstviY6egv2JkFvTsIeaDRRk8e0efhJc4Xaei2ynbjCyJ7GZj7y6huBSA3eNboJWR
         CqRxu51qJ4GZq/MiGyuTq/1eHCmoJyV0GGA3KzW1CW2RqGFvaGslV/9DWcNnutUzx8pI
         WnqMOSJ3Toh435jUUTtjm5+zFImo8aSzaYke29cDRRXdo1IEAZeazgzUsSHJfBQC9jv4
         8c4Z3eXd+dcy7j6hjfYBlGdTUM4wr+NuMSq2tlMay/aYhocZxSPN2dj7QEM4Hytw0QxH
         DkYg==
X-Forwarded-Encrypted: i=1; AJvYcCWass48mFtZRHu4oaSocbKUAoKiNPJrF5QsWbXUSUalZ/272wAp3hk2Nxk4xOTVI/dlDKifgO1ZlWNkcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSK1HQgbfLxd6QFi1AnBvwBfSM7llZyFnd3Jki6hPqvG1QZjRO
	1BbaUUICjtynlkd2T190dpZJGdxc3RQamls5euPmR4+tI3i9OjJzlO9WOIJejoGyFOnTm8AqW/R
	FlHF7UiZT/m6vnOZqI+3r95JyMkKYSNM=
X-Gm-Gg: AZuq6aJfKByB/dAZmYVtA+vKPDLEa2CoD7rSnjnfT+90shejTdNrgcIJsx0NSJS1mwU
	Qb4SM0FtWVlu28fdOaki/Hya0b25blo7q0F4g/qBAl+YCVKYBzbOL24obMVO762uCJAspbr8E96
	QVtsZdMoXLikFPa5NiDd7plmx4Yfv294HEFvk6pDJLirMT5nwWAFbcVKviBjQ4QwvVHZmDH1dhS
	wPEeDkh6cZu1yblP5Qz/n2hOgkFlDNQaeysyy18pPvJX9ObIkI8EQaBzV5SNhIE4YanKqBZzolb
	E22a0Lg=
X-Received: by 2002:a5d:64c7:0:b0:435:b728:c979 with SMTP id
 ffacd0b85a97d-435f3a6f814mr13098748f8f.8.1770020654964; Mon, 02 Feb 2026
 00:24:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122151125.7367-1-clamor95@gmail.com> <3677292.iIbC2pHGDl@senjougahara>
 <CAPVz0n0Enr0SNoVXjPyROhj6s412OEczQp+bgY9TGiEekpjW7A@mail.gmail.com> <2051347.usQuhbGJ8B@senjougahara>
In-Reply-To: <2051347.usQuhbGJ8B@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Feb 2026 10:24:03 +0200
X-Gm-Features: AZwV_QisbXJcU6EWAostZp_Hl3RGj2PJJtIR2_JRg09Mv-dLMCQcjMg91fofi-E
Message-ID: <CAPVz0n3PncS5vcK5TDW950c6Z=sf6vTFPOP1B81+2UWvHEa1Xg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: phy: tegra: add HSIC support
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:06 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, February 2, 2026 3:37=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:07 M=
ikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Friday, January 23, 2026 12:11=E2=80=AFAM Svyatoslav Ryhel wrote:
> > > > Add support for HSIC USB mode, which can be set for second USB cont=
roller
> > > > and PHY on Tegra SoC along with already supported UTMI or ULPI.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/usb/phy/phy-tegra-usb.c   | 249 ++++++++++++++++++++++++++=
++--
> > > >  include/linux/usb/tegra_usb_phy.h |   5 +
> > > >  2 files changed, 243 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-=
tegra-usb.c
> > > > index afa5b5535f92..4f0fde33647e 100644
> > > > --- a/drivers/usb/phy/phy-tegra-usb.c
> > > > +++ b/drivers/usb/phy/phy-tegra-usb.c
> > > > @@ -29,17 +29,26 @@
> > > >  #include <linux/usb/tegra_usb_phy.h>
> > > >  #include <linux/usb/ulpi.h>
> > > >
> > > > +#define USB_TXFILLTUNING                     0x154
> > > > +#define USB_FIFO_TXFILL_THRES(x)             (((x) & 0x1f) << 16)
> > > > +#define USB_FIFO_TXFILL_MASK                 0x1f0000
> > > > +
> > > >  #define ULPI_VIEWPORT                                0x170
> > > >
> > > >  /* PORTSC PTS/PHCD bits, Tegra20 only */
> > > >  #define TEGRA_USB_PORTSC1                    0x184
> > > > -#define TEGRA_USB_PORTSC1_PTS(x)             (((x) & 0x3) << 30)
> > > > -#define TEGRA_USB_PORTSC1_PHCD                       BIT(23)
> > > > +#define   TEGRA_USB_PORTSC1_PTS(x)           (((x) & 0x3) << 30)
> > > > +#define   TEGRA_USB_PORTSC1_PHCD             BIT(23)
> > > > +#define   TEGRA_USB_PORTSC1_WKOC             BIT(22)
> > > > +#define   TEGRA_USB_PORTSC1_WKDS             BIT(21)
> > > > +#define   TEGRA_USB_PORTSC1_WKCN             BIT(20)
> > > >
> > > >  /* HOSTPC1 PTS/PHCD bits, Tegra30 and above */
> > > > +#define TEGRA30_USB_PORTSC1                  0x174
> > > >  #define TEGRA_USB_HOSTPC1_DEVLC                      0x1b4
> > > > -#define TEGRA_USB_HOSTPC1_DEVLC_PTS(x)               (((x) & 0x7) =
<< 29)
> > > > -#define TEGRA_USB_HOSTPC1_DEVLC_PHCD         BIT(22)
> > > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)     (((x) & 0x7) << 29)
> > > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PHCD               BIT(22)
> > > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC   BIT(2)
> > >
> > > PTS is an enumeration, not a bitfield, so I would say '4' instead of =
'BIT(2)'
> > >
> >
> > Noted
> >
> > > >
> > > >  /* Bits of PORTSC1, which will get cleared by writing 1 into them =
*/
> > > >  #define TEGRA_PORTSC1_RWC_BITS       (PORT_CSC | PORT_PEC | PORT_O=
CC)
> > > > @@ -51,11 +60,12 @@
> > > >  #define   USB_SUSP_CLR                               BIT(5)
> > > >  #define   USB_PHY_CLK_VALID                  BIT(7)
> > > >  #define   UTMIP_RESET                                BIT(11)
> > > > -#define   UHSIC_RESET                                BIT(11)
> > > >  #define   UTMIP_PHY_ENABLE                   BIT(12)
> > > >  #define   ULPI_PHY_ENABLE                    BIT(13)
> > > >  #define   USB_SUSP_SET                               BIT(14)
> > > > +#define   UHSIC_RESET                                BIT(14)
> > > >  #define   USB_WAKEUP_DEBOUNCE_COUNT(x)               (((x) & 0x7) =
<< 16)
> > > > +#define   UHSIC_PHY_ENABLE                   BIT(19)
> > > >
> > > >  #define USB_PHY_VBUS_SENSORS                 0x404
> > > >  #define   B_SESS_VLD_WAKEUP_EN                       BIT(14)
> > > > @@ -156,6 +166,58 @@
> > > >  #define UTMIP_BIAS_CFG1                              0x83c
> > > >  #define   UTMIP_BIAS_PDTRK_COUNT(x)          (((x) & 0x1f) << 3)
> > > >
> > > > +/*
> > > > + * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers star=
t from 0x800
> > > > + * just where UTMIP registers should have been. This is the case o=
nly with Tegra20
> > > > + * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shif=
ter by 0x400
> > >
> > > 'shift', or 'are shifted'
> > >
> >
> > Noted
> >
> > > > + * to 0xc00, but register layout is preserved.
> > > > + */
> > > > +#define UHSIC_PLL_CFG1                               0x804
> > > > +#define   UHSIC_XTAL_FREQ_COUNT(x)           (((x) & 0xfff) << 0)
> > > > +#define   UHSIC_PLLU_ENABLE_DLY_COUNT(x)     (((x) & 0x1f) << 14)
> > > > +
> > > > +#define UHSIC_HSRX_CFG0                              0x808
> > > > +#define   UHSIC_ELASTIC_UNDERRUN_LIMIT(x)    (((x) & 0x1f) << 2)
> > > > +#define   UHSIC_ELASTIC_OVERRUN_LIMIT(x)     (((x) & 0x1f) << 8)
> > > > +#define   UHSIC_IDLE_WAIT(x)                 (((x) & 0x1f) << 13)
> > > > +
> > > > +#define UHSIC_HSRX_CFG1                              0x80c
> > > > +#define   UHSIC_HS_SYNC_START_DLY(x)         (((x) & 0x1f) << 1)
> > > > +
> > > > +#define UHSIC_TX_CFG0                                0x810
> > > > +#define   UHSIC_HS_READY_WAIT_FOR_VALID              BIT(9)
> > > > +
> > > > +#define UHSIC_MISC_CFG0                              0x814
> > > > +#define   UHSIC_SUSPEND_EXIT_ON_EDGE         BIT(7)
> > > > +#define   UHSIC_DETECT_SHORT_CONNECT         BIT(8)
> > > > +#define   UHSIC_FORCE_XCVR_MODE                      BIT(15)
> > > > +#define   UHSIC_DISABLE_BUSRESET             BIT(20)
> > > > +
> > > > +#define UHSIC_MISC_CFG1                              0x818
> > > > +#define   UHSIC_PLLU_STABLE_COUNT(x)         (((x) & 0xfff) << 2)
> > > > +
> > > > +#define UHSIC_PADS_CFG0                              0x81c
> > > > +#define   UHSIC_TX_RTUNEN                    0xf000
> > > > +#define   UHSIC_TX_RTUNE(x)                  (((x) & 0xf) << 12)
> > > > +
> > > > +#define UHSIC_PADS_CFG1                              0x820
> > > > +#define   UHSIC_PD_BG                                BIT(2)
> > > > +#define   UHSIC_PD_TX                                BIT(3)
> > > > +#define   UHSIC_PD_TRK                               BIT(4)
> > > > +#define   UHSIC_PD_RX                                BIT(5)
> > > > +#define   UHSIC_PD_ZI                                BIT(6)
> > > > +#define   UHSIC_RX_SEL                               BIT(7)
> > > > +#define   UHSIC_RPD_DATA                     BIT(9)
> > > > +#define   UHSIC_RPD_STROBE                   BIT(10)
> > > > +#define   UHSIC_RPU_DATA                     BIT(11)
> > > > +#define   UHSIC_RPU_STROBE                   BIT(12)
> > > > +
> > > > +#define UHSIC_CMD_CFG0                               0x824
> > > > +#define   UHSIC_PRETEND_CONNECT_DETECT               BIT(5)
> > > > +
> > > > +#define UHSIC_STAT_CFG0                              0x828
> > > > +#define   UHSIC_CONNECT_DETECT                       BIT(0)
> > > > +
> > > >  /* For Tegra30 and above only, the address is different in Tegra20=
 */
> > > >  #define USB_USBMODE                          0x1f8
> > > >  #define   USB_USBMODE_MASK                   (3 << 0)
> > > > @@ -174,7 +236,8 @@ struct tegra_xtal_freq {
> > > >       u8 enable_delay;
> > > >       u8 stable_count;
> > > >       u8 active_delay;
> > > > -     u8 xtal_freq_count;
> > > > +     u8 utmi_xtal_freq_count;
> > > > +     u16 hsic_xtal_freq_count;
> > > >       u16 debounce;
> > > >  };
> > > >
> > > > @@ -184,7 +247,8 @@ static const struct tegra_xtal_freq tegra_freq_=
table[] =3D {
> > > >               .enable_delay =3D 0x02,
> > > >               .stable_count =3D 0x2F,
> > > >               .active_delay =3D 0x04,
> > > > -             .xtal_freq_count =3D 0x76,
> > > > +             .utmi_xtal_freq_count =3D 0x76,
> > > > +             .hsic_xtal_freq_count =3D 0x1CA,
> > > >               .debounce =3D 0x7530,
> > > >       },
> > > >       {
> > > > @@ -192,7 +256,8 @@ static const struct tegra_xtal_freq tegra_freq_=
table[] =3D {
> > > >               .enable_delay =3D 0x02,
> > > >               .stable_count =3D 0x33,
> > > >               .active_delay =3D 0x05,
> > > > -             .xtal_freq_count =3D 0x7F,
> > > > +             .utmi_xtal_freq_count =3D 0x7F,
> > > > +             .hsic_xtal_freq_count =3D 0x1F0,
> > > >               .debounce =3D 0x7EF4,
> > > >       },
> > > >       {
> > > > @@ -200,7 +265,8 @@ static const struct tegra_xtal_freq tegra_freq_=
table[] =3D {
> > > >               .enable_delay =3D 0x03,
> > > >               .stable_count =3D 0x4B,
> > > >               .active_delay =3D 0x06,
> > > > -             .xtal_freq_count =3D 0xBB,
> > > > +             .utmi_xtal_freq_count =3D 0xBB,
> > > > +             .hsic_xtal_freq_count =3D 0x2DD,
> > > >               .debounce =3D 0xBB80,
> > > >       },
> > > >       {
> > > > @@ -208,7 +274,8 @@ static const struct tegra_xtal_freq tegra_freq_=
table[] =3D {
> > > >               .enable_delay =3D 0x04,
> > > >               .stable_count =3D 0x66,
> > > >               .active_delay =3D 0x09,
> > > > -             .xtal_freq_count =3D 0xFE,
> > > > +             .utmi_xtal_freq_count =3D 0xFE,
> > > > +             .hsic_xtal_freq_count =3D 0x3E0,
> > > >               .debounce =3D 0xFDE8,
> > > >       },
> > > >  };
> > > > @@ -541,7 +608,7 @@ static int utmi_phy_power_on(struct tegra_usb_p=
hy *phy)
> > > >               val =3D readl_relaxed(base + UTMIP_PLL_CFG1);
> > > >               val &=3D ~(UTMIP_XTAL_FREQ_COUNT(~0) |
> > > >                       UTMIP_PLLU_ENABLE_DLY_COUNT(~0));
> > > > -             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->xtal_freq_c=
ount) |
> > > > +             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->utmi_xtal_f=
req_count) |
> > > >                       UTMIP_PLLU_ENABLE_DLY_COUNT(phy->freq->enable=
_delay);
> > > >               writel_relaxed(val, base + UTMIP_PLL_CFG1);
> > > >       }
> > > > @@ -812,6 +879,153 @@ static int ulpi_phy_power_off(struct tegra_us=
b_phy *phy)
> > > >       return 0;
> > > >  }
> > > >
> > > > +static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
> > > > +{
> > > > +     void __iomem *base =3D phy->regs;
> > > > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > > > +
> > > > +     return readl_relaxed(base + shift + reg);
> > > > +}
> > > > +
> > > > +static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, =
u32 value)
> > > > +{
> > > > +     void __iomem *base =3D phy->regs;
> > > > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > > > +
> > > > +     writel_relaxed(value, base + shift + reg);
> > > > +}
> > > > +
> > > > +static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
> > > > +{
> > > > +     struct tegra_utmip_config *config =3D phy->config;
> > > > +     void __iomem *base =3D phy->regs;
> > > > +     u32 val;
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > > > +     val &=3D ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_P=
D_RX |
> > > > +              UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > > > +     val |=3D UHSIC_RX_SEL;
> > >
> > > L4T r16 (Tegra30) keeps UHSIC_PD_TX set until after UHSIC_RESET has b=
een cleared. Commit message says this avoids a signal glitch.
> > >
> >
> > I did not notice any difference with this change and without. Since it
> > does not affect detection of modem by my device I can apply it (is it
> > worth applying at all?). Should it be applied globally or for Tegra30+
> > only?
>
> Downstream only has it for Tegra30, but that's probably just because it w=
as tested in the Tegra30 timeframe. If it's not causing any issue on Tegra2=
0 I would apply it globally. Considering it's a signal glitch it might only=
 have an effect in marginal signal situations.
>
> >
> > > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > > > +
> > > > +     udelay(2);
> > > > +
> > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > +     val |=3D UHSIC_RESET;
> > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > +
> > > > +     udelay(30);
> > > > +
> > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > +     val |=3D UHSIC_PHY_ENABLE;
> > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG0);
> > > > +     val &=3D ~(UHSIC_IDLE_WAIT(~0) |
> > > > +              UHSIC_ELASTIC_UNDERRUN_LIMIT(~0) |
> > > > +              UHSIC_ELASTIC_OVERRUN_LIMIT(~0));
> > > > +     val |=3D UHSIC_IDLE_WAIT(config->idle_wait_delay) |
> > > > +             UHSIC_ELASTIC_UNDERRUN_LIMIT(config->elastic_limit) |
> > > > +             UHSIC_ELASTIC_OVERRUN_LIMIT(config->elastic_limit);
> > > > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG0, val);
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG1);
> > > > +     val &=3D ~UHSIC_HS_SYNC_START_DLY(~0);
> > > > +     val |=3D UHSIC_HS_SYNC_START_DLY(config->hssync_start_delay);
> > > > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG1, val);
> > > > +
> > >
> > > L4T r16 (Tegra30) clears UHSIC_TX_CFG0.UHSIC_HS_READY_WAIT_FOR_VALID =
here. According to commit message this fixes an intermittent failure to con=
nect to HSIC modem. It also sets UHSIC_MISC_CFG0.UHSIC_DISABLE_BUSRESET  be=
low due to same issue.
> > >
> >
> > And this change causes my modem to fail entirely.
> >
> > [   10.145976] usb 1-1: new high-speed USB device number 2 using ci_hdr=
c
> > [   10.295970] usb 1-1: device descriptor read/64, error -71
> > [   10.545975] usb 1-1: device descriptor read/64, error -71
> > [   10.795990] usb 1-1: new high-speed USB device number 3 using ci_hdr=
c
> > [   10.935970] usb 1-1: device descriptor read/64, error -71
> > [   11.185977] usb 1-1: device descriptor read/64, error -71
> >
> > I assume UHSIC_DISABLE_BUSRESET, UHSIC_HS_READY_WAIT_FOR_VALID and
> > UHSIC_PD_TX workarounds are all consequences of how modem in
> > downstream kernel is called. Instead of relaying on modem to lead the
> > controller probe, downstream just brutally removes and reinits
> > controller until modem probes. I have never observed modem not
> > appearing without any of discussed patches.
>
> The downstream commit says that without this workaround, the modem would =
sometimes not come up in stress tests. So I think it's possible there is st=
ill a rare hardware bug that this is working around, but perhaps we're miss=
ing some other part and that's why it's not working. I think it's fine to d=
rop these changes.
>

I propose not adding any of the three workarounds for now. I don't
have a Tegra20 with an HSIC modem, as it seems that most Tegra20
devices use ULPI mode. Among my personal devices, only the LG Optimus
Vu (P895) is a GSM device with an XMM HSIC modem, and it fails if I
add UHSIC_DISABLE_BUSRESET and UHSIC_HS_READY_WAIT_FOR_VALID. Since I
may be the only one at the moment actively working in this area of
legacy Tegra SoCs =E2=80=94 and this discussion is public =E2=80=94 anyone =
who has
issues can contact me to resolve them. Additionally, I will keep in
mind that there may be a need for these workarounds; if I find any
need for them during modem bring-ups in the legacy Tegra community, I
will submit dedicated patches with explanations.

> >
> >
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG0);
> > > > +     val |=3D UHSIC_SUSPEND_EXIT_ON_EDGE;
> > > > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG0, val);
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG1);
> > > > +     val &=3D ~UHSIC_PLLU_STABLE_COUNT(~0);
> > > > +     val |=3D UHSIC_PLLU_STABLE_COUNT(phy->freq->stable_count);
> > > > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG1, val);
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PLL_CFG1);
> > > > +     val &=3D ~(UHSIC_XTAL_FREQ_COUNT(~0) |
> > > > +             UHSIC_PLLU_ENABLE_DLY_COUNT(~0));
> > > > +     val |=3D UHSIC_XTAL_FREQ_COUNT(phy->freq->hsic_xtal_freq_coun=
t) |
> > > > +             UHSIC_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
> > > > +     tegra_hsic_writel(phy, UHSIC_PLL_CFG1, val);
> > > > +
> > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > +     val &=3D ~UHSIC_RESET;
> > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > +
> > > > +     udelay(2);
> > > > +
> > > > +     if (phy->soc_config->requires_usbmode_setup) {
> > > > +             val =3D readl_relaxed(base + USB_USBMODE);
> > > > +             val &=3D ~USB_USBMODE_MASK;
> > > > +             if (phy->mode =3D=3D USB_DR_MODE_HOST)
> > > > +                     val |=3D USB_USBMODE_HOST;
> > > > +             else
> > > > +                     val |=3D USB_USBMODE_DEVICE;
> > > > +             writel_relaxed(val, base + USB_USBMODE);
> > > > +     }
> > > > +
> > > > +     if (phy->soc_config->has_hostpc)
> > > > +             set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
> > > > +     else
> > > > +             set_pts(phy, 0);
> > >
> > > This (and below) are abusing has_hostpc to detect Tegra30 vs Tegra20.=
 We should instead add soc_config fields hsic_pts_value and portsc1_offset.
> > >
> > > > +
> > > > +     val =3D readl_relaxed(base + USB_TXFILLTUNING);
> > > > +     if ((val & USB_FIFO_TXFILL_MASK) !=3D USB_FIFO_TXFILL_THRES(0=
x10)) {
> > > > +             val =3D USB_FIFO_TXFILL_THRES(0x10);
> > > > +             writel_relaxed(val, base + USB_TXFILLTUNING);
> > > > +     }
> > > > +
> > > > +     if (phy->soc_config->has_hostpc) {
> > > > +             val =3D readl_relaxed(base + TEGRA30_USB_PORTSC1);
> > > > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1=
_WKDS |
> > > > +                      TEGRA_USB_PORTSC1_WKCN);
> > > > +             writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
> > > > +     } else {
> > > > +             val =3D readl_relaxed(base + TEGRA_USB_PORTSC1);
> > > > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1=
_WKDS |
> > > > +                      TEGRA_USB_PORTSC1_WKCN);
> > > > +             writel_relaxed(val, base + TEGRA_USB_PORTSC1);
> > > > +     }
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
> > > > +     val &=3D ~UHSIC_TX_RTUNEN;
> > > > +     val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> > > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> > > > +
> > > > +     if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALI=
D,
> > > > +                            USB_PHY_CLK_VALID))
> > > > +             dev_err(phy->u_phy.dev,
> > > > +                     "Timeout waiting for PHY to stabilize on enab=
le (HSIC)\n");
> > >
> > > Should return error (return value of utmi_wait_register) here?
> > >
> >
> > Noted.
> >
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
> > > > +{
> > > > +     void __iomem *base =3D phy->regs;
> > > > +     u32 val;
> > > > +
> > > > +     set_phcd(phy, true);
> > > > +
> > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > > > +     val |=3D (UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD=
_RX |
> > > > +             UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > > > +
> > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > +     val |=3D UHSIC_RESET;
> > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > +
> > > > +     udelay(30);
> > > > +
> > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > +     val &=3D ~UHSIC_PHY_ENABLE;
> > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
> > > >  {
> > > >       int err =3D 0;
> > > > @@ -828,6 +1042,10 @@ static int tegra_usb_phy_power_on(struct tegr=
a_usb_phy *phy)
> > > >               err =3D ulpi_phy_power_on(phy);
> > > >               break;
> > > >
> > > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > > +             err =3D uhsic_phy_power_on(phy);
> > > > +             break;
> > > > +
> > > >       default:
> > > >               break;
> > > >       }
> > > > @@ -859,6 +1077,10 @@ static int tegra_usb_phy_power_off(struct teg=
ra_usb_phy *phy)
> > > >               err =3D ulpi_phy_power_off(phy);
> > > >               break;
> > > >
> > > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > > +             err =3D uhsic_phy_power_off(phy);
> > > > +             break;
> > > > +
> > > >       default:
> > > >               break;
> > > >       }
> > > > @@ -1256,6 +1478,8 @@ static const struct tegra_phy_soc_config tegr=
a20_soc_config =3D {
> > > >       .requires_usbmode_setup =3D false,
> > > >       .requires_extra_tuning_parameters =3D false,
> > > >       .requires_pmc_ao_power_up =3D false,
> > > > +     .uhsic_registers_shift =3D 0,
> > > > +     .uhsic_tx_rtune =3D 0, /* 40 ohm */
> > > >  };
> > > >
> > > >  static const struct tegra_phy_soc_config tegra30_soc_config =3D {
> > > > @@ -1264,6 +1488,8 @@ static const struct tegra_phy_soc_config tegr=
a30_soc_config =3D {
> > > >       .requires_usbmode_setup =3D true,
> > > >       .requires_extra_tuning_parameters =3D true,
> > > >       .requires_pmc_ao_power_up =3D true,
> > > > +     .uhsic_registers_shift =3D 0x400,
> > > > +     .uhsic_tx_rtune =3D 8,  /* 50 ohm */
> > > >  };
> > > >
> > > >  static const struct of_device_id tegra_usb_phy_id_table[] =3D {
> > > > @@ -1360,6 +1586,7 @@ static int tegra_usb_phy_probe(struct platfor=
m_device *pdev)
> > > >       tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
> > > >       switch (tegra_phy->phy_type) {
> > > >       case USBPHY_INTERFACE_MODE_UTMI:
> > > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > >               err =3D utmi_phy_probe(tegra_phy, pdev);
> > > >               if (err)
> > > >                       return err;
> > > > diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/=
tegra_usb_phy.h
> > > > index e394f4880b7e..4e79f1c2173a 100644
> > > > --- a/include/linux/usb/tegra_usb_phy.h
> > > > +++ b/include/linux/usb/tegra_usb_phy.h
> > > > @@ -24,6 +24,9 @@ struct gpio_desc;
> > > >   * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelc=
h_level
> > > >   *      and hsdiscon_level should be set for adequate signal quali=
ty
> > > >   * requires_pmc_ao_power_up: true if USB AO is powered down by def=
ault
> > > > + * uhsic_registers_shift: for Tegra30+ where HSIC registers were s=
hifted
> > > > + *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP =
on PHY2
> > > > + * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS=
/PMOS driver
> > > >   */
> > > >
> > > >  struct tegra_phy_soc_config {
> > > > @@ -32,6 +35,8 @@ struct tegra_phy_soc_config {
> > > >       bool requires_usbmode_setup;
> > > >       bool requires_extra_tuning_parameters;
> > > >       bool requires_pmc_ao_power_up;
> > > > +     u32 uhsic_registers_shift;
> > >
> > > I would rather call this 'uhsic_registers_offset'. Shift first brings=
 to mind bitshifts, and we often have fields in these config structs for bi=
t shifts called '*_shift'.
> > >
> >
> > Yes, offset seems more appropriate.
> >
> > > > +     u32 uhsic_tx_rtune;
> > > >  };
> > > >
> > > >  struct tegra_utmip_config {
> > > >
> >
> > Mikko, thank you for your review, since HSIC patches already were
> > picked into linux/next I will prepare a few followup patches to
> > address some of uncertainties.
>
> Thank you!
>
>
>
