From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: add support for tegra30 interrupts
Date: Wed, 2 Nov 2011 19:54:04 +0000
Message-ID: <20111102195404.GF12913@n2100.arm.linux.org.uk>
References: <1320248292-22736-1-git-send-email-pdeschrijver@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173F9A46E5@HQMAIL01.nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173F9A4758@HQMAIL01.nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173F9A47A7@HQMAIL01.nvidia.com> <20111102192112.GC12913@n2100.arm.linux.org.uk> <20111102192625.GD14372@legolas.emea.dhcp.ti.com> <20111102193947.GD12913@n2100.arm.linux.org.uk> <20111102194827.GF14372@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111102194827.GF14372-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 02, 2011 at 09:48:28PM +0200, Felipe Balbi wrote:
> Hi,
> 
> you forgot to comment on the fact that gpio_desc shouldn't be held in an
> array. Any comments ?

I did not comment on that because that's someone elses problem.

> What I mean is that, just like irq_descs, we should be able to allocate
> them dynamically. Maybe, just like irq_descs, hold them in a radix tree
> and maybe even have a matching API "gpio_alloc_descs()".

Probably - I expect Grant would really like to see some patches along
those lines.  As I say, someone elses problem.

But what is _our_ problem is what to do with all the ARCH_NR_GPIOs
that we have now, and stop them increasing.  There is a trivial solution
to that which I outlined which can be used until GPIO gets something
along your idea - and which doesn't involve me having to argue with
those who think that the kernel should remain as small as possible.
