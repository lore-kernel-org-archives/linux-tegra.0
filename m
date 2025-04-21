Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F42045BC
	for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225678; cv=none; b=orvI6vrOdzBpDO4oyZlLYry+nSQy+A0tRxwdmKxKAYuzr6kroaaAVoVhJ2QRqozwBj3VhGt/zlbary/i8vY3ZAveCtz4XPHuC/PreewwddDG+cC2c6IKTyRlJU0SJ9asmlgJmFFFELQe3tCGC81TCd2MyQZ/ichuc/ycu6/Bx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225678; c=relaxed/simple;
	bh=6owbIwn0Z92Iad5VoDVl0Hb7ifHZ5gRy5Bq1+R0Ao1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbzZaFfoWD2slBXRYxfR88tFKmm27uoo1uIn0FE0toYFLcL003aQv/MmTJWXIZxRGtf+yQZl3GAGYA35ZnWMtnUdfAbrUMHlWy9wdRRq1yNT1b4FabeDeRHpyOEJPMgdHAAREvL6HCDei+bwKaTLBqb4ikWAOTIqoyDmfym1/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0npXpJI; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0npXpJI"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af5085f7861so2575813a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745225675; x=1745830475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JsUANS/3QmGwXCVqQcGJa453VmqQ/CMnkdO6ufQpYW0=;
        b=g0npXpJIIrKrb+dQeVfkiJdfQDQj9SC/423WupUbj1wbxEeBo9tpuw5feyRaxe8m3O
         ptbotn4xNAuV157Y01iaOvoVqkw02lD6zNQmJn0qSU1Ptf61vyecuYzz+W+HCR6nbtvV
         gaRI7i0hDh/EqrfVJL6D/fVB/NKJ/z3CSQ8SbOX3dsMXTWbHok9WMgQ34OgRwK91xh0f
         nz9KhN6gFkR0WYZ+E9jctO+jY2SdukNCfBGrPWyOGmPtRFpKzC06KMldAh8qHxno/asy
         0EiQpfei5f07+AWzUIfXAB4dEhEMf8JgUPBcDujOtTCyPJC0WE6qX8XmHpDE0bAUjnIG
         zN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745225675; x=1745830475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsUANS/3QmGwXCVqQcGJa453VmqQ/CMnkdO6ufQpYW0=;
        b=KlD0PGIuqa71pYkrdUTJ+44BUCGhJJqvxPJoNNoqrI0qL9/Mb1HScZx0uiMPNEJyrc
         /edkudml+EEBXejw2xZ96R6NGevpllkWGrcPwbsKBYCRfc0eWxEN+SMPkZPvVJjhpxID
         BlccMLLFpdjHiSWsdOhrl+NU4tCxJ+XZqqZWVr5mrygQPLW/0lHkDlhS+J+IDNZrdYg0
         /b7e4KTDw7QM+pjUP1GR+UxLBST1LuNkg3P3qzhKpDepySYDOgAIJv/iAxVoMh9Nkwi2
         BXuH9VGcKAH1dg6rIi8/os9lyhDIcLXIAQlyu+O6ZkZaZRW/iZdkiwY0f5EoDKuc4Qn9
         TJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeKzaFEKC10L3GQvdTWKr9TQlqoxit5HXSO6QY3MlxOaWs98dmLdRFb7MjY2xl5WZ7NXEKcLeeOfkfng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqu2R7pLUP0rNRk2GKb1Cgao4koX8rI1+v1iakaAQkbnfxSqI1
	2v2Z+yMw9dQA7JRqNgyVSmABIFHQ99bQuDeWG/fKKaMu+uwmkkrKji5BBKiATA==
X-Gm-Gg: ASbGncuz5ylB4Qf4xKTiYHvpoeuskzO7pgYWH6G1+o1nRFkiPIQVo/+9j0U77gJWloe
	7ahnp88xl9E4/KHxj7hxeTDRBQBqGi6zkTmpvl5vlpfMdIlJuGEEkRCeLnhdA215bR8oroXWRze
	fXgmXBv6S0fzEkyUKfNLuwJwIPqiTkkWm80Ud8bArRRRQ8vbuN9hXAz08z4elmlCzvSsWkRjn/v
	do2KxvEMODJTP2Y0q7LHQylJE44CvSh8KlD208RM2RtcDbGT1chx9Wp7ll1oP3haSZa6pXQ1xZS
	G93YPJqW9OSMdd0GNvJgBBswXVYO4s4xGPmOJ7i8kAxH4JvJlNU=
X-Google-Smtp-Source: AGHT+IF+6vp1Asd0YufISXtpwDH4F0HjLKz5ncPpxH+cAOzmBbxfoIeObcPr7mGOJDtXf1kolL0S7A==
X-Received: by 2002:a17:90a:fc4f:b0:308:2b5b:d67f with SMTP id 98e67ed59e1d1-3087bb51a77mr16746598a91.9.1745225674795;
        Mon, 21 Apr 2025 01:54:34 -0700 (PDT)
Received: from thinkpad ([120.60.74.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdbaa2sm60594995ad.250.2025.04.21.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:54:34 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:24:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: tegra: Allow building as a module
Message-ID: <lk37wtb25pr2rj3zhct5udaykr7joqw2mpgtupjq33of2xhesi@rmdgucbzxmgz>
References: <20250420-pci-tegra-module-v1-0-c0a1f831354a@gmail.com>
 <20250420-pci-tegra-module-v1-2-c0a1f831354a@gmail.com>
 <pgp3cdksefn2z4n2hlyhftbdlfwyx7gbol7q6wdj5j4brux3cw@thts2qcahdw3>
 <CALHNRZ9R4SWtzAYocY9X7D9hm4mXeWKhdo_rk5UmRPVGD-vbBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ9R4SWtzAYocY9X7D9hm4mXeWKhdo_rk5UmRPVGD-vbBQ@mail.gmail.com>

On Mon, Apr 21, 2025 at 03:09:42AM -0500, Aaron Kling wrote:
> On Mon, Apr 21, 2025 at 2:52 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Sun, Apr 20, 2025 at 09:59:06PM -0500, Aaron Kling via B4 Relay wrote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The driver works fine as a module, so allow building as such.
> > >
> >
> > In the past, the former irqchip maintainer raised concerns for allowing the
> > irqchip drivers to be removed from the kernel. The concern was mostly (afaik)
> > due to not disposing all IRQs before removing the irq_domain.
> >
> > So Marek submitted a series [1] that added a new API for that. But that series
> > didn't progress further. So if you want to make this driver a module, you need
> > to do 2 things:
> >
> > 1. Make sure the cited series gets merged and this driver uses the new API.
> > 2. Get an Ack from Thomas (who is the only irqchip maintainer now).
> 
> Should this be a hard blocker for building this one driver as a
> module? I did a quick grep of drivers/pci/controller for irq_domain,
> then compared several of the hits to the Kconfig. And every single one
> is tristate. Tegra is by far not a unique offender here.
> 

Not 'unique', yes. But the situation is a bit worse atm. Some of the patches
(making the driver as a module) were merged in the past without addressing the
mapping issue.

Please take a look at the reply from Marc:
https://lkml.iu.edu/hypermail/linux/kernel/2207.2/08367.html

Even though Marc said that disposing IRQs is not enough to make sure there are
no dangling pointers of the IRQs in the client drivers, I'm inclined to atleast
allow modular drivers if they could dispose all the mappings with the new API.
This doesn't mean that I'm not cared about the potential issue, but the removing
of modules is always an 'experimental' feature in the kernel. So users should be
aware of what they are doing. Also, we have not seen any reported issues after
disposing the IRQs from the controller drivers. That also adds to my view on
this issue.

That being said, the safest option would be to get rid of the remove callback
and make the module modular. This will allow the driver to be built as a module
but never getting removed (make sure .suppress_bind_attrs is also set).

- Mani

> Sincerely,
> Aaron
> 
> >
> > - Mani
> >
> > [1] https://lore.kernel.org/linux-pci/20240715114854.4792-1-kabel@kernel.org
> >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  drivers/pci/controller/Kconfig     | 2 +-
> > >  drivers/pci/controller/pci-tegra.c | 3 +++
> > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > > index 9800b768105402d6dd1ba4b134c2ec23da6e4201..a9164dd2eccaead5ae9348c24a5ad75fcb40f507 100644
> > > --- a/drivers/pci/controller/Kconfig
> > > +++ b/drivers/pci/controller/Kconfig
> > > @@ -224,7 +224,7 @@ config PCI_HYPERV_INTERFACE
> > >         driver.
> > >
> > >  config PCI_TEGRA
> > > -     bool "NVIDIA Tegra PCIe controller"
> > > +     tristate "NVIDIA Tegra PCIe controller"
> > >       depends on ARCH_TEGRA || COMPILE_TEST
> > >       depends on PCI_MSI
> > >       help
> > > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> > > index b3cdbc5927de3742161310610dc5dcb836f5dd69..c260842695f2e983ae48fd52b43f62dbb9fb5dd3 100644
> > > --- a/drivers/pci/controller/pci-tegra.c
> > > +++ b/drivers/pci/controller/pci-tegra.c
> > > @@ -2803,3 +2803,6 @@ static struct platform_driver tegra_pcie_driver = {
> > >       .remove = tegra_pcie_remove,
> > >  };
> > >  module_platform_driver(tegra_pcie_driver);
> > > +MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> > > +MODULE_DESCRIPTION("NVIDIA PCI host controller driver");
> > > +MODULE_LICENSE("GPL");
> > >
> > > --
> > > 2.48.1
> > >
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
