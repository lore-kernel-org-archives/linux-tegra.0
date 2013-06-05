From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 0/4] Override bits for PLLM
Date: Wed, 5 Jun 2013 17:08:25 +0300
Message-ID: <1370441329-8619-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, Stephen Warren <swarren@wwwdotorg.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLLM has override bits on Tegra30 and Tegra114. This patchset implements
support for them for both Tegra30 and Tegra114.

Peter De Schrijver (4):
  CHROMIUM: clk: tegra: Add fields for override bits
  CHROMIUM: clk: tegra: override bits for Tegra114 PLLM
  CHROMIUM: clk: tegra: override bits for Tegra30 PLLM
  CHROMIUM: clk: tegra: Use override bits when needed

 drivers/clk/tegra/clk-pll.c      |   82 ++++++++++++++++++++++---------------
 drivers/clk/tegra/clk-tegra114.c |   15 +++++++
 drivers/clk/tegra/clk-tegra30.c  |   18 ++++++++
 drivers/clk/tegra/clk.h          |    8 ++++
 4 files changed, 90 insertions(+), 33 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty
