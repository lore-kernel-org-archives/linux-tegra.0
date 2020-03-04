From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Date: Wed, 4 Mar 2020 19:10:08 +0300
Message-ID: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

I was trying out today's linux-next-20200304 and noticed this splat in KMSG:

[    1.161244] BUG: sleeping function called from invalid context at
drivers/base/power/runtime.c:1075
[    1.161393] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid:
37, name: kworker/u8:1
[    1.161481] CPU: 1 PID: 37 Comm: kworker/u8:1 Not tainted
5.6.0-rc4-next-20200304-00181-gbebfd2a5be98 #1588
[    1.161616] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    1.161769] Workqueue: ci_otg ci_otg_work
[    1.161882] [<c010e8bd>] (unwind_backtrace) from [<c010a315>]
(show_stack+0x11/0x14)
[    1.162035] [<c010a315>] (show_stack) from [<c0987d29>]
(dump_stack+0x85/0x94)
[    1.162132] [<c0987d29>] (dump_stack) from [<c013e77f>]
(___might_sleep+0xeb/0x118)
[    1.162281] [<c013e77f>] (___might_sleep) from [<c052fa1d>]
(__pm_runtime_resume+0x75/0x78)
[    1.162427] [<c052fa1d>] (__pm_runtime_resume) from [<c0627a33>]
(ci_udc_pullup+0x23/0x74)
[    1.162575] [<c0627a33>] (ci_udc_pullup) from [<c062fb93>]
(usb_gadget_connect+0x2b/0xcc)
[    1.162665] [<c062fb93>] (usb_gadget_connect) from [<c062769d>]
(ci_hdrc_gadget_connect+0x59/0x104)
[    1.162807] [<c062769d>] (ci_hdrc_gadget_connect) from [<c062778b>]
(ci_udc_vbus_session+0x43/0x48)
[    1.162949] [<c062778b>] (ci_udc_vbus_session) from [<c062f997>]
(usb_gadget_vbus_connect+0x17/0x9c)
[    1.163089] [<c062f997>] (usb_gadget_vbus_connect) from [<c062634d>]
(ci_otg_work+0xbd/0x128)
[    1.163245] [<c062634d>] (ci_otg_work) from [<c0134719>]
(process_one_work+0x149/0x404)
[    1.163335] [<c0134719>] (process_one_work) from [<c0134acb>]
(worker_thread+0xf7/0x3bc)
[    1.163479] [<c0134acb>] (worker_thread) from [<c0139433>]
(kthread+0xf3/0x118)
[    1.163621] [<c0139433>] (kthread) from [<c01010bd>]
(ret_from_fork+0x11/0x34)

I haven't tried to figure out what change causes this problem, it didn't
happen using next-20200218. Please take a look, thanks in advance.
