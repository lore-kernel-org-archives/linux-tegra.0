From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v1] clk: tegra: clk-dfll: Fix to remove pm_runtime_irq_safe
Date: Tue, 12 Nov 2019 08:17:05 -0800
Message-ID: <1573575426-31314-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, sboyd@kernel.org, mturquette@baylibre.com, pgaikwad@nvidia.com
Cc: digetx@gmail.com, pdeschrijver@nvidia.com, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch includes fix to remove pm_runtime_irq_safe which was added
mistakenly during dfll suspend and resume implementation as a part of
Tegra210 SC7 suspend and resume patch series.

This patch removes pm_runtime_irq_safe and also has minor description
update for argument of dfll_suspend in comments.

Some of the patch series are applied so sending this fix as incremental
fix to latest linux-next.

Sowjanya Komatineni (1):
  clk: tegra: clk-dfll: Fix to remove pm_runtime_irq_safe

 drivers/clk/tegra/clk-dfll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.7.4
