From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2] MAINTAINERS: add keyword "tegra" to Tegra section
Date: Mon, 11 Feb 2013 09:56:35 -0800
Message-ID: <1360605395.2028.28.camel@joe-AO722>
References: <1360605099-7088-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360605099-7088-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: arm@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-02-11 at 10:51 -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> The intent is to ensure that all Tegra-related patches are sent to the
> linux-tegra@ mailing list, so people can keep up-to-date on all misc
> driver changes.
> 
> Doing this with a keyword is far simpler and more compact than listing
> all Tegra-related drivers, even if wildcards were used.
> 
> Words such as integrate or integrator are common. Ensure the character
> right before "tegra" isn't a-z (case-insensitive), to make sure the
> keyword doesn't match those.
> 
> Cc: Joe Perches <joe@perches.com>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  MAINTAINERS |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b98c89b..10e9b31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7829,9 +7829,7 @@ L:	linux-tegra@vger.kernel.org
>  Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
>  S:	Supported
> -F:	arch/arm/mach-tegra
> -F:	arch/arm/boot/dts/tegra*
> -F:	arch/arm/configs/tegra_defconfig
> +K:	(?i)[^a-z]tegra
>  
>  TEHUTI ETHERNET DRIVER
>  M:	Andy Gospodarek <andy@greyhouse.net>

It's probably not a good idea to remove
any of the F: lines as there are files
that could get modified in those paths
without any tegra word in the patch.
