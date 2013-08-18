From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: tegra: add support for Trusted Foundations
Date: Sun, 18 Aug 2013 17:37:00 +0900
Message-ID: <CAAVeFuJY_UkS8rF=xfB0uEpJp4bZpc77i599bP4qmY9Xr91PSQ@mail.gmail.com>
References: <1376360992-1508-1-git-send-email-acourbot@nvidia.com>
 <1376360992-1508-3-git-send-email-acourbot@nvidia.com> <520BF8BD.7050706@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <520BF8BD.7050706-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 15, 2013 at 6:38 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/12/2013 08:29 PM, Alexandre Courbot wrote:
>> Register the firmware operations for Trusted Foundations if the device
>> tree indicates it is active on the device.
>
>> diff --git a/arch/arm/mach-tegra/firmware.c b/arch/arm/mach-tegra/firmware.c
>
>> +void __init tegra_init_firmware(void)
>> +{
>> +     struct device_node *node;
>> +
>> +     if (!of_have_populated_dt())
>> +             return;
>
> That's never false on Tegra, at least upstream.

Will remove, thanks.

>> +     node = of_find_compatible_node(NULL, NULL, "tl,trusted-foundations");
>> +     if (node) {
>> +             const char *tf_version;
>> +             int err;
>> +
>> +             err = of_property_read_string(node, "version", &tf_version);
>> +             if (err != 0) {
>> +                     pr_crit("Cannot read Trusted Foundation version: %d\n",
>> +                             err);
>> +                     BUG();
>> +             } else {
>> +                     register_trusted_foundations(tf_version);
>> +             }
>> +     }
>> +}
>
> I think most/all of that function will be common across all SoCs that
> support the TF monitor. I think you want to move the code into
> register_trusted_foundations() (or a function that calls that) in patch 1?

Agreed. If we push the logic a bit further, we should also have some
platform parameters for non-DT users, along with an
of_register_trusted_foundations() for those who prefer DT.

Thanks,
Alex.
