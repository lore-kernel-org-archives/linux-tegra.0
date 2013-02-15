From: Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: assume CONFIG_OF
Date: Fri, 15 Feb 2013 14:18:59 -0800
Message-ID: <CAA9_cme3e-VWFs+5o6g88dXmURsjojT08o9Cw+=r7=AfRKz5gQ@mail.gmail.com>
References: <1360965237-14857-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360965237-14857-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 15, 2013 at 1:53 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra only supports, and always enables, device tree. Remove all ifdefs
> and runtime checks for DT support from the driver.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>

..adding Vinod.
