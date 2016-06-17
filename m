From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 07/13] dt-bindings: i2c: Add support for 'i2c-bus'
 subnode
Date: Fri, 17 Jun 2016 17:30:54 +0100
Message-ID: <20160617163054.GD32754@leverpostej>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-8-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-8-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 17, 2016 at 01:03:41PM +0100, Jon Hunter wrote:
> The I2C driver core for boards using device-tree assumes any subnode of
> an I2C adapter in the device-tree blob as being a I2C slave device.
> Although this makes complete sense, some I2C adapters may have subnodes
> which are not I2C slaves but subnodes presenting other features. For
> example some Tegra devices have an I2C interface which may share its
> pins with other devices and to share these pins subnodes for
> representing these pins so they have be shared via the pinctrl framework
> are needed.
> 
> To allow I2C adapters to have non-I2C specific subnodes in device-tree
> that are not parsed by the I2C driver core by adding support for a
> 'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
> subnode is present then all I2C slaves must be placed under this subnode.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index f31b2ad1552b..ed56b08c7e6e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -32,6 +32,14 @@ wants to support one of the below features, it should adapt the bindings below.
>  - clock-frequency
>  	frequency of bus clock in Hz.
>  
> +- i2c-bus
> +	For I2C adapters that have child nodes that are a mixture of both I2C
> +	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'
> +	subnode can be used for populating I2C devices to prevent the I2C core
> +	from attempting to add any non-i2c nodes as I2C devices. If 'i2c-bus'
> +	subnode is present then all I2C slaves must be added under this
> +	subnode.

The general idea seems sound.

It would be good if we could remove the mention of the I2C core,
something like:

  - i2c-bus
	For I2C adapters that have child nodes that are a mixture of both I2C
	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'
	subnode can be used for populating I2C devices. If an 'i2c-bus'
	subnode is present, only subnodes of this will be considered as
	I2C slaves.

How are #address-cells and #size-cells handled in this case? I assume
that they should live under the i2c-bus subnode, which should be called
out.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
