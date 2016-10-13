From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] thermal: tegra: add hw-throttle function
Date: Thu, 13 Oct 2016 12:35:31 +0300
Message-ID: <20161013093531.GA29895@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Wei Ni,

This is a semi-automatic email about new static checker warnings.

The patch ce0dbf04f685: "thermal: tegra: add hw-throttle function" 
from May 11, 2016, leads to the following Smatch complaint:

drivers/thermal/tegra/soctherm.c:486 throttrip_program()
	 warn: variable dereferenced before check 'dev' (see line 481)

drivers/thermal/tegra/soctherm.c
   480	{
   481		struct tegra_soctherm *ts = dev_get_drvdata(dev);
                                                            ^^^
Dereference inside function.

   482		int temp, cpu_throt, gpu_throt;
   483		unsigned int throt;
   484		u32 r, reg_off;
   485	
   486		if (!dev || !sg || !stc || !stc->init)
                     ^^^
Check is too late.

   487			return -EINVAL;
   488	

regards,
dan carpenter
