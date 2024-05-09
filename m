Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EAA13A87A
	for <linux-tegra@vger.kernel.org>; Thu,  9 May 2024 04:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715228203; cv=none; b=Yp+Od1IWiNeXuA1mg86m5hEyvYT7xXOpR7TbbzPf+GT4X7Xkb3OGNhAjKz8eqkNy42v77E6h+7aCfpgNIhI9pGhp9ucz6Igj5azpAg6S78tWu+D64s4S8I20mau5FBBhdPpgpkRJLVIPBVINP/rdd0D9gQhzG6KkZyFSwEF+jCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715228203; c=relaxed/simple;
	bh=M8OzvcYBmKGDKjXGMF5Iys8win0xxLaBpfz7DSCaZzA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0ks/xMZ8jGdPnG/YEK2hY5CkH4PxrpRFyCLar90vhIrbCu7A3qYZ0fsNGeqJ+tfq8mIjNs27PVSobTN+4qhSq/VcKwwF6rm+JP0r89tlm69F/mMTDN30bV8WGCaaMtwSBodXcOWHPZHlVI/8EJXkniPoL0QA3ypP8XS0isdJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e98909e1-0dba-11ef-b3cf-005056bd6ce9;
	Thu, 09 May 2024 07:16:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 07:16:30 +0300
To: Frank Li <Frank.li@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
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
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZjxOHpXITE_5I4lq@surfacebook.localdomain>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
 <Zjp/eTITvtTG8bBL@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjp/eTITvtTG8bBL@lizhi-Precision-Tower-5810>

Tue, May 07, 2024 at 03:22:33PM -0400, Frank Li kirjoitti:
> On Mon, May 06, 2024 at 05:20:40PM +0300, Andy Shevchenko wrote:
> > The of_gpio.h is going to be removed. In preparation of that convert
> > the driver to the agnostic API.

...

> Can I include your patch in my imx6 pci improvement patches
> https://lore.kernel.org/linux-pci/20240507-pci2_upstream-v4-0-e8c80d874057@nxp.com/T/#t
> 
> There is patch, which rename function from imx6 -> imx. That will avoid
> conflict.

You can, of course, but it will be not my decision to make. Ask PCI maintainers
who is supposed to take this series.

-- 
With Best Regards,
Andy Shevchenko


