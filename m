From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 2/4] staging/nvec: reimplement on top of tegra i2c
 driver
Date: Mon, 20 Jul 2015 16:18:11 -0600
Message-ID: <55AD73A3.6000706@wwwdotorg.org>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru> <1437424546-30405-3-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437424546-30405-3-git-send-email-danindrey-JGs/UdohzUI@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/20/2015 02:35 PM, Andrey Danin wrote:
> Remove i2c controller related code and use tegra i2c driver in slave mode.
> Update nvec documentation.

> diff --git a/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt b/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt

I would expect this patch to add a new binding file 
nvidia,nvec-slave.txt so that the filename continues to match the 
compatible value it documents. This patch introduces a new binding for 
the NVEC slave as opposed to modifying the existing binding.

> +- compatible : should be "nvidia,nvec-slave".
> +- reg: the i2c address of the slave controller

I think "the I2C address to respond to" would be clearer? You might also 
mention that this needs to include flags from <dt-bindings/i2c/ic2.h>.
