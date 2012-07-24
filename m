From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 5/5] i2c: tegra: convert normal suspend/resume to
 *_noirq
Date: Tue, 24 Jul 2012 13:52:38 +0100
Message-ID: <20120724125237.GB22576@sirena.org.uk>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
 <1341919244-23327-6-git-send-email-ldewangan@nvidia.com>
 <500D96E6.4060507@wwwdotorg.org>
 <20120724091358.GK12034@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120724091358.GK12034-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 24, 2012 at 12:13:58PM +0300, Peter De Schrijver wrote:
> On Mon, Jul 23, 2012 at 08:24:38PM +0200, Stephen Warren wrote:

> > IIRC, I proposed it before solely to solve some suspend/resume ordering
> > issues, and Colin Cross NAKd it. These days, deferred probe should make
> > this change unnecessary.

> How does deferred probe solve this? Iirc the problem is that i2c is needed to
> talk to the PMIC, so we need to make sure i2c is shutdown last because drivers
> might want to do regulator control in the suspend function.

With probe deferral the drivers will be after the regulator driver in
the DPM list and so be suspended first.
