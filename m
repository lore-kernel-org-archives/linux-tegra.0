Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336C270EB9;
	Tue,  6 May 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525844; cv=none; b=KCaQAwMKB6avVlxJntA4iOqAlwHugESI0flFAI7UYIG/jTxooQbICilDIixm2ITz7iUCMfQAZVkzLURS77sB5qUsANFfiCxvd/DMdE8z0Q88PUT1Sej192YSBTG2zXD7F5gigDyLNokRAi/OH6XPcuYCmD7Wuv3g39+f9EbRTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525844; c=relaxed/simple;
	bh=kxl6991z3S6FTrgaggQEvrxDteL5i0EJ9Yq+c+yztj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGMqSfY9CbeBH7vhlb/Pp0sFIEKXDk6V3JaDkNmOCn+o4tXNnc2cxyA1Ggkl+mwGojMPY4zfDjTyjOQVvJrcLiEIaZNSI9nP9MI2lyUpgyRxqvsHZOKsZwEhdqhUC8K0ef8+5bTZXghXwCqbXcpuGZADfEgZmfflnsxCIxN0rWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Avjjiy6F; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Avjjiy6F"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfed67e08so54134261fa.2;
        Tue, 06 May 2025 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746525840; x=1747130640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKzBLfrH7ZCXq8Z7XeDJquF9cK0JOdM2v72Fh6/i1GY=;
        b=Avjjiy6F00icIZzGhxhbGgNCBS84XhHFORG6juybyKr2ffBIekmJOSnSNKJUJt/WBT
         CbrCCsfLVSJ2Du5x2j5iuvtcwQvF8r6gVpovYv4Zop5VTkixwn5X+8yfAyuvNaGaDxCd
         01M16IyLijclPRP0S+qeMxuLX83JVHCivRKywN+MKD7sQI/CA4aFnGPw8t9Ifps2jkXa
         DRey0yEEA8xm1/dTP8svHZzbQjBa+d8Yag8cJUReJrK5iuPJuRZ7EDIeasTgRxqaPVwH
         UoI+DrtsbYql/Hp3594YtSnqErEQi4ktz61mZwkRioo3YtQOy85icdUGjSfKVMU+sv7Z
         bNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525840; x=1747130640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKzBLfrH7ZCXq8Z7XeDJquF9cK0JOdM2v72Fh6/i1GY=;
        b=vSjSZOFXNdxLj8TraKxoYpzJVT3y4KwL6dRENPJiwCRigKwuziqNcLZ8kGbwj9m3mN
         njCYnFwhcXXgQPICrKnDDNFNpc3L4jwH2gKFaKzE+cTxUHXRhZvgreaQYWdfO1iTa0SL
         P2N6WDKQiKv+REUeQ3N+00Op+HYZ72rH3Bg02duZ/gsl9TaPcYgwN0iDxS7E/x7ZMSVa
         XIDGBLiYn7wDxoCxg1wTHsmAOH/JYvBokSStcu4S7xHtrTNyS8du7fAa+T5NR8ylcZkw
         OPCNkE0BDL7PhqIIC7A4tAggzRCFJ2qswhivtLcVFaX/hWLjcraVJRntZvUV2vn8bcXe
         uPww==
X-Forwarded-Encrypted: i=1; AJvYcCUk4h9jCNbpc3VxmcEs9CU0scja5xeLG95FMRqGWP4OV3PIQiEElQvvFov5SW1a9czoQ3Gw5SkuI8FxowY=@vger.kernel.org, AJvYcCVl79DPiyt3MtkEOjIwpvUhiyvY03ZlYjjYbtC/I3egQ7OWGGF4YgTOKA1Qxo1WNa62N9LvYMK0MSmIf1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGuadOX0txfBM12YBbWCgqRG1YOeFEQvTH2WoFqvilrnzBBoDV
	J+3LMT82rU77w4uOWNp5X59/XJj4ShZUrE0hOtGv8QuRBb2Dkbp6/vR7gt2NdKOuX0MbcZgNUMt
	b75THSRCbc/VdMFWp5Xa2a3i7rtgwOeO0Bt0BAQ==
X-Gm-Gg: ASbGncvZ2xsrdyK4FNL6ytUT+hh8mpbCvIFbBoVW+bN8yd1uWu2lEJzVt9MtlpQ6Q2J
	o+FfWQ71GfMSnHmjDepK5OlElvaIUzBAEikQBCdP/MZHk2iOGMJ1BmMZ+ztWI6v5anqGDGuBMvi
	QTw5WtFsqFyzhKrfmmy8n27Bc=
X-Google-Smtp-Source: AGHT+IGciPq7h67vOHHMe0xab6MDc0v5dNL433NEtKmDciAYRCLBTsLbgrW7XgJxzca/FxBElFGLqswtQhqwiWFwryo=
X-Received: by 2002:a05:651c:1476:b0:30d:9198:5e81 with SMTP id
 38308e7fff4ca-3264f01a3c7mr9896271fa.9.1746525840156; Tue, 06 May 2025
 03:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
 <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com>
 <CALHNRZ9s5EdL3vapyJS4TdT=v5v_QG-=n8ABNJDLU4B-7w+wRw@mail.gmail.com>
 <CALHNRZ96Cs8+gyyb=_jTpvCq--uF3P1s8_m7t25nN_vPx0ELXA@mail.gmail.com> <66776953-ef1d-40ac-9d4b-a35a6ebae20c@nvidia.com>
In-Reply-To: <66776953-ef1d-40ac-9d4b-a35a6ebae20c@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 6 May 2025 05:03:47 -0500
X-Gm-Features: ATxdqUGvlu7DDYzmMS6LwM0KhqiAoWJKCs8SIgUhl7XFqFsl_6mr2D0nBIij5Xg
Message-ID: <CALHNRZ8uXZQObwQBC-sLudUdtprM24qU5yYdb4D3FEP2AQVkmQ@mail.gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: Jon Hunter <jonathanh@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:51=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
>
> On 05/05/2025 08:44, Aaron Kling wrote:
> > On Sun, Apr 20, 2025 at 8:44=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> >>
> >> On Sun, Apr 13, 2025 at 11:45=E2=80=AFPM Aaron Kling <webgeek1234@gmai=
l.com> wrote:
> >>>
> >>> On Fri, Apr 4, 2025 at 3:18=E2=80=AFAM Aaron Kling via B4 Relay
> >>> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >>>>
> >>>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>>
> >>>> Currently, if usb-role-switch is set and role-switch-default-mode is
> >>>> not, a xusb port will be inoperable until that port is hotplugged,
> >>>> because the driver defaults to role none. Instead of requiring all
> >>>> devices to set the default mode, assume that the port is primarily
> >>>> intended for use in device mode. This assumption already has precede=
nce
> >>>> in the synopsys dwc3 driver.
> >>>>
> >>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>> ---
> >>>>   drivers/phy/tegra/xusb.c | 8 +++-----
> >>>>   1 file changed, 3 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> >>>> index 79d4814d758d5e1f0e8200d61e131606adbb0e2d..c56e83216d0f566a09b6=
7377172fb04c8406f4cf 100644
> >>>> --- a/drivers/phy/tegra/xusb.c
> >>>> +++ b/drivers/phy/tegra/xusb.c
> >>>> @@ -731,13 +731,11 @@ static void tegra_xusb_parse_usb_role_default_=
mode(struct tegra_xusb_port *port)
> >>>>
> >>>>          if (mode =3D=3D USB_DR_MODE_HOST)
> >>>>                  role =3D USB_ROLE_HOST;
> >>>> -       else if (mode =3D=3D USB_DR_MODE_PERIPHERAL)
> >>>> +       else
> >>>>                  role =3D USB_ROLE_DEVICE;
> >>>>
> >>>> -       if (role !=3D USB_ROLE_NONE) {
> >>>> -               usb_role_switch_set_role(port->usb_role_sw, role);
> >>>> -               dev_dbg(&port->dev, "usb role default mode is %s", m=
odes[mode]);
> >>>> -       }
> >>>> +       usb_role_switch_set_role(port->usb_role_sw, role);
> >>>> +       dev_dbg(&port->dev, "usb role default mode is %s", modes[mod=
e]);
> >>>>   }
> >>>>
> >>>>   static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_po=
rt *usb2)
> >>>>
> >>>> ---
> >>>> base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> >>>> change-id: 20250404-xusb-peripheral-c45b1637f33b
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Aaron Kling <webgeek1234@gmail.com>
> >>>>
> >>>>
> >>>
> >>> Friendly reminder about this patch.
> >>>
> >>> Sincerely,
> >>> Aaron
> >>
> >> Friendly re-reminder about this series.
> >>
> >> Sincerely,
> >> Aaron Kling
> >
> > It has been over a month since this patch was submitted. And neither
> > this nor any other patch I've submitted since have been reviewed or
> > responded to by any Tegra subsystem maintainer. Is there anyone else
> > that can review these and pick them up? Or is there any other path
> > forward for series that get ignored by the subsystem maintainers?
>
>
> Sorry for the delay. I have had a look at this patch and I am not sure
> about this. The function you are changing is called
> 'tegra_xusb_parse_usb_role_default_mode' and it is doing precisely what
> it was intended to do. In other words, parse device-tree and set the
> mode accordingly. So forcing the mode in this function does not feel
> correct.
>
> Also from the description it is not 100% clear to me the exact scenario
> where this is really a problem.

My specific use case is booting AOSP/Android on Tegra devices using
mainline support. Android debug bridge is configured to use xudc on
the otg ports. As mainline is currently set up, the default usb role
is 'none'. So if I boot a unit with a usb cable already plugged into
the debug port, I cannot access adb.

I originally fixed this by setting role-switch-default-mode in the
device tree for every device I'm targeting. Then I looked at just
defaulting to peripheral mode in code. And as mentioned in the commit
message, other usb drivers already default to peripheral mode instead
of none. I'm open to other solutions, but requiring every device tree
to set a default role doesn't seem like a good solution either.

Sincerely,
Aaron Kling
