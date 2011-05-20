From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: No Tegra board file updates for 2.6.40
Date: Thu, 19 May 2011 18:48:11 -0700
Message-ID: <BANLkTin-MrstYQQ0M7DfGFEpzKnyEUWVmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Russell is trying to keep the overall diff stats for 2.6.40 in
arch/arm/ negative, and to support that I am not going to pull any
board file changes for 2.6.40.  Hopefully we'll have a clear direction
on how to proceed with new boards and new devices in existing boards
in 2.6.41.  I plan to pull all the outstanding changes and put them in
Tegra's for-next as soon as 2.6.40-rc1 is released.

In 2.6.40 I'll try to move some of the core drivers like gpio into
drivers/, which should help provide some negative diffstat to offset
board files and PM support.
