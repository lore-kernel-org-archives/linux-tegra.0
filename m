From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2] drivers/thermal/tegra: Fix a double free on the device
 node
Date: Mon, 27 Aug 2018 18:31:09 +0200
Message-ID: <b450ad67-ac22-03ea-677c-34b254ffa976@linaro.org>
References: <1535376738-14035-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535376738-14035-1-git-send-email-zhongjiang@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: zhong jiang <zhongjiang@huawei.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ezequiel@collabora.com
List-Id: linux-tegra@vger.kernel.org

On 27/08/2018 15:32, zhong jiang wrote:
> The function 'for_each_child_of_node' iterates over the node list by
> dropping the of_node reference of the previous node.
> 
> Calling of_node_put() on the iterator is pointless and leads to an
> inconsistent refcounting in addition to a double free. Remove it.
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
> v1->v2: According to Daniel's suggestion. I modify the subject and commit log.
> 
>  drivers/thermal/tegra/soctherm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
> index ed28110..3aa55c9 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -980,7 +980,6 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
>  		tcd = thermal_of_cooling_device_register(np_stcc,
>  							 (char *)name, ts,
>  							 &throt_cooling_ops);
> -		of_node_put(np_stcc);
>  		if (IS_ERR_OR_NULL(tcd)) {
>  			dev_err(dev,
>  				"throttle-cfg: %s: failed to register cooling device\n",
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
