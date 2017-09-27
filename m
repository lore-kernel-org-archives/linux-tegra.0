From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Thu, 28 Sep 2017 02:31:23 +0300
Message-ID: <001e6454-ad15-5e9d-cb49-277082b21687@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
 <5c8b83775b982e6ee851c127444a8e839f422ad0.1506377430.git.digetx@gmail.com>
 <20170927094557.yr2fl5arodjnh637@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927094557.yr2fl5arodjnh637@mwanda>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 27.09.2017 12:45, Dan Carpenter wrote:
>> --- /dev/null
>> +++ b/drivers/staging/tegra-vde/Kconfig
>> @@ -0,0 +1,6 @@
>> +config TEGRA_VDE
>> +	tristate "NVIDIA Tegra20 video decoder driver"
>> +	depends on ARCH_TEGRA_2x_SOC
> 
> Could we get a || COMPILE_TEST here as well?
> 

Good point, I'll address it in V2.

-- 
Dmitry
