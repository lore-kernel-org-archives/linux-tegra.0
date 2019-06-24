From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v1] OPP: Fix crashing when current OPP has unsupportable
 voltage
Date: Mon, 24 Jun 2019 12:48:57 +0530
Message-ID: <20190624071857.6ji4zc55qugpqnij@vireshk-i7>
References: <20190623175053.26167-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623175053.26167-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Marc Dietrich <marvin24@gmx.de>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 23-06-19, 20:50, Dmitry Osipenko wrote:
> Fix NULL dereference caused by a typo in the code. In particular it
> happens when CPU is running on a frequency which has unsupportable voltage
> (by regulator) defined in the OPP table and a custom set_opp() callback is
> being used. The problem was spotted during of testing of upcoming update
> for the NVIDIA Tegra CPUFreq driver.
> 
> Cc: stable <stable@vger.kernel.org>
> Fixes: 7e535993fa4f ("OPP: Separate out custom OPP handler specific code")
> Reported-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 9fda9a0ec016..89ec6aa220cf 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -685,7 +685,7 @@ static int _set_opp_custom(const struct opp_table *opp_table,
>  
>  	data->old_opp.rate = old_freq;
>  	size = sizeof(*old_supply) * opp_table->regulator_count;
> -	if (IS_ERR(old_supply))
> +	if (!old_supply)
>  		memset(data->old_opp.supplies, 0, size);
>  	else
>  		memcpy(data->old_opp.supplies, old_supply, size);

While the change is fine, the commit log isn't. It isn't about
unsupportable voltage but frequency. The frequency the CPU is
currently running at, is not present in the OPP table and so there is
no corresponding OPP, hence no voltage supplies.

I have applied this patch with following change log:

commit 560d1bcad715c215e7ffe5d7cffe045974b623d0 (HEAD -> opp/linux-next)
Author: Dmitry Osipenko <digetx@gmail.com>
Date:   Sun Jun 23 20:50:53 2019 +0300

    opp: Don't use IS_ERR on invalid supplies
    
    _set_opp_custom() receives a set of OPP supplies as its arguments and
    the caller of it passes NULL when the supplies are not valid. But
    _set_opp_custom(), by mistake, checks for error by performing
    IS_ERR(old_supply) on it which will always evaluate to false.
    
    The problem was spotted during of testing of upcoming update for the
    NVIDIA Tegra CPUFreq driver.
    
    Cc: stable <stable@vger.kernel.org>
    Fixes: 7e535993fa4f ("OPP: Separate out custom OPP handler specific code")
    Reported-by: Marc Dietrich <marvin24@gmx.de>
    Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
    [ Viresh: Massaged changelog ]
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


-- 
viresh
