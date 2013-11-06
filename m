From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: HEADS UP - potential conflicts for 3.14 on all drivers, binding docs,
 and SoC .dtsi files
Date: Wed, 06 Nov 2013 16:10:14 -0700
Message-ID: <527ACC56.1080605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I'm implementing a "reset controller" in the Tegra CAR driver; see
include/linux/reset*.h.

This will mean touching a whole bunch of Tegra on-SoC drivers. In order
for this not to take 3+ kernel cycles, I'm going to create a single
branch/series that touches:

* (Almost?) all Tegra DT binding docs.
* All tegraNNN.dtsi.
* (Almost?) all Tegra drivers/code that use or provide clocks or resets.

I plan to merge this all early on for 3.14 through the Tegra then
arm-soc tree. If you're touching pretty much anything on Tegra, you'll
want to plan on rebasing your patches on top of this series, and work
with the relevant subsystem maintainers to merge this branch into theirs
before applying your patches.

If you're interested in what the patches look like, they'll soon be
published to:

git://github.com/swarren/linux-tegra.git linux-next_common

Note that that branch rebases a lot; it's my WIP/backup branch based on
linux-next. A stable branch will be available once the merge window is over.
