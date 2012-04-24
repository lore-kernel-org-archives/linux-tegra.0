From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra_ventana: als and proximity sensor
 isl29018 support
Date: Tue, 24 Apr 2012 14:08:47 -0700
Message-ID: <20120424210847.GA12611@quad.lixom.net>
References: <1334645155-13799-1-git-send-email-ldewangan@nvidia.com>
 <1334645155-13799-4-git-send-email-ldewangan@nvidia.com>
 <4F8DF01D.9040900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F8DF01D.9040900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 17, 2012 at 04:35:09PM -0600, Stephen Warren wrote:
> On 04/17/2012 12:45 AM, Laxman Dewangan wrote:
> > Add the device info for ALS and proximity sensor isl29018.
> 
> (There were a ton of irrelevant people CC'd on this patch; I cut them
> out, but kept the lists in case anyone was interested in the replies.
> The most relevant list, linux-tegra, also wasn't CC'd)
> 
> > diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
> 
> > +		/* ALS and proximity sensor */
> 
> > +		isl29018: isl29018@44 {
> 
> I don't think the label "isl29018:" serves any purpose; nothing else
> needs to refer to this node.
> 
> I note from http://patchwork.ozlabs.org/patch/132936/ that:
> 
> a) Perhaps the vendor prefix should be "isil" not "isl". Olof, can you
> please comment here?

The standard practice is to use stock tickers, but if companies aren't public
then there isn't much you can do. Like Linus said, use your best judgement and
taste and that's really all we can ask for. :)



-Olof
