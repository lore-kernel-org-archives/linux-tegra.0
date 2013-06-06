From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add basic SecureOS support
Date: Thu, 6 Jun 2013 19:37:49 +0900
Message-ID: <51B0667D.30801@nvidia.com>
References: <1370503687-17767-1-git-send-email-acourbot@nvidia.com> <1740292.8Sz57ytBcM@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1740292.8Sz57ytBcM@flatron>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karan Jhavar <kjhavar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chris Johnson <CJohnson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tomasz,

On 06/06/2013 07:17 PM, Tomasz Figa wrote:
>> +Global properties
>> +-------------------------------------------
>> +
>> +The following properties can be specified into the "chosen" root
>> +node:
>> +
>> +  nvidia,secure-os: enable SecureOS.
>
> Hmm, on Exynos we had something like
>
>          firmware@0203F000 {
>                  compatible = "samsung,secure-firmware";
>                  reg = <0x0203F000 0x1000>;
>          };
>
> but your solution might be actually the proper one, since firmware is not
> a hardware block. (The address in reg property is pointing to SYSRAM
> memory, which is an additional communication channel with the firmware.)

Yes, I saw your implementation but decided to do it through the chosen 
node anyway, since that's what it seems to be designed and we don't need 
any reg parameter.

> I think this patch could be split into several patches:
>   - add support for firmware
>   - split reset function
>   - add reset support using firmware.

Mmm possibly yes, but I wonder if that would not be too much splitting. 
Stephen?

> Hmm, I wonder if you need all this complexity here. Have a look at our
> exynos_smc function
>
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/arch/arm/mach-exynos/exynos-smc.S?id=refs/tags/next-20130606

Yes, I just embarrassed myself showing my ignorance of ARM assembler. ;) 
The fix Russel proposed is pretty close to your version.

>> +static const struct firmware_ops tegra_firmware_ops = {
>> +     .set_cpu_boot_addr = tegra_set_cpu_boot_addr,
>> +};
>
> It's good that this interface is finally getting some user besides Exynos.

I didn't know about it first but Joseph kindly pointed it out to me and 
it indeed makes it easier to implement this.

Thanks,
Alex.
