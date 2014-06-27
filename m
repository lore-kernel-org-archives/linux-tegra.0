From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: export clock names for debugging
Date: Fri, 27 Jun 2014 09:59:57 -0600
Message-ID: <53AD94FD.2070400@wwwdotorg.org>
References: <1403797705-26910-1-git-send-email-pdeschrijver@nvidia.com> <53AC41B0.40307@wwwdotorg.org> <20140627121954.GR3679@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140627121954.GR3679-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 06:19 AM, Peter De Schrijver wrote:
> On Thu, Jun 26, 2014 at 05:52:16PM +0200, Stephen Warren wrote:
>> On 06/26/2014 09:48 AM, Peter De Schrijver wrote:
>>> When writing a module for testing or debugging purposes, there is no way to
>>> get hold of clk handles. This patch solves this by exposing all valid clocks
>>> as clkdev's for the virtual device tegra-clk-debug.
>>
>> This is to support clk_get_sys()?
>>
> 
> Yes.
> 
>> I guess this seems fine, so feel free to apply it, but I slightly wonder
>> why not just include this change as part of the presumably local and
>> never-to-be-upstreamed test/dev module?
> 
> The idea is to allow local debug modules to get hold of the struct clk *. I
> don't think that's possible without using clk_get_sys()?

Well, for a debug hack you can always just add extra clock entries into
some DT node and so avoid clk_get_sys:-)

My point wasn't so much about not using clk_get_sys in a debug driver,
but more that if this patch is only required to support non-upstreamed
debug code, perhaps this patch should stay downstream along with that
non-upstreamed debug code. That said, I'm not really objecting to it,
just making a minor comment.
