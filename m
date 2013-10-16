From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 14/19] clk: tegra30: replace enum by binding header
Date: Wed, 16 Oct 2013 11:02:50 -0600
Message-ID: <525EC6BA.4040709@wwwdotorg.org>
References: <1381848794-11761-1-git-send-email-pdeschrijver@nvidia.com> <1381848794-11761-15-git-send-email-pdeschrijver@nvidia.com> <525D9A85.40102@wwwdotorg.org> <20131016144618.GL5643@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016144618.GL5643-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 08:46 AM, Peter De Schrijver wrote:
> On Tue, Oct 15, 2013 at 09:41:57PM +0200, Stephen Warren wrote:
>> On 10/15/2013 08:52 AM, Peter De Schrijver wrote:
>>> As the clock IDs are now specified in a header file, we can use those
>>> definitions instead of maintaining an internal enum.
>>
>> Nit: The patch subject should say "clk: tegra:" not "clk: tegra20:" so
>> that anyone looking at the tags in the subject has only one "tegra"
>> value to look at, not a whole bunch of them.
>>
>> Would it make sense to squash patches 15, 16, 18 together (and similar
>> for Tegra30) to avoid some churn i.e. the fact that the entire body of
>> tegra_periph_clk_list[] gets replaced twice?
> 
> You mean do all the changes for Tegra20 and Tegra30 in 1 patch per SoC?

Yes. I think it'd make the patches smaller. But it's probably not a big
deal if you disagree.
