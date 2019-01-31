From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V2 2/6] clocksource: tegra: add Tegra210 timer driver
Date: Thu, 31 Jan 2019 11:01:14 +0200
Message-ID: <20190131090114.GZ7714@pdeschrijver-desktop.Nvidia.com>
References: <20190128091815.7040-1-josephl@nvidia.com>
 <20190128091815.7040-3-josephl@nvidia.com>
 <20190128150908.GB31317@ulmo>
 <20190129084155.GX7714@pdeschrijver-desktop.Nvidia.com>
 <20190129102912.GC28850@ulmo>
 <8d5b6a61-8fb8-2f83-5378-9b1a1e5bd03d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8d5b6a61-8fb8-2f83-5378-9b1a1e5bd03d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 30, 2019 at 10:40:06AM +0800, Joseph Lo wrote:
> On 1/29/19 6:29 PM, Thierry Reding wrote:
> > On Tue, Jan 29, 2019 at 10:41:55AM +0200, Peter De Schrijver wrote:
> > > On Mon, Jan 28, 2019 at 04:09:08PM +0100, Thierry Reding wrote:
> > > 
> > > ...
> > > 
> > > > 
> > > > Up to here this is a duplicate of timer-tegra20.c. And a lot of
> > > > tegra210_timer_init() is the same as tegra20_timer_init() as well. Can't
> > > > we unify the two drivers instead?
> > > > 
> > > > The power cycle restrictions of the architected timer, do they not apply
> > > > to chips earlier than Tegra210 either? So don't we need all of these
> > > > additional features on the timer-tegra20.c driver as well? If so that
> > > 
> > > No. Chips prior to Tegra114 do not have an arch timer and the arch timer
> > > does work correctly on Cortex-A15 so Tegra114 and Tegra124 can use it.
> > > It's broken on Cortex-A57 though, so we can't use it as a wakeup source
> > > on Tegra210.
> > 
> > If chips prior to Tegra114 don't have an architected timer, then we
> > can't remove the timer-tegra20 driver, because we still need it on
> > Tegra20 and Tegra30, right?
> > 
> 
> For Tegra20/30, it's Cortext-A9 with TWD timer. (arch/arm/kernel/smp_twd.c)
> 
> Originally, I thought the functionality of timer-tegra20 would be fully
> replaced by TWD timer driver. But from the log in the kernelci test
> farm[1][2], it looks to me the timer-tegra20 driver still works as
> clocksource driver for Tegra20/30. I cannot confirm if the clock event
> device has been replaced by TWD timer in the log. It could be replaced in
> the background. And by looking into the driver, it should be.

The TWD timer runs from the CPU clock so its frequency changes with
CPU DVFS. That makes it difficult to use.

Peter.
