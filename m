From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: cpu clock change latency
Date: Fri, 23 Sep 2011 16:39:32 +0200
Message-ID: <201109231639.33651.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

arch/arm/mach-tegra/cpu-tegra.c (as from nv-tegra.nvidia.com) contains a some 
strange comment:

 493         /* FIXME: what's the actual transition time? */
 494         policy->cpuinfo.transition_latency = 300 * 1000;

The trees on chromeos.org (both, kernel and kernel-next) have:

 392         /* cpu clock change latency: ~400us */
 393         policy->cpuinfo.transition_latency = 400;

because according to 

http://git.chromium.org/gitweb/?p=chromiumos/third_party/kernel.git;a=commitdiff;h=6a4debe346f5946f4fab14b413885896b7cde324

this improves latency of the GUI. Note that the comment said "us", while the cpu 
transition latency is measured in "ns", so 400 * 1000 would be right. 

So either the comment is wrong (should be 400ns) or the patch is wrong (which is 
unlikely, because it improved latency in the testcase).

Can someone comment on this?

Thanks

Marc
