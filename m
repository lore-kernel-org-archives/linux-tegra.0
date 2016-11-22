From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH 1/6] apalis-tk1: remove spurious new lines
Date: Mon, 21 Nov 2016 18:53:27 -0800
Message-ID: <CAADWXX-hfEP+OcztBsWQcPeGXNAXvFA+QGk_qLXaL1APkc1WOQ@mail.gmail.com>
References: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com> <1479773647-14726-2-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479773647-14726-2-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

.Marcel,

your git-sendemail emails get marked as spam, because:

       dmarc=fail (p=QUARANTINE dis=NONE) header.from=toradex.com

which is probably because the toradex.com dmarc rule requires DKIM,
but you lack a DKIM signature.

The most common case is that you've misconfigured your git-send-email
thing to go through a smtp server that is *not* the proper toradex.com
smtp server, and so you don't have a dkim signature.

Looking at your non-git-send-email emails, that do have DKIM
signatures, they've gone through
HE1PR05MB1881.eurprd05.prod.outlook.com (I'm sorry for your pain),
while your git-send-email ones seem to go through
"mrelay.perfora.net".

And obviouslty perfora.net is not adding the DKIM signatures for toradex.com

               Linus

On Mon, Nov 21, 2016 at 4:14 PM, Marcel Ziswiler
<marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org> wrote:
> Remove some spurious new lines.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
>
>  arch/arm/boot/dts/tegra124-apalis-eval.dts |  1 -
>  arch/arm/boot/dts/tegra124-apalis.dtsi     | 12 ------------
>  2 files changed, 13 deletions(-)
[...]
