Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442913B8BA1
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649515; cv=none; b=IiKKpNS2RSPnrT+YU9c2MPyX2Kd4qXqGm62qaK8KeDUwN1+ig8kSx/kbLr/qL8hdEpKNfljLI4bm1LoTbH6gX4XICgzILfb3Jt5kYaE7nfPKqmYJ+ea5ENr+pHsctftWoRB2xndlnQ9jE4Eq7QSwlwStXeRD/nz9zhvJ0xiRJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649515; c=relaxed/simple;
	bh=WR4DGvfWQ9vg+1TnVPPV/BSBM4+13udBc144kk/FGoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kxMXI1qIZg5hFUUVnIAbl+l4xsaMozoMoqX/YoeO+Lt5jfjlBvw/TnIkb+2QDpMLFkXu9mSoJcu/oypWMPw32niVkDev98ZZCtjcZxvDG1mX9bctRT4WKNpWQRAM7EZgoZ/LvKNGycBx0gigsXoNadAM1ugjtmxi2fqu8YahKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmXfd9iy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmXfd9iy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so29776735e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2026 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775649513; x=1776254313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k40FHMst7ZYaUpavfz/biELRzCmoNJ4RIF78KxcSSeg=;
        b=YmXfd9iypGV2CumeGJ1C94Y5vNJGyqW9wa9wr7V209vRUiQ5b+PzwyGY2VCpkepj2h
         d2jJg8k6fSJee0j7mgUhUtkNRGto94VMZRJCVsuHXRcfn1/RM060s6ZhDhLhurl/VXzN
         +3YQODU4u6j4zUTo66PNPvZEZGLCfcGDSmZNQC202/vUA6bI2jVza4fLsxeRYOD/vwx9
         ARKBqgpI8b0uCGmpg7FgDlAEyhPtsmEshrXsOKK7UBwJaWFuvVjDA19Kx/1OMhOb12/J
         ZSe+/dmc0vbasCtut3sBoaQzsBQzjBu6m5r+SoRhEGl02sj5W0b0uKDG68RxcO1JiwlR
         7Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649513; x=1776254313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k40FHMst7ZYaUpavfz/biELRzCmoNJ4RIF78KxcSSeg=;
        b=gW3O854uXQMeFbMFyOJMUH5uSdLhbcJoTpj9SYyLlwLwaRrfgfoKA1ropaI5lFKoz8
         DeQ5xq70wwUPXU0huXDCKSTQcYOJYoSngSX63ZdB/gWw7VG0ELYuQhWLWfNvSMe1D8ef
         qL2d2hyMBGsli1FXOn+zpc6H3fWhp3H1dckKCTPeTmACU27JPYmp2ofMRDckZi8jd+NC
         vlUjphh/AejeMrary+RBAluxtni+Oa454kSY2GrWuEAhHMc+sRVaTq1RDeR9TGFqZezB
         LGhF9j6bhtutMz8aZwDgOimX6Qp3NH8AoxXHZDQYjRC7M2PJLhwWiv50Hs/Gcv+7mV42
         H+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUd091a8yi0jFERT1g0qQzm2kf3r1aAyWi+uz6alb4ZnkzsUqK6oMR7y8/XpqXcznkNnfWBxBi/srCTWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOsZIgpTjs0z9XTVdSN+8cx5xCBDqyPrlUz9S+QfcSdSnegQht
	JlHPruYrLo6sLfrhio7YAci8+tnWD4SP0g5/EwN6xXMNNXfZgFp0RXKz
X-Gm-Gg: AeBDieuurc01qJzB8OVD8YbDCj6MqOLGeAaYifZ8EPkt9wwe76VdUHzXMFwdDq64P+m
	9nAKf2NdQVyFva8kfU9Kx/i9He3jpiCoK9Vl2sUMVxrdewWpn51mGUAIY6hJ3cUyZMCZrNX1BKv
	Nt/W4j1wHjhLfK50V9TCTgi8WNCAsAS7NTDD0B+NGqRfSh1eKgGY5XEkzZcZ4JPfOw9Blp1iwWr
	emMibWvsMhqsQQWcrMY6nQZvpo8bcc2VF+ZXSyB85g/f429zt2PBC7DL7dbsr2ytlk4vfxzQ2sk
	LWXkqmnEGkbVb/jCun9Tdq3d2zvGbdujnxew/ewAe2DwAfH2Qh57ofNqvCBqlI7LEuIfgDogZBz
	yLVVw1TwGJV5VqkwjYBPW/KxsrnuxOvx9pmPJ47WAxG1qCOu4SBIr1FGRAIqKrRyqpsVLhFr9Vj
	eeVmhsbbzbVqhnXgrLtGLkxYj2ppQ1R8KNmDbWRfUSkSBOP+IOqcg/Q3pmHPyPUFfK
X-Received: by 2002:a05:600c:3549:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488997d5e5bmr274362495e9.25.1775649512422;
        Wed, 08 Apr 2026 04:58:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm1178015225e9.2.2026.04.08.04.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:58:31 -0700 (PDT)
Date: Wed, 8 Apr 2026 12:58:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: <bhelgaas@google.com>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <kishon@kernel.org>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <Frank.Li@nxp.com>, <den@valinux.co.jp>,
 <hongxing.zhu@nxp.com>, <jingoohan1@gmail.com>, <vidyas@nvidia.com>,
 <cassel@kernel.org>, <18255117159@163.com>, <linux-pci@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] PCI: tegra194: fix min() signedness when capping
 ASPM L1 entrance latency
Message-ID: <20260408125827.7063fd83@pumpkin>
In-Reply-To: <20260407145749.130753-1-mmaddireddy@nvidia.com>
References: <20260407145749.130753-1-mmaddireddy@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Apr 2026 20:27:49 +0530
Manikanta Maddireddy <mmaddireddy@nvidia.com> wrote:

> The DT property "aspm-l1-entry-delay-ns" is converted to microseconds,
> then encoded for the L1 entrance latency register field as ilog2(us) + 1,
> clamped to the hardware maximum of 7.
> 
> ilog2() returns int type, while the upper bound is 7U (unsigned int).
> The min() macro is implemented with __careful_cmp(), which rejects mixed
> signed and unsigned operands at compile time via BUILD_BUG_ON_MSG in
> minmax.h; that check trips on this pair, notably when building with W=1.
> 
> This combination fails to build (e.g. parisc allyesconfig, GCC 15, as
> reported by the 0-day bot).
> 
> Use min_t(u32, ilog2(us) + 1U, 7U) so both sides of the comparison are
> unsigned and consistent with aspm_l1_enter_lat.

Adding 1U (rather than 1) is enough to make everything signed.
Alternatively change the 7U to 7 and it will all be fine regardless of
whether ilog2() returns a signed or unsigned result.

Remember min_t(u32, x, y) is min((u32)x, (u32)y) and you wouldn't put in
casts like that for any other arithmetic operation.

Note that for the compile to fail there has to be a code path where
ilog2(us) isn't known to generate a non-negative value.
ilog2(us) (probably) ends up as 'fls(us) - 1'. If that is implemented using a
compiler builtin (because there is a single instruction) then gcc knows that
the input can't be zero (from the max()), so knows that fls() can't return 0
(which it does for 0), so knows it is never negative and the checks in min()
pass.

parisc may be one of the architectures that ends up with a real function
for fls() so the compiler doesn't know the result of ilog2() is
non-negative.

Just delete the U.

	David

> 
> Fixes: 4a44cd65c9dd ("PCI: tegra194: Use aspm-l1-entry-delay-ns DT property for L1 entrance latency")
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604051407.AODe3ddZ-lkp@intel.com/
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 393f75ce3df3..93d3452ac117 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1147,7 +1147,7 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
>  	if (!ret) {
>  		u32 us = max(val / 1000, 1U);
>  
> -		pcie->aspm_l1_enter_lat = min(ilog2(us) + 1, 7U);
> +		pcie->aspm_l1_enter_lat = min_t(u32, ilog2(us) + 1U, 7U);
>  	}
>  
>  	ret = of_property_read_u32(np, "num-lanes", &pcie->num_lanes);

