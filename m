From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 08/10] usb: phy: tegra: Use u32 for hardware register
 variables
Date: Mon, 23 Dec 2019 00:48:09 +0300
Message-ID: <6c0fbeb2-3db2-f331-fc0a-a900241a32f5@gmail.com>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-9-digetx@gmail.com> <20191222132227.GA7096@nuc8i5>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191222132227.GA7096@nuc8i5>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dejin Zheng <zhengdejin5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

22.12.2019 16:24, Dejin Zheng пишет:
> On Fri, Dec 20, 2019 at 04:52:36AM +0300, Dmitry Osipenko wrote:
>> There is a mix of u32/ULONG usage in the driver's code. Let's switch to
>> u32 uniformly, for consistency.
>>
>> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/phy/phy-tegra-usb.c | 28 +++++++++++++++-------------
>>  1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>> index d5739b6e0b6c..551c94e3877a 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>> @@ -202,7 +202,7 @@ static inline struct tegra_usb_phy *to_tegra_usb_phy(struct usb_phy *u_phy)
>>  static void set_pts(struct tegra_usb_phy *phy, u8 pts_val)
>>  {
>>  	void __iomem *base = phy->regs;
>> -	unsigned long val;
>> +	u32 val;
>>  
>>  	if (phy->soc_config->has_hostpc) {
>>  		val = readl_relaxed(base + TEGRA_USB_HOSTPC1_DEVLC);
>> @@ -221,7 +221,7 @@ static void set_pts(struct tegra_usb_phy *phy, u8 pts_val)
>>  static void set_phcd(struct tegra_usb_phy *phy, bool enable)
>>  {
>>  	void __iomem *base = phy->regs;
>> -	unsigned long val;
>> +	u32 val;
>>  
>>  	if (phy->soc_config->has_hostpc) {
>>  		val = readl_relaxed(base + TEGRA_USB_HOSTPC1_DEVLC);
>> @@ -320,7 +320,8 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
>>  {
>>  	struct tegra_utmip_config *config = phy->config;
>>  	void __iomem *base = phy->pad_regs;
>> -	unsigned long val, flags;
>> +	unsigned long flags;
>> +	u32 val;
> Why are you still using unsigned long here?

Please take a look at [1][2], the types are matching callees.

[1]
https://elixir.bootlin.com/linux/v5.5-rc2/source/include/linux/spinlock.h#L249

[2]
https://elixir.bootlin.com/linux/v5.5-rc2/source/include/asm-generic/io.h#L297
