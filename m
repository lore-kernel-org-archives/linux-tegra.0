From: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [flasher PATCH] Set a boot delay of 0 instead of -2
Date: Wed, 26 Nov 2014 17:57:05 +0000
Message-ID: <1417024626-6616-1-git-send-email-james.thomas@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Using fdtput on 32-bit systems results in a delay of 2147483647, setting this
to 0 achieves the same goal

James Thomas (1):
  Set bootdelay to 0

 tegra-uboot-flasher | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.3
