From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 18/21] ARM: tegra: cpufreq: Adjust memory frequency
 with cpu frequency
Date: Sun, 20 Feb 2011 20:23:20 -0800
Message-ID: <AANLkTikbOQZ2jW+mfN41dXwuKVVJ3vCVKRZLezxbj61o@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-20-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-20-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 19, 2011 at 2:26 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

Patch description please. Besides that:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

But note for future work:


> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Vote on memory bus frequency based on cpu frequenc=
y
> + =A0 =A0 =A0 =A0* This sets the minimum frequency, display or avp ma=
y request higher
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (rate >=3D 816000)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_set_rate(emc_clk, 600000000); /* cp=
u 816 MHz, emc max */
> + =A0 =A0 =A0 else if (rate >=3D 456000)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_set_rate(emc_clk, 300000000); /* cp=
u 456 MHz, emc 150Mhz */
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_set_rate(emc_clk, 100000000); =A0/*=
 emc 50Mhz */
> +


This hardcodes frequencies that might or might not be used on some
systems and some parts. So it'll need to be revisited when enabling
other configurations.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
