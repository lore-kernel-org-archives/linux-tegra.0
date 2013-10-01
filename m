From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 00/12] Introduce common infra for tegra clocks
Date: Tue, 01 Oct 2013 11:39:09 -0600
Message-ID: <524B08BD.2020902@wwwdotorg.org>
References: <1379946381-20125-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379946381-20125-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/23/2013 08:24 AM, Peter De Schrijver wrote:
> This patchset introduces common infrastructure for clocks which exist in
> several Tegra SoCs. We also move Tegra114 to this new infrastructure.
> Tegra20 and Tegra30 will be moved later in separate patchsets.
> 
> Changes since v1:
> + move common clks allocation to patch 2
> + adapt also Tegra20 and Tegra30 to the changes in patch 2
> 
> Boottested on dalmore, beaverboard and seaboard.

What commit is this series based on? I applied the two pre-requisites:

ARM: tegra114: add missing clocks to binding.eml
clk: tegra: replace enum tegra114_clk by binding header.eml

... but still got a bunch of conflicts when applying this. I guess at
least commit 819c1de "clk: add CLK_SET_RATE_NO_REPARENT flag" isn't in
the history of this series. Consequently, I gave up and didn't test this.

Also, I had given a lot of feedback on v1. Admittedly I should have
reviewed v2 since it appeared just before I reviewed v1, but I expect
most of the feedback still applies given the limited list of changes
listed above. Certainly, this series still removes the "dsib" clock yet
I expect it shouldn't (patch 1, in the change to
tegra114_periph_clk_init()), and that's the very first piece of feedback
I gave on v1, and also causes the first "git am" conflict with
CLK_SET_RATE_NO_REPARENT.
