Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220DA1D90AD;
	Mon,  5 May 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431056; cv=none; b=ISXwStM5TGTy2ZGa4/Ev/gFaTaN3SmjSFhE5E+gQogzXDA1LLWRaApDGluZ6yelOE0mYRP2nuSPyQxOF79RcmkeZDPATu2Bcya426ETpQI0zhgUXon6ncIz9dvSZTTbRUoIrgktf7J4veevMkSCDW6ywovhkVtrUdQAL+H6kM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431056; c=relaxed/simple;
	bh=UcisPycVUYK3PjUw1OKyl8AUVBZDMva3bOuLoGD5qUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWhn5eOwfGzBDq7F5AvI7eVl07xE+WvwwbTrJbs8/0bfaj7nOpEP9r89UH7gTrXj9CWXTamRu9/ItX/K13ykNartxzXrb+NDNTEe5qBAO/WweimeGrECRJE9QqNwL030VmwH53HtUPBynbioTGR6kMw3XENsiQmZOJucuxM952I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxPthzR3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxPthzR3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so4286286e87.0;
        Mon, 05 May 2025 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746431053; x=1747035853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YfZlMj5L1rIXbKZqZyMAiXs3rNL2+v0csZ4Sk0W44A=;
        b=cxPthzR3GomjKuYVGQsWobGp0XIYxVCGLf8/JxdqIkb85ryjg0RfJQ908LC0R9LZW8
         rbdA8hA8A6VppOmJRk45ZSxHE+1zWixwu55xD89xIJXDJc4hsFmfwBdTF2cNEh7VxC67
         EVWmBwVl0uZynl6W7uHmm94u/Xa7CW53fSEdarQZ1R6xjfUQJwui2VklHVTcHwVu0+Q8
         4QUvy691OIQ5PZ9LflqR49Ty4CaGAWO+eO1YGGjvmcFD7TlX0th2ysIT42v5c3zVKSB7
         7HDFFiZ37ewzRddZu5/T1cw7jnFJWnbIxx/hCaEJlGIRS2saJl6uukqBixhHmnzpz/Fb
         GvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431053; x=1747035853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YfZlMj5L1rIXbKZqZyMAiXs3rNL2+v0csZ4Sk0W44A=;
        b=MLOvIgGNVy/PJb1X2MSGZlvqLPbidudupAa97XgCe4ejb/RmJAcg8OBq592+5nt7RP
         b/9AmAFDi/oLwM2uFZ8sSCYyuBS/nS1AVRdZwZuPYKgVLoZMjaFHOnVFLGFbxVyLQ0RO
         N4KDojtE1/bsyjMNYpnlXdkz05ROb217UUrlTGmbv7Gh6sFYi+TEuzeBrJ+240dLyOoQ
         T3m5ebqreYKyGLUZRHjZBq430Nkup//Lpapq6tvKt9pzQ8RtjytJ7hsWno+E1EPMKX3l
         mrOYtnKTJ9n5Fehzekgz1B7y1szY4vviV0xkmkCYMt2GC/jfG9//v9GEt4ekEp5noIKV
         9ImA==
X-Forwarded-Encrypted: i=1; AJvYcCVak6f6L2hQ3a2yTE+hlNydb7HK2J5S4FtVlUjGO0fKJn4BbIPWOeKgpx3J6P5glIo1f8g5XoVK21QluQM=@vger.kernel.org, AJvYcCW97KhjzL0taujpBaIQK2udyZsGxHI0WskDvztGI9s/ouB3eB86uGUZS8cZY2bBf42s/Oa9tgHbzfY3UBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5F2RfpCovnEkNdjVIf2r3tUkvvK0rQ2c0Gln+N80mu2+ifCE6
	L+++IpNaRaD20iIHpPZJaBNFuhsPyXfzDeL0lgaO0Wpivsv9ocbnHMMYnGilgF2QKt8LUS2uq1R
	WL4MJw5pzN9+lE5Jg2xR80iSi1Bo=
X-Gm-Gg: ASbGnct3+SgOzTGOSUMfFMytraNaNbydvLmiZRomRaw2Qh9jkH9/708MFJSI0DxSSFP
	tE49KZ4V/U39y+FJLAAWkDlpwxJaJI++Py2pWtTkuzbxwC3q2MN2EcrGfcSZPfPdB4BeUG30a/W
	988v5eVYwfmgXhfszXPo0nOA==
X-Google-Smtp-Source: AGHT+IHc0fOmjO83nNf2FMWszElkKLmBS+1uX4Zwc0i7HMD+sMy5SEc7Qd7c1xzbkVCLpvs9dxwi5C+lK1UiNofdkpU=
X-Received: by 2002:a05:6512:39c3:b0:545:1082:918d with SMTP id
 2adb3069b0e04-54fa4f911d7mr1882118e87.41.1746431052827; Mon, 05 May 2025
 00:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
 <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com> <CALHNRZ9s5EdL3vapyJS4TdT=v5v_QG-=n8ABNJDLU4B-7w+wRw@mail.gmail.com>
In-Reply-To: <CALHNRZ9s5EdL3vapyJS4TdT=v5v_QG-=n8ABNJDLU4B-7w+wRw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 5 May 2025 02:44:00 -0500
X-Gm-Features: ATxdqUG8e1J7-Xz2G1fIUZsrs4RbLP9uMITH__FF3GvRP5n93247IAapcHKUjXY
Message-ID: <CALHNRZ96Cs8+gyyb=_jTpvCq--uF3P1s8_m7t25nN_vPx0ELXA@mail.gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: webgeek1234@gmail.com
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 8:44=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Sun, Apr 13, 2025 at 11:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Fri, Apr 4, 2025 at 3:18=E2=80=AFAM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Currently, if usb-role-switch is set and role-switch-default-mode is
> > > not, a xusb port will be inoperable until that port is hotplugged,
> > > because the driver defaults to role none. Instead of requiring all
> > > devices to set the default mode, assume that the port is primarily
> > > intended for use in device mode. This assumption already has preceden=
ce
> > > in the synopsys dwc3 driver.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  drivers/phy/tegra/xusb.c | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > > index 79d4814d758d5e1f0e8200d61e131606adbb0e2d..c56e83216d0f566a09b67=
377172fb04c8406f4cf 100644
> > > --- a/drivers/phy/tegra/xusb.c
> > > +++ b/drivers/phy/tegra/xusb.c
> > > @@ -731,13 +731,11 @@ static void tegra_xusb_parse_usb_role_default_m=
ode(struct tegra_xusb_port *port)
> > >
> > >         if (mode =3D=3D USB_DR_MODE_HOST)
> > >                 role =3D USB_ROLE_HOST;
> > > -       else if (mode =3D=3D USB_DR_MODE_PERIPHERAL)
> > > +       else
> > >                 role =3D USB_ROLE_DEVICE;
> > >
> > > -       if (role !=3D USB_ROLE_NONE) {
> > > -               usb_role_switch_set_role(port->usb_role_sw, role);
> > > -               dev_dbg(&port->dev, "usb role default mode is %s", mo=
des[mode]);
> > > -       }
> > > +       usb_role_switch_set_role(port->usb_role_sw, role);
> > > +       dev_dbg(&port->dev, "usb role default mode is %s", modes[mode=
]);
> > >  }
> > >
> > >  static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port=
 *usb2)
> > >
> > > ---
> > > base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> > > change-id: 20250404-xusb-peripheral-c45b1637f33b
> > >
> > > Best regards,
> > > --
> > > Aaron Kling <webgeek1234@gmail.com>
> > >
> > >
> >
> > Friendly reminder about this patch.
> >
> > Sincerely,
> > Aaron
>
> Friendly re-reminder about this series.
>
> Sincerely,
> Aaron Kling

It has been over a month since this patch was submitted. And neither
this nor any other patch I've submitted since have been reviewed or
responded to by any Tegra subsystem maintainer. Is there anyone else
that can review these and pick them up? Or is there any other path
forward for series that get ignored by the subsystem maintainers?

Sincerely,
Aaron Kling
