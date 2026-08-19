Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CE3DCDA3;
	Wed, 19 Aug 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124699; cv=none; b=BNIuLysf3SkZekPIx4uu8oPVn9MS7wWIQW/djF+6utom0Q/dlXO7JrwYjFHrR47O3Oyih/701yiOQ4VCONvjkBfMzPk1+8Dy3d3+iZAGJqrf8WEAoGIy/Cr2J8EpmCNaG3mkexJaEFFpliM1bZLqNw3ZBcgxsdVNwsDq/Q1CbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124699; c=relaxed/simple;
	bh=/AV77nngDAMTr2yMd1BMXJXCCtriPp4MXTLmWc3GeHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkNOQRYhFLaw+q8FeTtV3pDpKF2WzCehw5CIkTKpPakPZUOgtwAPR8M7z5mDGgjCwsmDJxyWjSlXkbMFq1+A6zomsNfoV0tGD8pXbFfscflk227Z5uMsv836pnl6Z1CcOmMiomrRQbCx0i8hUU/qjuCgBHa5hoWtEDy3FtqfveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr0oUucK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr0oUucK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE76C1F000E9;
	Wed, 19 Aug 2026 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787124696;
	bh=3HC9hzqp25hJ9dnFkyg3+4PSSoZICNQ+8dExx/7chds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr0oUucKoheS3zqBS3EqHM07soF7W/biU/1NSGlWU/Xxf+DOFemVcmIm5YosXdpMt
	 PudcHgdJL6I3FxB67iBX3QCDqxCPrP7W0qBY9bLAcjGdg9rkT2o+yv0GHBoKWidKud
	 g+42uBSMsj8mhX3xRGReSaqDSiCRKrVYtICbOzPbcjE8jfggnrp6RfOlkKZCr9mUR0
	 3rAoXZNK53Idf331vcMLgnDdVf79nUKnPG0Dm5jUWeJN0W5uoHUBa9meWaqTZ4YaUO
	 es6N/H67wYyf0LIJhnrEB/KA5OUrrx/oldcOnjadA7Cu9i1y1AZbOKPZ6frBmdjZsw
	 iSFuK7EG3VRcw==
Date: Wed, 19 Aug 2026 00:31:34 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v9 1/3] usb: add missing headers transitively included by
 <linux/phy/phy.h>
Message-ID: <aoVb1kxR11yP0Uvv@hu-petche-lv.qualcomm.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
 <20260810125614.441667-2-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810125614.441667-2-vladimir.oltean@nxp.com>

On 26-08-10 15:56:12, Vladimir Oltean wrote:
> The chipidea ci_hdrc_imx driver uses regulator consumer API like
> regulator_enable() but does not include <linux/regulator/consumer.h>.
> 
> The core USB HCD driver calls invalidate_kernel_vmap_range() and
> flush_kernel_vmap_range(), but does not include <linux/highmem.h>.
> 
> The DWC3 gadget driver calls:
> - device_property_present()
> - device_property_count_u8()
> - device_property_read_u8_array()
> but does not include <linux/property.h>
> 
> Similarly, dwc3-imx uses device_property_read_bool() without including
> <linux/property.h>.
> 
> The dwc3-generic-plat driver uses of_device_get_match_data() but does
> not include <linux/of.h>.
> 
> In all these cases, the necessary includes were still provided somehow,
> directly or indirectly, through <linux/phy/phy.h>. I found the following
> command to be quite helpful in figuring out the include chain:
> 
> $ make KCFLAGS="-H" drivers/usb/dwc3/dwc3-imx.o
> 
> Since <linux/phy/phy.h> wants to drop the unnecessary includes, fill in
> the required headers to avoid any breakage.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> # dwc3
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org> #chipidea part

Peter
> 
> v7->v9: none
> v6->v7:
> - add drivers/usb/dwc3/dwc3-imx.c to the list of patched files
> - collect tag from Greg, keeping it despite the new addition because the
>   change is minor and in the same spirit as the rest
> (https://lore.kernel.org/linux-phy/2026033028-squint-yield-4c23@gregkh/)
> v2->v6: none
> v1->v2: collect tag
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
>  drivers/usb/core/hcd.c               | 1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  drivers/usb/dwc3/dwc3-imx.c          | 1 +
>  drivers/usb/dwc3/gadget.c            | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 282314eea7fc..1509b8ec630c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -17,6 +17,7 @@
>  #include <linux/clk.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm_qos.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "ci.h"
>  #include "ci_hdrc_imx.h"
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8e8a5f59b319..f7def9b116e0 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/bcd.h>
> +#include <linux/highmem.h>
>  #include <linux/module.h>
>  #include <linux/version.h>
>  #include <linux/kernel.h>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..2f2ae6f4704f 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> index 973a486b544d..6e122674edaf 100644
> --- a/drivers/usb/dwc3/dwc3-imx.c
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  
>  #include "core.h"
>  #include "glue.h"
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index fa0f16ffafef..e70c17d50db8 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/delay.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
