From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: provide dummy cpu car ops
Date: Thu, 14 Feb 2013 10:43:16 -0700
Message-ID: <511D2234.8000408@wwwdotorg.org>
References: <1360853581-9756-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360853581-9756-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/14/2013 07:52 AM, Peter De Schrijver wrote:
> tegra_boot_secondary() relies on some of the car ops. This means having an
> uninitialized tegra_cpu_car_ops will lead to an early boot panic.
> Providing a dummy struct avoids this and makes adding Tegra114 clock support
> in a bisectable way a lot easier.
> 
> --
> 
> Stephen,
> 
> Should this be a separate patch or should I make this part of new release of
> the Tegra114 clock series?

I will try and remember to apply this before the Tegra114 clock series,
although I think you're reposting that anyway, so feel free to include
this in that series to make things simpler.
