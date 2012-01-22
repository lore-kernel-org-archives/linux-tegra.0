From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: possible hrtimer related problem on tegra
Date: Sun, 22 Jan 2012 16:18:12 +0100
Message-ID: <1539302.lfXQIS47Lr@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

I've been plagued with random lockups starting with Linux 3.0.13 (pulled from 
ChromeOS-3.0 tree) on a Tegra board (paz00). First symtoms are slowly losing 
responsiveness followed by a total lockup (nothing in dmesg, no oops). Using 
performance governor instead of ondemand, made it go away.

So I started bisecting 3.0.12..3.0.13 and finially found that reverting 
24ee8bfe (hrtimer: Fix extra wakeups from __remove_hrtimer()) fixes the 
problem.

As Olof mentioned on IRC it is likely that the patch does not directly causes 
lockups but something else which was hidden before. It isn't clear to me if 
other tegra boards (seaboard, harmony) also suffer from this.

Any hints on this issue are appreciated.

Thanks

Marc
