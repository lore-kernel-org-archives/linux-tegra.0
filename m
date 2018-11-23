From: Jose Abreu <jose.abreu@synopsys.com>
Subject: Re: [PATCH] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Fri, 23 Nov 2018 12:44:02 +0000
Message-ID: <9c8443aa-edaa-2398-bdd8-df49f2529cb6@synopsys.com>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181123122122.18957-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <jose.abreu@synopsys.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 23-11-2018 12:21, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Setting up and tearing down debugfs is current unbalanced, as seen by
> this error during resume from suspend:
>
>     [  752.134067] dwc-eth-dwmac 2490000.ethernet eth0: ERROR failed to create debugfs directory
>     [  752.134347] dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: failed debugFS registration
>
> The imbalance happens because the driver creates the debugfs hierarchy
> when the device is opened and tears it down when the device is closed.
> There's little gain in that, and it could be argued that it is even
> surprising because it's not usually done for other devices. Fix the
> imbalance by moving the debugfs creation and teardown to the driver's
> ->probe() and ->remove() implementations instead.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>

Did you test trying to dump "descriptors_status" file when
interface is not open ? I think that's the main reason why this
is not in probe ...

Thanks and Best Regards,
Jose Miguel Abreu
