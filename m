From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: clk_round_rate() can return a zero upon
 error
Date: Tue, 10 Dec 2013 23:55:49 -0800
Message-ID: <52A81A85.9010508@nvidia.com>
References: <alpine.DEB.2.02.1312091746400.4127@tamien> <20131211075117.GA24559@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131211075117.GA24559-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/10/2013 11:51 PM, Sascha Hauer wrote:
> On Mon, Dec 09, 2013 at 06:00:12PM -0800, Paul Walmsley wrote:
>> Treat both negative and zero return values from clk_round_rate() as
>> errors.  This is needed since subsequent patches will convert
>> clk_round_rate()'s return value to be an unsigned type, rather than a
>> signed type, since some clock sources can generate rates higher than
>> (2^31)-1 Hz.
>>
>> Eventually, when calling clk_round_rate(), only a return value of zero
>> will be considered a error.  All other values will be considered valid
>> rates.  The comparison against values less than 0 is kept to preserve
>> the correct behavior in the meantime.
> Shouldn't it be an error when the result is not within sensible limits
> instead? What do you do with a rate of 1Hz?

It's up to the caller of clk_round_rate() to decide what doesn't make 
sense for its use-case.  The caller can certainly react to non-zero 
rates as it likes.

The 0 return code (and the previous negative return values that were 
used previously) are just intended for the clock framework to signal 
explicit errors encountered during clk_round_rate()'s execution.

- Paul
