From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 21/21] ARM: tegra: clock: Miscellaneous clock updates
Date: Sun, 20 Feb 2011 20:28:54 -0800
Message-ID: <AANLkTikE8wVsuZ0QNZoB0htowSs+xeCa5+ockXH6_TgG@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-23-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-23-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 19, 2011 at 2:26 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> Correct max rates for pclk and sclk (Originally fixed by
> =A0Dima Zavin <dima-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>)
>
> Correct max rate for plla (Originally fixed by
> =A0Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>)
>
> Remove unnecessary no-op set_rate on audio clocks
>
> Add clock lookup entries for grhost, bsea, and vde clocks
>
> Update clock clookup entries for vcp, bsea, and vde clocks
>
> Add shared clock entries for sclk and emc
>
> Add a virtual cop clock to provide a reset op (Originally fixed by
> =A0Dima Zavin <dima-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>)
>
> Pass set_rate on super clocks through to parent
>
> Fix pllx frequency table entry for 608 MHz
>
> Remove incorrect plla frequency table entries
>
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
