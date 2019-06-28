From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: RE: [PATCH v3 02/22] PM / devfreq: tegra30: Keep interrupt disabled
 while governor is stopped
Date: Fri, 28 Jun 2019 15:48:42 +0900
Message-ID: <20190628064842epcms1p37e66e5fa52885ef7461b439bd336e60f@epcms1p3>
References: <20190627211115.21138-3-digetx@gmail.com>
        <20190627211115.21138-1-digetx@gmail.com>
        <CGME20190627211230epcas5p2504c225e67a823a586768a2749248b72@epcms1p3>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627211115.21138-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

>There is no real need to keep interrupt always-enabled, will be nicer
>to keep it disabled while governor is inactive.
>
>Suggested-by: Thierry Reding <thierry.reding@gmail.com>
>Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>---
> drivers/devfreq/tegra30-devfreq.c | 43 ++++++++++++++++---------------
> 1 file changed, 22 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>index a27300f40b0b..5e2b133babdd 100644
>--- a/drivers/devfreq/tegra30-devfreq.c
>+++ b/drivers/devfreq/tegra30-devfreq.c
[]
>@@ -416,8 +417,6 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
> {
> 	unsigned int i;
> 
>-	disable_irq(tegra->irq);
>-
> 	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
> 		      ACTMON_GLB_PERIOD_CTRL);
> 

I think this has nothing to do with
"keep it disabled while governor is inactive."

And this looks dangerous because it disables the safety measure
of disabling interrupt while you touch some looking-critical registers.
Anyway, as I do not know the internals of Tegra SoC, I cannot sure.

Cheers,
MyungJoo
