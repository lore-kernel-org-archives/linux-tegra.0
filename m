Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F5214E2EA
	for <linux-tegra@vger.kernel.org>; Tue,  7 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076245; cv=none; b=Mh9GdVvJjmMXnaAGoqWhoPX7vyPiBNk0My7Y4p7GAif6kvqr2qxMxkTg0HH0im/N1rD6Tbbe4gr9QmGN8uxbFuW4c2RZLh51DaL36vT4XwNhKqr3o4HuOF3fG5wWpqiN5Kc2cBVkeZ8L202C8cTEf3ROTYoP07H9gYTwXsZVAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076245; c=relaxed/simple;
	bh=jnbmoIfEkquEEjiJBAjqdCDBxOD1+Yzt7A7OKiFlJfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaH4Dtf/C4FNmj0ePYEpCW0TCwGlUhQY7Z1Kux7XROsMS/XMiLCA0ruDx1Q6UK3ew8wJFIAdT046Uddc44sBcfOUpEVdlR73xtR1WHE3l9MdsrnZk1wxOCzi95nSIHryQvt30tTzV/Vh9vaz78D6ZjoU7fK8jmLyBUrW9BZuNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClqbICPf; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClqbICPf"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2884381276.2
        for <linux-tegra@vger.kernel.org>; Tue, 07 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076241; x=1715681041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=ClqbICPfGWs4b3Kil8wr9qUk9sNcSadQx7MKrglRxSUZNtKHMoGjJUbwrtS+2iOZJY
         eadxodiGOSOVLNQMyvANf317P6IFUtwTyUHhLOt7M7tvuVa/fwz9wN/+erbwFLXG2g2y
         1oH8B115XICgrEKBcpZvfl1GSSwX37sXhcPF1RBF2im4pDZLcSScd1kn3Gou6n+G+CNJ
         MDSKhUcbfeueiOci2vFZoYnyvQC5mgekuBzf5piN9ZJrWOwhVArEPla0MNH3XSuSPEQN
         u87VP4F0SjIDS3IEoI6MmIpP0Ep7GIo0z+K7dW7iDrf4EWBDrubFEtAe81yZDOMJhAG1
         LZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076241; x=1715681041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=v8AaebBeO6fy7X2/7507a2RS0WWiN7sUJqKsD/gWb6Bywhk9eVD4HDBghlmIWtGlZ8
         fklGYSVuw7TJH6R+QYz98829QGV6zCRNNASSL++iINsygA/OuadUHXMQkDZFtHFOll28
         v05fY6Vc4xTuXis0hXyi5BNRUkSNbNYkC1JM2YC6VuoXeIUoU1/yA5eww5eAISbjgAgx
         M6ffalmSntjtU1Ay2qIyOZz94zYgalBph6HFS7618a6t6SYhTke4fhmWHNRPxrFmppD7
         TZpPEZAmrfwHnexoSdv4Z+ZL31nA7uPGHwYbVtFEUwcvFy8kFIep0KCS0ONgXb06UFqm
         b/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9pGX/eMK4FKHVOZ4BdVIlcDtO9M+vHmQbZq93iHW3BZ1Qpvyb4Go3KNfIwJzho4pCZomH9jR8zHywC6nMULYR5ab9Syt/TP/9m2U=
X-Gm-Message-State: AOJu0YzbfAMeRYPWVjV3CYycobUQhbjon7+sFRy5kbwEkdw7awK8cpM/
	5HqlIjU92GOGbRTWzalunl4hd5KhB9Ps6V0uRORAv1x7KbCc5cAo+cCfv2EjuYJy2qUAQuC/5Ob
	Z25W4zT0rjJmtGw61Fj9BgnNTNgoVYs6WtWHqxQ==
X-Google-Smtp-Source: AGHT+IE6RbboWA6zivUgxElWhiInYBOoZKZxCooBjJtVLVKzpcY065ewr27Om73FjNB7+c1CsbFfoFINBaR1I1fIna4=
X-Received: by 2002:a5b:912:0:b0:de6:3c4:c3a with SMTP id a18-20020a5b0912000000b00de603c40c3amr12223334ybq.10.1715076241415;
 Tue, 07 May 2024 03:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:03:50 +0200
Message-ID: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In v4:
> - added tag (Mani)
> - fixed a polarity bug in iMX.6 driver (Linus)

Looks good now. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Perhaps the use of  _raw accessors could be avoided in 5/5 by some
elaborart polarity quirk but I'm no perfectionist and it can be fixed later=
.

Yours,
Linus Walleij
