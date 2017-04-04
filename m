From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] reset: Add APIs to manage array of resets
Date: Tue, 4 Apr 2017 09:53:44 +0530
Message-ID: <15a3a7c8-2ef9-e643-98aa-ef450f722063@codeaurora.org>
References: <201704041257.siy13sYK%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201704041257.siy13sYK%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 04/04/2017 09:44 AM, kbuild test robot wrote:
> Hi Vivek,
>
> [auto build test WARNING on balbi-usb/next]
> [also build test WARNING on v4.11-rc5 next-20170403]
> [cannot apply to pza/reset/next]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Vivek-Gautam/reset-APIs-to-manage-a-list-of-resets/20170404-111639
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git next
> config: x86_64-randconfig-x004-201714 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>          # save the attached .config to linux build tree
>          make ARCH=x86_64
>
> All warnings (new ones prefixed by >>):
>
>     drivers/reset/core.c: In function 'reset_control_array_deassert':
>>> drivers/reset/core.c:526:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
>       for (i = 0; i < num_rsts; i++)
>       ^~~
>     drivers/reset/core.c:528:3: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'for'
>        if (ret)
>        ^~

Right, gonna fix these warnings in the next version of the patch.
Thanks

> vim +/for +526 drivers/reset/core.c
>
>     510	/**
>     511	 * reset_control_array_deassert: deassert a list of resets
>     512	 *
>     513	 * @resets: reset control array holding info about a list of resets
>     514	 * @num_rsts: number of resets to be deasserted.
>     515	 *
>     516	 * Returns 0 on success or error number on failure.
>     517	 */
>     518	int reset_control_array_deassert(int num_rsts,
>     519					struct reset_control_array *resets)
>     520	{
>     521		int ret, i;
>     522	
>     523		if (WARN_ON(IS_ERR_OR_NULL(resets)))
>     524			return -EINVAL;
>     525	
>   > 526		for (i = 0; i < num_rsts; i++)
>     527			ret = reset_control_deassert(resets[i].rst);
>     528			if (ret)
>     529				goto err;
>     530	
>     531		return 0;
>     532	
>     533	err:
>     534		while (--i >= 0)
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

BRs
Vivek

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
