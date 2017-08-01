From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: gadget serial oops in gs_write_room when data rx'd after close
Date: Tue, 1 Aug 2017 15:21:07 -0600
Message-ID: <e2256dbd-8749-8ee2-a2f8-f076d1062ebb@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Felipe,

I've found a problem in the gadget serial driver, which I believe is 
triggered in the following scenario:

1) Both host and gadget system have a USB gadget serial port open.

2) Gadget side application closes the serial port.

3) Host side sends data to the serial port.

(Steps 2, 3 may need to happen at almost the same time and/or perhaps in 
the opposite order)

4) Gadget side passes the received data to the TTY layer even though the 
port is closed locally, which soon results in an oops in gs_write_room 
since port is NULL in the following:

	struct gs_port	*port = tty->driver_data;
...
	spin_lock_irqsave(&port->port_lock, flags);


The exact oops I see is:

> [  132.757406] Unable to handle kernel NULL pointer dereference at virtual address 00000170
> [  132.757409] pgd = ffffffc001481000
> [  132.757414] [00000170] *pgd=000000026cdd6003, *pud=000000026cdd6003, *pmd=000000026cdd7003, *pte=00e8000003881707
> [  132.757418] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [  132.757422] Modules linked in: bcmdhd pci_tegra bluedroid_pm
> [  132.757428] CPU: 5 PID: 53 Comm: kworker/u12:1 Not tainted 4.4.38-tegra #1
> [  132.757429] Hardware name: quill (DT)
> [  132.757439] Workqueue: events_unbound flush_to_ldisc
> [  132.757441] task: ffffffc1eb660c80 ti: ffffffc1eb6a8000 task.ti: ffffffc1eb6a8000
> [  132.757447] PC is at _raw_spin_lock_irqsave+0x20/0x54
> [  132.757452] LR is at gs_write_room+0x1c/0x7c
> [  132.757453] pc : [<ffffffc000b2bb70>] lr : [<ffffffc000722fd4>] pstate: 800000c5
> [  132.757454] sp : ffffffc1eb6abbe0
> [  132.757456] x29: ffffffc1eb6abbe0 x28: ffffffc07aea9000 
> [  132.757458] x27: 0000000000000003 x26: ffffff8015209000 
> [  132.757460] x25: 00000000ffffffff x24: ffffff8015209000 
> [  132.757462] x23: 0000000000000000 x22: ffffffc07aea9000 
> [  132.757463] x21: ffffffc1db1cf820 x20: 0000000000000170 
> [  132.757465] x19: 0000000000000000 x18: 00000000004a4000 
> [  132.757466] x17: 00000000bc7817d9 x16: ffffffc000b37a60 
> [  132.757468] x15: ffffffc000b37a60 x14: 00000000000007a1 
> [  132.757470] x13: ffffffc1db1cf823 x12: 0000000000012a38 
> [  132.757471] x11: ffffffc000b379d0 x10: 000000000000000d 
> [  132.757473] x9 : ffffffc1eb6abd20 x8 : ffffffc1db1cf823 
> [  132.757474] x7 : 0000000000000000 x6 : 0000000000000000 
> [  132.757476] x5 : ffffffc07aea9238 x4 : 0000000000000001 
> [  132.757477] x3 : 0000000000000001 x2 : 0000000000000040 
> [  132.757479] x1 : ffffffc1eb6a8000 x0 : 0000000000000170 
> [  132.757479] 
> [  132.757481] Process kworker/u12:1 (pid: 53, stack limit = 0xffffffc1eb6a8020)
> [  132.757482] Call trace:
> [  132.757484] [<ffffffc000b2bb70>] _raw_spin_lock_irqsave+0x20/0x54
> [  132.757487] [<ffffffc000466af4>] tty_write_room+0x1c/0x2c
> [  132.757489] [<ffffffc0004634a0>] __process_echoes+0x24/0x25c
> [  132.757491] [<ffffffc000466208>] n_tty_receive_buf_common+0x1ec/0xa24
> [  132.757493] [<ffffffc000466a50>] n_tty_receive_buf2+0x10/0x18
> [  132.757495] [<ffffffc000469554>] flush_to_ldisc+0xe4/0x154
> [  132.757499] [<ffffffc0000bb9d4>] process_one_work+0x154/0x434
> [  132.757501] [<ffffffc0000bbde8>] worker_thread+0x134/0x40c
> [  132.757503] [<ffffffc0000c1678>] kthread+0xe0/0xf4
> [  132.757506] [<ffffffc000084f90>] ret_from_fork+0x10/0x40
> [  132.757508] ---[ end trace 5f1b8572ec9b9a44 ]---
> [  132.758707] note: kworker/u12:1[53] exited with preempt_count 1

The patch below fixes this in my testing:

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index 9b0805f55ad7..16bb24a047d9 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -537,7 +537,7 @@ static void gs_rx_push(unsigned long _port)
>  		}
>  
>  		/* push data to (open) tty */
> -		if (req->actual) {
> +		if (req->actual & tty) {
>  			char		*packet = req->buf;
>  			unsigned	size = req->actual;
>  			unsigned	n;

However, I'm not sure if that patch is entirely complete/correct. Can 
you comment? In particular:

1) It causes any data that's received while the port is closed to be 
simply thrown away. I assume this is expected behaviour, as opposed to 
e.g. buffering the data up until the port is opened later. I note that 
gs_rx_push does buffer data in the tty_throttled() case, but that's a 
different case than port closed.

2) gs_rx_push() still calls gs_start_rx() even if there's no TTY 
attached to the gadget serial device. I wonder if it should stop 
submitting USB requests until the port is open again? Perhaps the 
current behaviour is correct since the host will be upset if the gadget 
refuses to read the data it's sending.

3) I'm not convinced that the patch above completely closes the race 
that triggers the oops. It should fully solve the issue if the steps I 
wrote at the very top of this email occur in order, but I think there's 
still a possible race if the set of steps below occur. Should gs_close() 
(or some related/child function) do something to synchronously drain the 
RX queue or RX line discipline, just like it already does to drain 
port_write_buf?

Possible remaining race window:

1) Both host and gadget system have a USB gadget serial port open.

2) Host side sends data to the serial port.

3) gs_rx_push() processes the received data, and passes it on to 
tty_insert_flip_string() and tty_flip_buffer_push(). I believe these are 
asynchronous APIs which simply store the data for later processing.

3) Gadget side application closes the serial port. I believe this sets 
tty->driver_data to NULL.

4) The TTY work queue entry written in (3) is executed, and the 
TTY/line-discipline code processes the received data, which again ends 
up calling gs_write_room() and triggering the same oops there.

Some additional notes on the setup that I used to reproduce the issue:

* Using NVIDIA's downstream Tegra kernel 4.4. While this does make the 
problem not-an-upstream-issue, the code in the gadget serial driver 
looks identical to upstream (v4.12) w.r.t. this issue, so although I 
haven't actually reproduced the issue with upstream SW, I'm fairly 
confident that the issue does exist there and could be reproduced. 
Upstream doesn't support the Tegra UDC device yet, so I can't test the 
exact same HW upstream yet.

* Host machine is a pretty fast/recent core i7 running Ubuntu 14.04 x86-64.

* Gadget machine is an NVIDIA Tegra (Jetson TX2; T186 SoC) running 
Ubuntu 14.04 AArch64.

* I found the quickest way to reproduce the issue is to run the 
following once the gadget serial connection has been set up via 
/sys/kernel/config/usb_gadget:

Tegra-side, so the port keeps getting opened/closed:
while true; do sudo service serial-getty@ttyGS0 restart; sleep 1; done
(Rather than setting up a systemd getty service, you can probably also 
just run agetty directly and then kill it in a loop.)

Host-side, so data keeps coming in:
while true; do cat some-small-multiline-text-file > /dev/ttyACM0; sleep 
1; done

Repro typically takes a second or two at most, whereas with the patch 
above the device has run for at least 40m without issue.

If the patch does look good, just let me know and I'll send it in the 
normal manner.
