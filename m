From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: moving Tegra30 to the common clock framework
Date: Mon, 14 May 2012 15:29:00 +0300
Message-ID: <20120514122900.GZ20304@tbergstrom-lnx.Nvidia.com>
References: <20120503161311.GG20304@tbergstrom-lnx.Nvidia.com>
 <20120507000329.GB14559@gmail.com>
 <20120509111335.GC20304@tbergstrom-lnx.Nvidia.com>
 <20120512180441.GA11435@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120512180441.GA11435-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, May 12, 2012 at 08:04:41PM +0200, Mark Brown wrote:
> On Wed, May 09, 2012 at 02:13:35PM +0300, Peter De Schrijver wrote:
> 
> > Ok. Thanks. One more question. We have some clocks with special features
> > such as request lines for clock outputs, delays for clocks recovered from
> > an external source or several divisors which are used based on the state
> > of the module which is served by the clock (eg. an idle divisor and an active
> > divisor). How should these be modelled?
> 
> For the idle/active divisors could they be represented as separate
> clocks?

I guess that might be possible. Need to look into it.

Cheers,

Peter.
