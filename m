From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 13/19] ARM: dts: tegra: replace legacy *,wakeup property
 with wakeup-source
Date: Wed, 23 Dec 2015 11:24:38 +0000
Message-ID: <CAPKp9uZ1hMegdL6wTUT0ROGd5CzyrnfKWsSRShXNdwRcyZ4Pnw@mail.gmail.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
	<1445422216-29375-14-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445422216-29375-14-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 21, 2015 at 11:10 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> Though the keyboard and other driver will continue to support the legacy
> "gpio-key,wakeup", "nvidia,wakeup-source" boolean property to enable the
> wakeup source, "wakeup-source" is the new standard binding.
>
> This patch replaces all the legacy wakeup properties with the unified
> "wakeup-source" property in order to avoid any futher copy-paste
> duplication.
>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Ping, do you prefer taking via your tree or should I send to armsoc
directly ?

--
Regards,
Sudeep
