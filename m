From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: tegra: set CPU reset handler with firmware op
Date: Fri, 14 Jun 2013 17:54:59 +0900
Message-ID: <CAAVeFuLi6-WnFP9LvEdqfj2cuK7pgW0_pg33i-Ucoobcxb8RSQ@mail.gmail.com>
References: <1371114745-24710-1-git-send-email-acourbot@nvidia.com>
 <1371114745-24710-4-git-send-email-acourbot@nvidia.com> <51BA1C3D.1010608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51BA1C3D.1010608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karan Jhavar <kjhavar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chris Johnson <CJohnson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 14, 2013 at 4:23 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 06/13/2013 03:12 AM, Alexandre Courbot wrote:
>> Use a firmware operation to set the CPU reset handler and only resort to
>> doing it ourselves if there is none defined.
>>
>> This supports the booting of secondary CPUs on devices using a TrustZone
>> secure monitor.
>
>> diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
>
>> +     err = call_firmware_op(set_cpu_boot_addr, 0, reset_address);
>> +     switch (err) {
>> +     case -ENOSYS:
>> +             tegra_cpu_reset_handler_set(reset_address);
>> +             /* pass-through */
>
> Rather than detecting -ENOSYS and falling back to the custom
> tegra_cpu_reset_handler_set(), does it make sense to plug in
> tegra_cpu_reset_handler_set as the firmware op when there is no secure
> firmware detected? That way, this code wouldn't need the special case;
> that would be isolated to firmware.c.

Mmmm I admit I just followed what Exynos did without thinking much
about it. I don't see any reason why your suggestion wouldn't work,
but on second thought tegra_cpu_reset_handler_set() is not a firmware
operation - wouldn't it be unexpected (and maybe confusing) to have it
called through call_firmware_op()?

Alex.
