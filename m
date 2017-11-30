From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Thu, 30 Nov 2017 11:31:12 +0000
Message-ID: <e69dc6c8-cbca-0498-c9d8-23e9a7ac1ad6@nvidia.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
 <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
 <f940d9f1-aaec-cf25-24d2-956df63bbbd1@gmail.com>
 <e0fa0df8-aaec-04fe-72b6-21ee1b3c9acb@nvidia.com>
 <95c14859-a2c7-1c61-adba-bd6c16155c01@gmail.com>
 <9d479a38-f40b-0e58-09c3-d06e9ee32a25@nvidia.com>
 <a96d03da-c2a3-1e44-f227-02577f972df6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a96d03da-c2a3-1e44-f227-02577f972df6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 29/11/17 23:13, Dmitry Osipenko wrote:
> On 30.11.2017 01:55, Jon Hunter wrote:

...

> I've asked you to re-test Tegra114/124 or whatever was failing for you with the
> PLL_M being marked as critical instead of PCLK. Maybe it was PLL_M that actually
> caused trouble on Tegra114/124.

Please share the exact change you would like me to test and I will.

Jon

-- 
nvpublic
