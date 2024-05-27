Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F7215F3F6
	for <linux-tegra@vger.kernel.org>; Mon, 27 May 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817078; cv=none; b=QzjT5aDdQoLDPnU5/BWhUFrIrYHuEeA2zkRPsCctRgqNhqzWS/DWUzzDmxYfTN+AiDf/iBIdI3iPDjNoyypwa0Q8GMuxIc/HoIW088B0yh67BkDdfsL05F+azeZa9mohjC8rDOR/5mFRzAF1N8S0Rzg+2NcIQ+QDsrhoagkSAYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817078; c=relaxed/simple;
	bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HA+hy5DhNq2NVnGg/PZYG6iIw2afQpNPlj88zI+uRCir3hdcE5+IEvt6xogZ0rTWBcg3KC67Cy9Of05miP/ftbKtcUazwT3DEbn66lBQMdv9pDtefHh5axPZHgZwPOPNcT1KDxgu9KSQNmIVyrabJoNvPNO3TnUziATpW4hYv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCgZ0cWU; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCgZ0cWU"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df7812c4526so2412390276.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 May 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817076; x=1717421876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=eCgZ0cWU8XvjJ+3rIdwk38GQ85ioZedXr/yh5C1PXCUy8eujLIBsVkzmEo+lI6I5Cy
         9aVz0PgLjw27AN8C7BzX2tlR/2aQ/SvKOJIXp/oZdMPBHWAtYDPvGY9PryXGRjqGlilR
         6dR8+zzCiiJECAVS1G6fGl90VA69XEArGBpcHxiCUkGUsUejtZIGnJ9UdTZ8RpYa3lYq
         RLBpEPtzijIS89HWplQnqZs9P1HnOUeXr//TGnLnrikEfqO4gdrbNYJoLP/RwS36U6Dr
         eUQs1y9hPRUIUCoRmoAWpCkce22ZPFdBeklMPj1+0fhp+KdMBNo6TVQOmOAPU5yUTNUh
         RvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817076; x=1717421876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=PzUD13ROwwToYrLwDE/23pwnpvhOf/Rz5de1V6CwYaTl8+adFsWgr6gUBOctio+ii+
         8+PA/iS8DhoR0YeS6xHDdge4ahiAOVvX+Vg9Nq5kiNfDzPE30Dmd+XUvFVuqVucUKl7g
         G04hxJOzwMLP0U95ELHRvmcsMJsf2iGLyc/9B840J80uVzTir0Os4euhhgSe2L3UmnQe
         0LnJNcBUUmjyDQphGrEB6nV+7Xv8rRm8oWKccYva8Vxr/34z9DY8AdL1bVgSn4H7BppX
         i2V6v8XObZLgkKTBt2dTIsFVTwoAc7wr1owfmupGvO9Pn47iDS2ywl3XobRWbhweqZ/q
         H4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWr7GZDD4iDBsaALHnY5RIH9Cc7gMLzJqOxWqPvHTcq7bW91xb0AS71h9txn/M6VK1eWfVURR0IzReOepHKNiNw620NbdUDOuAfDzg=
X-Gm-Message-State: AOJu0YycxwDGN7bfMLb+bunkjfJTdGDvS3f4cccJBx6jy2QAkU9Ga7VA
	t9+iJincABbjq/wbP2EkHNXq4X/5oJv4h4Uxn6IbuEIJhM8H4jI31T59T6xL89LytaGyc25VG+J
	CJqIWxyEi3r+YwwZQrXpqf9XMLEHcRgxhgAaPRA==
X-Google-Smtp-Source: AGHT+IG3ODce9dNV390Ozs9wlqpcGCT+NP7kvAR3YSrx49G8pypddGGuh8zJs0qLVCnoqGn9N6DYCNxnN4AlbhGb3Ao=
X-Received: by 2002:a25:d610:0:b0:de5:9d13:591b with SMTP id
 3f1490d57ef6-df7721c660emr8663079276.32.1716817076072; Mon, 27 May 2024
 06:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com> <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:37:45 +0200
Message-ID: <CACRpkdZFfjCitNiGVe=F4Jd_M36fqdG0ixD7396xEVbvqZUdyA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
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

On Mon, May 6, 2024 at 4:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Would maybe mention in the commit that the quirk to gpiolib
is already in place (people are already confused by it) but no big
deal.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
