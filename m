From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/11] ARM: tegra: Switch to new pinctrl driver
Date: Tue, 3 Apr 2012 22:49:13 +0200
Message-ID: <CACRpkdaQ2owAFxpF-F2t8m2MUEx0CY1gjvwUA1JGLJ6UOci30g@mail.gmail.com>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
	<1333148404-17691-9-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148404-17691-9-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Mar 31, 2012 at 1:00 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:

> ---
> v3: Remove GPIO-related code, use mapping table instead of pinctrl AP=
Is
> =A0 =A0for all pinconfig setup. Don't tristate PCIe pingroups on Harm=
ony.
> =A0 =A0Note: Before this version, this patch had the following acks, =
but I've
> =A0 =A0removed them due to the rework:
> =A0 =A0Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> =A0 =A0Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I guess this goes through the Tegra tree,
Linus Walleij
