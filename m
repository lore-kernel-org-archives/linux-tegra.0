From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon
 bug in Intel's EHCI"
Date: Tue, 19 Mar 2013 12:49:28 -0600
Message-ID: <5148B338.6070001@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1303191420121.1302-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1303191420121.1302-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 12:34 PM, Alan Stern wrote:
> On Mon, 18 Mar 2013, Stephen Warren wrote:
> 
>> Alan,
>>
>> In v3.9-rc3, I find that "reboot" and "shutdown" hang on Tegra. I
>> bisected it to commit 6402c79 "USB: EHCI: work around silicon bug in
>> Intel's EHCI controllers", and confirmed that running v3.9-rc3 with just
>> that one patch reverted does solve the problem.
>>
>> Do you have any idea what the problem might be, or is there anything I
>> can do to help debug this? Thanks.
> 
> Is there any way to find out where the hangup occurs?  For example, can
> you get anything from Alt-SysRq-W?
> 
> Failing that, can you put some printk statements in
> drivers/usb/host/ehci-hcd.c, in the ehci_halt(),
> ehci_silence_controller(), and ehci_shutdown() routines?  (Although I 
> suspect this may not help because the hangup occurs somewhere else...)

Yes, sysrq seems to work over the serial console:-)

>  * Will now restart
> 
> *** break sent ***
> [  180.765213] SysRq : Show Blocked State
> [  180.768963]   task                PC stack   pid father
> [  180.774182] khubd           D c0517678     0    21      2 0x00000000
> [  180.780559] [<c0517678>] (__schedule+0x348/0x6dc) from [<c02ebc90>] (usb_kill_urb+0x88/0xd4)
> [  180.788984] [<c02ebc90>] (usb_kill_urb+0x88/0xd4) from [<c02ecb70>] (usb_start_wait_urb+0xa4/0x13c)
> [  180.798012] [<c02ecb70>] (usb_start_wait_urb+0xa4/0x13c) from [<c02ecd98>] (usb_control_msg+0x98/0xcc)
> [  180.807301] [<c02ecd98>] (usb_control_msg+0x98/0xcc) from [<c02e4394>] (hub_port_init+0x5e0/0x9d0)
> [  180.816242] [<c02e4394>] (hub_port_init+0x5e0/0x9d0) from [<c02e6640>] (hub_port_connect_change+0x1f4/0x970)
> [  180.826050] [<c02e6640>] (hub_port_connect_change+0x1f4/0x970) from [<c02e70fc>] (hub_events+0x340/0x8c4)
> [  180.835598] [<c02e70fc>] (hub_events+0x340/0x8c4) from [<c02e76a8>] (hub_thread+0x28/0x1b8)
> [  180.843941] [<c02e76a8>] (hub_thread+0x28/0x1b8) from [<c0041268>] (kthread+0xa4/0xb0)
> [  180.851851] [<c0041268>] (kthread+0xa4/0xb0) from [<c000ed98>] (ret_from_fork+0x14/0x3c)
> [  180.859929] udevd           D c0517678     0   167      1 0x00000001
> [  180.866285] [<c0517678>] (__schedule+0x348/0x6dc) from [<c0517df0>] (schedule_preempt_disabled+0x24/0x34)
> [  180.875834] [<c0517df0>] (schedule_preempt_disabled+0x24/0x34) from [<c05167f8>] (__mutex_lock_slowpath+0x15c/0x354)
> [  180.886336] [<c05167f8>] (__mutex_lock_slowpath+0x15c/0x354) from [<c05169fc>] (mutex_lock+0xc/0x24)
> [  180.895455] [<c05169fc>] (mutex_lock+0xc/0x24) from [<c02f1fd0>] (show_manufacturer+0x18/0x40)
> [  180.904059] [<c02f1fd0>] (show_manufacturer+0x18/0x40) from [<c027fe18>] (dev_attr_show+0x1c/0x48)
> [  180.913007] [<c027fe18>] (dev_attr_show+0x1c/0x48) from [<c01191c0>] (sysfs_read_file+0x90/0x16c)
> [  180.921870] [<c01191c0>] (sysfs_read_file+0x90/0x16c) from [<c00c8418>] (vfs_read+0x98/0x13c)
> [  180.930379] [<c00c8418>] (vfs_read+0x98/0x13c) from [<c00c84f8>] (SyS_read+0x3c/0x70)
> [  180.938196] [<c00c84f8>] (SyS_read+0x3c/0x70) from [<c000ed00>] (ret_fast_syscall+0x0/0x30)
> [  180.946527] reboot          D c0517678     0   877    876 0x00000000
> [  180.952883] [<c0517678>] (__schedule+0x348/0x6dc) from [<c0517df0>] (schedule_preempt_disabled+0x24/0x34)
> [  180.962432] [<c0517df0>] (schedule_preempt_disabled+0x24/0x34) from [<c05167f8>] (__mutex_lock_slowpath+0x15c/0x354)
> [  180.972934] [<c05167f8>] (__mutex_lock_slowpath+0x15c/0x354) from [<c05169fc>] (mutex_lock+0xc/0x24)
> [  180.982050] [<c05169fc>] (mutex_lock+0xc/0x24) from [<c02813c4>] (device_shutdown+0xc8/0x188)
> [  180.990566] [<c02813c4>] (device_shutdown+0xc8/0x188) from [<c00364b4>] (kernel_restart_prepare+0x34/0x3c)
> [  181.000202] [<c00364b4>] (kernel_restart_prepare+0x34/0x3c) from [<c00364c8>] (kernel_restart+0xc/0x4c)
> [  181.009578] [<c00364c8>] (kernel_restart+0xc/0x4c) from [<c00366bc>] (SyS_reboot+0x1ac/0x1d8)
> [  181.018086] [<c00366bc>] (SyS_reboot+0x1ac/0x1d8) from [<c000ed00>] (ret_fast_syscall+0x0/0x30)

I assume you only want the back-traces, not the reset of the sysrq spew?

BTW, I have also occasionally noticed some either hung task or RCU spew
related to usb_kill_urb at other times (i.e. when not rebooting), IIRC
(which I may not; I may be remembering what happens if I just leave the
reboot hung for a few minutes, as shown below):

> [  240.670335] INFO: task khubd:21 blocked for more than 120 seconds.
> [  240.676516] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  240.684336] khubd           D c0517678     0    21      2 0x00000000
> [  240.690706] [<c0517678>] (__schedule+0x348/0x6dc) from [<c02ebc90>] (usb_kill_urb+0x88/0xd4)
> [  240.699140] [<c02ebc90>] (usb_kill_urb+0x88/0xd4) from [<c02ecb70>] (usb_start_wait_urb+0xa4/0x13c)
> [  240.708181] [<c02ecb70>] (usb_start_wait_urb+0xa4/0x13c) from [<c02ecd98>] (usb_control_msg+0x98/0xcc)
> [  240.717481] [<c02ecd98>] (usb_control_msg+0x98/0xcc) from [<c02e4394>] (hub_port_init+0x5e0/0x9d0)
> [  240.726433] [<c02e4394>] (hub_port_init+0x5e0/0x9d0) from [<c02e6640>] (hub_port_connect_change+0x1f4/0x970)
> [  240.736251] [<c02e6640>] (hub_port_connect_change+0x1f4/0x970) from [<c02e70fc>] (hub_events+0x340/0x8c4)
> [  240.745809] [<c02e70fc>] (hub_events+0x340/0x8c4) from [<c02e76a8>] (hub_thread+0x28/0x1b8)
> [  240.754160] [<c02e76a8>] (hub_thread+0x28/0x1b8) from [<c0041268>] (kthread+0xa4/0xb0)
> [  240.762067] [<c0041268>] (kthread+0xa4/0xb0) from [<c000ed98>] (ret_from_fork+0x14/0x3c)
> [  240.770153] INFO: task udevd:167 blocked for more than 120 seconds.
> [  240.776410] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  240.784228] udevd           D c0517678     0   167      1 0x00000001
> [  240.790586] [<c0517678>] (__schedule+0x348/0x6dc) from [<c0517df0>] (schedule_preempt_disabled+0x24/0x34)
> [  240.800145] [<c0517df0>] (schedule_preempt_disabled+0x24/0x34) from [<c05167f8>] (__mutex_lock_slowpath+0x15c/0x354)
> [  240.810659] [<c05167f8>] (__mutex_lock_slowpath+0x15c/0x354) from [<c05169fc>] (mutex_lock+0xc/0x24)
> [  240.819787] [<c05169fc>] (mutex_lock+0xc/0x24) from [<c02f1fd0>] (show_manufacturer+0x18/0x40)
> [  240.828397] [<c02f1fd0>] (show_manufacturer+0x18/0x40) from [<c027fe18>] (dev_attr_show+0x1c/0x48)
> [  240.837353] [<c027fe18>] (dev_attr_show+0x1c/0x48) from [<c01191c0>] (sysfs_read_file+0x90/0x16c)
> [  240.846227] [<c01191c0>] (sysfs_read_file+0x90/0x16c) from [<c00c8418>] (vfs_read+0x98/0x13c)
> [  240.854747] [<c00c8418>] (vfs_read+0x98/0x13c) from [<c00c84f8>] (SyS_read+0x3c/0x70)
> [  240.862565] [<c00c84f8>] (SyS_read+0x3c/0x70) from [<c000ed00>] (ret_fast_syscall+0x0/0x30)

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
