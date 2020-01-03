From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v1 3/7] dmaengine: tegra-apb: Prevent race conditions on
 channel's freeing
Date: Fri, 3 Jan 2020 09:16:04 +0100
Message-ID: <20200103081604.GD14228@qmqm.qmqm.pl>
References: <20191228204640.25163-1-digetx@gmail.com>
 <20191228204640.25163-4-digetx@gmail.com>
 <20191230204555.GB24135@qmqm.qmqm.pl>
 <20191230205054.GC24135@qmqm.qmqm.pl>
 <4e1e4fef-f75c-f2e2-4d9e-29af69daf8db@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4e1e4fef-f75c-f2e2-4d9e-29af69daf8db@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 02, 2020 at 06:09:45PM +0300, Dmitry Osipenko wrote:
> 30.12.2019 23:50, Michał Mirosław пишет:
> > On Mon, Dec 30, 2019 at 09:45:55PM +0100, Michał Mirosław wrote:
> >> On Sat, Dec 28, 2019 at 11:46:36PM +0300, Dmitry Osipenko wrote:
> >>> It's unsafe to check the channel's "busy" state without taking a lock,
> >>> it is also unsafe to assume that tasklet isn't in-fly.
> >>
> >> 'in-flight'. Also, the patch seems to have two independent bug-fixes
> >> in it. Second one doesn't look right, at least not without an explanation.
> >>
> >> First:
> >>
> >>> -	if (tdc->busy)
> >>> -		tegra_dma_terminate_all(dc);
> >>> +	tegra_dma_terminate_all(dc);
> >>
> >> Second:
> >>
> >>> +	tasklet_kill(&tdc->tasklet);
> > 
> > BTW, maybe you can convert the code to threaded interrupt handler and
> > just get rid of the tasklet instead of fixing it?
> 
> This shouldn't bring much benefit because the the code's logic won't be
> changed since we will still have to use the threaded ISR part as the
> bottom-half and then IRQ API doesn't provide a nice way to synchronize
> interrupt's execution, while tasklet_kill() is a nice way to sync it.

What about synchronize_irq()?

BTW, does tegra_dma_terminate_all() prevent further interrupts that might
cause the tasklet to be scheduled again?

Best Regards,
Michał Mirosław
