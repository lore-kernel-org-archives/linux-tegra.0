From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE
Date: Mon, 26 Aug 2013 16:19:59 -0600
Message-ID: <521BD48F.1060202@wwwdotorg.org>
References: <20130826153050.GC8764@redacted.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130826153050.GC8764-nxOev/eQj6CGu0OVIAPS5KfLeoKvNuZc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/26/2013 09:30 AM, Kyle McMartin wrote:
> While poking at something using the for-3.12/* trees, I hit the
> following compile error:
> drivers/built-in.o: In function `tegra_pcie_map_irq':
> /builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.armv7hl/drivers/pci/host/pci-tegra.c:640:
> undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> drivers/built-in.o: In function `tegra_msi_map':
> /builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.armv7hl/drivers/pci/host/pci-tegra.c:1227:
> undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> make: *** [vmlinux] Error 1
> 
> Since our .config had CONFIG_CPU_IDLE off. We should probably provide
> an empty function to handle this to avoid cluttering up pci-tegra.c
> with conditionals.

Another approach would be to use if (IS_ENABLED(CPU_IDLE)) at the call
site. I guess the approach in this patch is better than that though,
since it doesn't pollute the callers with knowledge of when this
function is available.

Thierry, if you're OK with this, I can forward it on to arm-soc.
