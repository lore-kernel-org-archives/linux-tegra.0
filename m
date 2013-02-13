From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 08/10] ARM: dt: Add references to tegra_car clocks
Date: Wed, 13 Feb 2013 13:38:07 +0200
Message-ID: <20130213113807.GE3073@tbergstrom-lnx.Nvidia.com>
References: <1360580700-10245-1-git-send-email-pdeschrijver@nvidia.com>
 <1360580700-10245-9-git-send-email-pdeschrijver@nvidia.com>
 <511A7AB5.4040607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <511A7AB5.4040607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 12, 2013 at 06:24:05PM +0100, Stephen Warren wrote:
> On 02/11/2013 04:04 AM, Peter De Schrijver wrote:
> > Add references to tegra_car clocks for the basic device nodes.
> 
> In this patch, you also need to remove the "clock-frequency" properties
> from tegra114-*.dts board files.

That would probably break bisectability no? I think this needs to be done
in a separate patch. Also, the UARTD enabling in init_table[] can then be
removed.

Cheers,

Peter.
