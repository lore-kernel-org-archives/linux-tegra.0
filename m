Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997A1A316C
	for <linux-tegra@vger.kernel.org>; Mon,  5 May 2025 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462728; cv=none; b=l3PVSYK/MSsM7WS2GHYMXiWp12kcVxiaghl/zORKJMRKvW3XAxhdqlugHOxN+kwSF3eOOjmnloddfo5VWgc0psj0DyKjHIu8rsapfYizMPjvzRlOND0peEFNCOTaUjwPq+aX5Wdjxyh/pCjXib7yBUEgKwSJLr4ICghwOq7SJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462728; c=relaxed/simple;
	bh=shkAZuvCH2RU/ckc8VuwX9a+2DZnjJ7l1ZckrK9OVyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcQT0L0iMryX9YasljYLmV5MyFIDpebXUpyBo1coC0i9ioJMRfEM+eVV3uH9cGhb/lzIcZ90mCo8NAg3W3nN806kC97fujoIbyZZoeYt/AyTMFsVrU24E8S8enzLgFwX8Kkg3el6xkI8WaWj2C29oDpUh2DMae3XDnbDuqDLzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMeVruwr; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMeVruwr"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af548cb1f83so4461234a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 05 May 2025 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746462725; x=1747067525; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P8zp6pDtJvcq027DnBZDXmCmCGpXlaf9vo9MS7U/Xtg=;
        b=PMeVruwrOGDyctAeFNqflnY/WkCJi87BWj9pvpDrCllzWm0IeTmZIVQTfPgohdAUtW
         NMV/WV2s3q61ItxnNfcKfeDusJ7K5vgaqHIg8ypJSnfTiPvWPB3Ts0G9s9pec3yTAJkJ
         WxY+y20LkKEC/yPPuLXrTYULeC5zLuD7wYlhHWKWLoCPhPRH11P7AKjVL3ECDCnpkdMO
         Uar/cLBlvgvYp5cVejUV8R/OO/vXT6OhovycqJ5VSPawMQinQnkPJqGSDApNceJV2Dpg
         oIXsu7/pMEW/XC8H/T29NWuAFreVTBUQcCEsTmZWX8TgtSyClulOt3+z+z0ZtoilfgFf
         99Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462725; x=1747067525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8zp6pDtJvcq027DnBZDXmCmCGpXlaf9vo9MS7U/Xtg=;
        b=MN8kc2bdWbN/TCFdTxlVrHbeeVZk8rrXoEVYX0R/TMVY64sQQxIYoLWd62l0KHnsVo
         kYHlzQ1oI1CYdSp3W1IRoQVWnLvzxBxOOUbnw+i+PBosETuPqy8GHtyY+9wKvyLBxp/g
         NLeMA6wG3dXhI3i47A0RpNHNMhEjVMEAnjQzYfB5Kmg/d16o16is+iNXd/J6yXULU2XF
         eQpR+vIGc8nmWCEQ0z3fwOLOZ2/z6hnbIUS8g0KNsXG2ec3EWFP87s2IL0PsEsWYa+Op
         lFRJ7wAWZltv5xpVmmpqAaChRPLBZRgGm0wbFma3TLNpAjfWdNE8+4id1rVMlpUGO6Hf
         WA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHl/N/471JuWnPg2pSZssuPia7dR3lUCXavq20a02YjP/QVu9nNc8rGlXX3nx8KxOavuhbD6k7+tlA1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0DvrsiiT/5yzli6gmCjUhi3FUZJEmgbv4J26yAw/oZAem5U6
	iRIlfoiD3UOvZhzH4DBBvOl0X0zZMMaMNwwARX4jb3Xp9C50oVqYY85ifOqO5g==
X-Gm-Gg: ASbGncuRCm+kCEySrPwF9tEMx+V1MmN5XbVXMGUsyn5aUxyrc4f30sbj3IAK6G4zctP
	QtRilz1BgUWu4/2E1OnBP80zhvEwYfJQTld094kQqjW2CSiKY7pzWT684JaBB9cuBSnstwJz6F0
	i4Re+o+xV9t93dzxOsVUMlAiK0BtosejFzvoak/9lv5h7Y6pgM6hqRfOVZhI87/Pz803ml44w8W
	joEx/cS/NwcALiyE1n7kxK4SO34KDBpHhzk/fx6ZEroRT8qwyrtsPDm8BOjBzDB1mjUlZmJF4cx
	vlhKuashT5mttfSjwL17qXDHAB2ndVj23urOoZkjCRJ2N2B7/eA=
X-Google-Smtp-Source: AGHT+IFmJNMq5Zm0Lx/iI+jAiEoLSglq132RPDiKeb9iy7s27eldL13qMLmaPmS7wnylnwCLW1L1wQ==
X-Received: by 2002:a05:6a21:3a4a:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-20e9660571emr11256518637.13.1746462725573;
        Mon, 05 May 2025 09:32:05 -0700 (PDT)
Received: from thinkpad ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm5794666a12.61.2025.05.05.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:05 -0700 (PDT)
Date: Mon, 5 May 2025 22:01:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: webgeek1234@gmail.com
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] PCI: tegra: Drop unused remove callback
Message-ID: <idddypjxxtiie3tllfk47krcydlno4lnhbkik4wakekcyu7c2d@iurtu6bjzeey>
References: <20250505-pci-tegra-module-v4-0-088b552c4b1a@gmail.com>
 <20250505-pci-tegra-module-v4-4-088b552c4b1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505-pci-tegra-module-v4-4-088b552c4b1a@gmail.com>

On Mon, May 05, 2025 at 09:59:01AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Debugfs cleanup is moved to a new shutdown callback to ensure the
> debugfs nodes are properly cleaned up on shutdown and reboot.
> 

Both are separate changes. You should remove the .remove() callback in the
previous patch itself and add .shutdown() callback in this patch.

And the shutdown callback should quiesce the device by putting it in L2/L3 state
and turn off the supplies. It is not intended to perform resource cleanup.

- Mani

> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 1539d172d708c11c3d085721ab9416be3dea6b12..cc9ca4305ea2072b7395ee1f1e979c24fdea3433 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2674,27 +2674,12 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static void tegra_pcie_remove(struct platform_device *pdev)
> +static void tegra_pcie_shutdown(struct platform_device *pdev)
>  {
>  	struct tegra_pcie *pcie = platform_get_drvdata(pdev);
> -	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> -	struct tegra_pcie_port *port, *tmp;
>  
>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>  		tegra_pcie_debugfs_exit(pcie);
> -
> -	pci_stop_root_bus(host->bus);
> -	pci_remove_root_bus(host->bus);
> -	pm_runtime_put_sync(pcie->dev);
> -	pm_runtime_disable(pcie->dev);
> -
> -	if (IS_ENABLED(CONFIG_PCI_MSI))
> -		tegra_pcie_msi_teardown(pcie);
> -
> -	tegra_pcie_put_resources(pcie);
> -
> -	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> -		tegra_pcie_port_free(port);
>  }
>  
>  static int tegra_pcie_pm_suspend(struct device *dev)
> @@ -2800,7 +2785,7 @@ static struct platform_driver tegra_pcie_driver = {
>  		.pm = &tegra_pcie_pm_ops,
>  	},
>  	.probe = tegra_pcie_probe,
> -	.remove = tegra_pcie_remove,
> +	.shutdown = tegra_pcie_shutdown,
>  };
>  builtin_platform_driver(tegra_pcie_driver);
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> 
> -- 
> 2.48.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
