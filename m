From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Boot hang due to "pipe: fold file_operations instances in one" in
 next-20130408
Date: Mon, 08 Apr 2013 15:19:39 -0600
Message-ID: <5163346B.5090602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Al,

I'm seeing a boot hang on Tegra in next-20130408. Even sysrq on the
serial console doesn't work, yet I think cpuidle is still running since
the LED that shows CPU power is flickering.

git bisect points at commit 9984d73 "pipe: fold file_operations
instances in one". Reverting
the-merge-of-the-branch-that-contains-this-patch from next-20130408
certainly solves the problem; reverting just that one patch is a bit
painful since it's in the middle of a bunch of other cleanup.

Do you have any idea what might be wrong? I can't see anything obvious
in the patch.
