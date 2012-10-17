From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: correct bank for pingroup and drv pingroup
Date: Wed, 17 Oct 2012 09:48:16 -0600
Message-ID: <507ED340.8010703@wwwdotorg.org>
References: <1350454897-18110-1-git-send-email-praithatha@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350454897-18110-1-git-send-email-praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/17/2012 12:21 AM, Pritesh Raithatha wrote:
> Signed-off-by: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(dropping stable from CC)

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Linus, if you could add Cc: stable when you commit it, that'd be useful
too. Thanks.

I have no idea how I screwed this up so badly, or how it worked when
programming completely bogus registers!

Adding a patch description would be useful especially for stable. A
useful patch description might be:

The bank numbers in the pinctrl driver must match the bank numbers in
the device tree. Swap the bank numbers in the driver to ensure this.
While we're at it, rename the #defines used for the bank base addresses
so it's more obvious which is which, and add comments indicating which
correspond to which device tree bank.
