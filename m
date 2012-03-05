From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V2 0/3] Open drain/open source support from gpio library
Date: Mon, 5 Mar 2012 07:50:14 -0700
Message-ID: <20120305145014.GA27229@ponder.secretlab.ca>
References: <1329490582-22107-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1329490582-22107-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, linus.walleij@stericsson.com, rdunlap@xenotime.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 17, 2012 at 08:26:18PM +0530, Laxman Dewangan wrote:
> This patch is as per discussion on the patch
> [PATCH V1] regulator: fixed: Support for open-drain gpio 
> where it was suggested to push the handling of open drain gpios
> into the gpio libray.
> 
> This is series of patches  to add support of the open drain and open
> source gpios in standard gpio library.
> - Added GPIOF_OPEN_DRAIN flag so that client can request the
>   gpio with this flag. Handle open drain gpio configuration properly.
> - Added GPIOF_OPEN_SOURCE flag so that client can request the
>   gpio with this flag. Handle open source gpio configuration properly.
> - Gpio documentation changes to have support for open-drain.
> 
> From the patch series of V1, it is discussed to
> - remove the sysfs interface supportsi for open drain.
> - Added open source support as a new change.
> 
> Laxman Dewangan (3):
>   Documentation: gpio: Add details of open-drain/source configuration
>   gpio: gpiolib: Support for open drain/collector gpios
>   gpio: gpiolib: Support for open source/emitter gpios

Applied, thanks

g.

> 
>  Documentation/gpio.txt |   17 +++++++++-
>  drivers/gpio/gpiolib.c |   83 ++++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/gpio.h   |    6 +++
>  3 files changed, 102 insertions(+), 4 deletions(-)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
