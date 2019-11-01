From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v7 13/19] PM / devfreq: tegra30: Increase sampling period
 to 16ms
Date: Fri, 1 Nov 2019 22:53:32 +0100
Message-ID: <20191101215332.GA8724@qmqm.qmqm.pl>
References: <20191029220019.26773-1-digetx@gmail.com>
 <20191029220019.26773-14-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191029220019.26773-14-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 30, 2019 at 01:00:13AM +0300, Dmitry Osipenko wrote:
> Increase sampling period by 4ms to get a nicer pow2 value, converting
> diving into shifts in the code. That's more preferable for Tegra30 that
> doesn't have hardware divider instructions because of older Cortex-A9 CPU.
> In a result boosting events are delayed by 4ms, which is not sensible in
> practice at all.

This is made irrelevant by patch 17.

Best Regards,
Micha³ Miros³aw
