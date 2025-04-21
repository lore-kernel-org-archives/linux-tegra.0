Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417D51E98EA;
	Mon, 21 Apr 2025 01:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745199859; cv=none; b=opg9RyG7AxoJepYvXLLylBbIXtp+cEUvt+Gl+LKEtpCOdrYtjWwWnNTcvs0oOE+vJ1QdSousnFurrzbCbrSzNQ32VC5I9An1r1qrr6w6q8wLpeggDcpP9HIJugOXMz2+Bnl/lCijutGOFSjnx/HCoQ5hm4mEysHL0YAoaVNH4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745199859; c=relaxed/simple;
	bh=1MWplbGj6J2kyMfB0GnmgHQUiASFoOeWcVvnaU+PZpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SE5nz1S0nP/tHFcFEXm3rXV5h7Z6OFkiSgyQHrz4YSSrRmfyWhdYV6ZgrUUp8MGFpFvBjoqgn9A+c+3u6fYIS1x4F/verRtyDrWUaUckDNEvnyNW+mTXD3WetH8JIV/UifUBBmwMRiEmJfLPMbkACyp0Frqj+yo8PanRo+lm3VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im4/2uib; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im4/2uib"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso4702157e87.3;
        Sun, 20 Apr 2025 18:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745199855; x=1745804655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNsP8TLxSjuJhg4MR6E04vLB1ANe+AOPTx67417P+WE=;
        b=Im4/2uibvNRYt0SDpBQGeO5/RgEdGqLQqhWQ2uo3C7tToyCo4O1ErCMHImD5gQG18u
         DCGyRq+F9S1qNeHyrOo5+0CXmRMF0z1Wjk+YqfhdZX+H15ZsS2uHTgeM3PzkU+ZVLiwt
         Lbw+2Sx9ryX2TqCVuvomlBmfKGLVdtYVF3SeOc8Xean9iloHThBVm45khCBJogAPwsvZ
         W7UvZc1djXoHqSuYi8qcrsDPxlA0svKD4iiCEIqCnysFTbScYcyB+s7cZCWoL76DZMDM
         v0gg0hLVAQL0sUFT/I+9HzQnb0pCtGz9OGa3JnEx5f6OUVtXj9pz6oSto0z7cKzNU0Le
         XEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745199855; x=1745804655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNsP8TLxSjuJhg4MR6E04vLB1ANe+AOPTx67417P+WE=;
        b=aLSaPF50DL/h1m3kPmuqOH+jM7yM/HS2B/lsY8MP0lYHBoSvsLCEd46L2c66Ors5LI
         Zx5YzwMYeo7B5RPpm/GQWKbbpSSKA5PGeh7894srhiVAt8NtqI9uolNCBl5xcOSJwSXi
         F/3/Am5VoCdhie88fQ9ToKoDCY9SMNWEZOCJwVTITxxYosf+S/SqxuINdQunk2UqbBv9
         EMUftmp674L8oE7tmCxy0QFfsvIyJXuIAaahfgJrTQQ8d3hJZE2/Kpkeee5RjRosfdao
         q27W8Jpnm4EHFpXgbIc24ROHTrQ29PhfHNLuH3YHTTWNQRAP48o/6cmG1PjTeHGoc8cA
         zawg==
X-Forwarded-Encrypted: i=1; AJvYcCUMFu0jQjJfE9uzQoVG2vUcszuD6eGEj6UtbD3TXDLpW3MVyzsoZrqiDZ6qgiiqI6hR0nTSjZ/xnk1MSL4=@vger.kernel.org, AJvYcCXKyCngke54QrbucR6+9e7WGXyfzQEwFcTfQK0StqNIg/I++EqQzUwd2TK56a0CByJv00ZrG0z6J5JzO+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqpqVgo2nD4YMej/oZaHlt4pTg6oupsJWQ8pSFV64vOLovJOE
	fUXJ7okUjf0CqicNwpFQqfXM7a+dkVDthq257SpAz9AABujw9dVOC5ThvPyJacCwt4baAHEuG3C
	ts9QeqI4nM7i6l0jv7NQ1WFS3j3U=
X-Gm-Gg: ASbGnculhltwF1TDovPR5DLGm3J/d3E/EYI4hqtWeaSqxErjn/c3OmWA0XY6HD3xmEg
	inOAv0NGP8QObrILNbI986PVG6V7lgzD8RvFruZd71VJUS6MT5mASDvOIILsbLgO5/XAbm0KR95
	2HwUEBtrL9G07/M2pIRgutCKFgAtjbc4Sh
X-Google-Smtp-Source: AGHT+IFJLl/9yEM6wOg1YcMUI+mppVQUpO6qF5SpCVT+8GKVAgREPCb9zCBKUQIoF0AwDOC3aXUAnkrQH3n39mE1160=
X-Received: by 2002:a05:6512:3f21:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-54d6e66c65dmr2824515e87.50.1745199855053; Sun, 20 Apr 2025
 18:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com> <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com>
In-Reply-To: <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 20 Apr 2025 20:44:04 -0500
X-Gm-Features: ATxdqUFF7fzxh_DaX7KhjifiWMQ2sIaayfrHFWcFH33ybOICoCOmsho-NVU-v8U
Message-ID: <CALHNRZ9s5EdL3vapyJS4TdT=v5v_QG-=n8ABNJDLU4B-7w+wRw@mail.gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: webgeek1234@gmail.com
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 11:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Fri, Apr 4, 2025 at 3:18=E2=80=AFAM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Currently, if usb-role-switch is set and role-switch-default-mode is
> > not, a xusb port will be inoperable until that port is hotplugged,
> > because the driver defaults to role none. Instead of requiring all
> > devices to set the default mode, assume that the port is primarily
> > intended for use in device mode. This assumption already has precedence
> > in the synopsys dwc3 driver.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/phy/tegra/xusb.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > index 79d4814d758d5e1f0e8200d61e131606adbb0e2d..c56e83216d0f566a09b6737=
7172fb04c8406f4cf 100644
> > --- a/drivers/phy/tegra/xusb.c
> > +++ b/drivers/phy/tegra/xusb.c
> > @@ -731,13 +731,11 @@ static void tegra_xusb_parse_usb_role_default_mod=
e(struct tegra_xusb_port *port)
> >
> >         if (mode =3D=3D USB_DR_MODE_HOST)
> >                 role =3D USB_ROLE_HOST;
> > -       else if (mode =3D=3D USB_DR_MODE_PERIPHERAL)
> > +       else
> >                 role =3D USB_ROLE_DEVICE;
> >
> > -       if (role !=3D USB_ROLE_NONE) {
> > -               usb_role_switch_set_role(port->usb_role_sw, role);
> > -               dev_dbg(&port->dev, "usb role default mode is %s", mode=
s[mode]);
> > -       }
> > +       usb_role_switch_set_role(port->usb_role_sw, role);
> > +       dev_dbg(&port->dev, "usb role default mode is %s", modes[mode])=
;
> >  }
> >
> >  static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *=
usb2)
> >
> > ---
> > base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> > change-id: 20250404-xusb-peripheral-c45b1637f33b
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
>
> Friendly reminder about this patch.
>
> Sincerely,
> Aaron

Friendly re-reminder about this series.

Sincerely,
Aaron Kling
