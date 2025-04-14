Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8809461;
	Mon, 14 Apr 2025 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744605916; cv=none; b=gadQ1g+glqsHl8ZocDnloSxu61SWwfAtTqvugUEqvLVT3nsJn3lsDebEKk+LKTUktMOcsV64KRwyWzI8j443iJFRDTa8vNfyw+EziJoyocw3YKDRSCTvBDal+psbaEcIswPIGhw0J2190j7fnWyutdcSdOJ3DnMmiH+FWhHq88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744605916; c=relaxed/simple;
	bh=zYqv5bRj9M7qiWBu0KP5DDWKYdaSVC/KUzyG/VznBIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXB300J2K+x8apf7zAPaOu1CSfd7WUI9nvGV4KlnjQVHeEu209mXdHLVyd0faDiwcDGaz1qMbnhRzyAN494uaqVSLR5kOh2LMdElXaO1zPNhqZwEifa4BICJXrgB7L32UrqZiP5BZnR1kQATQ/14sy/t1PVbloAOBaIPzqH+g9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l55MWd8y; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l55MWd8y"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c461a45f8so34355351fa.1;
        Sun, 13 Apr 2025 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744605913; x=1745210713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yc3jiQ8kZxV+LcAN0rkQAoQqLmjbhOlTCeWE9SKAIWI=;
        b=l55MWd8y8QuY96KElqS3rBX65weTC5UiMlJA7G3ugCY7u/YfvYDf8zMb/K3qA2A3SX
         jRHUSXNcUon3ENduO7VS/y8aTCGGQJNxKIW4Zi9vTIuO3ZGhJ8G34zI5rM+ryj/Gq2+B
         UWhKMFtdpANKyMEJ3F2GyXegGB1apGId+2lDOTIuP0oQtxAnerSKurwm4h2MLiNbOBip
         lcM0pc0hKfiBPLXHW/iYFMMsrOj9ybmNqzS58LHkhKIjED9MxdWhmh1T+HhfLnwcpINn
         5szcMqycyphHmtWxc2HcCeTIk7GHiBY/iVQKb/chlAGSO/NKIaXaE0joViG0JS6YYh/L
         inRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744605913; x=1745210713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yc3jiQ8kZxV+LcAN0rkQAoQqLmjbhOlTCeWE9SKAIWI=;
        b=DDEF0QVWd5E5xdBKmfelvoKY85zeZUVcg3p3AytrkAaTPu99ZtsSGoZyySGxakIuks
         7ww2ORKSQg1MEaVib5FUkMXJiOUE+ZsGI9UX8f9j0wNmEANYy2lvR+GMpRXBiqvS/+2l
         n65T786x4S93lEzRBxwW80mtyjOVoBSSVIC4j8MvikIgBbj9Y2QAaXvTXPCfPXiGIzsX
         iMpwCVGqvTf8F4yvr3mDLadxqJJI3z+RhdegwNiC4OoTfYPe/SarlbhvtUWxupUgNEmW
         5kasZb6Rdr8cXd+S0NgKLOi37alQ8pmfSKpUQLbAHMTuy3fixyX8wzv8jAjqkxXgNFSR
         4P3w==
X-Forwarded-Encrypted: i=1; AJvYcCUKS0oGg8T5ic+ivAYtuBDQLba8iOO8vruBadTBbsqIMw4BTjUGd7y6QKUTYG9bOANXvo72XLJTV1cNNIs=@vger.kernel.org, AJvYcCWyLcn6S8kHIobwPiqIBDM2QwVzP4+APSTzMzDh85TRY4Sbq4RynOd70fSEbVTwzOO4O3FXRU/F9Pagvik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxohl1eunNVMRFFENPQJIZi09HDx1iYPDXsF3AE+bcmJMqIiLwl
	2fEfiAdXQ4Mkl9Li8vyWR3VpmjhiL8rJab0+EO0kFkHFPXnSmt6VMhWuZk7NRMmaH+f8F7onhx7
	7j8x9NtNF2ZxJUi7NPvb87ScdyFk=
X-Gm-Gg: ASbGnctmVVEWQMlnputiKFR1+FSQ9YWGzWASylvvxAkkBkI4MJE9rnth3tFeo4HjCWB
	vZ4OrP8ZD7BZfrGcPAIQMnJHZ+oMKbzl/PtjthanNT7q6/HFpCA9slpkijqNYSGM+GtkCZigdtM
	FVLG8jpXiBSTDxjNeGWL+L8A==
X-Google-Smtp-Source: AGHT+IEW35UpKJ3TVFI5EnVSheZ5tHl+xOgElVMnA77E6wgo7u5O3iof6q5qmhz2WrQE+pWjN/KGO4h3blUSLI4s/Ks=
X-Received: by 2002:a2e:bd88:0:b0:30b:e96a:7d69 with SMTP id
 38308e7fff4ca-31049a9eff9mr30904871fa.35.1744605912293; Sun, 13 Apr 2025
 21:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
In-Reply-To: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 13 Apr 2025 23:45:01 -0500
X-Gm-Features: ATxdqUF57-rCxIpVekQ3O83bzoHuLDnXdYKspeuPx52uO3yuAc_oPztfCji0DhU
Message-ID: <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: webgeek1234@gmail.com
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 3:18=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Currently, if usb-role-switch is set and role-switch-default-mode is
> not, a xusb port will be inoperable until that port is hotplugged,
> because the driver defaults to role none. Instead of requiring all
> devices to set the default mode, assume that the port is primarily
> intended for use in device mode. This assumption already has precedence
> in the synopsys dwc3 driver.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/phy/tegra/xusb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 79d4814d758d5e1f0e8200d61e131606adbb0e2d..c56e83216d0f566a09b673771=
72fb04c8406f4cf 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -731,13 +731,11 @@ static void tegra_xusb_parse_usb_role_default_mode(=
struct tegra_xusb_port *port)
>
>         if (mode =3D=3D USB_DR_MODE_HOST)
>                 role =3D USB_ROLE_HOST;
> -       else if (mode =3D=3D USB_DR_MODE_PERIPHERAL)
> +       else
>                 role =3D USB_ROLE_DEVICE;
>
> -       if (role !=3D USB_ROLE_NONE) {
> -               usb_role_switch_set_role(port->usb_role_sw, role);
> -               dev_dbg(&port->dev, "usb role default mode is %s", modes[=
mode]);
> -       }
> +       usb_role_switch_set_role(port->usb_role_sw, role);
> +       dev_dbg(&port->dev, "usb role default mode is %s", modes[mode]);
>  }
>
>  static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *us=
b2)
>
> ---
> base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> change-id: 20250404-xusb-peripheral-c45b1637f33b
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Friendly reminder about this patch.

Sincerely,
Aaron
