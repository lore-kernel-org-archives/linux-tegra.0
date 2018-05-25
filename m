From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] memory: tegra: include linux/spinlock.h
Date: Sat, 26 May 2018 00:18:34 +0300
Message-ID: <11dbcb7d-4aa8-90c2-83b2-66e0d6e8bb10@gmail.com>
References: <20180525211155.1928474-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525211155.1928474-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26.05.2018 00:11, Arnd Bergmann wrote:
> The newly added code in this file causes a build error unless
> we include linux/spinlock.h, at least in some configurations:
> 
> In file included from drivers/memory/tegra/mc.h:15,
>                  from drivers/memory/tegra/tegra20.c:11:
> include/soc/tegra/mc.h:159:2: error: unknown type name 'spinlock_t'
>   spinlock_t lock;
>   ^~~~~~~~~~
> drivers/memory/tegra/tegra20.c: In function 'terga20_mc_hotreset_assert':
> drivers/memory/tegra/tegra20.c:207:2: error: implicit declaration of function 'spin_lock_irqsave'; did you mean 'arch_local_irq_save'? [-Werror=implicit-function-declaration]
>   spin_lock_irqsave(&mc->lock, flags);
>   ^~~~~~~~~~~~~~~~~
> 
> Fixes: cb557757e1aa ("memory: tegra: Add Tegra20 memory controller hot resets")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/memory/tegra/tegra20.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
> index 7119e532471c..8853e21b773f 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -6,6 +6,7 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <linux/spinlock.h>
>  #include <dt-bindings/memory/tegra20-mc.h>
>  
>  #include "mc.h"

Yes, the spinlock header was getting included indirectly.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
