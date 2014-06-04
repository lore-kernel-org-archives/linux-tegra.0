From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: Tegra 2 T20 NAND Flash Support
Date: Wed, 04 Jun 2014 09:23:22 +0200
Message-ID: <538EC96A.4050702@ziswiler.com>
References: <538E6FB5.5020806@ziswiler.com> <1401866283.2173.3.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401866283.2173.3.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/04/2014 09:18 AM, Lucas Stach wrote:
> I took the Linux Tegra NAND driver from Thierry and cleaned it up quite
> a bit. It now works with both ONFI and non-ONFI NAND, at least for
> reading. Writing doesn't quite work yet and I've got side-tracked with
> other stuff.
>
> If you are interested in moving this forward I can put up my WIP patches
> to some public location.

Sounds great, yes. That would be perfect, thanks.

We even once got an universal NAND test infrastructure from Micron based 
on a re-worked Colibri T20 which we could use to validate it with 
various NAND flash parts.
