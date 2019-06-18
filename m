From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 18 Jun 2019 10:30:28 +0100
Message-ID: <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 11/06/2019 16:18, Jose Abreu wrote:
> Convert everything to phylink.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>

I am seeing a boot regression on -next for some of our boards that have
a synopsys ethernet controller that uses the dwmac-dwc-qos-ethernet
driver. Git bisect is pointing to this commit, but unfortunately this
cannot be cleanly reverted on top of -next to confirm. 

The bootlog shows the following bug is triggered ...

[   10.784989] ------------[ cut here ]------------
[   10.789597] kernel BUG at /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/kernel/time/timer.c:952!
[   10.798881] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   10.804351] Modules linked in:
[   10.807400] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G S                5.2.0-rc3-00940-g425b0fad9c7e #9
[   10.816682] Hardware name: NVIDIA Tegra186 P2771-0000 Development Board (DT)
[   10.823712] pstate: 20000005 (nzCv daif -PAN -UAO)
[   10.828496] pc : mod_timer+0x208/0x2d8
[   10.832235] lr : stmmac_napi_poll_tx+0x524/0x5a0
[   10.836839] sp : ffff000010003d00
[   10.840141] x29: ffff000010003d00 x28: ffff8001f42887c0 
[   10.845438] x27: ffff8001f42887c0 x26: ffff8001f55b7100 
[   10.850735] x25: 0000000000000000 x24: 0000000000000000 
[   10.856033] x23: ffff0000112e9000 x22: 0000000000000000 
[   10.861330] x21: 0000000000000001 x20: ffff0000121ad000 
[   10.866626] x19: ffff8001f47da000 x18: 0000000000000000 
[   10.871922] x17: 0000000000000000 x16: 0000000000000001 
[   10.877218] x15: 0000000000000009 x14: 0000000000001000 
[   10.882515] x13: 0000000080000000 x12: 0000000000000001 
[   10.887811] x11: 000000000000000c x10: 0000000000000000 
[   10.893107] x9 : 0000000000000000 x8 : 00000000fffee49c 
[   10.898403] x7 : 000000000000002a x6 : 000000000000002a 
[   10.903699] x5 : ffff8001f4189c80 x4 : 0000000000290000 
[   10.908995] x3 : 0000000000000000 x2 : 0000000000000000 
[   10.914291] x1 : 00000000fffee596 x0 : ffff8001f428b160 
[   10.919587] Call trace:
[   10.922024]  mod_timer+0x208/0x2d8
[   10.925415]  stmmac_napi_poll_tx+0x524/0x5a0
[   10.929674]  net_rx_action+0x220/0x318
[   10.933413]  __do_softirq+0x110/0x23c
[   10.937066]  irq_exit+0xcc/0xd8
[   10.940199]  __handle_domain_irq+0x60/0xb8
[   10.944282]  gic_handle_irq+0x58/0xb0
[   10.947931]  el1_irq+0xb8/0x180
[   10.951063]  arch_cpu_idle+0x10/0x18
[   10.954627]  do_idle+0x1dc/0x2a8
[   10.957845]  cpu_startup_entry+0x24/0x28
[   10.961758]  rest_init+0xd4/0xe0
[   10.964978]  arch_call_rest_init+0xc/0x14
[   10.968976]  start_kernel+0x44c/0x478
[   10.972626] Code: aa1503f4 aa1403f5 17ffffc5 d503201f (d4210000) 
[   10.978709] ---[ end trace 89626c50aaab321f ]---

I have not looked at this any further, but wanted to see if you have some
thoughts. 

Cheers
Jon

-- 
nvpublic
