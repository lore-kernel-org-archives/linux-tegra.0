From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V15 4/6] i2c: tegra: Add DMA support
Date: Fri, 8 Feb 2019 19:15:20 +0300
Message-ID: <21901823-2ec1-6bd5-d0df-2360858f2b7e@gmail.com>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
 <1549576040-15907-4-git-send-email-skomatineni@nvidia.com>
 <7806f2cd-72b4-6ae3-b75f-0fc74fb62b95@gmail.com>
 <BYAPR12MB3398BE6DA6F1E82E5F2525C2C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB3398382FF9052AE466CE29ECC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB339863A43F030013DCA7F548C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339863A43F030013DCA7F548C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.02.2019 18:58, Sowjanya Komatineni пишет:
> 
> 
>>> Please use "release_dma:" variant that I suggested in the comment to v14 because:
>>>>
>>> 1) It's just a good (and common-style in kernel) tone to unwind errors handling in the opposite order, it makes code more straight forward and helps to avoid silly mistakes.
>>>
>>> 2) It keeps the current code consistent in regards to probe error-handling.
>>>
>>
>> Can move tegra_i2c_release_dma under the same disable_div_clk label before clk_disable
>>
>> Order in probe is
> 	clk_prepare
> 	i2c_runtime_resume
> 	clk_enable in case of multimaster mode
> 	i2c_init_dma
>>
>> unwinding should be order is
> 	release_dma
> 	disable_div_clk
> 	disable_rpm
> 	unprepared
>>
>> Probe failure from tegra_i2c_init_dma, tegra_i2c_init, devm_request_irq, i2c_add_numbered_adapter all of them perform goto disable_div_clk
>>
>> I can add tegra_i2c_release_dma before performing clock disable under same disable_div_clk so all existing disable_div_clk labels remain same.
>> Otherwise adding new label release_dma causes all goto disable_div_clk statement also to be changed but its same as adding release_dma under disable_div_clk above the clk_disable.
>>
> 
> OK, please ignore above. will add release_dma to show explicitly for readability.
> With release_dma all error handlers performing disable_clk_div need to go thru release dma and disable_clk_div label is not needed.

tegra_i2c_init_dma() releases dma itself in a case of error, hence it should jump to the disable_clk_div.

> So having release dma under disable_clk before clk_disable function is also same. 
> Please confirm if this is ok to use same disable_div_clk or do you prefer release_dma label removing disable_div_clk

In general goto-label naming should reflect the actual jump-action. If goto jumps to dma-releasing, then the action is release-dma and not disable-clk.

Hence the correct variant is:

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7104213d813b..62e81096fb55 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1604,14 +1604,14 @@ static int tegra_i2c_probe(struct platform_device *pdev)
        ret = tegra_i2c_init(i2c_dev, false);
        if (ret) {
                dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
-               goto disable_div_clk;
+               goto release_dma;
        }
 
        ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
                        tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
        if (ret) {
                dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-               goto disable_div_clk;
+               goto release_dma;
        }
 
        i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
@@ -1625,14 +1625,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
        ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
        if (ret)
-               goto disable_div_clk;
+               goto release_dma;
 
        return 0;
 
+release_dma:
+       tegra_i2c_release_dma(i2c_dev);
+
 disable_div_clk:
        if (i2c_dev->is_multimaster_mode)
                clk_disable(i2c_dev->div_clk);
-       tegra_i2c_release_dma(i2c_dev);
 
 disable_rpm:
        pm_runtime_disable(&pdev->dev);
