From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] regulator: core: Use parent voltage from the supply when
 bypassed
Date: Thu, 31 Mar 2016 15:27:58 +0100
Message-ID: <56FD33EE.6030109@nvidia.com>
References: <1459359124-22436-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459359124-22436-1-git-send-email-broonie@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 30/03/16 18:32, Mark Brown wrote:
> When a regulator is in bypass mode it is functioning as a switch
> returning the voltage set in the regulator will not give the voltage
> being output by the regulator as it's just passing through its supply.
> This means that when we are getting the voltage from a regulator we
> should check to see if it is in bypass mode and if it is we should
> report the voltage from the supply rather than that which is set on the
> regulator.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> 
> Completely untested.
> 
>  drivers/regulator/core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 74e8a7a3b3e8..03042e450399 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3118,6 +3118,20 @@ EXPORT_SYMBOL_GPL(regulator_sync_voltage);
>  static int _regulator_get_voltage(struct regulator_dev *rdev)
>  {
>  	int sel, ret;
> +	bool bypassed;
> +
> +	if (rdev->desc->ops->get_bypass) {
> +		ret = rdev->desc->ops->get_bypass(rdev, &bypassed);
> +		if (ret < 0)
> +			return ret;
> +		if (bypassed) {
> +			if (rdev->supply) {
> +				ret = _regulator_get_voltage(rdev->supply->rdev);

Should this be a return here?

> +			} else {
> +				return -EINVAL;
> +			}
> +		}
> +	}
>  
>  	if (rdev->desc->ops->get_voltage_sel) {
>  		sel = rdev->desc->ops->get_voltage_sel(rdev);
> 

I gave this a quick test on tegra124 having populated the
get/set_bypass() operators for the as3722. In this case, there is still
a problem because _regulator_get_voltage() is called during regulator
registration when set_machine_constraints() is called, which is before
we have called regulator_register_resolve_supply(). Therefore, it seems
to me that we still need to resolve the supply before we call
set_machine_constraints().

Jon
