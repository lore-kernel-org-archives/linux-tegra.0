From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0/7] ARM: tegra: board patches
Date: Sat, 19 Feb 2011 23:44:37 -0600
Message-ID: <1298180684-6261-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is a small series of mostly unrelated patches that cleans up, adds and
restructures some of the board code in place. It also includes a critical fix
from Simon Glass for the reboot code to work.

I have tested booting this on seaboard, but I can't get to a harmony to try
until tomorrow. I wanted to get the patches out for the first round of review
though.


-Olof

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
