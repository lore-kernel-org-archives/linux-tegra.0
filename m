From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 18 Jun 2019 10:42:31 +0100
Message-ID: <26cfaeff-a310-3b79-5b57-fd9c93bd8929@nvidia.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
 <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 18/06/2019 10:35, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> 
>> I am seeing a boot regression on -next for some of our boards that have
>> a synopsys ethernet controller that uses the dwmac-dwc-qos-ethernet
>> driver. Git bisect is pointing to this commit, but unfortunately this
>> cannot be cleanly reverted on top of -next to confirm. 
> 
> Thanks for reporting. Looks like the timer is not setup when 
> stmmac_tx_clean() is called. When do you see this stacktrace ? After 
> ifdown ?

I am not certain but I don't believe so. We are using a static IP address
and mounting the root file-system via NFS when we see this ...

[   10.607510] dwc-eth-dwmac 2490000.ethernet eth0: phy link up rgmii/1Gbps/Full
[   10.607536] dwc-eth-dwmac 2490000.ethernet eth0: phylink_mac_config: mode=phy/rgmii/1Gbps/Full adv=00,00000000,00000000 pause=0f link=1 an=0
[   10.608804] dwc-eth-dwmac 2490000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[   10.630979] IP-Config: Complete:
[   10.639046]      device=eth0, hwaddr=d2:e5:1c:57:26:4b, ipaddr=192.168.99.2, mask=255.255.255.0, gw=192.168.99.1
[   10.649201]      host=192.168.99.2, domain=, nis-domain=(none)
[   10.655022]      bootserver=192.168.0.1, rootserver=192.168.0.1, rootpath=
[   10.677531] VDD_1V8_AP_PLL: disabling
[   10.681194] VDD_RTC: disabling
[   10.684246] VDDIO_SDMMC3_AP: disabling
[   10.688132] VDD_HDMI_1V05: disabling
[   10.691704] SD_CARD_SW_PWR: disabling
[   10.695357] VDD_USB0: disabling
[   10.698488] VDD_USB1: disabling
[   10.701621] VDD_HDMI_5V0: disabling
[   10.705100] ALSA device list:
[   10.708063]   No soundcards found.
[   10.711914] Freeing unused kernel memory: 1472K
[   10.727005] Run /init as init process
[   10.784989] ------------[ cut here ]------------
[   10.789597] kernel BUG at /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/kernel/time/timer.c:952!

Cheers
Jon

-- 
nvpublic
