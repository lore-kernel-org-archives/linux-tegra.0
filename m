From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 3/5] ARM: DT: tegra114:add aliases and DMA requestor
 for serial controller
Date: Mon, 11 Mar 2013 11:38:06 -0600
Message-ID: <513E167E.8030000@wwwdotorg.org>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com> <1362852678-13421-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362852678-13421-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pdeschrijver@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 03/09/2013 11:11 AM, Laxman Dewangan wrote:
> Add APB DMA requestor and serial aliases for serial controller.
> There will be two serial driver i.e. 8250 based simple serial driver
> and APB DMA based serial driver for higher baudrate and performace.
> 
> The simple serial driver get enabled with compatible "nvidia,tegra114-uart",
> "nvidia,tegra20-uart" and APB DMA based driver will get enabled with
> compatible "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart".
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1:
> - Remove UARTB car id correction. Make the compatible with tegra114 and
>   tegra30 for hsuart and tegra20 for simple uart driver.

Why the difference for the two drivers? Either the HW is compatible with
all 3 of 114/30/20 (in which case you only need list 114/20 in the
compatible value), or it's not compatible with either 30/20, since we
already know that 30/20 are compatible with each-other (in which case
you should only list 114 in the compatible property).
