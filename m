From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/5] of: Add nvidia,controller-id property to Tegra
 I2C bindings
Date: Wed, 20 Aug 2014 14:19:35 -0600
Message-ID: <53F502D7.9030403@wwwdotorg.org>
References: <1407933685-12404-1-git-send-email-mperttunen@nvidia.com> <1407933685-12404-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407933685-12404-3-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/13/2014 06:41 AM, Mikko Perttunen wrote:
> Sometimes, hardware blocks want to issue requests to devices
> connected to I2C buses by itself. In such case, the bus the
> target device resides on must be configured into a register.
> For this purpose, each I2C controller has a defined ID known
> by the hardware. Add a property for these IDs to the device tree
> bindings, so that drivers can know what ID to write to a hardware
> register when configuring a block that sends I2C messages autonomously.

> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt

> +Optional properties:
> +- nvidia,controller-id: ID of controller when referred to in
> +                        hardware registers.

I'd prefer to put this information into the thermal trip node, since 
this represents what ID the PMC uses to communicate with the I2C 
controller, and there's no absolute guarantee that multiple clients that 
communicate directly with an I2C controller would use the same numbering 
scheme.

If that doesn't work, can be at least name this nvidia,pmc-controller-id 
or nvidia,id-in-pmc so that if there are different numbering schemes, 
there's a clear path to represent this in different properties without 
conflicting names?
