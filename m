From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: Unhandled LM90 irq 308 on Dalmore?
Date: Thu, 19 Dec 2013 02:08:45 -0800
Message-ID: <52B2C5AD.5080405@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean Delvare <khali@linux-fr.org>
List-Id: linux-tegra@vger.kernel.org

Just FYI, the Tegra114 Dalmore board here reports an unhandled IRQ about 
two minutes after boot:

[  120.950839] irq 308: nobody cared (try booting with the "irqpoll" option)
[  120.957654] CPU: 1 PID: 74 Comm: irq/308-lm90 Not tainted 
3.13.0-rc4-next-20131218-30442-g28522bc #1
[  120.966816] [<c0015c44>] (unwind_backtrace) from [<c0011898>] 
(show_stack+0x10/0x14)
[  120.974571] [<c0011898>] (show_stack) from [<c0565370>] 
(dump_stack+0x80/0xcc)
[  120.981804] [<c0565370>] (dump_stack) from [<c0066030>] 
(__report_bad_irq+0x20/0xc0)
[  120.989543] [<c0066030>] (__report_bad_irq) from [<c0066550>] 
(note_interrupt+0x1f8/0x254)
[  120.997811] [<c0066550>] (note_interrupt) from [<c0064fc0>] 
(irq_thread+0x12c/0x158)
[  121.005613] [<c0064fc0>] (irq_thread) from [<c003fcac>] 
(kthread+0xc4/0xe0)
[  121.012614] [<c003fcac>] (kthread) from [<c000e738>] 
(ret_from_fork+0x14/0x3c)
[  121.019825] handlers:
[  121.022117] [<c0064408>] irq_default_primary_handler threaded 
[<c0384764>] lm90_irq_thread
[  121.030418] Disabling IRQ #308

This is on next-20131218.

- Paul
