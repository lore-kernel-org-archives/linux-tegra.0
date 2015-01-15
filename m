From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra20: cpuidle: remove unnecessary "resettable"
 status clear
Date: Thu, 15 Jan 2015 16:23:52 +0300
Message-ID: <54B7BF68.9030303@gmail.com>
References: <1421326202-29845-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421326202-29845-1-git-send-email-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

15.01.2015 15:49, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> CPU1 "resettable" status is already cleared by final suspend function=
 in case
> of suspend abortion and by reset handler in case of completed CPU pow=
ergate,
> no point to do it again.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   arch/arm/mach-tegra/cpuidle-tegra20.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-te=
gra/cpuidle-tegra20.c
> index b30bf5c..ad6158e 100644
> --- a/arch/arm/mach-tegra/cpuidle-tegra20.c
> +++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
> @@ -158,8 +158,6 @@ static bool tegra20_idle_enter_lp2_cpu_1(struct c=
puidle_device *dev,
>
>   	cpu_suspend(0, tegra20_sleep_cpu_secondary_finish);
>
> -	tegra20_cpu_clear_resettable();
> -
>   	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
>
>   	return true;
>
Completely forgot to remove it also from 'sleep.h' and 'sleep-tegra20.S=
'. Please=20
ignore this patch, I'll include it in ASM -> C conversion series.

--=20
Dmitry
