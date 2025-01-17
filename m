Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004651F6687;
	Fri, 17 Jan 2025 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102245; cv=none; b=ZGTtUiJqzAIoFo7l9odYhw4+SDUdqQkg88oyf/SzMZSo3nGTb6Dq8EvjOYFaKIDUN7X8wFvF5xm/YWpm18dVb76C69hRofHNY5IGcQv8pve7kf9Cbp3c4wL+iWLlXTNOWx+Ca+JHOMluqjxlDA5aexpff2FFBI2TO90KTzYq7GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102245; c=relaxed/simple;
	bh=N9Vit9tVxjjfmkXXr2SKuzlMMH57Us61o8IB8e+uljY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QA5bVf6RxARwCq+3lK4+Y/isJfADq3VWeSMBXYWD3W/Wf5K0xe92Qj0r/94OcZh+Xikw06T0OnZO41g4BwjySG6nxkV+7vVbxKof5y7BJw6x5fqftatUJ3fDFFucEjBmA/PHLZnPS0hZgc3s+2Wzc3LH85ibNoke6eFo4xs2r60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k4iy5uS8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k4iy5uS8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074D6C4CEDD;
	Fri, 17 Jan 2025 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737102244;
	bh=N9Vit9tVxjjfmkXXr2SKuzlMMH57Us61o8IB8e+uljY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4iy5uS8VRpEUgUIsbGniMRwfjVoBMAg5VVejnIdhsKP52nKCxPf34kruwN4DtOIP
	 ANUud9tpDUqFm4xsZZDlrkcbfXlkvaQCjAqDErJxps8zth+FUgVbVTDMSZkPfdbi5V
	 iUfPptDAQo8f62teVipem+D+lTPVmAG3Oi7aKeHY=
Date: Fri, 17 Jan 2025 09:24:01 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Prashanth K <quic_prashk@quicinc.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"opensource.kernel" <opensource.kernel@vivo.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Brad Griffis <bgriffis@nvidia.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjNdIHVz?=
 =?utf-8?Q?b=3A_gadget=3A_u=5Fserial=3A_Disable_ep_before_settin?=
 =?utf-8?Q?g?= port to null to fix the crash caused by port being null
Message-ID: <2025011752-myspace-gigahertz-13a6@gregkh>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <TYUPR06MB62175A4CC0559A1E4330C267D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYUPR06MB62175A4CC0559A1E4330C267D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>

On Fri, Jan 17, 2025 at 05:04:30AM +0000, 胡连勤 wrote:
> Hi  Jon：
> 
> > >>> Considering that in some extreme cases, when performing the
> > >>> unbinding operation, gserial_disconnect has cleared gser->ioport,
> > >>> which triggers gadget reconfiguration, and then calls
> > >>> gs_read_complete, resulting in access to a null pointer. Therefore,
> > >>> ep is disabled before gserial_disconnect sets port to null to prevent this
> > from happening.
> > >>>
> > >>> Call trace:
> > >>>    gs_read_complete+0x58/0x240
> > >>>    usb_gadget_giveback_request+0x40/0x160
> > >>>    dwc3_remove_requests+0x170/0x484
> > >>>    dwc3_ep0_out_start+0xb0/0x1d4
> > >>>    __dwc3_gadget_start+0x25c/0x720
> > >>>    kretprobe_trampoline.cfi_jt+0x0/0x8
> > >>>    kretprobe_trampoline.cfi_jt+0x0/0x8
> > >>>    udc_bind_to_driver+0x1d8/0x300
> > >>>    usb_gadget_probe_driver+0xa8/0x1dc
> > >>>    gadget_dev_desc_UDC_store+0x13c/0x188
> > >>>    configfs_write_iter+0x160/0x1f4
> > >>>    vfs_write+0x2d0/0x40c
> > >>>    ksys_write+0x7c/0xf0
> > >>>    __arm64_sys_write+0x20/0x30
> > >>>    invoke_syscall+0x60/0x150
> > >>>    el0_svc_common+0x8c/0xf8
> > >>>    do_el0_svc+0x28/0xa0
> > >>>    el0_svc+0x24/0x84
> > >>>
> > >>> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> > >>> Cc: stable@vger.kernel.org
> > >>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> > >>> ---
> > >>>
> > >>> Changes in v3:
> > >>>    - Add --- line above the version tag information
> > >>>    - Remove extra blank lines in commit messages
> > >>>    - Version tag information from v2 to changes in v2
> > >>>    - Link to v2:
> > >>>
> > https://lo/
> > >>>
> > re.kernel.org%2Fall%2FTYUPR06MB6217DAA095A9863D4B58D57CD23B2%40T
> > YUPR
> > >>>
> > 06MB6217.apcprd06.prod.outlook.com%2F&data=05%7C02%7Chulianqin%40
> > viv
> > >>>
> > o.com%7Cc88bd260faf9470d244f08dd363eb8df%7C923e42dc48d54cbeb5821
> > a797
> > >>>
> > a6412ed%7C0%7C0%7C638726365197191059%7CUnknown%7CTWFpbGZsb3d
> > 8eyJFbXB
> > >>>
> > 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp
> > bCI
> > >>>
> > sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=G4l0lGF093J44BuTeGpEYpYvC
> > MGiK3d
> > >>> TnR%2Fd2Zn8Q1U%3D&reserved=0
> > >>>
> > >>> Changes in v2:
> > >>>    - Remove some address information from patch descriptions
> > >>>    - Link to v1:
> > https://lore.k/
> > ernel.org%2Fall%2FTYUPR06MB621763AB815989161F4033AFD2762%40TYUPR
> > 06MB6217.apcprd06.prod.outlook.com%2F&data=05%7C02%7Chulianqin%40
> > vivo.com%7Cc88bd260faf9470d244f08dd363eb8df%7C923e42dc48d54cbeb58
> > 21a797a6412ed%7C0%7C0%7C638726365197206594%7CUnknown%7CTWFpb
> > GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> > MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6rGddQJ
> > L9K%2Bqyr98IXYkf6zM8AzxN6%2FaJZztGybx%2FUw%3D&reserved=0
> > >>>    - Link to suggestions:
> > >>>
> > https://lo/
> > >>>
> > re.kernel.org%2Fall%2FTYUPR06MB6217DE28012FFEC5E808DD64D2962%40TY
> > UPR
> > >>>
> > 06MB6217.apcprd06.prod.outlook.com%2F&data=05%7C02%7Chulianqin%40
> > viv
> > >>>
> > o.com%7Cc88bd260faf9470d244f08dd363eb8df%7C923e42dc48d54cbeb5821
> > a797
> > >>>
> > a6412ed%7C0%7C0%7C638726365197216620%7CUnknown%7CTWFpbGZsb3d
> > 8eyJFbXB
> > >>>
> > 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp
> > bCI
> > >>>
> > sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7EvOpENpZd8s6S8PR1D%2B2
> > HnQmBLPa
> > >>> UNotpV5UGSDiDE%3D&reserved=0
> > >>>
> > >>>    drivers/usb/gadget/function/u_serial.c | 8 ++++----
> > >>>    1 file changed, 4 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/drivers/usb/gadget/function/u_serial.c
> > >>> b/drivers/usb/gadget/function/u_serial.c
> > >>> index 53d9fc41acc5..bc143a86c2dd 100644
> > >>> --- a/drivers/usb/gadget/function/u_serial.c
> > >>> +++ b/drivers/usb/gadget/function/u_serial.c
> > >>> @@ -1420,6 +1420,10 @@ void gserial_disconnect(struct gserial *gser)
> > >>>     /* REVISIT as above: how best to track this? */
> > >>>     port->port_line_coding = gser->port_line_coding;
> > >>> +   /* disable endpoints, aborting down any active I/O */
> > >>> +   usb_ep_disable(gser->out);
> > >>> +   usb_ep_disable(gser->in);
> > >>> +
> > >>>     port->port_usb = NULL;
> > >>>     gser->ioport = NULL;
> > >>>     if (port->port.count > 0) {
> > >>> @@ -1431,10 +1435,6 @@ void gserial_disconnect(struct gserial *gser)
> > >>>     spin_unlock(&port->port_lock);
> > >>>     spin_unlock_irqrestore(&serial_port_lock, flags);
> > >>> -   /* disable endpoints, aborting down any active I/O */
> > >>> -   usb_ep_disable(gser->out);
> > >>> -   usb_ep_disable(gser->in);
> > >>> -
> > >>>     /* finally, free any unused/unusable I/O buffers */
> > >>>     spin_lock_irqsave(&port->port_lock, flags);
> > >>>     if (port->port.count == 0)
> > >>
> > >>
> > >> We have observed a reboot regression on Tegra234 (I have not tried
> > >> other
> > >> boards) and bisect is pointing to this commit. Reverting this on top
> > >> of mainline is fixing the problem.
> > >>
> > >> With this change, when the board reboots we see ...
> > >>
> > >> [   59.918177] tegra-xudc 3550000.usb: ep 3 disabled
> > >> [   59.923097] tegra-xudc 3550000.usb: ep 2 disabled
> > >> [   59.927955] tegra-xudc 3550000.usb: ep 5 disabled
> > >> [   80.911432] rcu: INFO: rcu_preempt self-detected stall on CPU
> > >> [   80.917354] rcu:     6-....: (5248 ticks this GP)
> > idle=ec24/1/0x4000000000000000 softirq=1213/1213 fqs=2623
> > >> [   80.927146] rcu:     (t=5253 jiffies g=3781 q=1490 ncpus=12)
> > >> [   80.932704] Sending NMI from CPU 6 to CPUs 2:
> > >> [   90.981555] CPU: 6 UID: 0 PID: 18 Comm: rcu_exp_gp_kthr Not tainted
> > 6.13.0-rc7-00043-g619f0b6fad52 #1
> > >> [   90.981558] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer
> > Kit/Jetson, BIOS 00.0.0-dev-main_92e5ae_88fd1_296de 12/16/2024
> > >> [   90.981559] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS
> > BTYPE=--)
> > >> [   90.981562] pc : smp_call_function_single+0xdc/0x1a0
> > >> [   90.981574] lr : __sync_rcu_exp_select_node_cpus+0x228/0x3c0
> > >> [   90.981578] sp : ffff800082eb3cd0
> > >> [   90.981579] x29: ffff800082eb3cd0 x28: 0000000000000010 x27:
> > ffff0000802933c0
> > >> [   90.981582] x26: ffff0007a8a1d700 x25: ffff800082895500 x24:
> > ffff800080132018
> > >> [   90.981584] x23: 0000000000000014 x22: ffff800081fb7700 x21:
> > ffff80008280d970
> > >> [   90.981586] x20: 0000000000000feb x19: ffff800082eb3d00 x18:
> > 0000000000000000
> > >> [   90.981588] x17: 0000000000000000 x16: 0000000000000000 x15:
> > 0000000000000000
> > >> [   90.981590] x14: ffff000080293440 x13: 0000000000000001 x12:
> > 0000000000000000
> > >> [   90.981591] x11: ffff800081fb2388 x10: ffff0000802933c0 x9 :
> > 0000000000000001
> > >> [   90.981593] x8 : 0000000000000040 x7 : 0000000000017068 x6 :
> > ffff800080132018
> > >> [   90.981595] x5 : 0000000000000000 x4 : ffff0007a8a4f9c8 x3 :
> > 0000000000000001
> > >> [   90.981597] x2 : 0000000000000000 x1 : ffff0007a8a4f9c0 x0 :
> > 0000000000000004
> > >> [   90.981599] Call trace:
> > >> [   90.981601]  smp_call_function_single+0xdc/0x1a0 (P)
> > >> [   90.981605]  __sync_rcu_exp_select_node_cpus+0x228/0x3c0
> > >> [   90.981607]  sync_rcu_exp_select_cpus+0x13c/0x2a0
> > >> [   90.981609]  wait_rcu_exp_gp+0x18/0x30
> > >> [   90.981611]  kthread_worker_fn+0xd0/0x188
> > >> [   90.981614]  kthread+0x118/0x11c
> > >> [   90.981619]  ret_from_fork+0x10/0x20
> > >> [  101.416347] sched: DL replenish lagged too much
> > >>
> > >
> > > Odd, you have a usb-serial gadget device in this system that is
> > > disconnecting somehow?  That oops doesn't point to anything in the usb
> > > gadget codebase, "all" we have done is move the call to shutdown the
> > > endpoints to earlier in the disconnect function.
> >
> > Yes the board starts usb-serial and usb-ethernet gadget and on reboot when
> > tearing it down I am seeing the above. As soon as it disables the tegra-xudc
> > endpoints (as seen above) the board appears to stall.
> >
> > > I'm glad to revert this, but it feels really odd that this is causing
> > > you an rcu stall issue.
> >
> > Thanks. I can't say I understand it either, but I am certain it is caused by this
> > change.
> >
> > Happy to run any tests to narrow this down a bit.
> 
> I'm really sorry. If we are sure that the problem is caused by this patch, we will roll it back first. In addition,
> what are the differences between the serial use of Tegra234 board and mobile phones?
> When we consider other solutions, we need to take this usage scenario of Tegra234 board into consideration.

Revert sent here now:
	https://lore.kernel.org/r/2025011711-yippee-fever-a737@gregkh
