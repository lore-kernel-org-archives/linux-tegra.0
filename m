From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] phy: tegra: xusb: Don't warn on probe defer
Date: Tue, 25 Feb 2020 10:32:14 +0530
Message-ID: <7292f4cc-ec5c-4840-3627-72883a0353c7@ti.com>
References: <20200224143641.5851-1-jonathanh@nvidia.com>
 <20200224151218.GA2570205@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224151218.GA2570205@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On 24/02/20 8:42 pm, Thierry Reding wrote:
> On Mon, Feb 24, 2020 at 02:36:41PM +0000, Jon Hunter wrote:
>> Deferred probe is an expected return value for tegra_fuse_readl().
>> Given that the driver deals with it properly, there's no need to
>> output a warning that may potentially confuse users.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/phy/tegra/xusb-tegra186.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Kishon,
> 
> I already have a couple of PHY subsystem patches from JC and Nagarjuna
> in a branch in the Tegra tree that I need to resolve a dependency. Do
> you mind if I pick this up into that branch as well and send it to you
> as a pull request later on? Say around v5.6-rc6?

You can take this via Tegra tree itself.

Acked-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>

-Kishon

> 
> Alternatively you could provide an Acked-by and then I can take them all
> through ARM SoC.
> 
> Thierry
> 
>> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
>> index 84c27394c181..12d0f3e30dbc 100644
>> --- a/drivers/phy/tegra/xusb-tegra186.c
>> +++ b/drivers/phy/tegra/xusb-tegra186.c
>> @@ -802,7 +802,9 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
>>  
>>  	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
>>  	if (err) {
>> -		dev_err(dev, "failed to read calibration fuse: %d\n", err);
>> +		if (err != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to read calibration fuse: %d\n",
>> +				err);
>>  		return err;
>>  	}
>>  
>> -- 
>> 2.17.1
>>
