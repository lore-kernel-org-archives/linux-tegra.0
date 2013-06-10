From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add basic SecureOS support
Date: Mon, 10 Jun 2013 10:35:57 -0600
Message-ID: <51B6006D.7010409@wwwdotorg.org>
References: <1370503687-17767-1-git-send-email-acourbot@nvidia.com> <51B0BC80.9040007@wwwdotorg.org> <CAAVeFu+by44HnOzv_85kwgeCx5b9TxiMhr27x69QcUj9GRbk8A@mail.gmail.com> <51B20B46.4030501@wwwdotorg.org> <CAAVeFu+UMZikdWO20c9chvBcieOAUgOhz-nTEUpevFWnPNC_ZA@mail.gmail.com> <20130610091415.GS18614@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130610091415.GS18614-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Chris Johnson <CJohnson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karan Jhavar <kjhavar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/10/2013 03:14 AM, Russell King - ARM Linux wrote:
> On Mon, Jun 10, 2013 at 05:11:15PM +0900, Alexandre Courbot wrote:
>> On Sat, Jun 8, 2013 at 1:33 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>>> I think we need to separate the concept of support for *a* secure
>>>>> monitor, from support for a *particular* secure monitor.
>>>>
>>>> Agreed. In this case, can we assume that support for a specific secure
>>>> monitor is not arch-specific, and that this patch should be moved
>>>> outside of arch-tegra and down to arch/arm? In other words, the ABI of
>>>> a particular secure monitor should be the same no matter the chip,
>>>> shouldn't it?
>>>
>>> I would like to believe that the Trusted Foundations monitor had the
>>> same ABI irrespective of which Soc it was running on. However, I have
>>> absolutely no idea at all if that's true. Even if there's some common
>>> subset of the ABI that is identical across all SoCs, I wouldn't be too
>>> surprised if there were custom extensions for each different SoC, or
>>> just perhaps even each product.
>>>
>>> Can you research this and find out the answer?
>>
>> Will do. Information about TF is scarce unfortunately.
> 
> The answer is... there isn't a common ABI.  That is something I pressed
> ARM Ltd for when this stuff first appeared and they were adamant that
> they were not going to specify any kind of ABI for this interface.

Right, there certainly isn't a common ABI across all secure monitors,
but in this case I was wondering something more specific: whether for
this specific implementation/provider of a secure monitor, if they had a
consistent ABI across all SoCs (or even boards) that they implemented it on.
