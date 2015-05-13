From: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mailbox: tegra xusb: undefined MFD_TEGRA_XUSB
Date: Wed, 13 May 2015 15:22:12 +0200
Message-ID: <CAD3Xx4JfF_HCkhk7k+05KD+F+5cXGcOLZ1eBu0nyCB_JBk1fYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Andrew,

your commit b1f10002b00a ("mailbox: Add NVIDIA Tegra XUSB mailbox
driver") is in today's linux-next tree (i.e., next-20150513) and it
adds the following lines:

+config TEGRA_XUSB_MBOX
+       tristate "NVIDIA Tegra XUSB Mailbox"
+       depends on MFD_TEGRA_XUSB

At the current state, the dependency is always false since the option
MFD_TEGRA_XUSB is not defined in Kconfig, and the added driver cannot
be compiled.

Is there a patch queued somewhere to add this missing option?

I detected the issue with undertaker-checkpatch [1, 2] running on a
bot in Erlangen [3] to make daily checks of commits in linux-next for
#ifdef related bugs.

Kind regards,
 Valentin

[1] https://vamos.informatik.uni-erlangen.de/trac/undertaker
[2] http://www.linuxplumbersconf.org/2014/ocw/proposals/1863
[3] https://www4.cs.fau.de/Research/CADOS/
