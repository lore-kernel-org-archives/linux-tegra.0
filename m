From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: RE: [PATCH] i2c/tegra: I2C driver uses the
 suspend_noirq/resume_noirq
Date: Fri, 12 Aug 2011 09:18:16 +0900
Message-ID: <1313108296.19990.10.camel@finisterre.wolfsonmicro.main>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
	 <CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
	 <20110806084805.GA18098@sirena.org.uk>
	 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
	 <CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
	 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2011-08-11 at 14:09 -0700, Stephen Warren wrote:
> Colin Cross wrote at Thursday, August 11, 2011 2:51 PM:

> Mark Brown wrote:
> > Unfortunately it's the only tool Linux has for dealing with this sort of
> > issue right now.  We were supposed to be getting support for telling the
> > PM core about dependencies but Linus didn't like that,

> Mark, can you fill in a little more detail; did Linus not like the concept
> of drivers registering dependencies on each-other, or was there a problem
> with the specific implementation that was proposed? I assume we're still a

He didn't like either, I think - he felt that probe ordering should be
sufficient. Which is true within the device model, in that devices can't
probe until all their resources are ready. This is coming up for ASoC
because that mechanism just doesn't work at all for us an we have to
work around it.

> long way away from anything like that working. You also mentioned Grant's
> device registration retry stuff, but doesn't that only solve the initial
> probing, not shutdown/suspend dependencies, or do devices take locks on
> each-other to handle that too?

Our current mechanism is based entirely on the order in which things get
instantiated so depending on the implementation of deferred binding we
may be able to change the ordering of the dpm_list.
