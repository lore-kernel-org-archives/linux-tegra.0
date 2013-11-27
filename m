From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: set SM2 voltage correct
Date: Wed, 27 Nov 2013 12:05:03 +0100
Message-ID: <6311b14be5af09d82e6781160e2aac3a@agner.ch>
References: <cover.1385508112.git.stefan@agner.ch>
 <c9ceead9e3df77b5a33ad654db23c241cd624096.1385508112.git.stefan@agner.ch>
 <1385546387.4270.11.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385546387.4270.11.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Lucas,

Am 2013-11-27 10:59, schrieb Lucas Stach:
> This isn't a global Tegra change, but very specific to the Colibri, so
> please reword your commit headline to reflect that.
Agree, will do that.

> Also there are other issues with the regulator setup on Colibri, I sent
> a patch for this a good while ago, but didn't come around to revise it
> until now. So if you are going to touch things here, please look up that
> patch and fold it into this one.
I guess you refer to this patchset:
http://thread.gmane.org/gmane.linux.ports.tegra/11984

Ok, I will fold patch 4 into my patchset. Not sure whether I should add
patch 3 (ULPI phy on Colibri T20) as well, since this one is somewhat
unrelated...

> I'll take a look at the other patches later today.
Thanks

--
Stefan
