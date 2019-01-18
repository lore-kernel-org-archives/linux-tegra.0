From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V1] i2c: tegra: increase transfer timeout
Date: Fri, 18 Jan 2019 09:20:14 +0000
Message-ID: <c6ba237c-d271-c9d7-1c30-9901ba6bb1a0@nvidia.com>
References: <1547757572-29075-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547757572-29075-1-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 17/01/2019 20:39, Sowjanya Komatineni wrote:
> increase transfer timeout to 10s to allow enough time during max
> transfer size.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index e417ebf7628c..ca7c581fb4c0 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -25,7 +25,7 @@
>  
>  #include <asm/unaligned.h>
>  
> -#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(10000))
>  #define BYTES_PER_FIFO_WORD 4
>  
>  #define I2C_CNFG				0x000

Should the timeout be set depending on the max transfer size? 10s seems
an age if the max transfer size is 4KB. In other words, we should this
only be applied for T194+?

Furthermore, in tegra_i2c_xfer_msg() we know the len of the message and
so maybe it would be better to dynamically set the timeout depending on
length?

Cheers
Jon

-- 
nvpublic
