From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Wed, 17 Jul 2019 19:58:53 +0100
Message-ID: <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 03/07/2019 11:37, Jose Abreu wrote:
> Mapping and unmapping DMA region is an high bottleneck in stmmac driver,
> specially in the RX path.
> 
> This commit introduces support for Page Pool API and uses it in all RX
> queues. With this change, we get more stable troughput and some increase
> of banwidth with iperf:
> 	- MAC1000 - 950 Mbps
> 	- XGMAC: 9.22 Gbps
I am seeing a boot regression on one of our Tegra boards with both
mainline and -next. Bisecting is pointing to this commit and reverting
this commit on top of mainline fixes the problem. Unfortunately, there
is not much of a backtrace but what I have captured is below. 

Please note that this is seen on a system that is using NFS to mount
the rootfs and the crash occurs right around the point the rootfs is
mounted.

Let me know if you have any thoughts.

Cheers
Jon 

[   12.221843] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[   12.229485] CPU: 5 PID: 1 Comm: init Tainted: G S                5.2.0-11500-g916f562fb28a #18
[   12.238076] Hardware name: NVIDIA Tegra186 P2771-0000 Development Board (DT)
[   12.245105] Call trace:
[   12.247548]  dump_backtrace+0x0/0x150
[   12.251199]  show_stack+0x14/0x20
[   12.254505]  dump_stack+0x9c/0xc4
[   12.257809]  panic+0x13c/0x32c
[   12.260853]  complete_and_exit+0x0/0x20
[   12.264676]  do_group_exit+0x34/0x98
[   12.268241]  get_signal+0x104/0x668
[   12.271718]  do_notify_resume+0x2ac/0x380
[   12.275716]  work_pending+0x8/0x10
[   12.279109] SMP: stopping secondary CPUs
[   12.283025] Kernel Offset: disabled
[   12.286502] CPU features: 0x0002,20806000
[   12.290499] Memory Limit: none
[   12.293548] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-- 
nvpublic
