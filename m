From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: nvec TODO
Date: Mon, 1 Aug 2011 11:45:49 +0100
Message-ID: <20110801104549.GG15578@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Greg,

A small patch to add something to this staging drivers todo list which
I just noticed.  BTW, why isn't there any easy way to find a list of
addresses to copy against stuff in staging?  I hope I have everyone...

The note is about something which should be easy enough to fix by people
who know the Tegra stuff (it probably involves changes outside of this
driver to fix.)

8<-------
From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Staging: Add clk API note to nvec/TODO

Add a note about the abuse of the clk API to the nvec/TODO list.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
--- 
 drivers/staging/nvec/TODO |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/TODO b/drivers/staging/nvec/TODO
index 77b47f7..649d6b7 100644
--- a/drivers/staging/nvec/TODO
+++ b/drivers/staging/nvec/TODO
@@ -4,5 +4,7 @@ ToDo list (incomplete, unordered)
 	- add compile as module support
 	- move nvec devices to mfd cells?
 	- adjust to kernel style
-
-
+	- fix clk usage
+	  should not be using clk_get_sys(), but clk_get(&pdev->dev, conn)
+	  where conn is either NULL if the device only has one clock, or
+	  the device specific name if it has multiple clocks.
