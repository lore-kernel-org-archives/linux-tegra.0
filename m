From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: use new gpio_lock_as_irq() API
Date: Thu, 17 Oct 2013 10:53:38 +0200
Message-ID: <CACRpkdZ27cDaMFVNiNMDD+C_fVpE+OtGTOShC6qHuXU05Krt=g@mail.gmail.com>
References: <1381951533-18179-1-git-send-email-swarren@wwwdotorg.org>
	<525F5D69.60906@linux.intel.com>
	<525F66B1.9020903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525F66B1.9020903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Cohen <david.a.cohen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 17, 2013 at 6:25 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 10/16/2013 09:45 PM, David Cohen wrote:
>> Hi Stephen,
>>
>> On 10/16/2013 12:25 PM, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Whenever an IRQ is claimed or freed, call gpio_lock_as_irq() or
>>> gpio_unlock_as_irq() on the associated GPIO, to prevent that GPIO from
>>> being configured in a manner incompatible with an interrupt.
>
>> As a suggestion, you could add a pointer to dev on tegra gpio priv data
>> and recover it using ira_data_get_irq_chip_data(), instead of using
>> static file-scope variable.
>
> That's true, but I figured it wasn't worth doing that without getting
> rid of all the other global data, which is a subject for another patch.

Yeah that would be nice, singletons are a bit unorthodox these
days but it's certain a separate refactoring.

Yours,
Linus Walleij
