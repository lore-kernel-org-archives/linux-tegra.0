From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 10 Jul 2012 20:34:24 +0530
Message-ID: <4FFC4478.7000204@nvidia.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org> <4FE80413.6070001@nvidia.com> <4FE87FE3.1080608@wwwdotorg.org> <4FE882A5.3080504@nvidia.com> <20120625222646.GB30406@opensource.wolfsonmicro.com> <4FE8EFC4.3090509@wwwdotorg.org> <4FFC190A.2040800@nvidia.com> <20120710134436.GD9409@opensource.wolfsonmicro.com> <4FFC31D5.7090600@nvidia.com> <20120710135302.GG9409@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120710135302.GG9409-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 10 July 2012 07:23 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Jul 10, 2012 at 07:14:53PM +0530, Laxman Dewangan wrote:
>
>> Sorry, I did not get it fully. I had two patches, one for fixed one
>> and other for tps65910. On which patch, you are seeing issue and
>> which part of code?
> Mainly tps65910.  The fixed voltage regulator does have the same issue
> but it is somewhat special here.

Oops, I follow the same approach for tps65910 what it was with fixed 
regulator, was thinking that this is good approach.

The sample code for tps65910 is as follows. So where do you think that 
it is wrong and what should be correct approach.
I need to follow the same for tps6586x also.


@@ -1023,6 +1051,13 @@ static struct tps65910_board 
*tps65910_parse_dt_reg_data(
                  "ti,regulator-ext-sleep-control", &prop);
          if (!ret)
              pmic_plat_data->regulator_ext_sleep_control[idx] = prop;
+
+
+        if (info->vin_name) {
+            snprintf(in_supply, 32, "%s-supply", info->vin_name);
+            if (of_find_property(np, in_supply, 0))
+                pmic_plat_data->input_supply[idx] =
+                                info->vin_name;
+        }
      }

      return pmic_plat_data;
@@ -1126,6 +1161,7 @@ static __devinit int tps65910_probe(struct 
platform_device *pdev)
          pmic->info[i] = info;

          pmic->desc[i].name = info->name;
+        pmic->desc[i].supply_name = pmic_plat_data->input_supply[i];
          pmic->desc[i].id = i;
