From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE
Date: Thu, 29 Aug 2013 13:54:41 -0700
Message-ID: <20130829205441.GT18542@quad.lixom.net>
References: <1377629554-17490-1-git-send-email-swarren@wwwdotorg.org>
 <1377629554-17490-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377629554-17490-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 27, 2013 at 12:52:34PM -0600, Stephen Warren wrote:
> From: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
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
> 
> Signed-off-by: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [swarren, removed unnecessary return statement]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Applied.


-Olof
