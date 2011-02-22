From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v3 0/6] Tegra board patches
Date: Mon, 21 Feb 2011 23:55:11 -0600
Message-ID: <1298354117-19097-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Third spin of board patches for .39. They have been tested on harmony
and seaboard.

Chances since v2:

* Fixed up a mismerge resulting in a bad sdhci patch for harmony
* Revised seaboard patch based on comments
* Synced up harmony pinmux and seaboard pinmux with runtime debugfs info

Changes since v1:

* I dropped the PCI-e patch since Mike is actively working on fixing
up that subsystem, and the reboot patch from Simon went in to Colin's
branch already.


--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
