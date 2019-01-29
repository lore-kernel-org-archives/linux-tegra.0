From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V2 2/6] clocksource: tegra: add Tegra210 timer driver
Date: Tue, 29 Jan 2019 10:41:55 +0200
Message-ID: <20190129084155.GX7714@pdeschrijver-desktop.Nvidia.com>
References: <20190128091815.7040-1-josephl@nvidia.com>
 <20190128091815.7040-3-josephl@nvidia.com>
 <20190128150908.GB31317@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190128150908.GB31317@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Joseph Lo <josephl@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 28, 2019 at 04:09:08PM +0100, Thierry Reding wrote:

...

> 
> Up to here this is a duplicate of timer-tegra20.c. And a lot of
> tegra210_timer_init() is the same as tegra20_timer_init() as well. Can't
> we unify the two drivers instead?
> 
> The power cycle restrictions of the architected timer, do they not apply
> to chips earlier than Tegra210 either? So don't we need all of these
> additional features on the timer-tegra20.c driver as well? If so that

No. Chips prior to Tegra114 do not have an arch timer and the arch timer
does work correctly on Cortex-A15 so Tegra114 and Tegra124 can use it.
It's broken on Cortex-A57 though, so we can't use it as a wakeup source
on Tegra210.

Peter.
