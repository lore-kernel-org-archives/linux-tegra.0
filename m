From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: tegra: collection of enhancements/fixes
Date: Tue, 14 Apr 2015 22:01:27 +0200
Message-ID: <1429041687.3963.33.camel@localhost.localdomain>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
	 <20150414125222.GB13446@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150414125222.GB13446-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt@kerne>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2015-04-14 at 14:52 +0200, Thierry Reding wrote:
> This duplicates a lot of a series that I've been carrying locally for
> quite some time but never got around to posting publicly. Sorry about
> that. I'll rebase what I have on top of this and then take this for
> v4.2.

OK, thanks Thierry.

Two questions:

A) You don't think it would make sense to get any of this applied sooner
than v4.2?

B) I would not need to post a second version of this series then?

I just noticed that patch 8 is actually missing the pinmux entry for the
touch interrupt which mandates a second version thereof. Or should I
just send a fix for that as a separate patch later?

BTW: I also noticed another regression with the following two patches
causing a hard freeze on our Apalis/Colibri T30 modules upon starting X
using a plain fbdev driver. This does not happen if I revert those two
commits but it also does not happen if I disable X startup. Do you have
any idea what might cause this?

a9fe46
ARM: tegra: Add memory controller support for Tegra30

6d9adf
ARM: tegra: Enable IOMMU for display controllers on Tegra30
