From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: use pll_ref as the pll_e parent
Date: Wed, 30 Oct 2013 16:50:03 -0600
Message-ID: <52718D1B.6030106@wwwdotorg.org>
References: <1383093707-10312-1-git-send-email-pdeschrijver@nvidia.com> <527128B5.2020101@wwwdotorg.org> <20131030221833.GQ22111@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131030221833.GQ22111-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/30/2013 04:18 PM, Peter De Schrijver wrote:
> On Wed, Oct 30, 2013 at 04:41:41PM +0100, Stephen Warren wrote:
>> On 10/29/2013 06:41 PM, Peter De Schrijver wrote:
>>> Use pll_ref instead of pll_re_vco as the pll_e parent on Tegra114 and
>>> Tegra124. Also add a pll_ref table entry for pll_e for Tegra114.
>>
>> Why? What benefit does this give, or what bug does this fix?
> 
> Otherrwise Tegra114 will crash on boot.

Sigh. For what reason?
