From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix wrong value written to PLLE_AUX
Date: Fri, 16 May 2014 10:05:18 -0600
Message-ID: <5376373E.1080401@wwwdotorg.org>
References: <1400248220-16025-1-git-send-email-ttynkkynen@nvidia.com> <20140516143110.GA28338@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140516143110.GA28338@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/16/2014 08:31 AM, Thierry Reding wrote:
> On Fri, May 16, 2014 at 04:50:20PM +0300, Tuomas Tynkkynen wrote:
>> The value written to PLLE_AUX was incorrect due to a wrong variable
>> being used.
>>
>> Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   This fix is required for the (upcoming) SATA support.
>>  drivers/clk/tegra/clk-pll.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Mike, Peter, it might be good to have this go into 3.16 as a
> prerequisite for the upcoming SATA driver (which presumably won't be
> ready until 3.17, but in that case it would be good to have this
> prerequisite merged already).

Probably even Cc: stable since it's a fix for a bug that I assume has
been in a kernel release or two?
