From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] Few more cleanups for tegra-timer
Date: Sun,  9 Jun 2019 22:27:27 +0300
Message-ID: <20190609192730.29459-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

I took a look at tegra-timer once again and spotted few more things that
could be improved in addition to [0] which is already in linux-next.

Please apply this small series in addition to [0], thanks in advance!

[0] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=111529

Dmitry Osipenko (3):
  clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
  clocksource/drivers/tegra: Set and use timer's period
  clocksource/drivers/tegra: Drop unneeded typecasting in one place

 drivers/clocksource/timer-tegra.c | 47 +++++++++++++++++++------------
 1 file changed, 29 insertions(+), 18 deletions(-)

-- 
2.21.0
