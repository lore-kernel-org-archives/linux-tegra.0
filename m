From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] soc/tegra: fix link errors with PMC disabled
Date: Mon, 20 Mar 2017 09:47:39 +0000
Message-ID: <e17797ae-35db-8254-ed38-c90b9d29ff0d@nvidia.com>
References: <20170320091405.1041129-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320091405.1041129-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

On 20/03/17 09:13, Arnd Bergmann wrote:
> With the new Tegra186 PMC driver merged, anything that relies on the previous
> PMC driver fails to link when that is disabled:
> 
> arch/arm/mach-tegra/pm.o: In function `tegra_pm_set':
> pm.c:(.text.tegra_pm_set+0x3c): undefined reference to `tegra_pmc_enter_suspend_mode'
> arch/arm/mach-tegra/pm.o: In function `tegra_suspend_enter':
> pm.c:(.text.tegra_suspend_enter+0x4): undefined reference to `tegra_pmc_get_suspend_mode'
> arch/arm/mach-tegra/pm.o: In function `tegra_init_suspend':
> pm.c:(.init.text+0x1c): undefined reference to `tegra_pmc_get_suspend_mode'
> pm.c:(.init.text+0x74): undefined reference to `tegra_pmc_set_suspend_mode'
> 
> ERROR: tegra_powergate_sequence_power_up [drivers/ata/ahci_tegra.ko] undefined!
> ERROR: tegra_powergate_power_off [drivers/ata/ahci_tegra.ko] undefined!
> 
> Making the definition depend on the presence of the driver makes it build
> again, though that might not be the correct fix.
> 
> Fixes: 854014236290 ("soc/tegra: Implement Tegra186 PMC support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

A fix was also submitted by Krzysztof [0].

Thierry, what's your preference? Maybe Arnd's approach is better.

Jon

[0] http://marc.info/?l=linux-arm-kernel&m=148926404419311&w=2

-- 
nvpublic
