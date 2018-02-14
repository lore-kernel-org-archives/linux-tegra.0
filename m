From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] memory: tegra: Squash tegra20-mc into common
 tegra-mc driver
Date: Wed, 14 Feb 2018 18:42:15 +0300
Message-ID: <ea94ef04-2eda-51c8-b485-e8c8063f2598@gmail.com>
References: <cover.1518452709.git.digetx@gmail.com>
 <148ce8c56ad764fc8133e0d97e43f9639cae15ff.1518452709.git.digetx@gmail.com>
 <20180213103039.GA6764@ulmo>
 <20180214111546.GR5850@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180214111546.GR5850-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 14.02.2018 14:15, Peter De Schrijver wrote:
> On Tue, Feb 13, 2018 at 11:30:39AM +0100, Thierry Reding wrote:
>>>  	}
>>
>> It's odd that we don't have an MC clock on Tegra2. I wonder if perhaps
>> we just never implemented one, or it uses one which is always on by
>> default. Cc Peter to see if he knows.
> 
> We do, it has DT ID TEGRA20_CLK_MC. However, it looks like the modeling is
> incorrect for Tegra20. Unlike on Tegra30 where the MC clock can be either
> half or the same as the EMC clock, it is always half the EMC clock on
> Tegra20. This happens to work because we likely never change the MC clock
> and the non-existing bit just reads as 0, which means half the MC clock.

Yes, and also that clock isn't specified in DT for MC. So probably we would have
to use clk_get_sys even if it was implemented correctly.
