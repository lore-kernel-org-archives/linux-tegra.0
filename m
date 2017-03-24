From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] i2c: tegra-bpmp: Enable Tegra BPMP I2C adapter
Date: Fri, 24 Mar 2017 09:30:08 +0000
Message-ID: <245d5500-5a99-cb76-f72d-16e2ebf3d415@nvidia.com>
References: <1489580410-9541-1-git-send-email-jonathanh@nvidia.com>
 <20170320140503.GA28203@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20170320140503.GA28203@ulmo.ba.sec>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/03/17 14:05, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 15, 2017 at 12:20:10PM +0000, Jon Hunter wrote:
>> Enable the Tegra BPMP I2C adapter by default if the Tegra BPMP itself
>> is enabled. This adapter is used as the I2C interface for the PMIC on
>> the Tegra186 Jetson-TX2 platform.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  drivers/i2c/busses/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 8adc0f1d7ad0..9e024ae8a067 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -933,6 +933,7 @@ config I2C_TEGRA
>>  config I2C_TEGRA_BPMP
>>  	tristate "NVIDIA Tegra BPMP I2C controller"
>>  	depends on TEGRA_BPMP
>> +	default y if TEGRA_BPMP
> 
> I think "if TEGRA_BPMP" in the line above implies "depends on
> TEGRA_BPMP", so it's redundant. "default y" should be equivalent. That
> said, I'm not sure if we really want to always enable this. There could
> be boards with a BPMP that don't use the I2C controller.

Initially, I had thought about putting a select for this under the
ARCH_TEGRA_186_SOC in drivers/soc/tegra/Kconfig. We could always do that
in the future if it turns out the BPMP does not have i2c on newer chips.

Cheers
Jon

-- 
nvpublic
