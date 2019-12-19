From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/4] usb: phy: tegra: Perform general clean up of the
 code
Date: Thu, 19 Dec 2019 18:37:12 +0300
Message-ID: <a37a10de-2b40-16af-210c-c69049277f35@gmail.com>
References: <20191218175313.16235-1-digetx@gmail.com>
 <20191218175313.16235-4-digetx@gmail.com> <20191219125437.GB1440537@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219125437.GB1440537@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.12.2019 15:54, Thierry Reding пишет:
> On Wed, Dec 18, 2019 at 08:53:12PM +0300, Dmitry Osipenko wrote:
>> This patch fixes few dozens of legit checkpatch warnings, adds missed
>> handling of potential error-cases, fixes ULPI clk-prepare refcounting and
>> prettifies code where makes sense. All these clean-up changes are quite
>> minor and do not fix any problems.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/phy/phy-tegra-usb.c | 367 +++++++++++++++++---------------
>>  1 file changed, 197 insertions(+), 170 deletions(-)
> 
> This could've been multiple patches to make it easier to review, but
> either way:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Yes, it probably could be separated into 10 patches, but then there is a
chance that I won't do it because sometimes it takes more time for me to
write commit message than to make a code change + extra time to re-check
every patch before sending it out :)

> One minor comment below...
> 
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>> index 15bd253d53c9..76949dbbbdc2 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
> [...]
>> @@ -310,13 +315,16 @@ static void ulpi_close(struct tegra_usb_phy *phy)
>>  	}
>>  }
>>  
>> -static void utmip_pad_power_on(struct tegra_usb_phy *phy)
>> +static int utmip_pad_power_on(struct tegra_usb_phy *phy)
>>  {
>> -	unsigned long val, flags;
>> -	void __iomem *base = phy->pad_regs;
>>  	struct tegra_utmip_config *config = phy->config;
>> +	void __iomem *base = phy->pad_regs;
>> +	unsigned long val, flags;
> 
> I think technically the "val" variable would have to be u32 because
> that's what readl() and writel() operate on.

I had the same thought and decided it's not worth the extra effort.

> That could be a separate
> patch, though and isn't really a big problem.

But I'll do it now for complicity, since you're asking about it (in a v2
perhaps).

Thank you very much for the reviews!
