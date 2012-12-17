From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dynamically calculate pll_d parameters
Date: Mon, 17 Dec 2012 23:16:54 +0100
Message-ID: <1355782614.1490.31.camel@tellur>
References: <1355767103-5303-1-git-send-email-dev@lynxeye.de>
	 <50CF963E.7020506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CF963E.7020506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 17.12.2012, 15:01 -0700 schrieb Stephen Warren:
> On 12/17/2012 10:58 AM, Lucas Stach wrote:
> > Calculate PLL_D parameters in a dynamically instead of using a fixed
> > table. This allows TegraDRM to drive outputs with CVT compliant modes.
> 
> Prashant, can you please review this, and comment on the best approach
> for dealing with the conflict this has with your clock driver rework.
> Thanks.
> 
> Lucas, I assume this algorithm generates the same cpcon values (and
> indeed M/N/P values) as were in the fixed pll_d_freq_table before?
> 
I know this might not be the nicest thing for validation, but no this
isn't generating exactly the same values. The tables used a fixed 1MHz
Cf, which results in high N values for faster pixel clocks. The new
algorithm tries to use a higher Cf if possible, resulting in smaller N
which provides the opportunity to reduce cpcon, which in turn might be a
win for power consumption.

The cpcon values are set according to the TRM and are indeed the same
when using Cf=1MHz.

To match the old behaviour of the table I would have to further dumb
down the calculation, which might make this more specific to PLL_D and
reduce the possibility to reuse parts of the code for other PLLs later
on. But as apparently there's a rework going on this might not be an
relevant argument.

Regards,
Lucas
