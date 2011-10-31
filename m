From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/3] staging: nvec: add device tree support
Date: Mon, 31 Oct 2011 13:18:13 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB877@HQMAIL01.nvidia.com>
References: <cover.1320088857.git.marvin24@gmx.de>
 <04ffd9770698b7efb119b92fa379eb2e2698e223.1320088857.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <04ffd9770698b7efb119b92fa379eb2e2698e223.1320088857.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Monday, October 31, 2011 1:59 PM:
> This adds device tree support to the nvec driver. By using this method
> it is no longer necessary to specify platform data through a board
> file.
...
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
...
> +	if (pdata) {
> +		nvec->gpio = pdata->gpio;
> +		nvec->i2c_addr = pdata->i2c_addr;
> +	} else if (nvec->dev->of_node) {
> +		nvec->gpio = of_get_named_gpio(nvec->dev->of_node, "request-gpios", 0);
> +		if (nvec->gpio < 0) {
> +			dev_err(&pdev->dev, "no gpio specified");
> +			goto failed;
> +		}

> +		prop = of_get_property(nvec->dev->of_node, "slave-addr", NULL);
> +		if (!prop) {
> +			dev_err(&pdev->dev, "no i2c address specified");
> +			goto failed;
> +		}
> +		nvec->i2c_addr = be32_to_cpup(prop);

----------==========----------==========----------==========----------==========
Don't you want to use of_property_read_u32() here to simplify the code
slightly? You can also get rid of at least one #include that way.

> +	} else {
> +		dev_err(&pdev->dev, "no platform data\n");
> +		goto failed;
> +	}

-- 
nvpublic
