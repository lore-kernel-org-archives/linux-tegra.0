From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegra:for-5.9/firmware 4/5] include/linux/string.h:296:30:
 warning: '__builtin_strncat' output truncated before terminating nul copying
 as many bytes from a string as its length
Date: Fri, 17 Jul 2020 09:29:39 +0100
Message-ID: <9ffe6869-7bfc-4d40-6761-09706d7da4eb@nvidia.com>
References: <202007150509.YYGFya5r%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <202007150509.YYGFya5r%lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 14/07/2020 22:28, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-5.9/firmware
> head:   4e87189912bd2167998d82c95bb68f73185069e2
> commit: 5e37b9c137ee5a3a9dc2815ca51f71746c2609a6 [4/5] firmware: tegra: Add support for in-band debug
> config: arm-allyesconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 5e37b9c137ee5a3a9dc2815ca51f71746c2609a6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/bitmap.h:9,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/rcupdate.h:31,
>                     from include/linux/rculist.h:11,
>                     from include/linux/dcache.h:7,
>                     from include/linux/fs.h:8,
>                     from include/linux/debugfs.h:15,
>                     from drivers/firmware/tegra/bpmp-debugfs.c:5:
>    In function 'strncat',
>        inlined from 'bpmp_populate_debugfs_inband' at drivers/firmware/tegra/bpmp-debugfs.c:422:4:
>>> include/linux/string.h:296:30: warning: '__builtin_strncat' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]


I took a look at this and see what the above is warning about and if
this is something we need to address.

When I implemented the above, I did take care to ensure that we would
not overflow the buffer and ensure that the string is null terminated.
If you look at the code, following the call to strncat, there is a
subsequent call to strcat which will add the null character. Before any
of these calls are made, the code does check to ensure that the strings
written to the buffer can fit and there is room for the null character.

We could update this code to address the above warning, but at the same
time I don't believe it is necessary.

Cheers
Jon

-- 
nvpublic
