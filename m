From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix EMC pdata initialization from registers
Date: Thu, 26 Jan 2012 18:15:18 -0800
Message-ID: <CAOesGMgwcxCOHew=3d+--xRmPvJTo9f+C9t0rRAktZdHXkaPTA@mail.gmail.com>
References: <1327626743-32478-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327626743-32478-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 5:12 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Commit d91eeb0 "ARM: tegra: emc: device tree support" modified the EM=
C
> driver to create an EMC table from existing register settings when no=
ne
> was provided through platform data or device tree. This code wrote th=
e
> wrong clock rate into the table; the actual rate in Hz, rather than t=
he
> expected half-rate in KHz. This caused the BUG_ON in
> tegra2_emc_clk_round_rate() to fire, since that enormous rate could n=
ot
> be generated.
>
> Fixes:
>
> [ =A0 =A02.425921] kernel BUG at arch/arm/mach-tegra/tegra2_clocks.c:=
1158!
> ...
> [ =A0 =A02.618766] [<c001c0e8>] (tegra2_emc_clk_round_rate+0x58/0x70)=
 from [<c00198b4>] (clk_round_rate+0x48/0x68)
> [ =A0 =A02.628494] [<c00198b4>] (clk_round_rate+0x48/0x68) from [<c00=
19cc0>] (clk_set_rate_locked+0x40/0x68)
> [ =A0 =A02.637707] [<c0019cc0>] (clk_set_rate_locked+0x40/0x68) from =
[<c0019d10>] (clk_set_rate+0x28/0x40)
> [ =A0 =A02.646754] [<c0019d10>] (clk_set_rate+0x28/0x40) from [<c001f=
fc8>] (tegra_update_cpu_speed+0x54/0x144)
> [ =A0 =A02.656144] [<c001ffc8>] (tegra_update_cpu_speed+0x54/0x144) f=
rom [<c002016c>] (tegra_target+0xb4/0xe0)
> [ =A0 =A02.665538] [<c002016c>] (tegra_target+0xb4/0xe0) from [<c01a9=
6c0>] (__cpufreq_driver_target+0x88/0xa4)
> [ =A0 =A02.674931] [<c01a96c0>] (__cpufreq_driver_target+0x88/0xa4) f=
rom [<c01ac9d0>] (dbs_check_cpu+0x324/0x340)
> [ =A0 =A02.684582] [<c01ac9d0>] (dbs_check_cpu+0x324/0x340) from [<c0=
1aca40>] (do_dbs_timer+0x54/0xf4)
> [ =A0 =A02.693277] [<c01aca40>] (do_dbs_timer+0x54/0xf4) from [<c0036=
9a8>] (process_one_work+0x1d4/0x320)
> [ =A0 =A02.702225] [<c00369a8>] (process_one_work+0x1d4/0x320) from [=
<c0036f34>] (worker_thread+0x134/0x230)
> [ =A0 =A02.711437] [<c0036f34>] (worker_thread+0x134/0x230) from [<c0=
03add0>] (kthread+0x80/0x8c)
> [ =A0 =A02.719700] [<c003add0>] (kthread+0x80/0x8c) from [<c000ebf4>]=
 (kernel_thread_exit+0x0/0x8)
>
> Reported-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied.


-Olof
