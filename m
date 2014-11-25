From: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [flasher PATCH] Add a command to specify post flash u-boot command
Date: Tue, 25 Nov 2014 22:14:51 +0000
Message-ID: <1416953692-28963-1-git-send-email-james.thomas@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Simple patch to allow a post-flash-cmd to be used after flashing is complete,
e.g --post-flash-cmd 'ums 0 mmc 0'

This defaults to 'reset' if not passed

James Thomas (1):
  Add a --post-flash-cmd command line argument

 tegra-uboot-flasher | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.9.3
