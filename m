From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] clk: tegra: probe deferral error reporting
Date: Thu, 26 Jul 2018 09:55:16 +0200
Message-ID: <13595e6b8bfb364023648297cad7da1b@agner.ch>
References: <20180720075422.26563-1-marcel@ziswiler.com>
 <153256109511.48062.12389268791907553857@swboyd.mtv.corp.google.com>
 <b202fe11-108f-c62c-bb6d-9e3a7de5a964@gmail.com>
 <153259028259.48062.10565668407094066922@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153259028259.48062.10565668407094066922@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Peter Geis <pgwipeout@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26.07.2018 09:31, Stephen Boyd wrote:
> Quoting Peter Geis (2018-07-25 16:42:34)
>> On 7/25/2018 7:24 PM, Stephen Boyd wrote:
>> > Quoting Marcel Ziswiler (2018-07-20 00:54:22)
>> >> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> >>
>> >> Actually report the error code from devm_regulator_get() which may as
>> >> well just be a probe deferral.
>> >>
>> >> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> >>
>> >> ---
>> >>
>> >>   drivers/clk/tegra/clk-dfll.c | 5 +++--
>> >>   1 file changed, 3 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> >> index 48ee43734e05..b2123084e175 100644
>> >> --- a/drivers/clk/tegra/clk-dfll.c
>> >> +++ b/drivers/clk/tegra/clk-dfll.c
>> >> @@ -1609,8 +1609,9 @@ int tegra_dfll_register(struct platform_device *pdev,
>> >>
>> >>          td->vdd_reg = devm_regulator_get(td->dev, "vdd-cpu");
>> >>          if (IS_ERR(td->vdd_reg)) {
>> >> -               dev_err(td->dev, "couldn't get vdd_cpu regulator\n");
>> >> -               return PTR_ERR(td->vdd_reg);
>> >> +               ret = PTR_ERR(td->vdd_reg);
>> >> +               dev_err(td->dev, "couldn't get vdd_cpu regulator: %d\n", ret);
>> >
>> > Do you want to know that a probe defer is happening? Usually patches are
>> > sent to make that error path silent.
>> >
>>
>> Just asking as the newbie here, but shouldn't probe deferral be
>> regulated to dev_debug?
>> Then pass any other error code as dev_err.
> 
> Yes probe defer should be relegated to debug level prints. Or really, we
> should introduce a more complicated system to make debugging probe defer
> errors simpler by informing us which driver is probe defering on what
> resource by putting debug prints in each framework that returns probe
> defer errors instead of updating each driver that uses these frameworks
> and thinks it needs to print errors in these cases. And hide all that
> behind some kernel commandline parameter and/or Kconfig option that lets
> us turn the prints off all the time if we're not developing drivers or
> testing things.

Afaict, that is already there in:
drivers/base/dd.c:really_probe()

So I suggest to just silence the EPROBE_DEFER case, e.g.\


	if (IS_ERR(td->vdd_reg)) {
		ret = PTR_ERR(td->vdd_reg);
		if (ret != -EPROBE_DEFER)
			dev_err(td->dev, "couldn't get vdd_cpu regulator: %d\n", ret);

		return ret;
	}

--
Stefan


> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
