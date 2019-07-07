From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 00/24] More improvements for Tegra30 devfreq driver
Date: Mon,  8 Jul 2019 01:32:39 +0300
Message-ID: <20190707223303.6755-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series addresses some additional review comments that were made by
Thierry Reding to [1] and makes several important changes to the driver,
fixing excessive interrupts activity. In the end I'm proposing myself as
a maintainer for the Tegra devfreq drivers.

[1] https://lore.kernel.org/lkml/0fb50eb1-a173-1756-6889-2526a10ac707@gmail.com/T/

Changelog:

v4:  Added two new patches to the series:

       PM / devfreq: tegra30: Synchronize average count on target's update
       PM / devfreq: tegra30: Increase sampling period to 16ms

     The first patch addresses problem where governor could get stuck due
     to outdated "average count" value which is snapshoted by ISR and there
     are cases where manual update of the value is required.

     The second patch is just a minor optimization.

v3:  Added support for tracepoints, replacing the debug messages.
     Fixed few more bugs with the help of tracepoints.

     New patches in this version:

       PM / devfreq: tegra30: Use tracepoints for debugging
       PM / devfreq: tegra30: Optimize CPUFreq notifier
       PM / devfreq: tegra30: Optimize upper consecutive watermark selection
       PM / devfreq: tegra30: Optimize upper average watermark selection
       PM / devfreq: tegra30: Include appropriate header

     Some of older patches of this series also got some extra minor polish.

v2:  Added more patches that are cleaning driver's code further and
     squashing another kHz conversion bug.

     The patch "Rework frequency management logic" of the v1 series is now
     converted to "Set up watermarks properly" because I found some problems
     in the original patch and then realized that there is no need to change
     the logic much. So the logic mostly preserved and only got improvements.

     The series is based on the today's linux-next (25 Jun) and takes into
     account minor changes that MyungJoo Ham made to the already queued
     patches from the first batch [1].

Dmitry Osipenko (24):
  PM / devfreq: tegra30: Change irq type to unsigned int
  PM / devfreq: tegra30: Keep interrupt disabled while governor is
    stopped
  PM / devfreq: tegra30: Handle possible round-rate error
  PM / devfreq: tegra30: Drop write-barrier
  PM / devfreq: tegra30: Set up watermarks properly
  PM / devfreq: tegra30: Tune up boosting thresholds
  PM / devfreq: tegra30: Use CPUFreq notifier
  PM / devfreq: tegra30: Move clk-notifier's registration to governor's
    start
  PM / devfreq: tegra30: Reset boosting on startup
  PM / devfreq: tegra30: Don't enable consecutive-down interrupt on
    startup
  PM / devfreq: tegra30: Add debug messages
  PM / devfreq: tegra30: Inline all one-line functions
  PM / devfreq: tegra30: Constify structs
  PM / devfreq: tegra30: Ensure that target freq won't overflow
  PM / devfreq: tegra30: Fix integer overflow on CPU's freq max out
  PM / devfreq: tegra30: Use kHz units uniformly in the code
  PM / devfreq: tegra30: Use tracepoints for debugging
  PM / devfreq: tegra30: Optimize CPUFreq notifier
  PM / devfreq: tegra30: Optimize upper consecutive watermark selection
  PM / devfreq: tegra30: Optimize upper average watermark selection
  PM / devfreq: tegra30: Synchronize average count on target's update
  PM / devfreq: tegra30: Include appropriate header
  PM / devfreq: tegra30: Increase sampling period to 16ms
  PM / devfreq: tegra20/30: Add Dmitry as a maintainer

 MAINTAINERS                            |   9 +
 drivers/devfreq/tegra30-devfreq.c      | 648 +++++++++++++++++++------
 include/trace/events/tegra30_devfreq.h | 105 ++++
 3 files changed, 607 insertions(+), 155 deletions(-)
 create mode 100644 include/trace/events/tegra30_devfreq.h

-- 
2.22.0
