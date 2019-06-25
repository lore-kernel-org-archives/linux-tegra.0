From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 25 Jun 2019 12:10:15 +0100
Message-ID: <113f37a2-c37f-cdb5-5194-4361d949258a@nvidia.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
 <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
 <26cfaeff-a310-3b79-5b57-fd9c93bd8929@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8DD9@DE02WEMBXB.internal.synopsys.com>
 <b66c7578-172f-4443-f4c3-411525e28738@nvidia.com>
 <d96f8bea-f7ef-82ae-01ba-9c97aec0ee38@nvidia.com>
 <6f36b6b6-8209-ed98-e7e1-3dac0a92f6cd@nvidia.com>
 <7f0f2ed0-f47c-4670-d169-25f0413c1fd3@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9D7024@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B9D7024@DE02WEMBXB.internal.synopsys.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 25/06/2019 08:37, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> 
>> Any further feedback? I am still seeing this issue on today's -next.
> 
> Apologies but I was in FTO.
> 
> Is there any possibility you can just disable the ethX configuration in 
> the rootfs mount and manually configure it after rootfs is done ?
> 
> I just want to make sure in which conditions this is happening (if in 
> ifdown or ifup).

I have been looking at this a bit closer and I can see the problem. What
happens is that ...

1. stmmac_mac_link_up() is called and priv->eee_active is set to false
2. stmmac_eee_init() is called but because priv->eee_active is false,
   timer_setup() for eee_ctrl_timer is never called.
3. stmmac_eee_init() returns true and so then priv->eee_enabled is set 
   to true.
4. When stmmac_tx_clean() is called because priv->eee_enabled is set to    
   true, mod_timer() is called for the eee_ctrl_timer, but because 
   timer_setup() was never called, we hit the BUG defined at
   kernel/time/timer.c:952, because no function is defined for the 
   timer.

The following fixes it for me ...

--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -399,10 +399,13 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
        mutex_lock(&priv->lock);
 
        /* Check if it needs to be deactivated */
-       if (!priv->eee_active && priv->eee_enabled) {
-               netdev_dbg(priv->dev, "disable EEE\n");
-               del_timer_sync(&priv->eee_ctrl_timer);
-               stmmac_set_eee_timer(priv, priv->hw, 0, tx_lpi_timer);
+       if (!priv->eee_active) {
+               if (priv->eee_enabled) {
+                       netdev_dbg(priv->dev, "disable EEE\n");
+                       del_timer_sync(&priv->eee_ctrl_timer);
+                       stmmac_set_eee_timer(priv, priv->hw, 0, tx_lpi_timer);
+               }
+               mutex_unlock(&priv->lock);
                return false;
        }

It also looks like you have a potention deadlock in the current code
because in the case of if (!priv->eee_active && priv->eee_enabled)
you don't unlock the mutex. The above fixes this as well. I can send a
formal patch if this looks correct. 

Cheers
Jon

-- 
nvpublic
