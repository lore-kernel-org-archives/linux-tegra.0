From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 1/4] reset: Add APIs to manage array of resets
Date: Tue, 20 Jun 2017 09:02:39 +0200
Message-ID: <1497942159.2386.1.camel@pengutronix.de>
References: <201706200445.RVcRobQj%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201706200445.RVcRobQj%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-06-20 at 04:21 +0800, kbuild test robot wrote:
> Hi Vivek,
> 
> [auto build test WARNING on pza/reset/next]
> [also build test WARNING on v4.12-rc6 next-20170619]
> [cannot apply to balbi-usb/next]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Philipp-Zabel/reset-Add-APIs-to-manage-array-of-resets/20170620-021320
> base:   git://git.pengutronix.de/git/pza/linux reset/next
> config: i386-randconfig-c0-06200218 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/gpu//drm/nouveau/include/nvif/os.h:28:0,
>                     from drivers/gpu//drm/nouveau/include/nvkm/core/os.h:3,
>                     from drivers/gpu//drm/nouveau/include/nvkm/core/event.h:3,
>                     from drivers/gpu//drm/nouveau/include/nvkm/core/device.h:3,
>                     from drivers/gpu//drm/nouveau/include/nvkm/core/subdev.h:3,
>                     from drivers/gpu//drm/nouveau/include/nvkm/core/engine.h:4,
>                     from drivers/gpu//drm/nouveau/include/nvkm/engine/fifo.h:3,
>                     from drivers/gpu//drm/nouveau/nvkm/engine/fifo/priv.h:4,
>                     from drivers/gpu//drm/nouveau/nvkm/engine/fifo/chan.h:4,
>                     from drivers/gpu//drm/nouveau/nvkm/engine/fifo/channv50.h:4,
>                     from drivers/gpu//drm/nouveau/nvkm/engine/fifo/chang84.c:24:
> >> include/linux/reset.h:110:37: warning: 'struct reset_control_array' declared inside parameter list
>     void reset_control_array_put(struct reset_control_array *resets)
>                                         ^
> >> include/linux/reset.h:110:37: warning: its scope is only this definition or declaration, which is probably not what you want
> 
> vim +110 include/linux/reset.h
> 
>     94		return optional ? NULL : ERR_PTR(-ENOTSUPP);
>     95	}
>     96	
>     97	static inline struct reset_control *
>     98	devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
>     99	{
>    100		return optional ? NULL : ERR_PTR(-ENOTSUPP);
>    101	}
>    102	
>    103	static inline struct reset_control *
>    104	of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
>    105	{
>    106		return optional ? NULL : ERR_PTR(-ENOTSUPP);
>    107	}
>    108	
>    109	static inline
>  > 110	void reset_control_array_put(struct reset_control_array *resets)
>    111	{
>    112	}

reset_control_array_put is static now, I forgot to remove this stub.

regards
      * Philipp
