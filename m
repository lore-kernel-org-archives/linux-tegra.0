Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52C62DC350
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034468; cv=pass; b=pmRaCOB/a3SdMo6FIwbZODlwwsxssRvXIG0svC7BnNde8c4VYTFkGpNfxWqLsXL/5t4e7QZ7wKdOo3j3zjNpUmrapO5wr2NdIHsTA/js3gX2CCHtpQgwIWN/wiDA1QWmHJqv1C3Q/R4QhnirSyBMe5mQNZuYXX+/MVG9TwuukFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034468; c=relaxed/simple;
	bh=4vOMU3KJblqcvy4DJHgfLqxLPeHzwlcx9CR/HjnFSHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3q9ORaS8nru1R1o0C0slInzmUpDqAa41SUrSTbJFZ6QrDOfqcxMG02NYN8OUW1VpXX7d2bc7zhqSE/zlgkdLRHzNThfDzhtdzF52+ekavugukwECSwMPseCih3moVfdCjc/AFOc8sAn2fp23Jissg/kmbxyZm78pXSRIk81bR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISBRKwJZ; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISBRKwJZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359108fd24so2663058f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 04:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770034465; cv=none;
        d=google.com; s=arc-20240605;
        b=Kc0/m+Vz+hAgMBc6OeXfzKuGJcPdKU0ryekh616XdEtxCJaKvtSSltTPew9EF62w6p
         jMmrgmH8r+bmTqZB+3S7rSt0hZVG+2o194LCz5TowQCsWaAvRxmA3YV8DKxhnTi3uaJG
         q5D++7XS9Gj9af73YZVHU7h27gxVQ+xmwScC2tFsiIP7oZOIwH4rhPLbT7C5UL3SWHoJ
         bZubqNbjeB/omrILFe0Sn3Yxo86Ev3DqhCBwRE8n7gJegdFrjgrknsvLJ/7l/u7Gii52
         JqoYyys4U4IF4STXDcpja3dc5z6wYoFBSTP5bFs0KxWDVdWplFxe2WSeGKrtZF6PKwMl
         mVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56+fWCwV/1yCfXrVGr4I8X47r1cy6upQroC6izF7fa0=;
        fh=GRRAJHq1qJOPEfphzAR3xREqwnmPJdwgk4R7CDqTM9I=;
        b=OBZLlZVI7+YzachB0lyZQ8x0ZRq/JHpC7PUmfFW+g5zFzGRIv4l3gJoksv7/mCE10y
         JHaANOA1bzx04FMc2LKJ9wlgAbU91kmk7Y3cJ+nocnMtCikrhnvZh+md2i8OSba5uXlK
         rtlx8NYHwzJVpJT3RJzlZjlaP2wAsr8BnQy8q5Napme5tNL1QyQPRUe3SRtPEHCrsxqe
         UpjDJsVQd94eXWlfNeSoFzpea3Uzd63Y4EFxKv0EkHstCcnyqUXFjA7LUC6PuNj4iGTh
         Gvh4AhkQwLMilawprIL3mUxKGQRzA1hQaaRsFvuzv1Lnsdqcq7NJKfFoZyZpmHPuNiOQ
         MP+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770034465; x=1770639265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56+fWCwV/1yCfXrVGr4I8X47r1cy6upQroC6izF7fa0=;
        b=ISBRKwJZPrbbdraoAqnNd9CJnTw7EuEmbeLCLs10SoxJS8oY4HOXRa4mp9YF1p+k94
         bZyue2NWz5E7KYG+3K0dWVvJ03+q+DjMIp1JP7s+jmipI1umSpXBF/dH4hntbnwCbTjb
         YdyrySz5dsec03gvBXloifbsYY52gLM3nYpp2wGrUKszMqiUB+5C8+Ul9J13Iqk6Sva1
         KNPGNATZ+8Ofe/qm8Zowf0EwAgVtf0wL8tDPD9xTSnyRcFw+6EWqhCpCyrZubE2JYJfC
         PjWn9lwuqHqO5hRyh80thRyqIiEeUgVegj2DeiB3pqVq/OgJ01XbnJzocaeGjsVxdYoT
         X3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770034465; x=1770639265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56+fWCwV/1yCfXrVGr4I8X47r1cy6upQroC6izF7fa0=;
        b=Oviz2d5ttNEcpoUk/EfAUAX1GtyWHiYbAM+ZIQxUkIWLGvFH7RhmFozAqMmOHBbMfT
         4y9JgezI7lAGfjPCPk9WfWlNSkHBmDHxy9Ze14zjwVUsIKAv0iR5lNsea8YGkywGizpp
         XB8VDKjMAWN0N/AXnMdq8TrydQCyRgO0/sVX0S+1gWdHOTiMTENP/E9d8esBxOKv5cgS
         lQLn4Xzk2hyaXpj2SpHxSy/QNx/4J18BVMiu3Tp7LcmcFW9iyv4hSec9i8XgiY37TfB2
         mJ+1XnjyYhHZ/avKYn2VDcpkC7stGWHkobbwLD4eWo13b8fuInbZbMxvwBqN5cC/lkuc
         qctg==
X-Forwarded-Encrypted: i=1; AJvYcCUXTHIb7MyLq8ct0L8U/2DKY04pCgpjpP1N44/SEM3eLcbeK50a+KsEir2GG1I6MhlmjU8d7nrBxEKHVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwPIHvDY9eF6rT4b+THD3EJGwgkrzfS/3HwE/+zfwYHpvJVIhw
	+0oXg5czh7+FCWKXDYqJCuPVGiIzn6rK/2jQfkI3uV8TTUQ1bu5AlIXCexcShcXZYOLUE1W+oly
	FWhL4Qd0MeolbK+G+ZK+Zra2NLbhgbyQ=
X-Gm-Gg: AZuq6aLhHvu65BydHcQ0dFjFX5MPO1Y3fUSqncJYoF15qUMgwzM/SsuxTw9WLR57tHc
	EOkD+b9zA4Zhh+H/f+OKHnl+IOXS+rh2G2BkxlpwlmnRzIFequ8+F9Ew1sy+18SnN5osU8UsrVz
	A64cFX+6EXWLg/LkwtD+ONFU6SDsm5uF9AOtoAF4nFZVa7Cvapm6qy5BlyXwBpTLBukOLnKm3s+
	pG4V8/qb/69JVEB6LTpjh/6/XDcDirb60gs/Mr6difHOBP6yo21opyNuEzyRuPrLBx73mMO
X-Received: by 2002:a05:6000:2385:b0:435:9ce0:f93c with SMTP id
 ffacd0b85a97d-435f3ad5b8emr17364591f8f.62.1770034465115; Mon, 02 Feb 2026
 04:14:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202080526.23487-1-clamor95@gmail.com> <20260202080526.23487-3-clamor95@gmail.com>
 <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
In-Reply-To: <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Feb 2026 14:14:13 +0200
X-Gm-Features: AZwV_Qhc04t50qV84MOPj_KuJjhvIvyYToXV4PJJJWcC5DH3b2UIXHdWJaS3HN0
Message-ID: <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from utmi_wait_register
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:05 Serge=
y Shtylyov <sergei.shtylyov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2/2/26 11:05 AM, Svyatoslav Ryhel wrote:
>
> > Return exact error value from utmi_wait_register during HSIC power on.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegr=
a-usb.c
> > index 3a7a74f01d1c..6173b240c3ea 100644
> > --- a/drivers/usb/phy/phy-tegra-usb.c
> > +++ b/drivers/usb/phy/phy-tegra-usb.c
> > @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy =
*phy)
> >       struct tegra_utmip_config *config =3D phy->config;
> >       void __iomem *base =3D phy->regs;
> >       u32 val;
> > +     int err =3D 0;
>
>    This initialization seems pointless -- the newly added variable gets o=
verwritten
> by you later...
>

So? let it better be initialized and rewritten then later on catch errors.

> [...]
> > @@ -984,12 +985,14 @@ static int uhsic_phy_power_on(struct tegra_usb_ph=
y *phy)
> >       val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> >       tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> >
> > -     if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> > -                            USB_PHY_CLK_VALID))
> > +     err =3D utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALI=
D,
> > +                              USB_PHY_CLK_VALID);
> > +
> > +     if (err)
> >               dev_err(phy->u_phy.dev,
> >                       "Timeout waiting for PHY to stabilize on enable (=
HSIC)\n");
> >
> > -     return 0;
> > +     return err;
> >  }
> >
> >  static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
>
> MBR, Sergey
>
