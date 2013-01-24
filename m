From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [v3 2/2] ARM: tegra: Skip scu_enable(scu_base) if not Cortex A9
Date: Thu, 24 Jan 2013 07:42:06 +0100
Message-ID: <20130124.084206.122831115046505200.hdoyu@nvidia.com>
References: <CAOesGMgtaCkiv285TU_vbAokN5M2MrANQ9piDcyXu5YMmbQq3A@mail.gmail.com><50FFA620.50008@ti.com><5100C0F7.9080101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5100C0F7.9080101-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "santosh.shilimkar-l0cyMroinI0@public.gmane.org" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Thu, 24 Jan 2013 06:04:55 +0100:

> Branch scu-base-rework contains just the SCU base address patches. After
> the few things listed below, I'll rename this branch and send a pull
> request to arm-soc.
> 
....
> 2) Lorenzo's last comment on "ARM: tegra: Use DT /cpu node to detect
> number of CPU core" was:
> 
> Please add missing punctuation, reword the commit log to make it clearer.
> 
> ... so that patch needs a reworded commit log.

I fixed. I'll send this[1] as a part of the "Tegra114 series(v4)" today.

[1] ARM: tegra: Use DT /cpu node to detect number of CPU core
