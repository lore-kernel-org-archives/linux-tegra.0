From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Fri, 12 Aug 2011 12:14:35 +0900
Message-ID: <20110812031433.GE10218@opensource.wolfsonmicro.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
 <CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
 <20110806084805.GA18098@sirena.org.uk>
 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
 <CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09@HQMAIL01.nvidia.com>
 <CAMbhsRTVm+dUODDgqiekpTrrNnpo9trJNNvOQ2ETCNkneh-L-g@mail.gmail.com>
 <1313109916.19990.28.camel@finisterre.wolfsonmicro.main>
 <CAMbhsRShLvyc2XKJAL8PwR0Uj4Pnp9rVt7QyK1qAVxJ-R2PSdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRShLvyc2XKJAL8PwR0Uj4Pnp9rVt7QyK1qAVxJ-R2PSdQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 11, 2011 at 07:59:27PM -0700, Colin Cross wrote:
> On Thu, Aug 11, 2011 at 5:45 PM, Mark Brown

> > For example with ASoC we'd sort all the components before the ASoC card
> > without regard for their bus dependencies or any other dependencies they
> > have (eg, their regulators). Since the ASoC card is a platform device
> > it's likely to have registered early with no regard for where the buses
> > the card needs are registered. I'd expect there's a reasonable chance
> > it'll actually make things worse in the short term.

> You can't just move everything after the card, you have to move
> everything after the last device that was probed, and it only works if
> nothing depends on any of the devices that are moved.

Sorry, I said that the wrong way round due to trying to reply quickly -
the card would be the thing that moves since that's the thing that
actually does the suspend but we've *no* idea which device we need to
move it after.  Since all the function does is a direct move after or
before a single device all we can do is pick one and pray that it's the
right device.
