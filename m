From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: pull request for Tegra clock rework and Tegra124 clock support
Date: Mon, 21 Oct 2013 20:57:42 +0100
Message-ID: <52658736.6050707@wwwdotorg.org>
References: <20131021135638.GA10943@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131021135638.GA10943-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/21/2013 02:56 PM, Peter De Schrijver wrote:
> Hi Mike,
> 
> This pull request contains both the tegra clock rework patches
> ([PATCH v6 00/15] Introduce common infra for tegra clocks)
> and the patches to support Tegra124 ([PATCH v4 0/7] Tegra124 clock support)
> 
> The following changes since commit d031acfc0b8376209e5b429513766e7028e40e1d:
> 
>   clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d (2013-10-16 19:49:25 +0300)
> 
> are available in the git repository at:
>   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-tegra124-0
> 
> Joseph Lo (2):
>       clk: tegra124: add wait_for_reset and disable_clock for tegra_cpu_car_ops
>       clk: tegra124: add suspend/resume function for tegra_cpu_car_ops

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
