From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0/9] arm/tegra: fuse cleanup and emc device tree support
Date: Thu, 22 Dec 2011 16:17:39 -0800
Message-ID: <1324599468-12845-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series does two things: It brings in some of the fuse/apb dma patches
that have previously been posted (but now completely refactored), and it adds
EMC table support to the device tree.

The bindings have been previously discused and have been modified accordingly to
the last agreements there.

Since there's some dependencies on the fuse rework, I'm a little lazy
and posting it as one series instead of two.

Comments welcome. I'm likely going to miss the 3.3 cut-offs on this but I still
want to reach closure on it and stage it for 3.4.


Thanks!

-Olof
