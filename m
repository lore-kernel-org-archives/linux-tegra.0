From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 05/21] ARM: tegra: clock: Disable clocks left on by bootloader
Date: Sun, 20 Feb 2011 16:40:51 -0800
Message-ID: <AANLkTim8i5vvizBViqFCyq9i+7Uo2E1BrNRf_gtnMb-v@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-7-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-7-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sat, Feb 19, 2011 at 2:25 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
> Adds CONFIG_TEGRA_DISABLE_BOOTLOADER_CLOCKS that iterates
> through all clocks, disabling any for which the refcount
> is 0 but the clock init detected the bootloader left the
> clock on.


I would argue that any kernel functionality that relies on clocks
being left on my bootloader is buggy, and/or should at least have
those clocks enabled in the static clock tables for the boards in
question, since it creates an undocumented dependency on firmware.

I would prefer if it disabled the clocks by default (after warning),
but that there was a runtime way to override while debugging (i.e. add
a bootarg 'keep_fwclocks' or similar to keep the firmware-enabled
clocks running and just warn about them).


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
