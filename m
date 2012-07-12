From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] usb: host: tegra: pass correct pointer in ehci_setup()
Date: Thu, 12 Jul 2012 10:31:16 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1207121029480.1413-100000@iolanthe.rowland.org>
References: <1342082208-14184-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1342082208-14184-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 12 Jul 2012, Laxman Dewangan wrote:

> The ehci_setup() require the pointer of usb_hcd.
> Passing the correct pointer in place of ehci_hcd
> pointer.
> 
> This is side effetct of change:
> commit 1a49e2ac9651df7349867a5cf44e2c83de1046af
> Author: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> 
>     EHCI: centralize controller initialization
> 
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Argh!  You're perfectly right, of course.  I thought I had checked all 
those calls carefully.

Anyway, two other calls need to be fixed as well.  I'll resubmit your 
patch, with the other two fixes included.  Okay?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
