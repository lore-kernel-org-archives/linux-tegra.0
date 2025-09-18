Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF3145B16
	for <linux-tegra@vger.kernel.org>; Thu, 18 Sep 2025 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208018; cv=none; b=SEVpqgLCxzCQjQjcCrULR/NsjRv390WE5cfDAA8RfWMuWYq8DYkpEWcG9diuE18mHm4CaNy6iGX2DHSYdsjKCKoh8N3n2HILqhpPxtkJfaSfpzu6Bdr2J+QUToBy183b4/jvstu7I8IXNGFmjkjG8Y15S5zTDVr2/BQ8OeSIBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208018; c=relaxed/simple;
	bh=KsI7IFE8nmE3nobB8kd8ZjHOdWvgSD+Q3iDrO0FofoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqyMsu/bJ8kbAY3rPTK5HdbgJEggE7H13+kVS71w59uW6XodnVYzC7X5q/pZZ6LLNXcVo4uk6qflB+JXItzTTortZBTdC5KgxEAKyiXxwX4d13Ii6biwKcDirXdFhNnckxgF5SzV5RE/l9oWwPMox39RQweX30NXle4FWT8URiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKwQaTqZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKwQaTqZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07c2908f3eso165931766b.1
        for <linux-tegra@vger.kernel.org>; Thu, 18 Sep 2025 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758208015; x=1758812815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jGRAU1dIkQ6kSxN8cpDQ6o04Ckso8P+w3s3co1ZgV0U=;
        b=AKwQaTqZUcD9POEszN5jugttKg/1g4pgKnFgl+gEC2ZBr3Pb0o4lFJSBBT1kLNgTQT
         8nGiVaaRwsUJIc72e7v9005D2b8/cejL1Q7iA6KcE0KNRtzyf6ZSdOH/xVGNoO3H4QxS
         xDgofPPrw3W6ci+JNkEDO4yFwAwprhuzHRrrgWh2shLVOks+FwuxWi6kqv44i/pIBLJZ
         11R0Ybzjm0fcu1Yp5edUIXcrBW7SKGtcSDfTjg9NKm7lQCiRt5bKAHqiylfZOlXtlODI
         7sN4+tTTU1aEOOOlt2z3tkw1oSB0a8K3S+xP6lZrzJOkGIhfttDm0QpCiiJYkd4RBRBx
         QvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208015; x=1758812815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGRAU1dIkQ6kSxN8cpDQ6o04Ckso8P+w3s3co1ZgV0U=;
        b=FZ7RvMfC2Rolciv22YvL5oRUy/GMQSmyN1SsmTsTxBGb/lQIRvL96wjBFhFWEmfpFG
         F3iLKsRBSKFoujM8NU1abKPbam2ApFqilREL7YbwFEdRNnp2v4MgfgPDqTOhGXo6xP4T
         EN2Pu6h3uN3pr7XsDxGwAUZyhIrulNxBlDHMI4xZ8iy0gY2uZwXhwh2Cgn7j5BATpSok
         TF3YDypRvcn08P2G0q8/1nhrqDUVsOMHuzTdjgVcVEg8wtMLwOqaDsYTKAsJGrhZwJym
         HXKZHqc0Zihon3SKSi06TlXUBjvatPJylg1iite3yIfoApcpbCO2Qryfi6R3G1DTJgcQ
         DA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxagDEcICBon2asqi2CnhSrIOWPWwXRtmRCOJTXFfDbBOrAcUtHzimHgKAT1WSSa8oZ9g595gtNJSoig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFow6fETcceNnFT5PFQ/3VmlHPa6cnyaF/MsnVB4uXNHqNv/HS
	ZfQt0Kdi5SN+11ioP+Ig60FllsTgKZz/LfTfvAOEIlxB4a53tJBU4lss5S2oGuTFJdO4iHrn6SY
	b3gmpxwif90jZmOHtU2JOZT2imh8bNAk=
X-Gm-Gg: ASbGnctxY9UU3j2a+caiFzeK/OFApERABmcxcA6Tmjv1UJD2BcfxtX3EyYaYmcz2JmN
	Wp/z2+94iI6uz9vw7QwaWgQ/nkzEII1O4tkJrsB/vxCbTgeKDUF7nx5IoTWWaAUX08avMCPh8JR
	4Uf1TX2Ct6P/z+L2tys74UCUhFV1CaWA6tyh7o1XfCYZm5TAcLfZH09thBcuX/pvGKEKblPjRLu
	ORq9t+ftbd+F+iffse1LHCD
X-Google-Smtp-Source: AGHT+IHnbC4doB+vg+OxOA1QuVMDQP5DcvXk+VafWalM/bZQwRbyhzLm7RyxJchWydSc6QVXLy4X1CWUyQpsG9I8wPc=
X-Received: by 2002:a17:907:da8:b0:b04:7ef0:9dd6 with SMTP id
 a640c23a62f3a-b1bbe7d7e07mr615048366b.55.1758208014587; Thu, 18 Sep 2025
 08:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831190055.7952-1-linux.amoon@gmail.com> <20250831190055.7952-2-linux.amoon@gmail.com>
 <a743fd19-d54b-450f-a4db-8efc21acf22a@nvidia.com> <CANAwSgS-Oq7iXDtiWM0W8NZ2q=BcCGviJAUdscWJRvyxLsw0CQ@mail.gmail.com>
 <8fac00fe-2ad4-4202-a6f2-c5043f7343f9@nvidia.com>
In-Reply-To: <8fac00fe-2ad4-4202-a6f2-c5043f7343f9@nvidia.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 18 Sep 2025 20:36:35 +0530
X-Gm-Features: AS18NWDEDkuCM0HycoUXLj4fCVD45cYRPAenXAVYcU6nd-dwQWLEpxd6NQpSBIU
Message-ID: <CANAwSgSZ7ANQVXyWM6wtaOG0tgAbNxoVh7Kz_AaDuxvQsA1b9g@mail.gmail.com>
Subject: Re: [RFC v1 1/2] PCI: tegra: Simplify clock handling by using
 clk_bulk*() functions
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>, 
	"open list:PCI DRIVER FOR NVIDIA TEGRA" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Thu, 18 Sept 2025 at 14:47, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 17/09/2025 19:26, Anand Moon wrote:
> > Hi Jon,
> >
> > On Wed, 17 Sept 2025 at 19:14, Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >>
> >> On 31/08/2025 20:00, Anand Moon wrote:
> >>> Currently, the driver acquires clocks and prepare/enable/disable/unprepare
> >>> the clocks individually thereby making the driver complex to read.
> >>>
> >>> The driver can be simplified by using the clk_bulk*() APIs.
> >>>
> >>> Use:
> >>>     - devm_clk_bulk_get_all() API to acquire all the clocks
> >>>     - clk_bulk_prepare_enable() to prepare/enable clocks
> >>>     - clk_bulk_disable_unprepare() APIs to disable/unprepare them in bulk
> >>>
> >>> As part of this cleanup, the legacy has_cml_clk flag and explicit handling
> >>> of individual clocks (pex, afi, pll_e, cml) are removed. Clock sequencing
> >>> is now implicitly determined by the order defined in the device tree,
> >>> eliminating hardcoded logic and improving maintainability.
> >>
> >> What platforms have you tested this change on?
> >>
> > I'm using a Jetson Nano 4GB model as my test platform.
>
> Thanks. One concern I have about this is that right now the DT binding
> doc for this device is still in the legacy text format and not converted
> to yaml. Therefore, there is no way to validate the device-tree bindings
> for this driver. So by making this change we are susceptible to people
> getting the device-tree incorrect and there is no way to check. Right
> now the driver will fail is a given clock is missing but after this
> change we are completely reliant that the device-tree is correct but no
> way to validate.
>
> It would be great to convert the text binding doc to yaml as part of
> this series.
>
I will convert the legacy text binding to a YAML file as part of this series.

[0] Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt

> Also if you look at the dwmac-tegra.c driver this one still populates
> the clock names when using the bulk APIs so that we know that the clocks
> that we require are present.
>
Only the Tegra20 SoC has three clocks.
    compatible = "nvidia,tegra20-pcie";
    clocks = <&tegra_car TEGRA20_CLK_PEX>,
                         <&tegra_car TEGRA20_CLK_AFI>,
                         <&tegra_car TEGRA20_CLK_PLL_E>;
                clock-names = "pex", "afi", "pll_e";

Whereas all the rest of the SoCs have 4 clocks.

  compatible = "nvidia,tegra30-pcie";
  compatible = "nvidia,tegra124-pcie";
  compatible = "nvidia,tegra210-pcie";
  compatible = "nvidia,tegra186-pcie";

  clocks = <&tegra_car TEGRA30_CLK_PCIE>,
                         <&tegra_car TEGRA30_CLK_AFI>,
                         <&tegra_car TEGRA30_CLK_PLL_E>,
                         <&tegra_car TEGRA30_CLK_CML0>;
                clock-names = "pex", "afi", "pll_e", "cml";

As suggested, I need to create two clock arrays for the clocks of the SoC.

But the code will introduce more overhead:

bulk clks -> devm_kcalloc (for clocks) -> assign id to clocks ->
devm_clk_bulk_get -> clk_bulk_prepare_enable.

I believe the use of devm_clk_bulk_get_all() is a cleaner and more modern
approach for the following reasons:
It simplifies the code by removing the need for manual memory allocation
(devm_kcalloc) and populating an array of clock specifications.
It is more efficient, as all clocks are fetched in a single API call,
reducing overhead.

Please let me know if this plan addresses your concerns.

> Jon
>
> [0] drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
>
> --
> nvpublic
>
Thanks
-Anand
