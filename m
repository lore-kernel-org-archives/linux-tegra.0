From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: dt: tegra: cleanup pass
Date: Sun, 13 May 2012 13:18:03 -0700
Message-ID: <CAOesGMh_adby1fdhoKZ0xovXpAP1nTYOGcDr1DCjZx4yMjR2vQ@mail.gmail.com>
References: <1336783081-16978-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336783081-16978-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 11, 2012 at 5:37 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I've been wanting to clean up the Tegra .dts files for a little while.
> Here's a set of changes to do so. Hopefully they don't seem to much
> like churn.
>
> I was thinking of putting them into a for-3.6/cleanup branch, but I
> suppose I could put them into 3.5 at the end too. I'd need to base this
> series on the result of merging Tegra's for-3.5/dt and
> for-3.5/tegra30-audio branches. Olof, what are your thoughts here?

We could merge it with next/dt2 in arm-soc, so it should be fine. Get
it sent in the next day or two though, please.

> I've tested them on Cardhu so far, but still need to test all the other
> boards to make sure I didn't introduce some typo.

Series generally looks sane, nice cleanup. Overall:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
