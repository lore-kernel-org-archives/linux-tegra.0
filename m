From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v9 03/17] ARM: tegra: Remove pen-locking from
 cpuidle-tegra20
Date: Fri, 21 Feb 2020 15:58:47 +0100
Message-ID: <20200221145847.GH10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:20AM +0300, Dmitry Osipenko wrote:
> Pen-locking is meant to block CPU0 if CPU1 wakes up during of entering
> into LP2 because of some interrupt firing up, preventing unnecessary LP2
> enter that will be resumed immediately. Apparently this case doesn't
> happen often in practice, I checked how often it takes place and found
> that after ~20 hours of browsing web, managing email, watching videos and
> idling (15+ hours) there is only a dozen of early LP2 entering abortions
> and they all happened while device was idling. Thus let's remove the
> pen-locking and make LP2 entering uninterruptible, simplifying code quite
> a lot. This will also become very handy for the upcoming unified cpuidle
> driver, allowing to have a common LP2 code-path across of different
> hardware generations.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
