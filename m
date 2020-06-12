From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 6/6] drm/tegra: output: rgb: Wrap directly-connected
 panel into DRM bridge
Date: Sat, 13 Jun 2020 00:53:37 +0300
Message-ID: <48645520-047f-da72-f8b1-3520911f242e@gmail.com>
References: <20200609132855.20975-7-digetx@gmail.com>
 <202006130511.AE6Kvrjm%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <202006130511.AE6Kvrjm%lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, clang-built-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

13.06.2020 00:23, kernel test robot пишет:
> Hi Dmitry,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on next-20200612]
> [cannot apply to tegra/for-next robh/for-next v5.7]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Support-DRM-bridges-on-NVIDIA-Tegra/20200609-213026
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git abfbb29297c27e3f101f348dc9e467b0fe70f919
> config: arm64-randconfig-r026-20200612 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3b43f006294971b8049d4807110032169780e5b8)

Interestingly, GCC doesn't report this warning.

> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> drivers/gpu/drm/tegra/rgb.c:100:48: warning: unused variable 'tegra_rgb_connector_helper_funcs' [-Wunused-const-variable]
> static const struct drm_connector_helper_funcs tegra_rgb_connector_helper_funcs = {
> ^
> 1 warning generated.


There are two unused structs in the code and one is referenced by the
other, I'll remove the unused structs in v7.
