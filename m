From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 00/11] ARM: tegra: Add PCIe device tree support
Date: Thu, 08 Mar 2012 21:54:23 -0700
Message-ID: <20120309045423.F34F43E0903@localhost>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>, linux-tegra@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu,  8 Mar 2012 15:51:20 +0100, Thierry Reding <thierry.reding@avionic-design.de> wrote:
> This patch series adds support for device tree based probing of the PCIe
> controller found on Tegra SoCs.
> 
> Patches 1 and 2 have already been posted by Grant and Mark respectively
> but I've included them here for reference. Both patches are dependencies
> for the subsequent patches.
> 
> Patches 3, 4 and 5 add support for obtaining the regulators required to
> power the PCIe controller from the device tree. Patches 6 and 7 are
> required to make some common PCI functions available after the init
> phase because the deferred probing will postpone the probing of the PCIe
> controller driver until that point.
> 
> Patches 8 and 9 make the PCIe controller code available as a driver and
> add the corresponding platform devices to the boards that enable PCIe
> (Harmony and TrimSlice). Patch 10 adds MSI support and patch 11 finally
> adds a device tree binding with documentation.
> 
> The code in patch 10 (MSI support) is based on the Vibrante kernel and I
> wasn't able to get a proper Signed-off-by or even copyright information.
> Perhaps somebody at NVIDIA can find out?
> 
> Thierry
> 
> Grant Likely (1):
>   drivercore: Add driver probe deferral mechanism
> 
> Mark Brown (1):
>   regulator: Support driver probe deferral

Greg has picked up the drivercore patch, so the regulator one can be queued
up too now.

g.

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
