From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5] clk: tegra124: Add new peripheral clocks
Date: Wed, 09 Oct 2013 10:00:18 -0600
Message-ID: <52557D92.9050200@wwwdotorg.org>
References: <1380878014-22088-1-git-send-email-pdeschrijver@nvidia.com> <1380878014-22088-5-git-send-email-pdeschrijver@nvidia.com> <525487C7.6080103@wwwdotorg.org> <20131009081123.GB3973@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131009081123.GB3973-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 02:11 AM, Peter De Schrijver wrote:
> On Wed, Oct 09, 2013 at 12:31:35AM +0200, Stephen Warren wrote:
>> On 10/04/2013 03:12 AM, Peter De Schrijver wrote:
>>> Tegra124 introduces a number of new peripheral clocks. This patch adds those
>>> to the common peripheral clock code.
>>
>> Don't you need to add AFC[0..5] in this patch and/or patch 5?
> 
> AFC[0..5] are reset only nodes afaik. Up to now, we haven't done that.
> The goal is to include them once we move to the reset framework.

No, we've always added clock entries for all reset-only clocks into the
clock driver. Since the port to the reset framework is not available
yet, we need to continue to do this. Otherwise, we won't be able to
upstream audio support.
