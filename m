Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FC2561C
	for <linux-tegra@vger.kernel.org>; Fri,  8 Mar 2024 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709917844; cv=none; b=lazXUSjNCou7VDtPA64eLjAB4tIzvJFI2/W5jxvFFFORCKGOARbsqhy1vcvU1DkujQPZ2s45M67IegwO9maJE1bKYazzHgJ+5/rXnPglckHjd0diKWoDnE2EujXn92uttCk0e83VS+84NBGNMiLllbcR3bZAYPKGgFDoHhWCY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709917844; c=relaxed/simple;
	bh=HzEEo1FuAZnGJUVCVuHaKfjVwk766+6hzwh+AAu2Lkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grhJEJaIOJkDAamkUf7CnldkboaEyOPa3pWhh1x6vd8RMRpt2L5NJdU9M6d8HNwYUJKjRq2hI/1IbQAhmOM/EJlQMDKvxDoGcw5T77IZid3hUCy04OvNdSzPElzulBQp8eobBJBGFSj7sP0xjmol3oduGIol/HrkpSrAbD9EUCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMQdxgs3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMQdxgs3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29b70bf6c58so856220a91.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 Mar 2024 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709917842; x=1710522642; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2kWEuzgRtKwEAwMhmmNmodaPq/DI7wxcR5vXLJ04Wo=;
        b=xMQdxgs3l7YLOjNGixyvgxQtqkeyBA1La7VbiP36ZjCqGMQKgVr8elooWoqrsbixxe
         fgtYeLBIvJy6Vl1Qk3qViMvdVIpdjAfXdwcgCsIxdTaGfUhLZ6e7y54DlJBtLQQnNkLd
         IOMHJIJWbaX/CN8vASDqWtNUKLQAPgl9PchVV7Ln+btysY0ivb71NElMS7x3oZspWlkG
         W/jwdOkoyQ+fnAR42HxIkXNaBol/RB33zsoBRGFL0XLgSp0Q5gstYAgDLoyUXyZkPgI/
         06bY8lXBGux2fy0/oewvjWsdOE2XS4wmUYq1SU4WOs4a+mqFjfqJbB4IVhKLgc05ygc5
         9APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709917842; x=1710522642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2kWEuzgRtKwEAwMhmmNmodaPq/DI7wxcR5vXLJ04Wo=;
        b=DblK1ts/B2VwdyaZmgShowBaUt6xk8Vqt0RanShskmvKk0uCFAO2C6DF8l9rmRuS2K
         HXdrUCVG3rnlMF92nIBByqYNea0GFBmDMtpFuFGgdgsdJPd6U8Q2vVvOwPzP6Q3WH+gF
         euoxHRsFQnq6emfzetdRWS56QBkfguSqwZUMK53NgQiUbMHJtC8zR4dmefQs3y7QKJLI
         jLlGbC1twFw21+9zyM8zagACP8svu+Ss8SFpbJ2tuznPlcf7AoE4AN2eE3lwW3wAWG7/
         aIftpEnt5xIMKA8Q7To9vaH2Zx3E5GKCUa2aQdg+H/epucUzIiGtXwrBT2GirVbcVTX0
         prSg==
X-Forwarded-Encrypted: i=1; AJvYcCVRx0qdMVmd2D56Tevt+Q2yEYGi8X6QWUpk9SIz1xkC1/rAsdbG21SVGJe/SCcxKnb+yl3OIlEoLhdwORp4og/dhiSdeoKWdhorGfs=
X-Gm-Message-State: AOJu0YyKaeeg6v7/PYtyrj3bh8fv2f8K5vCKbdybNeG8tFfyKTjyZ1bH
	+UQxmTTSCAIt2z/u7OeKP9tJlxDq0ktP6iRIv/lojWqzP9256Ouoxps7fPTZpg==
X-Google-Smtp-Source: AGHT+IFZZccyoD4Rjms9sGylhl/6bi13hc3TIZoTOmk5GJOEjCrpAwbGuEHC37AMF3es6hymzRJPLA==
X-Received: by 2002:a17:90b:318:b0:29b:b6bb:17ba with SMTP id ay24-20020a17090b031800b0029bb6bb17bamr567988pjb.46.1709917841853;
        Fri, 08 Mar 2024 09:10:41 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id k61-20020a17090a3ec300b0029ba1b5a692sm2470187pjc.12.2024.03.08.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:10:41 -0800 (PST)
Date: Fri, 8 Mar 2024 22:40:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/1] PCI: dwc: Remove unused of_gpio.h
Message-ID: <20240308171029.GB53064@thinkpad>
References: <20240307122840.3682287-1-andriy.shevchenko@linux.intel.com>
 <20240308095547.GI3789@thinkpad>
 <Zer_9VTVJqCNoOFG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zer_9VTVJqCNoOFG@smile.fi.intel.com>

On Fri, Mar 08, 2024 at 02:09:25PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 08, 2024 at 03:25:47PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 07, 2024 at 02:28:40PM +0200, Andy Shevchenko wrote:
> > > of_gpio.h is deprecated and subject to remove.
> > > The driver doesn't use it, simply remove the unused header.
> 
> > What about the rest?
> > 
> > drivers/pci/controller/dwc/pcie-kirin.c
> > drivers/pci/controller/dwc/pci-imx6.c
> 
> Have you chance to look at them?
> 

Ok. I failed to spot the usage of of_get_named_gpio() in both drivers. But you
already submitted a patch to convert kirin last year [1], and that didn't get
any love from the maintainers. Could you please respin? Perhaps convert imx6
also?

[1] https://lore.kernel.org/all/20230213180735.42117-1-andriy.shevchenko@linux.intel.com/

> > There is also one non-dwc driver:
> > 
> > drivers/pci/controller/pci-aardvark.c
> 
> Keyword: non-dwc.
> This patch is for DesignWare controllers that confirmed not using the header.
> 
> > It is better to remove it from all PCI drivers in a single patch.
> 
> I disagree on this. These are different drivers and even inside DesignWare not
> all of them can be converted with a simple change like this one.
> 

Since this is just a header removal I thought you can just send a single patch
for these drivers since there is nothing special that warrants a separate patch
for aardvark (both are inside the drivers/pci/ hierarchy).

But anyway, I wouldn't press for it.

> That said, please consider applying this one as is.
> 

I can give my R-o-b tag, but Lorenzo or Krzysztof will apply this.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
