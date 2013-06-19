From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: ERROR: Bad of_node_put() on /timer@60005000
Date: Wed, 19 Jun 2013 10:18:37 +0200
Message-ID: <20130619.111837.2022797543173602143.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

With CONFIG_OF_DYNAMIC enabled, I got the following. Is this a known issue?

....
[    0.000000] ERROR: Bad of_node_put() on /timer@60005000
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.10.0-rc6-next-20130617-00054-gb8f8ed0 #232
[    0.000000] [<c00155b8>] (unwind_backtrace+0x0/0x138) from [<c0011cf0>] (show_stack+0x10/0x14)
[    0.000000] [<c0011cf0>] (show_stack+0x10/0x14) from [<c0559548>] (dump_stack+0x78/0xbc)
[    0.000000] [<c0559548>] (dump_stack+0x78/0xbc) from [<c039ae30>] (of_node_release+0x90/0xa0)
[    0.000000] [<c039ae30>] (of_node_release+0x90/0xa0) from [<c039b3e4>] (of_find_matching_node_and_match+0x74/0x98)
[    0.000000] [<c039b3e4>] (of_find_matching_node_and_match+0x74/0x98) from [<c0791658>] (clocksource_of_init+0x40/0x58)
[    0.000000] [<c0791658>] (clocksource_of_init+0x40/0x58) from [<c077a2b4>] (time_init+0x1c/0x30)
[    0.000000] [<c077a2b4>] (time_init+0x1c/0x30) from [<c0777708>] (start_kernel+0x168/0x2b0)
[    0.000000] [<c0777708>] (start_kernel+0x168/0x2b0) from [<80008074>] (0x80008074)
[    0.000000] ERROR: Bad of_node_put() on /rtc
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.10.0-rc6-next-20130617-00054-gb8f8ed0 #232
[    0.000000] [<c00155b8>] (unwind_backtrace+0x0/0x138) from [<c0011cf0>] (show_stack+0x10/0x14)
[    0.000000] [<c0011cf0>] (show_stack+0x10/0x14) from [<c0559548>] (dump_stack+0x78/0xbc)
[    0.000000] [<c0559548>] (dump_stack+0x78/0xbc) from [<c039ae30>] (of_node_release+0x90/0xa0)
[    0.000000] [<c039ae30>] (of_node_release+0x90/0xa0) from [<c039b3e4>] (of_find_matching_node_and_match+0x74/0x98)
[    0.000000] [<c039b3e4>] (of_find_matching_node_and_match+0x74/0x98) from [<c0791658>] (clocksource_of_init+0x40/0x58)
[    0.000000] [<c0791658>] (clocksource_of_init+0x40/0x58) from [<c077a2b4>] (time_init+0x1c/0x30)
[    0.000000] [<c077a2b4>] (time_init+0x1c/0x30) from [<c0777708>] (start_kernel+0x168/0x2b0)
[    0.000000] [<c0777708>] (start_kernel+0x168/0x2b0) from [<80008074>] (0x80008074)
....
