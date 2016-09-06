From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 0/9] Some Tegra I2C Updates
Date: Tue, 6 Sep 2016 10:52:11 +0100
Message-ID: <7e1a0e3f-c3f7-1cf4-55b8-7355b97dc629@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
 <20160830203844.GD3645@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160830203844.GD3645@katana>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/08/16 21:38, Wolfram Sang wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Aug 26, 2016 at 02:08:56PM +0100, Jon Hunter wrote:
>> Add runtime-pm and pinctrl support for Tegra I2C driver.
>>
>> The first 6 patches are trivial clean-up/simplification changes.
>>
>> Changes since V1:
>> - Fixed cppcheck warning reported by Wolfram
>> - Added 3 more clean-up patches to fix some checkpatch issues
>>
>> Jon Hunter (9):
>>   i2c: tegra: Fix lines over 80 characters
>>   i2c: tegra: Use BIT macro
>>   i2c: tegra: Fix missing blank lines after declarations
>>   i2c: tegra: Add missing new line characters
>>   i2c: tegra: Remove non device-tree support
>>   i2c: tegra: Use device name for adapter name
>>   i2c: tegra: Simplify I2C resume
>>   i2c: tegra: Add runtime power-management support
>>   i2c: tegra: Add pinctrl support
>>
> 
> Applied to for-next, thanks!
> 
> If you are in for some more cleanups ;)
> 
>     SPATCH
> drivers/i2c/busses/i2c-tegra.c:529:2-23: WARNING: Assignment of bool to 0/1
> drivers/i2c/busses/i2c-tegra.c:555:3-24: WARNING: Assignment of bool to 0/1

Thanks! I have sent a patch to fix these.

Cheers
Jon

-- 
nvpublic
