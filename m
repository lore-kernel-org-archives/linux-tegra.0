From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/4] i2c: tegra: Bug fixes, cleanups and M_NOSTART support
Date: Tue, 5 Jun 2012 22:37:36 +0530
Message-ID: <4FCE3CD8.8060502@nvidia.com>
References: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com> <4FCE3078.1030008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FCE3078.1030008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 05 June 2012 09:44 PM, Stephen Warren wrote:
> On 06/05/2012 07:09 AM, Laxman Dewangan wrote:
>> This patch series having the:
>> - Handling of late register write due to Tegra PPSB design.
>> - support for I2C_M_NOSTART
>> - Use devm_* for all allocation.
> The series,
>
> Acked-by: Stephen Warren<swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> Note that patch 4 touches context adjacent to Prashant's "i2c: tegra:
> Add clk_prepare/clk_unprepare" patch, which I hope to take through the
> Tegra tree since it's a requirement for the Tegra common clock
> conversion. I don't think this will cause any significant conflict, but
> perhaps it's worth resolving it explicitly.
>
> Wolfram, perhaps we should put these 4 patches and Prashan'ts into their
> own topic branch so that you can merge it into the I2C tree, and I can
> merge it into the Tegra tree too? Or, I can take everything through
> Tegra if you want, and ack it.
>
> Laxman, do you expect any more I2C-related changes this kernel cycle?
I have two more changes in plan:
-I2c controller require two clock source and the fixes towards that. 
This can go on Tegra tree as changes are require in 
mach-tegra/tegra30_clock.c, tegra20_clock.c files also.

- Run time PM support but can be done later.
