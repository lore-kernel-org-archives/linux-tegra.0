From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Thu, 25 Aug 2011 11:36:17 +0100
Message-ID: <20110825103616.GC31154@opensource.wolfsonmicro.com>
References: <CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
 <20110806084805.GA18098@sirena.org.uk>
 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
 <CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09@HQMAIL01.nvidia.com>
 <CAMbhsRTVm+dUODDgqiekpTrrNnpo9trJNNvOQ2ETCNkneh-L-g@mail.gmail.com>
 <1313109916.19990.28.camel@finisterre.wolfsonmicro.main>
 <CAMbhsRShLvyc2XKJAL8PwR0Uj4Pnp9rVt7QyK1qAVxJ-R2PSdQ@mail.gmail.com>
 <20110812031433.GE10218@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04B24A3CA6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B24A3CA6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 24, 2011 at 02:28:29PM -0700, Stephen Warren wrote:

> (and you'd mentioned having the subsystem maintainers weigh in on this;
> which sub-system; IRQ, power, I2C, ...?)

I'm one of the regulator API subsystem maintainers FWIW.
