From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: [RFC PATCH 0/5] Minor bugfixes for Tegra kernels
Date: Wed, 16 Jan 2013 14:56:08 -0500
Message-ID: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

In the course of my research here at Columbia University, I have been
doing some kernel development on the Google Nexus 7 device. I took the
time to address most of the compile-time warnings while building the
Tegra kernel tree using the cross-compiler shipped with Android
(gcc-4.7), and in doing so I came across a few minor issues.

This RFC series addresses several minor bugs that I was able to fix
while suppressing compile warnings. Not knowing exactly where
to send the patches, I decided to send them primarily to the Tegra
list serv in hopes that they will find their way to the correct place.

All 5 patches apply cleanly the kernel/tegra repository hosted by
Google. I used the commit hash referenced in the Android device tree
git logs as my HEAD revision: 22b4fcde206e96f57bf0a111403fc3d75532918a
I belive that this is the revision which corresponds to the prebuilt
kernel provided in the Jelly Bean release.

I would appreciate your feedback, and/or redirection!

Best,

        -Jeremy

Jeremy C. Andrus (5):
  arm: tegra: Fix build under Android cross-compiler
  arm: tegra: Fix modem_reset_flag assignment
  power: smb347: Fix stack corruption
  input: lid: Fix init function ignores sysfs retval
  input: touchscreen: Fix rmi4 sysfs and driver removal

 arch/arm/mach-tegra/baseband-xmm-power.c | 2 +-
 arch/arm/mach-tegra/sleep.S              | 2 ++
 drivers/input/lid.c                      | 4 +++-
 drivers/input/touchscreen/rmi4/rmi_f09.c | 7 +------
 drivers/power/smb347-charger.c           | 2 +-
 5 files changed, 8 insertions(+), 9 deletions(-)

-- 
1.8.1
