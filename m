From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: Fix clock rate computation
Date: Mon, 25 Nov 2013 10:16:04 -0700
Message-ID: <529385D4.6040901@wwwdotorg.org>
References: <1384787499-26994-1-git-send-email-treding@nvidia.com> <20131125140910.GI26617@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131125140910.GI26617-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/25/2013 07:09 AM, Peter De Schrijver wrote:
> On Mon, Nov 18, 2013 at 04:11:35PM +0100, Thierry Reding wrote:
>> The PLL output frequency is multiplied during the P-divider computation,
>> so it needs to be divided by the P-divider again before returning.
>>
>> This fixes an issue where clk_round_rate() would return the multiplied
>> frequency instead of the real one after the P-divider.
>>
> 
> Series Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> I will squash the Tegra124 fixes in the Tegra124 series.

BTW, as a maintainer of some code, you usually do one of:

a) Apply the patch yourself.

b) Ack the patch for someone else to apply.

It's unusual to do both, unless there's some confusion which tree the
patch will go through, so you do e.g. (b) first then later find out that
(a) was more correct, or vice-versa.

Also, in the past I've been asked to make sure that all ARM-related
patches go to the main ARM list as well as the Tegra-specific list, to
make sure they get full visibility.
