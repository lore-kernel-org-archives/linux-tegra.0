From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Boot WARN with patch "regulator: core: Link consumer with regulator
 driver"
Date: Wed, 11 Jul 2018 13:08:14 +0300
Message-ID: <83491a3e-cfed-6673-244e-e720f338db92@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: p.paillet@st.com, broonie@kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

I'm seeing the following spew during boot with Tegra210 with the patch 
"regulator: core: Link consumer with regulator driver", recently applied 
to linux-next:

[    1.196664] ------------[ cut here ]------------
[    1.201480] kobject: '(null)' ((____ptrval____)): is not initialized, 
yet kobject_put() is being called.
[    1.219186] WARNING: CPU: 2 PID: 23 at lib/kobject.c:688 
kobject_put+0xa4/0xe8
[    1.230026] Modules linked in:
[    1.241081] CPU: 2 PID: 23 Comm: kworker/2:0 Not tainted 
4.18.0-rc4-next-20180711 #66
[    1.258637] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[    1.258651] Workqueue: rcu_gp srcu_invoke_callbacks
[    1.272055] pstate: 60000005 (nZCv daif -PAN -UAO)
[    1.272064] pc : kobject_put+0xa4/0xe8
[    1.272071] lr : kobject_put+0xa4/0xe8
[    1.272078] sp : ffff000009be3cf0
[    1.279387] console [ttyS0] disabled
[    1.283662] x29: ffff000009be3cf0 x28: 0000000000000000
[    1.283673] x27: ffff8000fb30aeb8 x26: ffff000008e20690
[    1.283686] x25: ffff0000093e2118 x24: ffff8000fff7b480
[    1.314668] x23: ffff000008135358 x22: ffff8000fff7b4c0
[    1.325719] x21: ffff8000fff7b4c8 x20: ffff8000fafae600
[    1.325727] x19: ffff8000faa54850 x18: 0000000000000010
[    1.346022] x17: 0000000000000000 x16: 0000000000000000
[    1.346022] x17: 0000000000000000 x16: 0000000000000000
[    1.356805] x15: ffffffffffffffff x14: 75705f7463656a62
[    1.356805] x15: ffffffffffffffff x14: 75705f7463656a62
[    1.356813] x13: 6f6b20746579202c x12: 64657a696c616974
[    1.356813] x13: 6f6b20746579202c x12: 64657a696c616974
[    1.374670] x11: 696e6920746f6e20 x10: 7369203a29295f5f
[    1.374670] x11: 696e6920746f6e20 x10: 7369203a29295f5f
[    1.374678] x9 : 5f5f6c6176727470 x8 : ffff0000085c9810
[    1.404186] x7 : 6220736920292874 x6 : 000000000000000d
[    1.414785] x5 : 0000000000000000 x4 : 0000000000000000
[    1.414793] x3 : ffffffffffffffff x2 : ffff000009301010
[    1.414801] x1 : a7cf02699fb4fa00 x0 : 0000000000000000
[    1.424623] Call trace:
[    1.424632]  kobject_put+0xa4/0xe8
[    1.424645]  __device_link_free_srcu+0x24/0x48
[    1.435235]  srcu_invoke_callbacks+0xf0/0x170
[    1.435242]  process_one_work+0x1e0/0x318
[    1.435247]  worker_thread+0x40/0x428
[    1.435259]  kthread+0x124/0x128
[    1.445628] loop: module loaded
[    1.449599] ---[ end trace ce0b4f0828c5eeaf ]---
[    1.449619] ------------[ cut here ]------------

After reverting the patch, the kernel boots without the warning.

Thanks,
Mikko
