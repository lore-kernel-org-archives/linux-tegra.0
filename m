Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955436CDE3
	for <linux-tegra@vger.kernel.org>; Fri,  6 Mar 2026 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772770517; cv=pass; b=j66spWsFuRgmRCoI9tPoTMho02lIt23bYI8yQdDj6oy5ofLocM+0Q4bVRGH7a4xM/VJ1Hwq93BZqG4go3FMVXwa7W8dTVKwKSij7/bqxf1wYysZ5as2H1mDCi+1+7Q9Qv4YSF79zOL6S+CzyiJcz1p8/1lTVAe58E+gOVv6okAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772770517; c=relaxed/simple;
	bh=nFIzFCEGdHvUoDkDKio798vd3KSOQ+BKfInvObQxhB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FooNf9ZsvBXdUyYI0dUxUk1HwpdOfgVeCpdnJSkNZYMI7fkyybcKLX32hWXsq5++3P9CLntKRTLyYYpyIDh4BvLN1p3Q23ce7XzGhuWouVhVIpwrOsg5Zn1sF7p3he5alzkBr2Py6XTKxLhcVRt1ffTaL8ODnwn0jNJWk+JEII4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuQ4LlqK; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuQ4LlqK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b941d924534so91706066b.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 20:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772770510; cv=none;
        d=google.com; s=arc-20240605;
        b=EoFUtBuHBOAlVkdz1xufpZIkUbyuk/tXrfn68GwOQcTRaolGur9OmzCU03T+lCGioR
         og0F0r/0iwBn6XKpiusThsMvnMYCUfpnWOxonla74qV9t43kT6LkyEUE+gGMrR6+dqRv
         +U5Vc91jJDxjZ4Dp0j1GgiVydsI3W9oz0cRbsUizpUXgI8+EaniDBwBUeBo84tixyWRf
         +XVnGtTLEKNWFf336m/oW/8/uDrm77+pkVpTriUo6HkiJ1Ja9paywQNEE1TD5mrs7Dc+
         0hvKxpI5OL3Nw7omKrHb3EKG5KQ9Du5ah+wpnuAwCE2ksHyXa4Ba/o1lYTyic/sQln5s
         0Agg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        fh=4M8MBgmCuqZe9WT5oC4uze002fxM8FCttWQtYciS6xE=;
        b=a5z1gPgpW+tRgNWw8JJyAp4QXTjRyxOGbi5H2sLeAfJ8Qi/P6lVam+LGXLNwMDaLD9
         y6jHrwwmGUHTzWMOjfjI9OL5shPDRtBQ8XekTDaDYYlqBCgPyS6uVPtDKbZ066Z68jEr
         11/n04r29mhkvr+kjD1Cey3iF/nHoDeXuaxtaR/GamCewMlAdjxzk+aV4DuI6olY++B0
         Ky2eKn1FsOf49btZ/yjXiqDevOAX/ZRm7xw0FKrAqBVFqo40/0+uxL6D5Lr4N9AMhPB6
         MI9VC/D3sLHgjr5sPSeSyzR75rGIosSV82FZV/NzgyjiZ6q+QeXJKXKVj4836qrPV5cP
         KqTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772770510; x=1773375310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=JuQ4LlqKe2uZcIT/kABI6GSC7b7JlJX0AZeWvKQeJVhKDtckoPQr5Td+YZWWzTMb4h
         nFgshoPtGycmuLuGPGLDJ2ovrA3Tfo8HjD1Ebkd3RPgLibjIVYo3nYNBSBFUDsdcmZqs
         9mihTwD9YwD6MQCiaxJn9BHpsClO/pJR27TRcRn4MbXAi7uigzte9NdrLWDyWl+m/6SE
         D6xdF+22cGQwghpTK4JeBUnGXMV2zkOMJzakkGTQfDO8Fei6yCPCfK8CFraWWesjFDyJ
         T8g59HWhFCLeHNlgXt43enDZiBLyaWUVh0kyx4K22hVBpW1QpDSIcvh/e800Qlj2x5X8
         g7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772770510; x=1773375310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=Q16W9OZaOI5Nfi6aUzzfsTQSy+A1olVNOkVAPpDrGOZyVxhMJbJSfS7xkRAQ9vErKH
         P5P7om2zpbJk75lO8us+k6Ax2JvtytdZ/1VUwcexWwYX8+HRf/BEvp/Z8D4AObW7G/EY
         S3JU+PotQd4igPI3tTJPt1ul3ICeoLtYr4MJA+D1CkTqIvQXQ/Y5WEiEeO8i1cP3QGtH
         soVwJjzr+bPyAS38zonVMje7GHFw9tS8Rw9aT2EvYi0Ojv7b5RwJjLYkQZkUzCOsLy1e
         QrdB5ioN0QE6THhR7yUyRjfWqgUMpN0zJKoI2TeiZFifl561euL3zf53x7s1LjYdCej/
         8xzg==
X-Forwarded-Encrypted: i=1; AJvYcCWpX1QphE02fVJsyGuSPW1mKvYfcTcwrpkR+GsxA/kWNXhdT+5bziFlBT0nFbSjIsUMiWFKqWWI/GpXlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFoX5vXelsi3qeM+A/0JLEfFKrQbKyuT1rnkvS7c+KrfsMy9t
	hskVb30e+QF1G11dXeM+GcQJMlpfer9oQs9GFWQuJ2/7Jq/BTiqz4oZy4OwXmod6zl5j4dsFq5S
	3CJqXoQTO00Ys6R7i4ZkwGEfNvAfrXcc=
X-Gm-Gg: ATEYQzy95UuYGY9NyLooJjVQ7GL4Vq1KjtP6eTb99w9hESqlqBoe3dxMZMx8QY7FR5V
	x1F7KSlJ23otJVq3319dGrH5Gnpw6AlradRYxDRly9itC6Yp2+lHFa9c6mv+AI89Fi+3CYZJf1K
	UPRyqGhC1b984q0UZXuVVbtzh9ULoNev3jIaZfJKVdH/Hmm4K8AcYsrHCJT8ko8pQEUiWDptqRb
	k/hAuxOJ7O7cRaywVJ4v9JY/Q5nwN6C5SF5ahFWQSWtFQFHMAlX6dnr2EAPW3MmtVSFnhSDrpZC
	nlWOKw==
X-Received: by 2002:a17:907:6d02:b0:b93:6bfe:d556 with SMTP id
 a640c23a62f3a-b942db8682dmr33539966b.7.1772770510037; Thu, 05 Mar 2026
 20:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304140329.7089-1-linux.amoon@gmail.com> <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 6 Mar 2026 09:44:53 +0530
X-Gm-Features: AaiRm51D8WbPwjbtXZGUsnsbSyyBH4WmUaM2xaSBTKwsUjOwhQr-zWi1-hyOtG4
Message-ID: <CANAwSgQ8eKV4jyxGeva_2aT98sPW=44Q9J5PxMgJ-bs3XdwrkA@mail.gmail.com>
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Chocron <jonnyc@amazon.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Niklas Cassel <cassel@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>, 
	Sai Krishna Musham <sai.krishna.musham@amd.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, Vidya Sagar <vidyas@nvidia.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>, 
	"open list:PCIE DRIVER FOR AMLOGIC MESON" <linux-amlogic@lists.infradead.org>, 
	"open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:SIFIVE DRIVERS:Keyword:fu [57] 40" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chen,

On Thu, 5 Mar 2026 at 05:57, Chen Wang <unicorn_wang@outlook.com> wrote:
>
> Hello Anand,
>
> On 3/4/2026 9:51 PM, Anand Moon wrote:
> > Following recent asynchronous probing updates to the Rockchip PCIe
> > controller, this change enables default async probe functionality for
> > all DesignWare Core (DWC) based controllers to optimize boot times [0].
> >
> > [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
> >
> > This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (18):
> >    PCI: al: Allow asynchronous probing for background link training
> >    PCI: amd-mdb: Allow asynchronous probing for background link training
> >    PCI: armada8x: Allow asynchronous probing for background link training
> >    PCI: artpec6: Allow asynchronous probing for background link training
> >    PCI: bt1: Allow asynchronous probing for background link training
> >    PCI: dra7xx: Allow asynchronous probing for background link training
> >    PCI: exynos: Allow asynchronous probing for background link training
> >    PCI: fu740: Allow asynchronous probing for background link training
> >    PCI: intel-gw: Allow asynchronous probing for background link training
> >    PCI: keystone: Allow asynchronous probing for background link training
> >    PCI: keembay: Allow asynchronous probing for background link training
> >    PCI: kirin: Allow asynchronous probing for background link training
> >    PCI: layerscape: Allow asynchronous probing for background link
> >      training
> >    PCI: meson: Allow asynchronous probing for background link training
> >    PCI: sophgo: Allow asynchronous probing for background link training
> >    PCI: tegra194: Allow asynchronous probing for background link training
> >    PCI: uniphier: Allow asynchronous probing for background link training
> >    PCI: visconti: Allow asynchronous probing for background link training
> >
> >   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
> >   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
> >   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
> >   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
> >   drivers/pci/controller/dwc/pci-meson.c      | 1 +
> >   drivers/pci/controller/dwc/pcie-al.c        | 1 +
> >   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
> >   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
> >   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
> >   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
> >   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
> >   18 files changed, 21 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
>
> Suggest you indicate in the title of the cover letter for the next patch
> that this patchset is only related to dwc.
>
Thanks, If I get positive feedback I will append dwc in the $subject.
> Thanks,
>
> Chen
>
Thanks
-Anand
