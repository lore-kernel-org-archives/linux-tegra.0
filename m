From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: tegra: fix compile-testing PCI host driver
Date: Sat, 2 Jun 2018 01:17:40 -0700
Message-ID: <20180602081740.kf6kngvsxybl7hmg@localhost>
References: <20180528155603.2897776-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180528155603.2897776-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, arm@kernel.org, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 28, 2018 at 05:55:29PM +0200, Arnd Bergmann wrote:
> The tegra_cpuidle_pcie_irqs_in_use() function is stubbed out for non-ARM
> builds, but now we can compile-test the Tegra pci driver on non-Tegra
> ARM platforms as well, which results in a new link error:
> 
> drivers/pci/host/pci-tegra.o: In function `tegra_pcie_map_irq':
> pci-tegra.c:(.text+0x288): undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> drivers/pci/host/pci-tegra.o: In function `tegra_msi_map':
> pci-tegra.c:(.text+0xba0): undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> 
> This adapts the #ifdef statement to match the exact condition under which
> the function can be called.
> 
> Fixes: 51bc085d6454 ("PCI: Improve host drivers compile test coverage")
> Cc: Rob Herring <robh@kernel.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!


-Olof
