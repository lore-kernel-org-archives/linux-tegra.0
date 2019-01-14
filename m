From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH] regmap-irq: do not write mask register if mask_base is
 zero
Date: Mon, 14 Jan 2019 17:42:26 +0800
Message-ID: <90be2d42-977b-10a9-8c56-0b7a5c61a765@nvidia.com>
References: <20190114093258.28431-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114093258.28431-1-markz@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Jinyoung Park <jinyoungp@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some background infos:
This patch fixes an issue when using max77620 gpio driver.
The issue is that, max77620 doesn't have a dedicated GPIO interrupt mask register.
If you want to mask a separate GPIO interrupt on max77620, you need to do that in
it's type register(starting from register address 0x36 - 0x3D).
So this means we can't find a proper register for "mask_base" property, while in current
regmap-irq.c, it updates mask registers assuming "mask_base" is always provided.

Maybe this patch is not the cleanest way to fix the issue, e.g: some chip's mask register
address is zero, in that case, could you help to suggest what is the right way?

Thanks,
Mark

On 1/14/2019 5:32 PM, Mark Zhang wrote:
> If client have not provided the mask base register then do not
> write into the mask register.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Jinyoung Park <jinyoungp@nvidia.com>
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> Signed-off-by: Mark Zhang <markz@nvidia.com>
> ---
>  drivers/base/regmap/regmap-irq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
> index d2d0014b0d23..330c1f7e9665 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -108,6 +108,9 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
>  	 * suppress pointless writes.
>  	 */
>  	for (i = 0; i < d->chip->num_regs; i++) {
> +		if (!d->chip->mask_base)
> +			continue;
> +
>  		reg = d->chip->mask_base +
>  			(i * map->reg_stride * d->irq_reg_stride);
>  		if (d->chip->mask_invert) {
> @@ -588,6 +591,9 @@ int regmap_add_irq_chip(struct regmap *map, int irq, int irq_flags,
>  	/* Mask all the interrupts by default */
>  	for (i = 0; i < chip->num_regs; i++) {
>  		d->mask_buf[i] = d->mask_buf_def[i];
> +		if (!chip->mask_base)
> +			continue;
> +
>  		reg = chip->mask_base +
>  			(i * map->reg_stride * d->irq_reg_stride);
>  		if (chip->mask_invert)
> 
