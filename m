From: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dt: paz00: define nvec as child of i2c bus
Date: Tue, 21 Jul 2015 09:35:21 +0300
Message-ID: <55ADE829.4030108@mail.ru>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru> <1437424546-30405-5-git-send-email-danindrey@mail.ru> <55AD73F4.2050502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AD73F4.2050502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.07.2015 1:19, Stephen Warren wrote:
> On 07/20/2015 02:35 PM, Andrey Danin wrote:
>> NVEC driver was reimplemented to use tegra i2c. Use common i2c bindings
>> for NVEC node.
>
>> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
>> b/arch/arm/boot/dts/tegra20-paz00.dts
>
>> +        nvec: nvec@45 {
>> +            compatible = "nvidia,nvec-slave";
>> +            reg = <0x45>;
>
> I think you need to or in I2C_OWN_SLAVE_ADDRESS from
> <dt-bindings/i2c/i2c.h> here?

Sorry, I mentioned it in letter 0 only.
I will rework nvec driver and device tree according to i2c core slave 
implementation later. v3 of this patchset is for fixing tegra i2c driver 
only.
