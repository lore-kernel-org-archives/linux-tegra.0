From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/5] regulator: core: Add early supply resolution for a
 bypassed regulator
Date: Mon, 25 Apr 2016 15:44:24 +0100
Message-ID: <571E2D48.10509@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
 <1461255121-5245-5-git-send-email-jonathanh@nvidia.com>
 <20160422104837.GC3217@sirena.org.uk> <571A0A81.4010009@nvidia.com>
 <20160422135339.GD3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160422135339.GD3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 22/04/16 14:53, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Apr 22, 2016 at 12:26:57PM +0100, Jon Hunter wrote:
> 
>> OK. Sorry if I have misunderstood you here, but this sounds more like
>> Thierry's initial proposal [0] but ignoring the any errors returned (and
>> we need to fix-up the locking in this patch). In the discussion that
> 
> Yes!
> 
>> followed I thought we agreed to only do this for the bypass case [1]. As
>> far as I am concerned either will work, but to confirm we should just
>> always try to resolve the supply early during regulator_register(), correct?
> 
> We need to only *fail* in the bypass case.

OK. So this is what I have now. Is it weird to return EPROBE_DEFER in 
_regulator_get_voltage()? If so, I could add a test for bypass in the
regulator_register().

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5b46d907e61d..7a6b7f667bcb 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3126,7 +3126,7 @@ static int _regulator_get_voltage(struct regulator_dev *rdev)
 		if (bypassed) {
 			/* if bypassed the regulator must have a supply */
 			if (!rdev->supply)
-				return -EINVAL;
+				return -EPROBE_DEFER;
 
 			return _regulator_get_voltage(rdev->supply->rdev);
 		}
@@ -3943,8 +3943,6 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		rdev->dev.of_node = of_node_get(config->of_node);
 	}
 
-	mutex_lock(&regulator_list_mutex);
-
 	mutex_init(&rdev->mutex);
 	rdev->reg_data = config->driver_data;
 	rdev->owner = regulator_desc->owner;
@@ -3969,7 +3967,9 @@ regulator_register(const struct regulator_desc *regulator_desc,
 
 	if ((config->ena_gpio || config->ena_gpio_initialized) &&
 	    gpio_is_valid(config->ena_gpio)) {
+		mutex_lock(&regulator_list_mutex);
 		ret = regulator_ena_gpio_request(rdev, config);
+		mutex_unlock(&regulator_list_mutex);
 		if (ret != 0) {
 			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
 				 config->ena_gpio, ret);
@@ -3987,31 +3987,40 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	if (init_data)
 		constraints = &init_data->constraints;
 
-	ret = set_machine_constraints(rdev, constraints);
-	if (ret < 0)
-		goto wash;
-
 	if (init_data && init_data->supply_regulator)
 		rdev->supply_name = init_data->supply_regulator;
 	else if (regulator_desc->supply_name)
 		rdev->supply_name = regulator_desc->supply_name;
 
+	/*
+	 * Attempt to resolve the regulator supply, if specified,
+	 * but don't return an error if we fail because we will try
+	 * to resolve it again later as more regulators are added.
+	 */
+	if (regulator_resolve_supply(rdev))
+		rdev_dbg(rdev, "unable to resolve supply\n");
+
+	ret = set_machine_constraints(rdev, constraints);
+	if (ret < 0)
+		goto wash;
+
 	/* add consumers devices */
 	if (init_data) {
+		mutex_lock(&regulator_list_mutex);
 		for (i = 0; i < init_data->num_consumer_supplies; i++) {
 			ret = set_consumer_device_supply(rdev,
 				init_data->consumer_supplies[i].dev_name,
 				init_data->consumer_supplies[i].supply);
 			if (ret < 0) {
+				mutex_unlock(&regulator_list_mutex);
 				dev_err(dev, "Failed to set supply %s\n",
 					init_data->consumer_supplies[i].supply);
 				goto unset_supplies;
 			}
 		}
+		mutex_unlock(&regulator_list_mutex);
 	}
 
-	mutex_unlock(&regulator_list_mutex);
-
 	ret = device_register(&rdev->dev);
 	if (ret != 0) {
 		put_device(&rdev->dev);
@@ -4028,13 +4037,16 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	return rdev;
 
 unset_supplies:
+	mutex_lock(&regulator_list_mutex);
 	unset_regulator_supplies(rdev);
+	mutex_unlock(&regulator_list_mutex);
 wash:
 	kfree(rdev->constraints);
+	mutex_lock(&regulator_list_mutex);
 	regulator_ena_gpio_free(rdev);
+	mutex_unlock(&regulator_list_mutex);
 clean:
 	kfree(rdev);
-	mutex_unlock(&regulator_list_mutex);
 	kfree(config);
 	return ERR_PTR(ret);
 }
-- 
2.1.4
