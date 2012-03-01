From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: tegra: export tegra_gpio_{en,dis}able
Date: Thu, 1 Mar 2012 11:59:21 -0800
Message-ID: <CAOesGMhom2ybsKKgezPKkrhH9NniZu+FMprQhibHwEX92MNtEQ@mail.gmail.com>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
	<1330630010-11241-2-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330630010-11241-2-git-send-email-alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Mar 1, 2012 at 11:26 AM, Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org> wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> These two functions are used in drivers that can be
> modules, so they need to be exported.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

With some of the pinmux changes going in this will no longer be
needed, but it is for now so:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
