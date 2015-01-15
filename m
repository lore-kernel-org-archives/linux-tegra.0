From: Dmitry Osipenko <digetx@gmail.com>
Subject: Two variants of fixing Tegra20 suspend bug
Date: Thu, 15 Jan 2015 13:58:56 +0300
Message-ID: <1421319545-23920-1-git-send-email-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: digetx@gmail.com, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi, this is third attempt to fix Tegra20 suspend bug. First was to use other
PMC scratch register for tegra_resume() address store and second to use syscore
ops for PMC driver.

Thierry Reding proposed other solution: to use IRAM instead of PMC scratch
register. I prepared two implementation variants:

        1) Store CPU "resettable" status in IRAM
        2) Store tegra_resume() address in IRAM

Both variants use reset handler IRAM area for placing tegra_resume() address,
since it is reserved and guarantees avoidance of any further possible memory
conflicts.

As for me, second variant is cleaner. It removes suspend PM from PMC driver,
which can be re-added later if needed.
