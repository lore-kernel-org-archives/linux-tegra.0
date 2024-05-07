Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067613B78A
	for <linux-tegra@vger.kernel.org>; Tue,  7 May 2024 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715069700; cv=none; b=XwbiGOnWMcDdSb+K09wEA0cCx442dh4HnTKpahEXGizyZSjchAn46YpUo5LnqRjKmnC4WW1zfalHMuDoxYxteNgmJrMQogoxc6XLGhoi67bBSJWvPSNpA9du0nUumKFvaz4OFPAQ532ZaJmzK7Gc9n8uotaQS1978lyl56+V0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715069700; c=relaxed/simple;
	bh=aFQgo/ziy0W2y9xqCxx31ymI6sX+uIn9KFqYXFLiQWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3TbpQ2KUb1WWWh4cGGHpkBylUuMBfP3hm2aJ2edp/45fRIs+SOyKmsJYKAam6q7Qy5GjMblNJM2Ix1ZE0ZAAlDkLfFiL82k+dDbeI1UpJbY6pskGz8gVCI1qfG6SpDzEuKS0exDZ0Yba73JJcBcFHWmR3bmDfMInaf8I3/+yAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WiaqiOs4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WiaqiOs4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f457853950so1812123b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 07 May 2024 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715069697; x=1715674497; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqO/eiCLhjMrDJZ/oHlF6w3tQ/HJRwHOeX5fd3lD2/4=;
        b=WiaqiOs4w0dmyeF0WX0eWphYt4SUnUU4pIl3C2onmoAY8S/2+tHY18nBKQraXLzcIE
         E50OFNdm6XtlUTOrXANbh770kdECAPyJowHDoS4NDH+qyVd8YTwLr/pZoLYe7oTZSe2w
         lGPQ+lxGX+ZrCmk1Rr8mRdBP3lFTYSk3uvXJ9JUQT6VbmXkRLJC70PU3TuwLgZ0drLsJ
         z+uPjIPOtshmkx2yFNu95N8EoiYmdob3eBSQnMED7OXVEAsi8TJ70T41y6GyRcdqNlZ7
         SJmLkGO4BcTi//xa6c/QEhS35bdgK3Fl0h15EM1kKTXXQPXT/8xIfFt9+KSxsyw+MjwT
         jSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715069697; x=1715674497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqO/eiCLhjMrDJZ/oHlF6w3tQ/HJRwHOeX5fd3lD2/4=;
        b=unXRot/W2lyCa6coC2WdIps14oUx59UXMuHmdZZgoZ6kfEs+5Bg3RdLoSaKnO/2p/E
         ZscaheuBIXIy+HWeZRCojTcZ79kAPVCOIgxqpTO0ecxow/BnmRTr3dLDODHJN8OGsSdb
         HXhncEvQVYIPEVjSZR9Im3xB/+ZaEkgwFKZ9MXcy5/WwDMRGkKyDGWdcejax6AWsD1qp
         BW05BzEq3yBlDl225Q26/63qJKgDxSkZu+SdxWIIfXoMQUVj7uhk9+dVP83OqSsuPSMT
         nbQ6pu9v0wevAKBdocJpeFbbEj+YHX0dohOeXKv/I3RswiUs8sSs6kbfzPCy6AYa4xlG
         akyg==
X-Forwarded-Encrypted: i=1; AJvYcCXsh/adNlfQnw/24EudK21SXE70jryOBMix3PAx7rnDPuYn8rAg3n26YJaQCwxauEJahDaDkrL1uhzCV4Un2dP50zo4bsle8YFkcpg=
X-Gm-Message-State: AOJu0YwGcW0pdJrfLWYyb/HMKL+oA+mlltgowIy2W+zGDxUuxuUc6zbC
	tTWf2ljEtyUnhKaPA674S3D7Sw87woVtTZKS99trwuiJq+t2ydiaQUB42S5BtA==
X-Google-Smtp-Source: AGHT+IHnAZTFdWiXFQwCMQRZCYd4TYAmRcm6JIyFZLn9J3uME67W+T2rImADb2DRfd7XSqJSBOyHVA==
X-Received: by 2002:a05:6a20:3251:b0:1ac:3d3c:c1e7 with SMTP id adf61e73a8af0-1afbdca8a39mr2746431637.12.1715069696505;
        Tue, 07 May 2024 01:14:56 -0700 (PDT)
Received: from thinkpad ([117.213.100.197])
        by smtp.gmail.com with ESMTPSA id u34-20020a631422000000b00600d20da76esm9156572pgl.60.2024.05.07.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:14:56 -0700 (PDT)
Date: Tue, 7 May 2024 13:44:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240507081441.GA6025@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>

On Mon, May 06, 2024 at 02:10:24PM +0200, Linus Walleij wrote:
> On Mon, Apr 29, 2024 at 12:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The of_gpio.h is going to be removed. In preparation of that convert
> > the driver to the agnostic API.
> >
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I think there is a bug here, the code is respecting the OF property
> "reset-gpio-active-high"
> but the code in drivers/gpio/gpiolib-of.h actually has a quirk for
> this so you can just
> delete all the active high handling and rely on 1 = asserted and 0 =
> deasserted when
> using GPIO descriptors.
> 

Wow...

So this bug is present even before this series, right?

> Just delete this thing:
> imx6_pcie->gpio_active_high = of_property_read_bool(node,
>                                            "reset-gpio-active-high");

But this is just a bandaid IMO. The flag for the PERST# GPIO should be properly
set in the board dts as per the board design.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
