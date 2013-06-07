From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add basic SecureOS support
Date: Fri, 7 Jun 2013 16:13:58 +0900
Message-ID: <CAAVeFuKxRuLdhO+-+YHG=c-TNGUUJbDj5AHj+K5e8y1JDEDksg@mail.gmail.com>
References: <1370503687-17767-1-git-send-email-acourbot@nvidia.com> <CABb+yY2SFfejMbbYOebMCUuMtAZF3u-yc+6z_MJTG2oOeSwL_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY2SFfejMbbYOebMCUuMtAZF3u-yc+6z_MJTG2oOeSwL_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karan Jhavar <kjhavar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chris Johnson <CJohnson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 6, 2013 at 9:26 PM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Jun 6, 2013 at 12:58 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Boot loaders on some Tegra devices can be unlocked but do not let the
>> system operate without SecureOS. SecureOS prevents access to some
>> registers and requires the operating system to perform certain
>> operations through Secure Monitor Calls instead of directly accessing
>> the hardware.
>>
> IOW, some critical h/w controls on Tegra are accessible only from
> Secure mode (not unusual). So if we(Linux) run in NS mode we need to
> make calls to the SecureOS, over SMC, to do things for us?

Exactly.

>> This patch introduces basic SecureOS support for Tegra. SecureOS support
>> can be enabled by adding a "nvidia,secure-os" property to the "chosen"
>> node of the device tree.
>>
> Probably just a nit, but shouldn't it be "nvidia,nonsecure-os"
> instead, denoting the mode Linux is going to run?  (and then I wonder
> if we could detect the mode (S or NS) at runtime and avoid this flag
> at all).

Detection of the secure mode at runtime would only solve half of the
issue: we would know that we are running in non-secure mode, but we
would still not know what monitor is operating. Detecting that part is
impossible AFAIK, so I'm afraid we need to pass that information
through the DT here.

Alex.
