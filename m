From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: tegra: clock: Round rate before setting rate
Date: Mon, 21 Feb 2011 21:26:04 -0800
Message-ID: <AANLkTikV4++xA6JCh2yx_krdJrFddioZjBWe9pHP0b-x@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-3-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298342392-21236-3-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 6:39 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> Call the clock's round_rate op, if it exists, before calling
> the set_rate op. =A0This will help later when dvfs is added,
> dvfs needs to know what the final rate will be before the
> frequency changes.
>
> Also requires fixes to the round rate functions to ensure
> calling round rate and then set rate will not cause the
> frequency to be rounded down twice. =A0When picking clock
> divider values, the clock framework picks the closest
> frequency that is lower than the requested frequency. =A0If
> the new frequency calculated from the divider value is
> rounded down, and then passed to set_rate, it will get
> rounded down again, possibly resulting in a frequency two
> steps lower than the original requested frequency.
>
> Fix the problem by rounding up when calculating the frequency
> coming out of a clock divider, so if that frequency is
> requested again, the same divider value will be picked.
>
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
