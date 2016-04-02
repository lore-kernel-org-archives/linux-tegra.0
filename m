From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: thermal: tegra: add thermtrip function
Date: Sat, 2 Apr 2016 08:50:45 +0300
Message-ID: <20160402055045.GA23902@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Wei Ni,

This is a semi-automatic email about new static checker warnings.

The patch ee6d79f202a4: "thermal: tegra: add thermtrip function" from 
Mar 29, 2016, leads to the following Smatch complaint:

drivers/thermal/tegra/soctherm.c:226 thermtrip_program()
	 warn: variable dereferenced before check 'dev' (see line 222)

drivers/thermal/tegra/soctherm.c
   221	{
   222		struct tegra_soctherm *ts = dev_get_drvdata(dev);
                                            ^^^^^^^^^^^^^^^^^^^
Dereference inside function.

   223		int temp;
   224		u32 r;
   225	
   226		if (!dev || !sg)
                    ^^^^
Too late.

   227			return -EINVAL;
   228	

regards,
dan carpenter
